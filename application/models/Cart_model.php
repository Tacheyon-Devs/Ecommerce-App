<?php 
class Cart_model extends CI_Model
{
    public function addItem($data)
    {
        $array = array
        (
            "quantity"=>$data->quantity,
            "itemPrice"=>$data->itemPrice*$data->quantity,
            "description"=>$data->description,
            "type"=>$data->type,
            "itemId"=>$data->id,
            "name"=>$data->name,
            'userId'=>$data->userId,
            'businessId'=>$data->businessId
        );
        $this->db->insert("cart",$array);
    }
    public function deleteUserData($id)
    {
        $this->db->where("userId",$id);
        $this->db->delete("cart");
    }
    public function getCartTotal($userId)
    {
        $query = "SELECT SUM(itemPrice) total FROM cart where `userId`=".$userId;
        return $this->db->query($query)->result()[0]->total;
    }
    public function getOrderDetails($userId)
    {
        $this->db->select("*");
        $this->db->from("cart");
        $this->db->where("userId", $userId);
        return $this->db->get()->result();
    }
    public function getNumberOfBusinesses($userId)
    {
        $businesses = $this->db->query("SELECT DISTINCT(businessId) FROM cart where userId=".$userId."")->result();
        return $businesses;
    }
    public function getDistinctBusinesses($userId)
    {
        return $query = $this->db->query("SELECT DISTINCT(businessId) FROM cart WHERE userId =".$userId."")->result();

    }
    public function getSingleBusinessOrder($businessId,$userId)
    {
        return $query = $this->db->query("SELECT * FROM cart WHERE userId=".$userId." AND businessId=".$businessId."")->result(); 
    }
}