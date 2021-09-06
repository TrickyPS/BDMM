<?php


class User {


    private $name;
    private $isStudent;
    private $email;
    private $pass;
    private $gender;
    private $avatar;


    
    public function  __construct($name ,$email ,$pass ,$isStudent ,$avatar,$gender){
        $this->name = $name;
        $this->email = $email;
        $this->pass = $pass;
        $this->isStudent = $isStudent;
        $this->avatar = $avatar;
        $this->gender = $gender;
    }

    public function Save(){
       try {
        
        $db = Connection::connect();
        $db->query("CALL SP_AddUser('".$this->name."','".$this->email."','".$this->pass."',".$this->isStudent.")");
        Connection::disconnect($db);
        return true;
       } catch (\Throwable $th) {
           return false;
       }
    }

    public  function Auth(){
        try {
            $user = null;
            $db = Connection::connect();
            $query = $db->query("CALL SP_FindUserByAuth('".$this->name."','".$this->pass."')");
            if($query != null){
                $user = $query->fetch_assoc();
                return $user; 
              }
              else{
                
                return false;
              }
            Connection::disconnect($db);
            return true;
           } catch (\Throwable $th) {
               return false;
           }
    }

}

?>