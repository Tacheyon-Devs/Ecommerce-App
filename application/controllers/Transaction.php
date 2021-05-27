<?php 
class Transaction extends My_Controller
{

    function __construct()

    {
        parent::__construct();
        $this->load->model("Cart_model","cartModel");
        $this->load->model("Business_model","businessModel");
        $this->load->model("Transaction_model","transactionModel");
        $this->load->model("User_model","userModel");
    }
    public function sub($str)
    {
        if (strlen($str) > 10)
        $str = substr($str, 0, 7) . '...'; 
        else
        $str =$str."     ";
        return $str;
    }
    public function getActiveBusinessOrders()
    {
        $data= $this->transactionModel->getActiveBusinessOrders($this->data->businessId);
        echo json_encode($data);    
    }
    public function getActiveUserOrders()
    {
        $data= $this->transactionModel->getActiveUserOrders($this->data->userId);
        
        foreach($data as $order )
        {
            $businessDetails = $this->transactionModel->getOrderProvider($order->businessId);
                
            $order->businessDetails=$businessDetails;    
        }
        echo json_encode($data);    
    }
    public function getOrderDetails()
    {
        $data = $this->transactionModel->getOrderDetails($this->data->code);
        echo json_encode($data);
    }
    public function getUserOrderDetails()
    {
        $data['orderDetails'] = $this->transactionModel->getUserOrderDetails($this->data->code);
        $data['QRCode']=$data['orderDetails'][0]->qrCodeImage;
        echo json_encode($data);
    }
    public function deliveryConfirmation()
    {
        
        // var_dump( base_url());die;
        $data = $this->transactionModel->getDeliveredItems($this->data->orderId);
        // $customerData =$this->userModel->getUserById($this->data->userId);
        $receipt ="<b>The following items has been delivered from order no.".$this->data->orderId."</b><br>";
        $receipt.="<br><b>Order Details</b><br>";
        $j=0;
        foreach($data as $order)
        {
            $data['customerData'] =$this->userModel->getUserById($order->userId);
            $data['businessData'] = $this->businessModel->getBusiness($order->businessId);
            $data['businessOwnerData'] = $this->businessModel->getBusinessOwner($data['businessData']->ownerId);
            $receipt.="<b>Order Name :</b>          ".$order->name."<br>";
            $receipt.="<b>Order Description :</b>   ".$order->description."<br>";
            $receipt.="<b>Order Quantity :</b>      ".$order->quantity."<br>";
            $receipt.="<b>Order Price :</b>      ".$order->itemPrice."<br><br>";
        }
        $receipt.="<br><b>Business Details</b><br>";
        // echo json_encode($data);die;
        $receipt.="<b>Name  :</b>   ".$data['businessData']->name."<br>";
        $receipt.="<b>Description  :</b>   ".$data['businessData']->description."<br>";
        $receipt.="<b>Location  :</b>   ".$data['businessData']->location."<br>";

        $receipt.="<br><b>Customer Details</b><br>";
        $receipt.="<b>Name  :</b>   ".$data['customerData']->name."<br>";
        $receipt.="<b>Email  :</b>   ".$data['customerData']->email."<br>";
        for($i=0;$i<2;$i++)
        {
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
            if($i==0)
            {
                $mail->AddAddress($data['customerData']->email, $data['customerData']->name);
            }
            else
            {
                $mail->AddAddress($data['businessOwnerData']->email, $data['businessOwnerData']->name);
            }
            $mail->SetFrom("malikzaman133@gmail.com", "ECommerce App");
            $mail->AddReplyTo("malikzaman133@gmail.com", "Bilal Malik");
            // $mail->AddCC("cc-recipient-email@domain", "cc-recipient-name");
            $mail->Subject = "Your Order details from Ecommerce App";
            
            // $content =implode($cartData);
            $mail->MsgHTML($receipt); 
            if(!$mail->Send()) 
            {
                $result['message']="Error while sending Email.";
                $result['success']=false;			
            } 
            else 
            {
                $result['message'] = "Order Details have been sent successfully";
                $result['success']	="true";
            }
        }
        $this->transactionModel->deleteTransaction($this->data->orderId);
        $this->transactionModel->deleteOrder($this->data->orderId);
        $QRCode = "userAssets/QRCodes/".$this->data->orderId.".png";
        if(file_exists($QRCode))
        {
            unlink($QRCode);
        }
        else
        {
            $data['message']="QR Code doesn't exist";
            $data['success']="false";
            echo json_encode($data);die;
        }
        echo json_encode($result);
    }
    public function purchaseItem()
    {
        
        // die;
        require_once(APPPATH.'/third_party/stripe/init.php');
        \Stripe\Stripe::setApiKey($this->config->item('stripeSecretkey'));
        $stripe = new \Stripe\StripeClient(
            $this->config->item('stripeSecretkey')
          );
        // $token = $stripe->tokens->create
        // ([
        //     'card'=>
        //     [
        //         'number' => $this->data->cardDetails->cardNumber,
        //         'exp_month' => $this->data->cardDetails->expiryMonth,
        //         'exp_year' => $this->data->cardDetails->expiryYear,
        //         'cvc' => $this->data->cardDetails->CVC,
        //     ]  
        // ]);
        // $tokenId = $token->id;
        
        // $item = $this->itemModel->getItem($this->data->id);
        // $tokenId=$this->data->token;
        $price = $this->cartModel->getCartTotal($this->data->userId);
        
        $orderDetails = $this->cartModel->getOrderDetails($this->data->userId);
        
        $createToken = \Stripe\Charge::create 
        ([
            "amount" => $price*100,
            "currency" => "PKR",
            "source" => $this->data->token,
            "description" => "Purchase from ecommerce app" 
        ]);
        require(APPPATH."third_party/phpqrcode/qrlib.php");
        $cartData=[];
        // $numberOfBusinesses = (count( $this->cartModel->getNumberOfBusinesses($this->data->userId)));
        $distinctBusinesses = $this->cartModel->getDistinctBusinesses($this->data->userId);
        // echo json_encode($distinctBusinesses);die;
        $receipt= "Sr.No    Product Name        Quantity    Price<br>";
        foreach($distinctBusinesses as $business)
        {
            $businessId=$business->businessId;
            $j=0;
            $order = $this->cartModel->getSingleBusinessOrder($businessId, $this->data->userId);
            // echo json_encode($order);    die;
            $uniqueCode = uniqid();
            QRcode::png($uniqueCode,"userAssets/QRCodes/".$uniqueCode.".png");
            $QRCodeImage = "userAssets/QRCodes/".$uniqueCode.".png";
            foreach($order as $item)
            {
                $this->transactionModel->addOrderItem($item,$this->data->userId,$businessId,$QRCodeImage,$uniqueCode);
                $j++;
                $receipt.="  ".$j."      ".$this->sub($item->name)."             ".$item->quantity."        ".$item->itemPrice."<br>";
            }
            $this->transactionModel->addOrder($uniqueCode,$businessId,$this->data->userId);
            $receipt.="<br>Order Code = ".$uniqueCode."<br>";
            $business = $this->businessModel->getBusiness($businessId);
            // // var_dump($business->name);die;
                $receipt.="<br>Business Details<br>";
                $receipt.="<i>Business Name :          </i>".$business->name."<br>";
                $receipt.="Business Description :   ".$business->description."<br>";
                $receipt.="Business Location :      ".$business->location."<br>";
            
            $receipt.= "Sr.No    Product Name        Quantity    Price<br>";
        }
        // echo json_encode($cartData);
        $customerData =$this->userModel->getUserById($this->data->userId);
        $this->cartModel->deleteUserData($customerData->id);     
        // $customerEmail = $customerData->email;
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
			$mail->AddAddress($customerData->email, $customerData->name);
			$mail->SetFrom("malikzaman133@gmail.com", "ECommerce App");
			$mail->AddReplyTo("malikzaman133@gmail.com", "Bilal Malik");
			// $mail->AddCC("cc-recipient-email@domain", "cc-recipient-name");
			$mail->Subject = "Your Order details from Ecommerce App";
			
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
        
    }
    public function scanQrCode()
    {
        $verifyOrderVendor = $this->transactionModel->verifyOrderVendor($this->data);
        if($verifyOrderVendor)
        {
            
            $this->transactionModel->updateStatus('accepted',$this->data);
            $orderDetails = $this->transactionModel->getOrderDetails($this->data->orderId);
            $data['orderDetails'] = $orderDetails;
            $data['message']="Data sent successfully.";
            $data['success']=true;
            echo json_encode($data);
        }
        else
        {
            $data['message']="This order does not belong to you.";
            $data['success']=false;
            echo json_encode($data);
            
        } 
    }
    public function processResponse()
    {
        // $this->transactionModel->updateStatus($this->data->status,$this->data);
        $response = $this->transactionModel->updateStatus($this->data->status,$this->data);
        // echo json_encode($response);die;
        // die;
        if($response)
        {
            $data['success']=true;
            $data['message']="Status changed to ".$this->data->status;
            echo json_encode($data);
        }
        else
        {
            $data['success']=false;
            $data['message']="Unable to change the status";
            echo json_encode($data);
        }
    }
    public function inProcessingOrders()
    {
        $inProcessingOrders = $this->transactionModel->getOrdersFromStatus('processing',$this->data);
        // echo json_encode($inProcessingOrders);die;
        if(isset($inProcessingOrders))
        {
            $data['data'] = $inProcessingOrders;
            $data['message'] ="Orders that are under processing are loaded successfully";
            $data['success'] = true;
            echo json_encode($data);
        }
        else
        {
            $data['message']="Nothing under processing";
            $data['success'] = false;
            $data['data']=null;
            echo json_encode($data);
        }
    }
    public function inQueueOrders()
    {
        $inQueueOrders = $this->transactionModel->getOrdersFromStatus('in queue',$this->data);
        // echo json_encode($inQueueOrders);die;
        if(isset($inQueueOrders))
        {
            $data['data'] = $inQueueOrders;
            $data['message'] ="Orders that are under Queue are loaded successfully";
            $data['success'] = true;
            echo json_encode($data);
        }
        else
        {
            $data['message']="Nothing under Queue";
            $data['success'] = false;
            $data['data']=null;
            echo json_encode($data);    
        }
    }
    public function deliverOrderItems()
    {
        $singleItem = $this->data[0];
        $deliveredItems = [];
        $pendingItems = []; 
        $completionCheck = true;
        foreach($this->data as $item)
        {
            if($item->status == "delivered")
            {
                array_push($deliveredItems,$item);
                $this->transactionModel->updateTransactionStatus("delivered",$item);
            }
            else
            {
                $item = $this->transactionModel->updateTransactionStatus("pending",$item);
                array_push($pendingItems,$item);
                $completionCheck=false;
            }           
        }
        if($completionCheck==false)
        {
            $this->transactionModel->updateOrderStatus("pending",$item);
        }
        else
        {
            $this->transactionModel->updateOrderStatus("delivered",$item);
        }
        $customerData = $this->userModel->getUserById($singleItem->userId);
        $businessDetails = $this->businessModel->getBusiness($singleItem->businessId);
        $businessOwner = $this->businessModel->getBusinessOwner($businessDetails->ownerId);
        for($i=0;$i<2;$i++)
        {
            $mail = $this->phpmailer->load();
            $mail->IsSMTP();
            $mail->Mailer = "smtp";  
            $mail->SMTPAuth   = TRUE;
            $mail->SMTPSecure = "tls";
            $mail->Port       = 587;
            $mail->Host       = "smtp.gmail.com";
            $mail->Username   = $this->config->item('smtpEmail');
			$mail->Password   = $this->config->item('smtpPassword');   
            $mail->IsHTML(true);
            if($i==0)
            {
                $receipt = "The following items for the your order no.".$singleItem->orderId." have been delivered successfully!.<br>";
                foreach($deliveredItems as $item)
                {
                    $receipt.="<b>Item Name :</b>          ".$item->name."<br>";
                    $receipt.="<b>Item Description :</b>   ".$item->description."<br>";
                    $receipt.="<b>Item Quantity :</b>      ".$item->quantity."<br>";
                    $receipt.="<b>Item Delivery Status :</b>      <b>".$item->status."</b><br>";
                    $receipt.="<b>Item Price :</b>      ".$item->itemPrice."<br><br>";
                }
                if($completionCheck==false)
                {
                    $receipt.= "The following items for the your order no.".$singleItem->orderId." are currently pending!.<br>";
                    foreach($pendingItems as $item)
                    {
                        $receipt.="<b>Item Name :</b>          ".$item->name."<br>";
                        $receipt.="<b>Item Description :</b>   ".$item->description."<br>";
                        $receipt.="<b>Item Quantity :</b>      ".$item->quantity."<br>";
                        $receipt.="<b>Item Delivery Status :</b>      <b>".$item->status."</b><br>";
                        $receipt.="<b>Item Price :</b>      ".$item->itemPrice."<br><br>";
                    }
                }
                else
                {
                    $receipt.= "<b>ORDER HAS BEEN COMPLETED!!</b>" ;
                }
                $mail->Subject = "Your delivery details from Ecommerce App";
                $mail->AddAddress($customerData->email, $customerData->name);
                $mail->SetFrom("malikzaman133@gmail.com", "ECommerce App");
                $mail->AddReplyTo("malikzaman133@gmail.com", "Bilal Malik");
                $mail->MsgHTML($receipt); 
                if(!$mail->Send()) 
                {
                    $result['message']['customer']="Error while sending Email.";
                    $result['success']=false;
                    die;			
                } 
                else 
                {
                    $result['message']['customer'] = "Email has been sent successfully to the customer!!."; 
                    $result['success']['customer']	=true;
                }   
            }
            else
            {
                $receipt = "The following items for the order no.".$singleItem->orderId." have been delivered successfully! to the customer ".$customerData->name.".<br>";
                foreach($deliveredItems as $item)
                {
                    $receipt.="<b>Item Name :</b>          ".$item->name."<br>";
                    $receipt.="<b>Item Description :</b>   ".$item->description."<br>";
                    $receipt.="<b>Item Quantity :</b>      ".$item->quantity."<br>";
                    $receipt.="<b>Item Delivery Status :</b>      <b>".$item->status."</b><br>";
                    $receipt.="<b>Item Price :</b>      ".$item->itemPrice."<br><br>";
                }
                if($completionCheck==false)
                {
                    $receipt.= "The following items for the your order no.".$singleItem->orderId." are currently pending!.<br>";
                    foreach($pendingItems as $item)
                    {
                        $receipt.="<b>Item Name :</b>          ".$item->name."<br>";
                        $receipt.="<b>Item Description :</b>   ".$item->description."<br>";
                        $receipt.="<b>Item Quantity :</b>      ".$item->quantity."<br>";
                        $receipt.="<b>Item Delivery Status :</b>      <b>".$item->status."</b><br>";
                        $receipt.="<b>Item Price :</b>      ".$item->itemPrice."<br><br>";
                    }
                }
                else
                {
                    $receipt.= "<b>ORDER HAS BEEN COMPLETED!!</b>" ;
                }
                $mail->Subject = "Your delivery details from Ecommerce App";
                $mail->AddAddress($businessOwner->email, $businessOwner->name);
                $mail->SetFrom("malikzaman133@gmail.com", "ECommerce App");
                $mail->AddReplyTo("malikzaman133@gmail.com", "Bilal Malik");
                $mail->MsgHTML($receipt); 
                if(!$mail->Send()) 
                {
                    $result['message']['businessOwner']="Error while sending Email.";
                    $result['success']=false;			
                } 
                else 
                {
                    $result['message']['businessOwner'] = "Email sent successfully to business owner";
                    $result['success']['businessOwner']	=true;
                }   
            }
        }
        echo json_encode($result);
    }
    public function deliveredOrders()
    {
        $deliveredOrders = $this->transactionModel->getDeliveredOrders($this->data->businessId);
        if(isset($deliveredOrders))
        {
            $result['data']=$deliveredOrders;
            $result['success']=true;
            $result['message']="Delivery items sent successfully";
            
        }
        else
        {
            $result['data']=null;
            $result['success']=false;
            $result['message']="No delivered items";
        }
        echo json_encode($result);
    }
}

