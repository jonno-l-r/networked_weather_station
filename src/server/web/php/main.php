<?php
/*
 * 2023 Jon Rabe, jonrabe@jonr.net
 */


namespace main;
require_once "controller.php";
use controller\Controller;


$x = new Controller(
   $_SERVER["REQUEST_URI"],
   $_GET
);
$x->processRequest();

?>
