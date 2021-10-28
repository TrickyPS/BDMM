<?php


class Video {

    private $id_video;
    private $id_nivel;
    private $title;
    private $type;
    private $path;
    

    public function __construct($id_video,$id_nivel,$title,$type,$path){
        $this->id_video = $id_video;
        $this->id_nivel = $id_nivel;
        $this->title = $title;
        $this->type = $type;
        $this->path = $path;
    }

    public function AddVideo(){
        try {
            $db = Connection::connect();
            $query = $db->query("CALL SP_Video(1,".$this->id_video.",".$this->id_nivel.",'".$this->title."','".$this->type."','".$this->path."')");
            
            if($query){
              Connection::disconnect($db);
                return true; 
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
    public function findAllVideosByUser(){
        try {
            $db = Connection::connect();
            $query = $db->query("CALL SP_Video(2,".$this->id_video.",".$this->id_nivel.",'".$this->title."','".$this->type."','".$this->path."')");
            
            if($query){
              Connection::disconnect($db);
              $videos = null;
              while($row = $query->fetch_assoc()){
                  $videos[] = $row;
              }
              return $videos; 
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
    public function eliminarVideoById(){
        try {
            $db = Connection::connect();
            $query = $db->query("CALL SP_Video(3,".$this->id_video.",".$this->id_nivel.",'".$this->title."','".$this->type."','".$this->path."')");
            
            if($query){
              Connection::disconnect($db);
                return true; 
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