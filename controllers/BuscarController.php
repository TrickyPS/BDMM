<?php
include("../models/Buscar.php");
include("../db/Connection.php");

$action = null;

if(isset($_POST["action"])){
    $action = $_POST['action'];
}

if(isset($_GET["action"])){
    $action = $_GET['action'];
}

switch ($action) {
    case 'buscarRecientes':
        $limit = 9;
        if(isset($_GET["limit"]))
            $limit = $_GET["limit"];
        $resp = Buscar::buscarRecientes($limit);
        echo json_encode($resp);
        break;
    
    default:
    http_response_code(404);
        break;
}