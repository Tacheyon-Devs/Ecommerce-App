<?php
class Item_model extends CI_Model
{
    public function addTags($tag,$item)
    {
        $array = array
        (
            "tagId"=>$tag,
            "itemId"=>$item
        );
        $this->db->insert("itemtags",$array);
    }
    public function getItemOwner($id)
    {
        $this->db->select("*");
        $this->db->from("businesses");
        $this->db->where("id",$id);
        $query = $this->db->get()->result()[0];
        return $query;

    }
    public function getItem($id)
    {
        $this->db->select("*");
        $this->db->from("items");
        $this->db->where("id",$id);
        $query = $this->db->get()->result()[0];
        return $query;

    }
    public function createItem($data,$path)
    {
        $array = array 
        (
            "name"=>$data->name,
            "itemPrice"=>$data->itemPrice,
            "businessId"=>$data->businessId,
            "description"=>$data->description,
            "itemImage"=>$path,

        );
        $this->db->insert("items",$array);
        return $this->db->insert_id();
    }
    public function getTags()
    {
        $this->db->select('*');
        $this->db->from('tags');
        $query =$this->db->get();
        return $query->result();
    }
}