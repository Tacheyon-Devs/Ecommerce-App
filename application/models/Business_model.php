<?php 
class Business_model extends CI_Model
{
    
    public function getBusinessOwner($id)
    {
        $this->db->select("*");
        $this->db->from("users");
        $this->db->where("id",$id);
        $query = $this->db->get()->result()[0];
        return $query;
    }
    
    public function getBusiness($id)
    {
        $this->db->select("*");
        $this->db->from("businesses");
        $this->db->where("id",$id);
        $query = $this->db->get()->result()[0];
        return $query;
    }
    public function updateFeatured($data)
    {
        $this->db->set('featured',true);
        $this->db->where('id',$data);
        $this->db->update('businesses');
    }
    public function createBusiness($data,$image)
    {
        $array = array
        (
            'name'=>$data->name,
            'longitude'=>$data->longitude,
            'latitude'=>$data->latitude,
            'description'=>$data->description,
            'businessImage'=>$image,
            "ownerId"=>$data->userId,
            'categoryId'=>$data->categoryId,
        );
        $this->db->insert('businesses',$array);
        return $this->db->insert_id();
    }
    public function getCategories()
    {
        $this->db->select('*');
        $this->db->from('categories');
        $query =$this->db->get();
        return $query->result();
    }
    public function getMyBusinesses($userId)
    {
        $this->db->select('*');
        $this->db->from("businesses");
        $this->db->where("ownerId",$userId);
        return $query = $this->db->get()->result_array();
    }
    public function getBusinessObjects($data)
    {
        $this->db->select("*");
        $this->db->from("events");
        $this->db->where('businessId',$data->id);
        $result['events']= $this->db->get()->result();
        $this->db->select("*");
        $this->db->from("items");
        $this->db->where('businessId',$data->id);
        $result['items']= $this->db->get()->result();
        return $result;
    } 

}