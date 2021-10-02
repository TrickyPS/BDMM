<?php


class User {


    private $name;
    private $isStudent;
    private $email;
    private $pass;
    private $gender;
    private $avatar;


    
    public function  __construct($name ,$email ,$pass ,$isStudent ,$avatar,$gender,$birth){
        $this->name = $name;
        $this->email = $email;
        $this->pass = $pass;
        $this->isStudent = $isStudent;
        $this->avatar = $avatar;
        $this->gender = $gender;
        $this->birth = $birth;
    }

    public function Save(){
       try {
        $result = null;
        $db = Connection::connect();
        $query = $db->query("CALL SP_AddUser('".$this->name."','".$this->email."','".$this->pass."',".$this->isStudent.")");
        
        if($query){
          Connection::disconnect($db);
            $user = $query->fetch_assoc();
            return $user; 
          }
          else{
            echo $db->error;
            Connection::disconnect($db);
            return false;
          }
        return true;
       } catch (\Throwable $th) {
           return false;
       }
       Connection::disconnect($db);
    }

    public  function Auth(){
        try {
            $user = null;
            $db = Connection::connect();
            $query = $db->query("CALL SP_FindUserByAuth('".$this->name."','".$this->pass."')");
            
            if($query){
              Connection::disconnect($db);
                $user = $query->fetch_assoc();
                $user["avatar"] = base64_encode($user["avatar"]);
                return $user; 
              }
              else{
                echo $db->error;
                Connection::disconnect($db);
                return false;
              }
            return true;
           } catch (\Throwable $th) {
               return false;
           }
           Connection::disconnect($db);
    }

    public function Update($id,$update_avatar,$type){
      try { 
        $result = null;
        $db = Connection::connect();
        $query = $db->query("CALL SP_UpdateUser(".$id.",'".$this->name."','".$this->email."','".$this->pass."',".$this->gender.",'".$this->avatar."',".$type.",".$this->birth.",".$update_avatar.")");
        if($query){
          Connection::disconnect($db);
            $user = $query->fetch_assoc();
            $user["avatar"] = base64_encode($user["avatar"]);
            return $user; 
          }
          else{
            echo $db->error;
            Connection::disconnect($db);
            return false;
          }
        return true;
       } catch (\Throwable $th) {
           return false;
       }
       Connection::disconnect($db);
    }

}

?>