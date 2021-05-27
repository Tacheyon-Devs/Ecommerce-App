<?php
class Comment_model extends CI_Model
{
    public function addComment($data)
    {
        $array = array
        (
            'text'=>$data->comment,
            'parentId'=>$data->postId,
            'userId'=>$data->userId
        );
        if($data->postType=="event")
        {
            $array['type']="event";
        }
        else
        {
            $array['type']="item";
        }
        $this->db->insert('comments',$array); 
         $result = $this->db->insert_id();
         $this->db->select('*');
         $this->db->from('comments');
         $this->db->where('id',$result);
         return $result = $this->db->get()->result()[0];

    }
    public function getCommentOwner($id)
    {
        $this->db->select("*");
        $this->db->from("users");
        $this->db->where('id',$id);
        return $this->db->get()->result()[0];
        
    }
    public function addLike($data)
    {
        $this->db->select("*");
        $this->db->from('comments');
        $this->db->where('id',$data->commentId);
        if($data->postType == 'item')
        {
            $this->db->where('type','item');
        }
        else
        {
            $this->db->where('type','event');
        }
        $result= $this->db->get()->result()[0];
        
        $result->likes = $result->likes+1;
        $this->db->where('id',$result->id);
        $this->db->where('type',$result->type);
        $this->db->update("comments",$result);
        return $result;
        
    }
    public function getCommentedObjectDetails($data)
    {
        $this->db->select("*");
        if($data->postType=="event")
        {
            $this->db->from('events');
        }
        else
        {
            $this->db->from('items');
        }
        $this->db->where('id',$data->postId);
        return $this->db->get()->result()[0];
    }
    public function getLikerDetails($id)
    {
        $this->db->select("*");
        $this->db->from("users");
        $this->db->where('id',$id);
        return $this->db->get()->result()[0];
    }
    public function getBusinessOwner($data)
    {
        $this->db->select("*");
        $this->db->from("users");
        $this->db->where('id',$data);
        return $this->db->get()->result()[0];
    }
    public function getBusiness($businessId)
    {
        $this->db->select("*");
        $this->db->from('businesses');
        $this->db->where('id',$businessId);
        return $this->db->get()->result()[0];
    }
    public function getLikedObject($result)
    {
        $this->db->select('*');
        
        if($result->type=='event')
        {
            $this->db->from('events');
        }
        else
        {
            $this->db->from('items');
        }
        $this->db->where('id',$result->parentId);
        return $result = $this->db->get()->result()[0];
    }
}