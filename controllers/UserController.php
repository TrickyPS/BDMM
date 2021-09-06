<?php

include("../models/User.php");
include("../db/Connection.php");

header('Content-Type: application/json');


if (isset($_SERVER['REQUEST_METHOD']))
{
  switch ($_SERVER['REQUEST_METHOD'])
  {
    case 'PUT':
      http_response_code(404);
      echo "Resource Not Foud";
      break;

    case 'DELETE':
      http_response_code(404);
      echo "Resource Not Foud";
      break;

      case 'GET':
        http_response_code(404);
      echo "Resource Not Foud";
        break;

      case 'POST':
        try {
          $json = file_get_contents('php://input');
          $data = json_decode($json);
          $name = $data->name;
          $email = $data->email;
          $pass = $data->pass;
          $isStudent = $data->isStudent;
          
          if($name && $email && $pass && $isStudent){
            $user = new User($name, $email, $pass,$isStudent,null,null);
            if($user->Save() ){
              http_response_code(200);
              echo json_encode(array("message"=>"User created successfully"));
            }else{
              http_response_code(500);
              echo json_encode(array("message"=>"Internal Error"));
            }
          }else{
            http_response_code(400);
            echo json_encode(array("message"=>"Bad Request"));
          }
        } catch (\Throwable $th) {
          http_response_code(500);
          echo json_encode(array("message"=>"Internal Error"));
        }
        break;

      default :
      http_response_code(404);
      echo json_encode(array("message"=>"Resource Not Found "));
  }
}









?>