<?php 
class User_model extends CI_Model
{
    public function sendInvitationCode($data)
    {
        $array = array
        (
            'userId'=>$data['userId'],
            'invitationCode'=>$data['invitationCode'],
            'email'=> $data['friendEmail'],
        );
        $this->db->insert('invites',$array);
        $result = $this->db->insert_id();
        $this->db->select('*');
        $this->db->from("invites");
        $this->db->where("id", $result);
        $query = $this->db->get();

        if($query->num_rows()>0)
        {
            return $query->result()[0];
        }
        else
        {
            return false;
        }
    }
    public function verifyEmail($email)
    {
        $this->db->select('*');
        $this->db->from("users");
        $this->db->where("email", $email);
        $query = $this->db->get();
        // $result = $query->result()[0];
        if($query->num_rows()>0)
        {
            return true;
        }
        else
        {
            return false;
        }
        // if()
    }
    public function getUserById($id)
    {
        $this->db->select('*');
        $this->db->from("users");
        $this->db->where("id", $id);
        $query = $this->db->get();
        // $result = $query->result()[0];
        if($query->num_rows()>0)
        {
            return $query->result()[0];
        }
        else
        {
            return false;
        }
    }
    public function logInUser($data)
    {
        $array = array
        (
            "email"=>$data->email,
            "passWord"=>$data->password
        );
        $this->db->select("*");
        $this->db->from("users");
        $this->db->where($array);
        $query = $this->db->get();
        if($query->num_rows()>0)
        {
            return $query->result()[0];
        }
        else
        {
            return false;
        }
    }
    public function verifyUserName($userName)
    {
        $this->db->select('*');
        $this->db->from("users");
        $this->db->where("userName", $userName);
        $query = $this->db->get();
        // $result = $query->result()[0];
        if($query->num_rows()>0)
        {
            return true;
        }
        else
        {
            return false;
        }
        // if()
    }
    public function signUpUser($data,$path=NULL)
    {
        $array = array
        (
            'name'=>$data->first." ".$data->last,
            'email'=>$data->email,
            'password'=>$data->password,
            'userName'=>$data->userName,
            'profileImage'=>$path,
            'verificationStatus'=>"false"
        );
        $this->db->insert('users',$array);
        return $this->db->insert_id();
    }
    public function createVerificationCode($userId,$code)
    {
        $array = array
        (
            'userId'=>$userId,
            'verificationCode'=>$code
        );
        $this->db->insert('verificationcodes',$array);
    }
    public function verifyUserAccount($code)
    {
        $this->db->select("*");
        $this->db->from('verificationcodes');
        $this->db->where('verificationCode',$code);
        $query = $this->db->get();
        if($query->num_rows()>0)
        {
            return $query->result()[0];
        }
        else
        {
            return false;
        }
    }
    public function setVerificationStatus($code)
    {
        $this->db->set("verificationStatus",true);
        $this->db->where("id",$code);
        $this->db->update("users");
        $this->db->where("userId",$code);
        $query =$this->db->delete("verificationcodes");
        
    }
}