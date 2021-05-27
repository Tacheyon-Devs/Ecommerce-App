<?php
// require(APPPATH."core/My_Controller.php");
class Comment extends My_Controller
{
    function __construct()
    {

        parent::__construct();
        $this->load->model("Comment_model","commentModel");
    }
    public function addComment()
    {
        $comment= $this->commentModel->addComment($this->data); 
        // echo json_encode($comment);die;  
        $commentedObject = $this->commentModel->getCommentedObjectDetails($this->data);
        // echo json_encode($commentedObject);die;
        $business = $this->commentModel->getBusiness($commentedObject->businessId);
        // echo json_encode($business);die;
        $businessOwner = $this->commentModel->getBusinessOwner($business->ownerId);
        // echo json_encode($businessOwner);die;
        // echo json_encode($businessOwner);die;
        $likerDetails = $this->commentModel->getLikerDetails($this->data->userId);
        // echo json_encode($likerDetails);die;
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
        
        $mail->Subject = "Comment Activity Alert from Ecommerce App";
        $content = $likerDetails->name." liked your comment <b>".$comment->text."</b>";

        // $content =implode($cartData);
        $mail->MsgHTML($content); 
        if(!$mail->Send()) 
        {
            $result['message']="Error while sending Email.";
            $result['success']=false;			
        } 
        else 
        {
            $result['message'] = "Comment Activity Alert Email Sent Successfully!!";
            $result['success']	="true";
        }
    
        if($comment)
        {
            $data['message']="Comment added successfully.";
            $data['success']="true";
        }
        else
        {
            $data['message']="Can't add comment.";
            $data['success']="false";
        }
        echo json_encode($data);
    }
    public function addLike()
    {
        $likerDetails = $this->commentModel->getLikerDetails($this->data->userId);
        // echo json_encode($likerDetails);die;
        $commentDetails = $this->commentModel->addLike($this->data);
        // echo json_encode($commentDetails);die;
        // echo json_encode($businessOwner);
        // $likedObject = $this->commentModel->getLikedObject($likeDetails);
        // echo json_encode($businessOwner);
        $commentOwner = $this->commentModel->getCommentOwner($commentDetails->userId);
        // echo json_encode($commentOwner);die;
        // $business = $this->commentModel->getBusiness($likedObject->businessId);
        // echo json_encode($businessOwner);
        // $businessOwner = $this->commentModel->getBusinessOwner($business->ownerId);
        // echo json_encode($businessOwner);
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
			$mail->AddAddress($commentOwner->email, $commentOwner->name);
			$mail->SetFrom("malikzaman133@gmail.com", "ECommerce App");
			$mail->AddReplyTo("malikzaman133@gmail.com", "Bilal Malik");
			
			$mail->Subject = "Comment Activity Alert from Ecommerce App";
			$content = $likerDetails->name." liked your comment <b>".$commentDetails->text."</b>";

			// $content =implode($cartData);
			$mail->MsgHTML($content); 
			if(!$mail->Send()) 
			{
				$result['message']="Error while sending Email.";
				$result['success']=false;			
			} 
			else 
			{
				$result['message'] = "Comment Activity Alert Email Sent Successfully!!";
                $result['success']	="true";
            }
		
        echo json_encode($result);
    }
}