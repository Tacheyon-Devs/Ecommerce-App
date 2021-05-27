<?php
ini_set('display_errors', 1); ini_set('display_startup_errors', 1); error_reporting(E_ALL);
 require_once($_SERVER['DOCUMENT_ROOT']. '/vendor/autoload.php');
 use PHPMailer\PHPMailer\PHPMailer;
 use PHPMailer\PHPMailer\SMTP;
 use PHPMailer\PHPMailer\Exception;
 class File extends My_Controller
 {
     function __construct()
     {
         parent::__construct();
     }
     public function insertProduct()
     {
         $this->load->view('Country/insertProduct');
     }
     public function allProducts()
     {
        $query['products'] = $this->Product_model->getProducts();
        // die(var_dump($query['products']));
        $this->load->view('Country/allProducts',$query);
     }
     public function insertInDB()
     {
        $config['upload_path'] = './assets/uploads';
        $config['allowed_types'] = 'gif|jpg|png|jpeg';
        $config['max_size'] = '2048000'; // max size in KB
        $config['max_width'] = '20000'; //max resolution width
        $config['max_height'] = '20000';  //max resolution height
        $this->load->library('upload', $config);
        $this->upload->do_upload('file');
        $image = $this->upload->data();           
         $data['name']  =$this->input->post('name');
         $data['price'] =$this->input->post('price');
         $data['description']=$this->input->post('description');
         $data['file']=base_url().'assets/uploads/'.$image['file_name'];
         $this->Product_model->storePicData($data);
         redirect('File/allproducts');
    }
    public function updateCart()
    {

        // die(var_dump($this->input->post('id')));
        $query=$this->Product_model->find($this->input->post());
        
    }
    public function checkout()
    {
        // echo "Check";
        $data['items']=$this->Product_model->getCart();
        $this->Product_model->emptyCart();
        // die(var_dump($data['items']));
        $this->load->view('country/checkoutpage',$data);
        // die(var_dump($data));
    }
    public function viewProduct($id)
    {
        // 
        $product['props'] = $this->Product_model->loadProduct($id);
        // die(var_dump($product));
        $this->load->view('Country/viewproduct',$product);

    }
    public function stripePost()
    {
        // die(var_dump($this->input->post()));
        require_once('application/libraries/stripe-php/init.php');
        
        \Stripe\Stripe::setApiKey($this->config->item('stripe_secret'));
        
        // \Stripe\Charge::create ([
        //         "amount" => $this->input->post('total')*100,
        //         "currency" => "usd",
        //         "source" => $this->input->post('stripeToken'),
        //         "description" => "Test Attempt" 
        // ]);

        $this->sendEmail($this->input->post('email'),$this->input->post('total'),$this->input->post('name'));   
            
        $this->session->set_flashdata('success', 'Payment made successfully.');
             
        redirect('/allproducts', 'refresh');
        // echo 'hel
        
    }
    public function sendEmail($recipentemail,$total_bill,$name)
    {
       
        
            $mail = new PHPMailer();
            $mail->IsSMTP();
            $mail->Mailer = "smtp";
            $mail->Host = "smtp.gmail.com";
            $mail->Port = 465; // 8025, 587 and 25 can also be used. Use Port 465 for SSL.
            $mail->SMTPAuth = true;
            $mail->SMTPSecure = 'ssl';
            $mail->Username = "malikzaman133@gmail.com";
            $mail->Password = "78601bilal0900";
            // $mail->SMTPDebug = 4;
            $mail->From = "malikzaman133@gmail.com";
            $mail->FromName = "Bilal Malik";
            $mail->AddAddress("malikzaman133@gmail.com");
            // $mail->AddReplyTo("Your Reply-to Address", "Sender's Name");
    
            $mail->Subject = "Payment Confirmation";
            $mail->Body = " Hi! Thank You for you purchase:\nThe following are you order information\nName : "
            .$name."\n"."Email : ".$recipentemail."\n"."Total Bill : ".$total_bill."$\n";
            // $mail->WordWrap = 50;
    
            if(!$mail->Send()) {
            echo 'Message was not sent.';
            echo 'Mailer error: ' . $mail->ErrorInfo;
            exit;
            } else {
            // echo 'Message has been sent.';
            return true;
            }
            
    }
    public function load()
    {
        $this->load->view('mail');
    }
    public function send()
    {
        $mail = new PHPMailer();
        $mail->IsSMTP();
        $mail->Mailer = "smtp";
        $mail->Host = "smtp.gmail.com";
        $mail->Port = 465; // 8025, 587 and 25 can also be used. Use Port 465 for SSL.
        $mail->SMTPAuth = true;
        $mail->SMTPSecure = 'ssl';
        $mail->Username = "malikzaman133@gmail.com";
        $mail->Password = "78601bilal0900";
        $mail->SMTPDebug = 4;
        $mail->From = "malikzaman133@gmail.com";
        $mail->FromName = "Bilal Malik";
        $mail->AddAddress("malikzaman133@gmail.com", "Rachel Recipient");
        // $mail->AddReplyTo("Your Reply-to Address", "Sender's Name");

        $mail->Subject = "Payment Confirmation";
        $mail->Body = "Hi! How are you?";
        $mail->WordWrap = 50;

        if(!$mail->Send()) {
        echo 'Message was not sent.';
        echo 'Mailer error: ' . $mail->ErrorInfo;
        exit;
        } else {
        echo 'Message has been sent.';
        }
        

    }
 } 