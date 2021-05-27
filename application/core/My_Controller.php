<?php
defined('BASEPATH') OR exit('No direct script access allowed');
if (isset($_SERVER['HTTP_ORIGIN'])) {
    header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
    header('Access-Control-Allow-Credentials: true');
    header('Access-Control-Max-Age: 86400');
}
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD'])) {
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
    }
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS'])) {
        header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
    }
    exit(0);
}
class My_Controller extends CI_Controller {

	protected $data;
	protected $secretKey ;
	public function __construct()
  	{
      		parent::__construct();
	  		$this->data = json_decode(file_get_contents("php://input"));
		    header("Access-Control-Allow-origin: *");
		    header("Content-Type: application/json");
		    header("Cache-Control: no-cache");
			$this->secretKey=  $this->config->item('secretKey');
	  		$this->load->helper('jwt');
			  $this->load->helper(array('form', 'url'));
			  $this->load->library("form_validation");
			  $this->load->model('User_model',"userModel");
			  $this->load->library('Phpmailer' , 'phpmailer');
  	}
  
	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		// $this->load->view('welcome_message');
		$this->load->view("jwtTest");

	}
	function isJson($string) {
		json_decode($string);
		return (json_last_error() == JSON_ERROR_NONE);
	   }
	public function test()
	{
		// Read JSON file
		// echo (json_encode($_POST));
		// $json_data = (json_decode(file_get_contents("php://input")));
		// $response_data = ($json_data);
		// echo (($response_data));
		// print_r(($_POST->email));
		// echo (gettype($response_data));
		// Decode JSON data into PHP array
		// $response_data = json_decode($json_data);
		// // All user data exists in 'data' object
		// $user_data = $response_data;
		// echo $user_data;
		// exit();
		// $_POST = (file_get_contents("php://input"));
		// $_POST = $this->input->post();
		//  $data=$_POST->email;
            
        //     echo json_encode($data);
        //     exit();
		// ((file_get_contents("php://input")));
		// $data['email'] = $_POST['email'];
		// echo json_encode($_POST);
		
		// echo  json_encode($_REQUEST);
		
		// $data =jwt_encode($this->input->post(),"asdadw");
		// $result = jwt_decode($data,"asdadw");
		// var_dump ($result);
	}
}
