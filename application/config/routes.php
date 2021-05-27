<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'Welcome/index';
$route['signup']= "Welcome/signUp";
// $route['jwtTest']="Welcome/test";
$route['test']="Welcome/test";

//emails
$route['verify/(:any)']="Welcome/verifyUser";
$route['sendinvitation']="Home/sendInvitation";
$route['invitation/(:any)/(:any)']="Home/inviteFriend";
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;
$route['login']="Welcome/logIn";
$route['home']="Welcome/home";

//business routes

$route['loadmybusinessespage']= "Business/loadMyBusinessesPage";
$route['getnearbyevents']="Business/getNearByEvents";
$route['loadcreatebusinesspage']="Business/loadCreateBusinessPage";
$route['createbusiness']="Business/createBusiness";
$route['loadviewbusinesspage']="Business/loadViewBusinessPage";
$route['viewbusiness']="Business/viewBusiness";
$route['getbusinessfeatured']="Business/getBusinessFeatured";

//event ROUTES

$route['loadvieweventpage']="Event/loadViewEventPage";
$route['viewevent']="Event/viewEvent";
$route['loadcreateeventpage']="Event/loadCreateEventPage";
$route['createevent']="Event/createEvent";

//item routes

$route['loadcreateitempage']="Item/loadCreateItemPage";
$route['loadviewitempage']="Item/loadViewItemPage";
$route['createitem']="Item/createItem";
$route['viewitem']="Item/viewItem";

//home

$route['home']="Home/index";
$route['loadmoredata']="Home/loadMoreData";
$route['loadmorefeatureddata']= "Home/loadMoreFeaturedData";
$route['loadmorenearbydata']="Home/loadMoreNearByData";
//system

$route['addtocart']="Home/addToCart";

//transactions and
$route['purchaseitem']="Transaction/purchaseItem";
$route["activebusinessorders"]="Transaction/getActiveBusinessOrders";
$route['getorderdetails']="Transaction/getOrderDetails";
$route['activeuserorders']="Transaction/getActiveUserOrders";
$route['getuserorderdetails']="Transaction/getUserOrderDetails";
$route['deliveryconfirmation']="Transaction/deliveryConfirmation";
$route['scanqrcode']="Transaction/scanQrCode";
$route['processresponse']="Transaction/processResponse";
$route['inprocessingorders']="Transaction/inProcessingOrders";
$route['inqueueorders']="Transaction/inQueueOrders";
$route['deliverorderitems']="Transaction/deliverOrderItems";
$route['inprocessingitems']="Transaction/inProcessingItems";
$route['deliveredorders']="Transaction/deliveredOrders";

//comments and replys
$route['addcomment']="Comment/addComment";
$route['addlike']="Comment/addLike";
//http://ecom.yourvteams.com