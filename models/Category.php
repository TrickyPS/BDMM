<?php


class Category {

    private $name;
    private $description;
    private $id_user;

    public function __construct($name,$description,$id_user){
        $this->name = $name;
        $this->description = $description;
        $this->id_user = $id_user;
    }

    public function AddCategory(){
        try {
            $db = Connection::connect();
            $query = $db->query("CALL SP_Category(1,'".$this->name."','".$this->description."',".$this->id_user.")");
            
            if($query){
              Connection::disconnect($db);
              $categories = null;
                while($row = $query->fetch_assoc()){
                    $categories[] = $row;
                }
                return $categories; 
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


    public function FindAll(){
        try {
            $db = Connection::connect();
            $query = $db->query("CALL SP_Category(2,'".$this->name."','".$this->description."',".$this->id_user.")");
            
            if($query){
              Connection::disconnect($db);
              $categories = null;
                while($row = $query->fetch_assoc()){
                    $categories[] = $row;
                }
                return $categories; 
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