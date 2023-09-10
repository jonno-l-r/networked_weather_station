<?php

namespace new_record;

require_once 'weather_db.php';
require_once 'weather_station.php';

use WriteWeatherDB;
use WeatherStation;


function main(){
    $db = new WriteWeatherDB(getenv("MARIADB_DATABASE_TABLE_NAME"));
    $station = new WeatherStation(getenv("WEATHER_STATION_ADDRESS"));

    $add_record = function ($measurement, $sensor) use ($db, $station) {
        $success = $station->getSuccess($sensor);

        if ($success)
            $success &= $db->writeMeasurement(
                $measurement,
                $sensor,
                $station->getMeasurement($measurement, $sensor)
            );
        
        return $success;
    };

    $success = $add_record("temperature", "BME280");
    $success &= $add_record("humidity", "BME280");
    $success &= $add_record("pressure", "BME280");
    $success &= $add_record("temperature", "MCP9808");

    return $success;
}


main();


/* TODO
   - write to log if measurement fails
*/

?>
