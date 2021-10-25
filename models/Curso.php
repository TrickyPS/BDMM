<?php

class Curso{

    private $name;
    private $description;
    private $user;
    private $precio;
    private $image;
    private $type;
    private $isPublic;

    public function __construct($user,$name,$description,$precio,$image,$type,$isPublic){
        $this->user = $user;
        $this->name=$name;
        $this->description=$description;
        $this->precio = $precio;
        $this->image = $image;
        $this->type = $type;
        $this->isPublic = $isPublic;
        
    }

    public function AddCurso(){
        try {
            $db = Connection::connect();
            $query = $db->query("CALL SP_Curso(1,".$this->user.",0,'".$this->name."','".$this->description."',".$this->precio.",'".$this->image."','".$this->type."')");
            
            if($query){
              Connection::disconnect($db);
              $category = $query->fetch_assoc();
                return $category; 
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

    public function GetCursoByUser(){
        try {
            $db = Connection::connect();
            $query = $db->query("CALL SP_Curso(2,".$this->user.",0,'".$this->name."','".$this->description."',".$this->precio.",'".$this->image."','".$this->type."')");
            
            if($query){
                Connection::disconnect($db);
                $cursos = null;
                  while($row = $query->fetch_assoc()){
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