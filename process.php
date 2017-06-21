 <?php


//clear session
session_start();

date_default_timezone_set('UTC');
$timezone = "Asia/Singapore"; 
if(function_exists('date_default_timezone_set')) date_default_timezone_set($timezone); 


$sessionid= $_POST['sessionid'];
$userip = $_POST['userip'];
$listOfItems = $_POST['listOfItems'];
$str = $_POST['listOfItems'];
$username = $_POST['fname'];
$today = date("F j, Y, g:i a");
$fee = $_POST['fee'];
$url = $_POST['url'];


// echo "URL ". $url;
// echo "  SESSION ". $sessionid. "  Username:".$username.  " - IP - ".$userip. " LIST ". $str;

	//the data
	$data = "$userip;$today;$username;$sessionid;$str\r\n";

	//open the file and choose the mode
	$fh = fopen("vote.txt", "a") or die("Couldn't open $file for writing!");
	fwrite($fh, $data) or die("Couldn't write data!");;
	//close the file
	fclose($fh);


// sanitized data for real-time results for use with result.php
// work around - beginning of first line must not contain semi colon 

	//the data
	$sanitizeddata = ";$str\r\n";

	//open the file and choose the append mode
	$fh = fopen("sanitized.txt", "a") or die("Couldn't open $file for writing!");
	fwrite($fh, $sanitizeddata) or die("Couldn't write data!");;
	//close the file
	fclose($fh);




	
	
	//login data
	$logindata = "$userip,$today,$username\r\n";
	//open the file and choose the mode
	$fh = fopen("logincheck.txt", "a") or die("Couldn't open $file for writing!");
	fwrite($fh, $logindata) or die("Couldn't write data!");;
	//close the file
	fclose($fh);
	
	
	//login name only
	$loginnameonly = "$username\r\n";
	//open the file and choose the mode
	$fh = fopen("logincheckname.txt", "a") or die("Couldn't open $file for writing!");
	fwrite($fh, $loginnameonly) or die("Couldn't write data!");;
	//close the file
	fclose($fh);
	
	//Yes to increase fee 
	$fees= "$fee\r\n";
	//open the file and choose the mode
	$fh = fopen("countfee.txt", "a") or die("Couldn't open $file for writing!");
	fwrite($fh, $fees) or die("Couldn't write data!");;
	//close the file
	fclose($fh);	
	
	
	
	//Email
	
	//define the receiver of the email
	$to = 'azraee@xyz.com;
	//define the subject of the email
	$subject = $username.'@'.$userip.' voted!'; 
	//create a boundary string. It must be unique 
	//so we use the MD5 algorithm to generate a random hash
	$random_hash = md5(date('r', time())); 
	//define the headers we want passed. Note that they are separated with \r\n
	$headers = "From: carevote@xyz.com\r\nReply-To: carevote@xyz.com";
	//add boundary string and mime type specification
	$headers .= "\r\nContent-Type: multipart/alternative; boundary=\"PHP-alt-".$random_hash."\""; 
	//define the body of the message.
	ob_start(); //Turn on output buffering
	?>
	--PHP-alt-<?php echo $random_hash; ?>  
	Content-Type: text/plain; charset="iso-8859-1" 
	Content-Transfer-Encoding: 7bit

	A vote has been registered

	--PHP-alt-<?php echo $random_hash; ?>  
	Content-Type: text/html; charset="iso-8859-1" 
	Content-Transfer-Encoding: 7bit


	<p>A vote has been registered!</p> 

	--PHP-alt-<?php echo $random_hash; ?>--
	<?
	//copy current buffer contents into $message variable and delete current output buffer
	$message = ob_get_clean();
	//send the email
	$mail_sent = @mail( $to, $subject, $message, $headers );
	//if the message is sent successfully print "Mail sent". Otherwise print "Mail failed" 
	echo $mail_sent ? "Mail sent" : "Mail failed";	
	
	

	header("Location: http://jitcares/jitcares/vote/thanks.shtml");

?>
