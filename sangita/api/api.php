<?php 

// database call
$host 		= "localhost";
$db_name 	= "eventsDb";
$username 	= "root";
$password 	= "password";

$con = mysqli_connect($host,$username,$password,$db_name);

// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  exit();
}

// required headers
header("Access-Control-Allow-Origin: *");
// header("Content-Type: application/json; charset=UTF-8");
$postData = !empty($_POST)?$_POST:[];
$act = !empty($postData['act'])?strip_tags($postData['act']):'';
switch ($act) {
	
	case 'list':
		$fetchData = [];
		$sql = "SELECT id, event_name, created_at, is_active FROM events ORDER BY id DESC";
		$result = mysqli_query($con, $sql);
		if (mysqli_num_rows($result) > 0) {
		  // output data of each row
		  while($row = mysqli_fetch_assoc($result)) {
		   $fetchData[] = $row;
		  }
		}
		if (!empty($fetchData)) {
			echo json_encode(array('status'=>TRUE, 'message'=>'Records found' ,'details'=>$fetchData)); die;
		} else {
			echo json_encode(array('status'=>FALSE, 'message'=>'No records found' ,'details'=>$fetchData)); die;
		}
		break;

	case 'store':
		$eventName = !empty($postData['eventName'])?strip_tags($postData['eventName']):'';
		if (!empty($eventName)) {
			$sql = "INSERT INTO events (`event_name`) VALUES( '".$eventName."')";
			$result = mysqli_query($con, $sql);
			if ($result) {
				echo json_encode(array('status'=>TRUE, 'message'=>'Records added')); die;
			} else {
				echo json_encode(array('status'=>FALSE, 'message'=>'Failed to add record')); die;
			}
		} else {
			echo json_encode(array('status'=>FALSE, 'message'=>'Invalid record')); die;
		}
		break;

	case 'update':
		$eventName = !empty($postData['eventName'])?strip_tags($postData['eventName']):'';
		$eventId   = !empty($postData['eventId'] && is_numeric($postData['eventId']))?$postData['eventId']:0;
		if (!empty($eventName) && !empty($eventId)) {
			$sql = "UPDATE events SET `event_name` = '".$eventName."' WHERE id = ".$eventId;
			$result = mysqli_query($con, $sql);
			if ($result) {
				echo json_encode(array('status'=>TRUE, 'message'=>'Records added')); die;
			} else {
				echo json_encode(array('status'=>FALSE, 'message'=>'Failed to add record')); die;
			}
		} else {
			echo json_encode(array('status'=>FALSE, 'message'=>'Invalid record')); die;
		}
		
		break;
	case 'delete':
		$eventId = !empty($postData['eventId'] && is_numeric($postData['eventId']))?$postData['eventId']:0;
		if (!empty($eventId)) {
			$sql = "DELETE FROM events WHERE id = ".$eventId;
			$result = mysqli_query($con, $sql);
			if ($result) {
				echo json_encode(array('status'=>TRUE, 'message'=>'Records deleted')); die;
			} else {
				echo json_encode(array('status'=>FALSE, 'message'=>'Failed to delete record')); die;
			}
		} else {
			echo json_encode(array('status'=>FALSE, 'message'=>'Invalid record')); die;
		}
		break;

	case 'main_map':
		$fetchData=[];
		$sql = 'select latitude, longitude from `mainMap` where status = "1"';
		$result = mysqli_query($con, $sql);
		while($row = mysqli_fetch_assoc($result)) {
			$fetchData = $row;
		}
		if (!empty($fetchData)) {
			echo json_encode(array('status'=>TRUE, 'details'=>$fetchData)); die;
		} else {
			echo json_encode(array('status'=>FALSE, 'message'=>'Failed to fetch records')); die;
		}
		break;

	case 'custom_marker_map':
		$fetchData=[];
		$sql = 'select latitude, longitude, marker_type from `custom_markers` where status = "1"';
		$result = mysqli_query($con, $sql);
		while($row = mysqli_fetch_assoc($result)) {
			$fetchData[] = $row;
		}
		if (!empty($fetchData)) {
			echo json_encode(array('status'=>TRUE, 'details'=>$fetchData)); die;
		} else {
			echo json_encode(array('status'=>FALSE, 'message'=>'Failed to fetch records')); die;
		}
		break;
	default:
		# code...
		break;
}

?>