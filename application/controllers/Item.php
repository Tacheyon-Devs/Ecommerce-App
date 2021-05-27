<?php
class Item extends My_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model("Item_model","itemModel");
    }
    public function createItem()
    {
        $fileInfo = finfo_open();
		 if($this->data)
         {
            if($this->data->itemImage=="" || $this->data->itemImage == NULL || isset($this->data->itemImage) == false)
			{
				$itemImagePath = "userAssets/itemImages/dummy.jpg";
				$itemId = $this->itemModel->createItem($this->data,$itemImagePath);
				$result['data']['itemImage']=base64_encode(file_get_contents(base_url().$itemImagePath));
			}
			else 
			{
                $decodedItemImage = base64_decode(($this->data->itemImage));
                $extensionType = finfo_buffer($fileInfo, $decodedItemImage, FILEINFO_MIME_TYPE);
                if (strpos($extensionType, "jpg")!==false || strpos($extensionType, "jpeg") !== false) 
				{
                    $extensionType=".jpg";
                } 
				else 
				{
                     $extensionType=".png";
                }
                $itemName = str_replace(" ","",$this->data->name);
                $itemImageName = $itemName.uniqid().$extensionType;
				$itemImagePath = "userAssets/itemImages/".$itemImageName;
				file_put_contents($itemImagePath,base64_decode($this->data->itemImage));
				$itemId = $this->itemModel->createItem($this->data,$itemImagePath);
				
            }
                foreach($this->data->tagId as $tagId)
                {
                    $this->itemModel->addTags($tagId,$itemId);
                }
                $result['data']['itemImage']=base64_encode(file_get_contents(base_url().$itemImagePath));
                $result['data']['itemId']=$itemId;
                
                $result['success']	=true;
                // $result['data']['token']=jwt_encode($this->config->item('secretData'),$this->config->item("secretKey"));						
                $result['message']="Item was created successfully";
            
                echo json_encode($result);
                die;
         }
         else
         {
             $result['success']=false;
             $result['message']="Please enter some data";
             echo json_encode($result);
         }
    }
    public function loadCreateitemPage()
    {
        $verifyToken = jwt_decode($this->data->token,$this->config->item("secretKey"));
        if($verifyToken)
        {
            $result['success'] =true;
            $result['message'] ="Continue to create item page";
            $result['data']['token']=$this->data->token;
            $result['data']['userId']=$this->data->userId; 
            $result['data']['tags']=$this->itemModel->getTags();
            echo json_encode($result);
        }
        else
        {
            $result['success']=false;
            $result['message']="Unauthorized Token!!";
            echo json_encode($result);
        }
    }
    
    public function loadViewItemPage()
    {
        $verifyToken = jwt_decode($this->data->token,$this->config->item("secretKey"));
        if($verifyToken)
        {
            $result['success'] =true;
            $result['message'] ="Continue to load item page";
            $result['data']['token']=$this->data->token;
            $result['data']['userId']=$this->data->userId; 
            echo json_encode($result);
        }
        else
        {
            $result['success']=false;
            $result['message']="Unauthorized Token!!";
            echo json_encode($result);

        }
    }
    
    public function viewItem()
    {
        
        $item = $this->itemModel->getItem($this->data->id);
        // var_dump($item->businessId);die;
        $itemOwner = $this->itemModel->getItemOwner($item->businessId);
        $data['item']=$item;
        $data['business']=$itemOwner;
        if($this->data->userId==$itemOwner->ownerId)
        {
			$data['editable']=true;
            $data['canPurchaseitem']=false;
		}
		else
		{
			$data['editable']=false;
            $data['canPurchaseTicket']=true;
		}
        echo json_encode($data);
    }
   

    // public function stripeResponseHandler($status, $response) {
    //     if ($response.error) {
    //         $('.error')
    //             .removeClass('hide')
    //             .find('.alert')
    //             .text(response.error.message);
    //     } else {
    //         $token = $response['id'];
    //         return $token;
            
    //     }
    // }
}