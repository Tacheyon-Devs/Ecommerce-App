<?php
class Home_model extends CI_Model
{
    function sort($object1, $object2) 
    { 
        return $object1->createdAt > $object2->createdAt; 
    }
    public function getFeaturedData($featured)
    {
        $count = 10;
        $this->db->select("*");
        if($featured!==1)
        {
            $count = $featured*10;
            $this->db->limit(10,$count-10);
        }
        else
        {
            $this->db->limit(10);
        }    
        $this->db->from("items");
        $this->db->where('featured',"true");
        $items=$this->db->get()->result();
        $this->db->select("*");
        if($featured!==1)
        {
            $count = $featured*10;
            $this->db->limit(10,$count-10);
        }
        else
        {
            $this->db->limit(10,0);
        }    
        $this->db->from("events");
        $this->db->where('featured',"true");
        
        $events=$this->db->get()->result();
        $this->db->select("*");
        if($featured!==1)
        {
            $count = $featured*10;
            $this->db->limit(10,$count-10);
        }
        else
        {
            $this->db->limit(10);
        }    
        $this->db->from("businesses");
        $this->db->where('featured',"true");
        $businesses=$this->db->get()->result();
        $result = (array) array_merge($events,$items,$businesses);
        usort($result,array($this,"sort"));
        // usort($result, fn($a, $b) => strcmp($a->createdAt, $b->createdAt));
        return ($result);
    }
    public function getData($swipe)
    {
        $count = 10;
        $this->db->select("*");
        if($swipe!==1)
        {
            $count = $swipe*10;
            $this->db->limit(10,$count-10);
        }
        else
        {
            $this->db->limit(10);
        }    
        $this->db->from("items");
        $events=$this->db->get()->result();
        $this->db->select("*");
        if($swipe!==1)
        {
            $count = $swipe*10;
            $this->db->limit(10,$count-10);
        }
        else
        {
            $this->db->limit(10,0);
        }    
        $this->db->from("events");
        $items=$this->db->get()->result();
        $result = (array) array_merge($events,$items);
        usort($result,array($this,"sort"));
        // usort($result, fn($a, $b) => strcmp($a->createdAt, $b->createdAt));
        
        return ($result);


    }
}
// $string = '11/05/2016';//string variable
// $date = date('Y-m-d',time());//date variable

// $time1 = strtotime($string);
// $time2 = strtotime($date);
// if($time1>$time2){
//     //do this
// }
// else{
//     //do this
// }
// $this->db->limit($limit,$start or offset);