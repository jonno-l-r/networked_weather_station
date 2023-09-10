<?php
/*
 * 2023 Jon Rabe, jonrabe@jonr.net
 */


class WeatherDB {
    private $measurement_name;
    private $measurement_id;
    private $sensor_name;
    private $sensor_stmt;

    protected $mysqli;

    const metadata_table = "sensors";
    const data_table = "canberra_data";

    const sensor_query = "SELECT id FROM sensors WHERE measurement=? AND sensor=?";


    public function __construct(){        
        $this->mysqli = new mysqli(
            "db",
            getenv("MARIADB_USER"),
            getenv("MARIADB_PASSWORD"),
            getenv("MARIADB_DATABASE")
        );
        $this->sensor_stmt = $this->mysqli->prepare(self::sensor_query);

        if ($this->sensor_stmt){
            $this->sensor_stmt->bind_param(
                "ss",
                $this->measurement_name,
                $this->sensor_name
            );
        }
    }


    public function getMeasurementID($measurement, $sensor){
        $this->measurement_name = $measurement;
        $this->sensor_name = $sensor;
        if ($this->sensor_stmt){
            $this->sensor_stmt->execute();
            $this->measurement_id = $this->sensor_stmt->get_result()->fetch_assoc()["id"];

            return $this->measurement_id;
        }
        else {
            return NULL;
        }
    }


    public function close(){
        $this->mysqli->close();
        if ($this->sensor_stmt){
            $this->sensor_stmt->close();
        }
    }    
}


class WriteWeatherDB extends WeatherDB {
    private $value;
    private $timestamp;
    private $data_stmt;
    private $measurement_id;
    private $query;

    const data_query = "INSERT INTO "
                      .WeatherDB::data_table
                      ." (timestamp, sensor_id, value) VALUES (?,?,?)";


    public function __construct(){
        WeatherDB::__construct();
        $this->data_stmt = $this->mysqli->prepare(self::data_query);

        if ($this->data_stmt){
            $this->data_stmt->bind_param(
                "iid",
                $this->timestamp,
                $this->measurement_id,
                $this->value
            );
        }
    }


    public function writeMeasurement($measurement, $sensor, $value){
        $this->timestamp = time();
        $success = (bool)$this->data_stmt;

        if ($this->data_stmt){
            $this->measurement_id = $this->getMeasurementID(
                $measurement,
                $sensor
            );
            $this->value = $value;
            $success &= $this->data_stmt->execute();
        }

        return $success;
    }


    public function close(){
        if ($this->data_stmt){
            $this->data_stmt->close();
        }
        WeatherDB::close();
    }
}


class ReadWeatherDB extends WeatherDB {
    const sanitize = array(
        "max"=>"MAX",
        "min"=>"MIN",
        "avg"=>"AVG",
        "over"=>">",
        "under"=>"<"
    );


    public function __construct(){
        WeatherDB::__construct();
    }


    private function _queryTable($query){
        $data;
        $result = $this->mysqli->query($query);

        if ($result){
            $data = $result->fetch_all($mode = MYSQLI_ASSOC);
            $result->free_result();
        }

        return $data;
    }


    public function getLatest(){
        return $this->_queryTable(
            "SELECT x.timestamp, x.sensor_id, s.measurement, s.sensor, y.value, s.unit "
          . "FROM " . WeatherDB::metadata_table . " s, "
          . "(SELECT sensor_id, MAX(timestamp) as timestamp "
          . "FROM " . WeatherDB::data_table . " "
          . "GROUP BY sensor_id) AS x "
          . "JOIN ". WeatherDB::data_table ." y "
          . "ON x.sensor_id = y.sensor_id "
          . "AND x.timestamp = y.timestamp "
          . "WHERE s.id = x.sensor_id"
        );
    }


    public function getBetween($t1, $t2){
        /* Where t1 < t2 */

        return $this->_queryTable(
            "SELECT c.timestamp, c.sensor_id, s.measurement, s.sensor, c.value, s.unit "
          . "FROM " . WeatherDB::data_table . " c, " . WeatherDB::metadata_table . " s "
          . "WHERE s.id = c.sensor_id "
          . "AND c.timestamp BETWEEN "
          . (int)$t1 . " AND " . (int)$t2
        );
    }


    private function _queryMaxMinBetween($t1, $t2, $func){
        /* Where t1 < t2 */

        return $this->_queryTable(
            "SELECT x.timestamp, x.sensor_id, s.measurement, s.sensor, x.value, s.unit "
          . "FROM " . WeatherDB::metadata_table . " s, "
          . "(SELECT timestamp, sensor_id, " . self::sanitize[$func] . "(value) as value "
          . "FROM " . WeatherDB::data_table . " "
          . "WHERE timestamp BETWEEN "
          . (int)$t1 . " AND " . (int)$t2 . " "
          . "GROUP BY sensor_id) AS x "
          . "JOIN " . WeatherDB::data_table . " y "
          . "ON x.timestamp = y.timestamp "
          . "AND x.sensor_id = y.sensor_id "
          . "WHERE s.id = y.sensor_id"
        );
    }    


    private function _getMaxMinBetween($t1, $t2, $func, $period){
        $data = array();
        $min_period = 60*60*12;

        if ($period >= $min_period){
            for ($_t1=$t2-$period; $_t1>$t1; $_t1=$_t1-$period){
                $data = array_merge(
                    $data,
                    $this->_queryMaxMinBetween(
                        $_t1,
                        $_t1+$period,
                        $func
                    )
                );
            }
        }
        else {
            $data = $this->_queryMaxMinBetween($t1, $t2, $func);
        }

        return $data;
    }


    public function getMaxBetween($t1, $t2, $period=0){
        return $this->_getMaxMinBetween($t1, $t2, "max", $period);
    }


    public function getMinBetween($t1, $t2, $period=0){
        return $this->_getMaxMinBetween($t1, $t2, "min", $period);
    }


    public function getAverageBetween($t1, $t2){
        /* Where t1 < t2 */

        return $this->_queryTable(
            "SELECT c.sensor_id, s.measurement, s.sensor, AVG(value) as value, s.unit "
          . "FROM " . WeatherDB::data_table . " c, " . WeatherDB::metadata_table . " s "
          . "WHERE timestamp BETWEEN "
          . (int)$t1 . " AND " . (int)$t2 . " "
          . "AND s.id = c.sensor_id "
          . "GROUP BY sensor_id "
        );
    }


    private function _getOverUnder($t1, $t2, $id, $threshold, $operator){
        /* Where t1 < t2 */

        return $this->_queryTable(
            "SELECT timestamp, sensor_id, value "
          . "FROM " . WeatherDB::data_table . " "
          . "WHERE timestamp BETWEEN "
          . (int)$t1 . " AND " . (int)$t2 . " "
          . "AND sensor_id = " . (int)$id . " "
          . "AND value " . self::sanitize[$operator] . (float)$threshold
        );
    }


    public function getOver($t1, $t2, $id, $threshold){
        return $this->_getOverUnder(
            $t1, $t2, $id, $threshold, "over"
        );
    }


    public function getUnder($t1, $t2, $id, $threshold){
        return $this->_getOverUnder(
            $t1, $t2, $id, $threshold, "under"
        );
    }    
}


function test(){
    $r = new ReadWeatherDB();
    $latest = $r->getUnder(1675400000, 1675482781, 12, 41.6);
    echo json_encode($latest);
};

?>
