<?php
namespace controller;
require_once "weather_db.php";
use ReadWeatherDB;
error_reporting(E_ALL ^ E_WARNING);


class Controller {
    private $db;
    private $endpoint;
    private $request;

    const api_root = "sensors";


    public function __construct($uri, $request){
        $this->db = new ReadWeatherDB();
        $this->_getEndpoint($uri);
        $this->request = $request;
    }


    private function _getEndpoint($_uri){
        $uri = explode("/", $_uri);
        $key = array_search(self::api_root, $uri);

        if ($key){
            $this->endpoint = $key==(count($uri)-1) ?
                            self::api_root : $uri[$key+1];
        }
        else {
            $this->endpoint = NULL;
        }
    }


    public function processRequest(){
        switch ($this->endpoint){
        case "getLatest":
            header("HTTP/1.1 200 OK");
            echo json_encode($this->db->getLatest());
            break;

        case "getBetween":
            header("HTTP/1.1 200 OK");
            echo json_encode(
                $this->db->getBetween(
                    (int)$this->request["t1"],
                    (int)$this->request["t2"]                    
                )
            );
            break;

        case "getMaxBetween":
            header("HTTP/1.1 200 OK");
            echo json_encode(
                $this->db->getMaxBetween(
                    (int)$this->request["t1"],
                    (int)$this->request["t2"],
                    (int)$this->request["period"]
                )
            );
            break;

        case "getMinBetween":
            header("HTTP/1.1 200 OK");
            echo json_encode(
                $this->db->getMinBetween(
                    (int)$this->request["t1"],
                    (int)$this->request["t2"],
                    (int)$this->request["period"]
                )
            );
            break;

        case "getAvgBetween":
            header("HTTP/1.1 200 OK");
            echo json_encode(
                $this->db->getAverageBetween(
                    (int)$this->request["t1"],
                    (int)$this->request["t2"]                    
                )
            );
            break;

        case "getOver":
            header("HTTP/1.1 200 OK");
            echo json_encode(
                $this->db->getOver(
                    (int)$this->request["t1"],
                    (int)$this->request["t2"],
                    (int)$this->request["id"],
                    (float)$this->request["threshold"]
                )
            );
            break;

        case "getUnder":
            header("HTTP/1.1 200 OK");
            echo json_encode(
                $this->db->getUnder(
                    (int)$this->request["t1"],
                    (int)$this->request["t2"],
                    (int)$this->request["id"],
                    (float)$this->request["threshold"]
                )
            );
            break;            

        default:
            header("HTTP/1.1 404 Not Found");
        }
        $this->db->close();
    }
}


function test(){
    $x = new Controller("hello/world", array());
}

?>
