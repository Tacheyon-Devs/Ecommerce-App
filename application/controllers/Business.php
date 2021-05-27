<?php
// require(APPPATH."core/My_Controller.php");
class Business extends My_Controller 
{

	public function __construct()
  	{
        parent::__construct();
        $this->load->model("Business_model","businessModel");	
    }
	public function createBusiness()
	{
        $fileInfo = finfo_open();
		 if($this->data)
         {
            if($this->data->businessImage=="" || $this->data->businessImage == NULL || isset($this->data->businessImage) == false)
			{
				$businessImagePath = "userAssets/businessImages/dummy.jpeg";
				$businessId = $this->businessModel->createBusiness($this->data,$businessImagePath);
				$result['data']['businessImage']=base64_encode(file_get_contents(base_url().$businessImagePath));
			}
			else 
			{
                $decodedBusinessImage = base64_decode(($this->data->businessImage));
                $extensionType = finfo_buffer($fileInfo, $decodedBusinessImage, FILEINFO_MIME_TYPE);
                if (strpos($extensionType, "jpg")!==false || strpos($extensionType, "jpeg") !== false) 
				{
                    $extensionType=".jpg";
                } 
				else 
				{
                     $extensionType=".png";
                }
                $businessName = str_replace(" ","",$this->data->name);
                $businessImageName = $businessName.uniqid().$extensionType;
				$businessImagePath = "userAssets/businessImages/".$businessImageName;
				file_put_contents($businessImagePath,base64_decode($this->data->businessImage));
				$businessId = $this->businessModel->createBusiness($this->data,$businessImagePath);
				
            }
                $result['data']['businessImage']=base64_encode(file_get_contents(base_url().$businessImagePath));
                $result['data']['businessId']=$businessId;
                $result['data']['userId']=$this->data->userId;
                $result['success']	=true;
                // $result['data']['token']=jwt_encode($this->config->item('secretData'),$this->config->item("secretKey"));						
                $result['message']="Business was created successfully";
                // $result['profileImage']=/
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
	public function loadViewBusinessPage()
    {
        $verifyToken = jwt_decode($this->data->token,$this->config->item("secretKey"));
        if($verifyToken)
        {
            $result['success'] =true;
            $result['message'] ="Continue to load business page";
            $result['data']['token']=$this->data->token;
            $result['data']['userId']=$this->data->userId; 
			$result['data']['businessId']=$this->data->businessId; 
            echo json_encode($result);
        }
        else
        {
            $result['success']=false;
            $result['message']="Unauthorized Token!!";
            echo json_encode($result);

        }
    }
    public function viewBusiness()
    {
        $business = $this->businessModel->getBusiness($this->data->id);
        $data['business']=$business;
		$data['businessObjects'] = $this->businessModel->getBusinessObjects($this->data);

        $data['owner']=$this->data->userId;
		if($data['owner']==$data['business']->ownerId)
		{
			$data['editable']=true;
		}
		else
		{
			$data['editable']=false;
		}
        echo json_encode($data);
    }
	public function loadMyBusinessesPage()
	{	
		
		$verifyToken = jwt_decode($this->data->token,$this->config->item("secretKey"));
		if($verifyToken)
		{
			$result['success'] =true;
			$result['data']['myBusinesses'] = $this->businessModel->getMyBusinesses($this->data->userId);
			$result['message'] ="Continue to my businesses page";
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
	public function loadCreateBusinessPage()
	{	
		$verifyToken = jwt_decode($this->data->token,$this->config->item("secretKey"));
		if($verifyToken)
		{
			$result['success'] =true;
			$result['data']['businessCategories']=$this->businessModel->getCategories();
			$result['message'] ="Continue to create business page";
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
	public function getBusinessFeatured()
	{
		
		require_once(APPPATH.'/third_party/stripe/init.php');
        \Stripe\Stripe::setApiKey($this->config->item('stripeSecretkey'));
        $stripe = new \Stripe\StripeClient(
            $this->config->item('stripeSecretkey')
          );
        $token = $stripe->tokens->create
        ([
            'card'=>
            [
                'number' => "4242 4242 4242 4242",
                'exp_month' => 10,
                'exp_year' => 2022,
                'cvc' => 321,
            ]  
        ]);
        $tokenId = $token->id;
        $createToken = \Stripe\Charge::create 
        ([
            "amount" => 100000,
            "currency" => "PKR",
            "source" => $tokenId,
            "description" => "Purchase from ecommerce app for featuring Business" 
        ]);
		if($createToken->paid)
		{
			$business = $this->businessModel->getBusiness($this->data->id);
			$this->businessModel->updateFeatured($business->id);
			$businessOwner = $this->businessModel->getBusinessOwner($business->ownerId);
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
			$mail->AddAddress($businessOwner->email, $businessOwner->name);
			$mail->SetFrom("malikzaman133@gmail.com", "ECommerce App");
			$mail->AddReplyTo("malikzaman133@gmail.com", "Bilal Malik");
			// $mail->AddCC("cc-recipient-email@domain", "cc-recipient-name");
			$mail->Subject = "App Response for featuring request.";
			$receipt = "Your business".$business->name." was added to featured successfully!";
			// $content =implode($cartData);
			$mail->MsgHTML($receipt); 
			if(!$mail->Send()) 
			{
				$result['message']="Error while sending Email.";
				$result['success']=false;			
			} 
			else 
			{
				$result['message'] = "user was created and a verifcation Email sent successfully";
                $result['success']	="true";
            }
			
        echo json_encode($mail);
		die;	
		}
		else
		{
			$data['result']="False";
			$data['message'] = "Payment was unsuccessful";
			die;
			// echo json
		}
    }
}