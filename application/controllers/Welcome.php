<?php
// require(APPPATH."core/My_Controller.php");
class Welcome extends My_Controller 
{

	public function __construct()
  	{
        parent::__construct();
		$this->load->library('session');
    }
	public function index()
	{
		echo json_encode($_SERVER);die;
		// echo"asd";
		// die;
		$this->load->view("jwtTest");
	}
	function isJson($string) 
	{
		json_decode($string);
		return (json_last_error() == JSON_ERROR_NONE);
	}
	function data_uri($file, $mime) 
	{  
		$contents = file_get_contents($file);
		$base64   = base64_encode($contents); 
		return ('data:' . $mime . ';base64,' . $base64);
	}
	function signUp()
	{
		// $data['0']=$this->config->item('smtpEmail');
		// $data['2']= $this->config->item('smtpPassword');
		// echo json_encode($data);die;
		if($this->data)
		{
			$inputEmail = $this->userModel->verifyEmail($this->data->email);
			$inputUserName = $this->userModel->verifyUserName($this->data->userName);
			if($inputEmail)
			{
				$result['success']=false;
				$result['message']="This email address is already taken.";
				echo json_encode($result);
				die();
			}
			if($inputUserName)
			{
				$result['success']=false;
				$result['message']="This username is already taken.";
				echo json_encode($result);
				die();
			}
			$fileInfo = finfo_open();
           
			if($this->data->profileImage=="" || $this->data->profileImage == NULL || isset($this->data->profileImage) == false)
			{
				$profileImagePath = "userAssets/profileImages/dummy.png";
				$userId = $this->userModel->signUpUser($this->data,$profileImagePath);
				$result['data']['profileImage']=($profileImagePath);
			}
			else 
			{
                $decodedProfileImage = base64_decode($this->data->profileImage);
                $extensionType = finfo_buffer($fileInfo, $decodedProfileImage, FILEINFO_MIME_TYPE);
                if (strpos($extensionType, "jpg")!==false || strpos($extensionType, "jpeg") !== false) 
				{
                    $extensionType=".jpg";
                } 
				else 
				{
                    echo $extensionType=".png";
                }
				$profileImageName = $this->data->first.$this->data->last.uniqid().$extensionType;
				$profileImagePath = "userAssets/profileImages/".$profileImageName;
				file_put_contents($profileImagePath,base64_decode($this->data->profileImage));
				$userId = $this->userModel->signUpUser($this->data,$profileImagePath);
				$result['data']['profileImage']=($profileImagePath);
            }

			$verificationCode = uniqid().uniqid();
			$this->userModel->createVerificationCode($userId,$verificationCode);
			$mail = $this->phpmailer->load();
			$mail->IsSMTP();
			$mail->Mailer = "smtp";
			$mail->SMTPDebug  = 1;  
			$mail->SMTPAuth   = TRUE;
			$mail->SMTPSecure = "tls";
			$mail->Port       = 587;
			$mail->Host       = "smtp.gmail.com";
			$mail->Username   = $this->config->item('smtpEmail');
			$mail->Password   = $this->config->item('smtpPassword');
			$mail->IsHTML(true);
			$mail->AddAddress($this->data->email, $this->data->first." ".$this->data->last);
			$mail->SetFrom("malikzaman133@gmail.com", "ECommerce App");
			$mail->AddReplyTo("malikzaman133@gmail.com", "Bilal Malik");
			// $mail->AddCC("cc-recipient-email@domain", "cc-recipient-name");
			$mail->Subject = "Email Verification notification sent via Gmail SMTP Server using PHP Mailer";
			
			$content = "<b>This is a Test Email sent via Gmail SMTP Server using PHP mailer class.</b> \n n\\Please click on the following link to verify your account. :) "
			.base_url()."verify/".$verificationCode;
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
				$result['message'] = "user was created and a verifcation Email sent successfully";
			}
			$result['success']	="true";						
			
			echo json_encode($result);
			
		}
		else
		{
			$result['success']=false;
			$result['message']="Please enter some data";
			echo (json_encode($result));die();
		}
	}
	public function logIn()
	{
		
		$loggedIn = $this->userModel->logInUser($this->data);
		// var_dump($loggedIn);die;
		if($loggedIn)
		{
			// $this->session->set_userdata("userId",$loggedIn->id);
			// echo $this->session->userdata("userId");die;
			$result['success'] = true;

			$result['data']['profileImage']=base64_encode(file_get_contents(base_url().$loggedIn->profileImage));
			$result['data']['token']=jwt_encode($this->config->item('secretData'),$this->config->item("secretKey"));
			$result['data']['user']=$loggedIn;
			$result['message'] ="Logged In Successfully!";
			echo json_encode($result);
			die;
		}
		else
		{
			$result['success']=false;
			$result['message']="Invalid Credentials!!";
			echo json_encode($result);
			die;
		}
	}
	public function verifyUser()
	{
		$verificationCode = explode("/",$_SERVER['REQUEST_URI'])[2];
		$verification=$this->userModel->verifyUserAccount($verificationCode);
		if($verification)
		{
			$this->userModel->setVerificationStatus($verification->userId);
			$result['success']	="true";						
			$result['message']="User was verified successfully";
			echo json_encode($result);
		}
		else
		{
			$result['success']=false;
			$result['message']="This link doesn't exist";
			echo (json_encode($result));
		}
	}
	public function test()
	{
		print_r(($_POST));
		die;
	}
}
