<?php

class Buscar {

    public static function buscarRecientes($limit){
        try {
            $db = Connection::connect();
            $query = $db->query("CALL SP_Buscar(1,".$limit.")");
            
            if($query){
                Connection::disconnect($db);
                $cursos = null;
                  while($row = $query->fetch_assoc()){
                    $row["image"] = base64_encode($row["image"]);
                    $cursos[] = $row;
                      
                  }
                  return $cursos; 
              }
              else{
                echo $db->error;
                Connection::disconnect($db);
                return false;
              }
           } catch (Exception $th) {
               return false;
           }
           Connection::disconnect($db);
    }

}