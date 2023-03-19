<?php

namespace station;
require_once 'weather_db.php';
use WriteWeatherDB;


class WeatherStation {
    const indices = array(
        "BME280" => array(
            "temperature" => 1,
            "pressure" => 2,
            "humidity" => 3
        ),
        "MCP9808" => array(
            "temperature" => 1
        )
    );
    private $url;


    public function __construct($url){
        $this->url = $url;
    }


    public function getData(){
        $response = file_get_contents($this->url);

        return json_decode($response);
    }


    public function getMeasurements(){
        $data = $this->getData();
        $scaled_data = array();

        foreach (self::indices as $sensor=>$measurement){
            foreach ($measurement as $name=>$index){
                $scaled_data[] = array(
                    "sensor" => $sensor,
                    "measurement" => $name,
                    "value" => round(
                        $data->$sensor[$index]->$name /
                        $data->$sensor[$index]->div,
                        3
                    )
                );
            }
        }

        return $scaled_data;
    }
}


function main(){
    $addr = getenv("WEATHER_STATION_ADDRESS");

    $db = new WriteWeatherDB("canberra_data");
    $w_station = new WeatherStation($addr);

    $data = $w_station->getMeasurements();
    $data_to_write = array();
    foreach ($data as $i=>$measurement){
        $data_to_write[
            $db->getMeasurementID(
                $measurement["measurement"],
                $measurement["sensor"]
            )
        ] = $measurement["value"];
    }

    $success = $db->writeMeasurements($data_to_write);
}


main();

?>
