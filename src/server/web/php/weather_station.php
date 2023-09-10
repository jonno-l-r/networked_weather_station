<?php
/*
 * 2023 Jon Rabe, jonrabe@jonr.net
 */


interface SensorAPI {
    public function getID($sensor);
    public function getSuccess($sensor);
    public function getMeasurement($measurement, $sensor);
}


class WeatherStation implements SensorAPI {
    const decimal_precision = 3;
    public $data;


    public function __construct($url){
        $this->getData($url);
    }


    public function getID($sensor){
        return $this->data->$sensor->id;
    }


    public function getSuccess($sensor){
        return $this->data->$sensor->success;
    }


    public function getMeasurement($measurement_name, $sensor){
        $measurement = $this->data->$sensor->$measurement_name;

        return round(
            $measurement->data / $measurement->div,
            self::decimal_precision
        );
    }


    public function getData($url){
        $this->data = json_decode(
            file_get_contents($url)
        );        
    }
}

?>
