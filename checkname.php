
<?php

date_default_timezone_set('UTC');
$timezone = "Asia/Singapore"; 
if(function_exists('date_default_timezone_set')) date_default_timezone_set($timezone); 

session_start();



//keep session ids
$userip = $_POST['userip'];
$today = date("F j, Y, g:i a");
$username = strtolower($_POST['fname']);
$staffid = trim($_POST['staffid']);
$_SESSION['valid_user']=$username;
$sessionid = session_id();


$file = file_get_contents("usernames.txt");
if(!strstr($file, "$username,$staffid"))

		{
			echo ("<SCRIPT LANGUAGE='JavaScript'>
			window.alert(' Incorrect login or staff ID. Please try again.')
			window.history.back(-1);
			</SCRIPT>");
		}
else

	{
	header("Location: http://jitcares/jitcares/vote/govote.php?sessionid=$sessionid&username=$username");

	}








?>

