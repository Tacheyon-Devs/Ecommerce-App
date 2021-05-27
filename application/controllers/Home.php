<?php
// require(APPPATH."core/My_Controller.php"); 
class Home extends MY_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model("Home_model","homeModel");
        $this->load->model("Event_model","eventModel");
        $this->load->model("Cart_model","cartModel");        
    }
    public function inviteFriend()
    {
        $user = explode("/",$_SERVER['REQUEST_URI'])[2];
        $invitationCode = explode("/",$_SERVER['REQUEST_URI'])[3];
        echo json_encode($invitationCode);
    }
    public function getNearByEvents()
	{
		$query = $this->eventModel->getNearByEvents($this->data->latitude,$this->data->longitude);
		return $query;
	}
    public function addToCart()
    {
        $array=[];
        // $data=[];
        foreach($this->data as $item)
        {
            $this->cartModel->addItem($item);
        }
        $data['message']="Items added successfully.";
        $data['success']=true;
        echo json_encode($data);
    }
    public function sendInvitation()
    {   
        $data['invitationCode'] = uniqid().uniqid().uniqid();
        $data['userId']=$this->data->userId;
        $data['friendEmail']=$this->data->friendEmail;
        $invitation=$this->userModel->sendInvitationCode($data);
        // echo json_encode($invitation);die;
        $mail = $this->phpmailer->load();
        $mail->IsSMTP();
        $mail->Mailer = "smtp";
        // $mail->SMTPDebug  = 1;  
        $mail->SMTPAuth   = TRUE;
        $mail->SMTPSecure = "tls";
        $mail->Port       = 587;
        $mail->Host       = "smtp.gmail.com";
        $mail->Username   = $this->config->item('smtpEmail');
			$mail->Password   = $this->config->item('smtpPassword');
        $mail->IsHTML(true);
        $mail->AddAddress($invitation->email);
        $mail->SetFrom("malikzaman133@gmail.com", "ECommerce App");
        $mail->AddReplyTo("malikzaman133@gmail.com", "Bilal Malik");
        $mail->Subject = "Ecommerce App invitation sent via Gmail SMTP Server using PHP Mailer";
        
        $content = "<b>This is a Test Email sent via Gmail SMTP Server using PHP mailer class.</b> \n n\\Please click on the following link to accept invite. :) "
        .base_url()."invitation/".$invitation->userId."/".$invitation->invitationCode;
        $mail->MsgHTML($content); 
        if(!$mail->Send()) 
        {
            $result['message']="Error while sending Email.";
            $result['success']=false;
            echo json_encode($result);
            die;
        } 
        else 
        {
            $result['message'] = "Invitation Sent Successfully!";
        }
        $result['success']	="true";						
        
        echo json_encode($result);
        
    }
    public function loadMoreData()
    {
        $data['itemEvents'] = $this->homeModel->getData($this->data->value);
        if(isset($data['itemEvents']))
        {
            $data['success']=true;
            echo json_encode($data);
        }
        else
        {
            $data['itemEvents']="Empty";
            $data['success']         =true;
            echo json_encode($data);
        }

    }
    public function loadMoreFeaturedData()
    {
        $data['featuredData']=$this->homeModel->getFeaturedData($this->data->value);
        if(isset($data['featuredData']))
        {
            $data['success']         =true;
            echo json_encode($data);
        }
        else
        {
            $data['featuredData']="Empty";
            $data['success']         =true;
            echo json_encode($data);
        }
        
    }
    public function loadMoreNearByData()
    {
        $data['nearByEvents']=$this->getNearByEvents();
        $data['success']="true";
        echo json_encode($data);
    }
    function index()
    {
        $swipe=$this->data->swipe;
        $featured=$this->data->featured;
        
        if(isset($this->data->latitude) && isset($this->data->latitude))
        {
            $data['nearByEvents']=$this->getNearByEvents();
        }
        else
        {
            $data['nearByEvents']="Empty";
        }
        
        $data['itemEvents'] = $this->homeModel->getData(1);
        $data['featuredData']=$this->homeModel->getFeaturedData(1);
        
        if (empty($data['itemEvents']) ) 
        {
            $result['itemsEvents']="Empty.";
            $result['success']="true";
            echo json_encode($result);
        }
        else if( empty($data['featuredData']))
        {
            $result['featuredData']="Empty.";
            $result['success']="true";
            echo json_encode($result);
        }
        else if( empty($data['nearByEvents']))
        {
            $result['message']="No more nearby events.";
            $result['success']="true";
            echo json_encode($result);
        }
        else
        {   
            $result['message']="Loaded Data Successfully";
            $result['success']="true";
            $result['data']=$data;
            echo json_encode($result);
            die;
        }
    }
}