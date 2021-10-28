<?php
include("../models/Curso.php");
include("../db/Connection.php");

$action = null;

if(isset($_POST["action"])){
    $action = $_POST['action'];
}

if(isset($_GET["action"])){
    $action = $_GET['action'];
}

switch ($action) {
    case "addCurso":
       if(isset($_POST["name"]) && isset($_POST["description"])
        && isset($_POST["user"]) && isset($_POST["price"]) ){
        $name = $_POST["name"];
        $description = $_POST["description"];
        $id_user = $_POST["user"];
        $price = $_POST["price"];
        $price = $price == "" ? "null":$price;
        $image =  addslashes(file_get_contents($_FILES['image']['tmp_name']));
        $type = $_FILES['image']['type'];
        $curso = new Curso($id_user,$name,$description,$price,$image,$type,"",0);
        $resp = $curso->AddCurso();
        echo json_encode($resp);
       }else{
        http_response_code(404);
       }
    break;

    case "updateCurso":
        if(isset($_POST["name"]) && isset($_POST["description"])
         && isset($_POST["user"]) && isset($_POST["price"]) && isset($_POST["curso"]) ){
         $name = $_POST["name"];
         $curso = $_POST["curso"];
         $description = $_POST["description"];
         $id_user = $_POST["user"];
         $price = $_POST["price"];
         $price = $price == "" ? "null":$price;
         $image =  addslashes(file_get_contents($_FILES['image']['tmp_name']));
         $type = $_FILES['image']['type'];
         $curso = new Curso($id_user,$name,$description,$price,$image,$type,"",$curso);
         $resp = $curso->UpdateCurso();
         echo json_encode($resp);
        }else{
         http_response_code(404);
        }
     break;

    case "getAllCursosByUser":
        $user = $_GET["user"];
         $curso = new Curso($user,"","","null","","",0,0);
         $resp = $curso->GetCursoByUser();
         echo json_encode($resp);
     break;

     case "eliminarCurso":
        $user = $_GET["user"];
         $curso = new Curso(0,"","",0,"","","",$user);
         $resp = $curso->DeleteCurso();
         echo json_encode($resp);
     break;

     case "publicarCurso":
        $user = $_GET["user"];
         $curso = new Curso(0,"","",0,"","","",$user);
         $resp = $curso->PublicarCurso();
         echo json_encode($resp);
     break;

    
    default:
        http_response_code(404);
        break;
}