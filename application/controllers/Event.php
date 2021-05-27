<?php
// require(APPPATH."core/My_Controller.php");
class Event extends My_Controller 
{
    function __construct()
    {
        parent::__construct();
        $this->load->model("Event_model","eventModel");
    }
    public function createEvent()
    {
        // echo json_encode($this->data->tagId);
        // die;
        $fileInfo = finfo_open();
		 if($this->data)
         {
            if($this->data->eventImage=="" || $this->data->eventImage == NULL || isset($this->data->eventImage) == false)
			{
				$eventImagePath = "userAssets/eventImages/dummy.jpg";
				$eventId = $this->eventModel->createEvent($this->data,$eventImagePath);
				$result['data']['eventImage']=base64_encode(file_get_contents(base_url().$eventImagePath));
			}
			else 
			{
                $decodedEventImage = base64_decode(($this->data->eventImage));
                $extensionType = finfo_buffer($fileInfo, $decodedEventImage, FILEINFO_MIME_TYPE);
                if (strpos($extensionType, "jpg")!==false || strpos($extensionType, "jpeg") !== false) 
				{
                    $extensionType=".jpg";
                } 
				else 
				{
                     $extensionType=".png";
                }
                $eventName = str_replace(" ","",$this->data->name);
                $eventImageName = $eventName.uniqid().$extensionType;
				$eventImagePath = "userAssets/eventImages/".$eventImageName;
				file_put_contents($eventImagePath,base64_decode($this->data->eventImage));
				$eventId = $this->eventModel->createEvent($this->data,$eventImagePath);
				
            }
                foreach($this->data->tagId as $tagId)
                {
                    $this->eventModel->addTags($tagId,$eventId);
                }
                $result['data']['eventImage']=base64_encode(file_get_contents(base_url().$eventImagePath));
                $result['data']['eventId']=$eventId;

                $result['data']['userId']=$this->data->userId;
                $result['success']	=true;
                // $result['data']['token']=jwt_encode($this->config->item('secretData'),$this->config->item("secretKey"));						
                $result['message']="Event was created successfully";
            
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
    public function loadCreateEventPage()
    {
        $verifyToken = jwt_decode($this->data->token,$this->config->item("secretKey"));
        if($verifyToken)
        {
            $result['success'] =true;
            $result['message'] ="Continue to create event page";
            $result['data']['token']=$this->data->token;
            $result['data']['userId']=$this->data->userId; 
            $result['data']['tags']=$this->eventModel->getTags();
            echo json_encode($result);
        }
        else
        {
            $result['success']=false;
            $result['message']="Unauthorized Token!!";
            echo json_encode($result);
        }
    
    }
    public function loadViewEventPage()
    {
        $verifyToken = jwt_decode($this->data->token,$this->config->item("secretKey"));
        if($verifyToken)
        {
            $result['success'] =true;
            $result['message'] ="Continue to load event page";
            $result['data']['token']=$this->data->token;
            $result['data']['userId']=$this->data->userId;
            $result['data']['eventId']=$this->data->eventId;

            echo json_encode($result);
        }
        else
        {
            $result['success']=false;
            $result['message']="Unauthorized Token!!";
            echo json_encode($result);

        }
    }
    public function viewEvent()
    {
        $event = $this->eventModel->getEvent($this->data->id);
        $eventOwner = $this->eventModel->getEventOwner($event->businessId);
        $data['event']=$event;
        $data['business']=$eventOwner;
        if($data['business']->ownerId==$this->data->userId)
		{
			$data['editable']=true;
            $data['canPurchaseTicket']=false;
		}
		else
		{
			$data['editable']=false;
            $data['canPurchaseTicket']=true;
		}
        echo json_encode($data);
    }
    
}