<?php 
class Transaction_model extends CI_Model
{
    public function getDeliveredItems($orderId)
    {
        $this->db->select('*');
        $this->db->from('transactions');
        $this->db->where('orderId',$orderId);
        return $this->db->get()->result();
    }
    public function deleteTransaction($id)
    {
        $this->db->where("orderId",$id);
        $this->db->delete("transactions");
    }
    public function deleteOrder($id)
    {
        $this->db->where("orderId",$id);
        $this->db->delete("orders");
    }
    public function addOrderItem($item,$userId,$businessId,$QRCode,$uniqueCode)
    {
        $array= array
        (
            'userId'=>$userId,
            'businessId'=>$businessId,
            'qrCodeImage'=>$QRCode,
            'name'=>$item->name,
            'quantity'=>$item->quantity,
            'itemPrice'=>$item->itemPrice,
            'description'	=>$item->description,
            'orderId'=>$uniqueCode
        );
        $this->db->insert('transactions',$array);
        
    }
    public function getOrderProvider($businessId)
    {
        $this->db->select("*");
        $this->db->from('businesses');
        $this->db->where('id',$businessId);
        $query=$this->db->get()->result()[0];
        return $query;
    }
    public function verifyOrderVendor($data)
    {
        $this->db->select("*");
        $this->db->from('orders');
        $this->db->where('businessId',$data->businessId);
        $this->db->where('orderId',$data->orderId);
        $result = $this->db->get();
        if($result->num_rows()>0)
        {
            return $result->result()[0];
        }
        else
        {
            return false;
        }
    }
    public function getOrderDetails($code)
    {
        $this->db->select("*");
        $this->db->from("transactions");
        $this->db->where("orderId",$code);
        return $this->db->get()->result();
    }
    public function getActiveBusinessOrders($businessId)
    {
        $this->db->select("*");
        $this->db->from('orders');
        $this->db->where("businessId",$businessId);
        $this->db->where('status',"placed");
        return $this->db->get()->result();
    }
    public function updateStatus($status,$data)
    {
        $this->db->set('status',$status);
        $this->db->where("orderId",$data->orderId);
        $this->db->update('transactions');
        $this->db->set('status',$status);
        $this->db->where("orderId",$data->orderId);
        $this->db->update('orders');
        return true;
    }
    public function updateTransactionStatus($status,$data)
    {
        $this->db->set('status',$status);
        $this->db->where("orderId",$data->orderId);
        $this->db->where('id',$data->id);
        $this->db->update('transactions');
        
        $this->db->select("*");
        $this->db->from('transactions');
        $this->db->where('id',$data->id);
        $this->db->where('orderId',$data->orderId);
        $query = $this->db->get();
        if($query->num_rows()>0)
        {
            return $query->result()[0];
        }
        else
        {
            return null;
        }
    }
    public function updateOrderStatus($status,$data)
    {
        $this->db->set('status',$status);
        $this->db->where("orderId",$data->orderId);
        
        $this->db->update('orders');
        return true;
    }
    public function getOrdersFromStatus($status,$data)
    {
        $this->db->select("*");
        $this->db->from("orders");
        $this->db->where("businessId",$data->businessId);
        $this->db->where("status",$status);
        $query =  $this->db->get();
        if($query->num_rows()>0)
        {
            return $query->result();
        }
        else
        {
            return null;
        }
    }
    public function addOrder($uniqueCode,$businessId,$userId)
    {
        $array1=array
        (
                'orderId'=>$uniqueCode,
                'userId'=>$userId,
                'businessId'=>$businessId
        );
        $this->db->insert('orders', $array1);
    }
    public function getActiveUserOrders($userId)
    {
        $this->db->select("*");
        $this->db->from('orders');
        $this->db->where("userId",$userId);
        return $this->db->get()->result();
    }
    public function getUserOrderDetails($code)
    {
        $this->db->select("*");
        $this->db->from("transactions");
        $this->db->where("orderId",$code);
        return $this->db->get()->result();
    }
    public function getDeliveredOrders($data)
    {
        $this->db->select("*");
        $this->db->from("orders");
        $this->db->where("businessId",$data);
        $this->db->where("status","delivered");
        $query = $this->db->get();
        if($query->num_rows()>0)
        {
            return $query->result();
        }
        else
        {
            return null;
        }
    }
}