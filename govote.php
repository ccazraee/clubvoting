<?php
function getCurrentURL()
{
    $currentURL = (@$_SERVER["HTTPS"] == "on") ? "https://" : "http://";
    $currentURL .= $_SERVER["SERVER_NAME"];
 
    if($_SERVER["SERVER_PORT"] != "80" && $_SERVER["SERVER_PORT"] != "443")
    {
        $currentURL .= ":".$_SERVER["SERVER_PORT"];
    } 
 
        $currentURL .= $_SERVER["REQUEST_URI"];
    return $currentURL;
}


?>

<?php
   // Commented the printing of variables for output testing
  // echo getCurrentURL()."<br>";
  $link = getCurrentURL();

  $query = parse_url($link, PHP_URL_QUERY);
  parse_str($query,$params);
  $username = $params['username'];
  $sessionid = $params['sessionid'];

  // Get the client ip address
  $ipaddress = $_SERVER['REMOTE_ADDR']

  // echo $username."<br>";
  // echo $sessionid;

?>

<?php
//$namefile = file_get_contents("logincheckname.txt");
//if(strstr($namefile, "$username"))

	//	{
		//	echo ("<SCRIPT LANGUAGE='JavaScript'>
		//	window.alert(' Have you already voted? You can only vote once.')
		//	window.history.back(-1);
		//	</SCRIPT>");
		//}

?>




 <html> 
 


<head> 
<title>          JIT Cares 2017 Nomination </title>
<link rel="stylesheet" type="text/css" href="./css/voting.css" media="screen" />

<!-- Load javascriptfile  --> 
<script src="voting.js">  </script>

</head> 

 <body> 


<div>

<DIV style="text-indent:20px"> 	

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<strong> WELCOME TO JIT CARES VOTING  </strong>

</DIV>



<DIV>
	<BR>
</DIV>


<!-- dhtml Container 'boxes' for candidates' names 
	 Feel free to make the code better 
-->


<div id="dhtmlgoodies_dragDropContainer">

	<div id="dhtmlgoodies_listOfItems">
		<div>
			<p>Available Candidates</p>
		<ul id="NONE">
		
		
<!-- ********************** START OF USER MODIFIED DATA  ********************** -->
	<li id="DD-Harry">Harry</li>
	<li id="DD-Mary">Mary</li>
	<li id="Mgr-Joe">Joe</li>
	<li id="Mgr-Lucy">Lucy</li>
	<li id="Mark ">Mark</li>
	<li id="Angie">Angie</li>



            
		</ul>
		
<!-- ********************** END OF USER MODIFIED DATA  ********************** -->
		</div>
	</div>
	
	
	
	
	<div id="dhtmlgoodies_mainContainer">
	<!-- ONE <UL> for each "room" 
		 The UL id will be recorded and counted.
		 Since the Sports and Social committee members are not unique unlike President, VPs, 
		 treasurer, or auditor, we can lump them together under 'Sports' and 'Social'
	
	-->
		<div>
			<p>President</p>
			<ul id="President">
			</ul>
		</div>
		<div>
			<p>Social Vice President</p>
			<ul id="SocialVP">
		</div>
		<div>
			<p>Sports Vice President</p>
			<ul id="SportsVP">
			</ul>
		</div>
		<div>
			<p>Secretary</p>
			<ul id="Secretary"></ul>
		</div>		
		<div>
			<p>Treasurer</p>
			<ul id="Treasurer"></ul>
		</div>
		<div>
			<p>Auditor</p>
			<ul id="Auditor"></ul>
		</div>
		<div>
			<p>Social Committee 1</p>
			<ul id="Social">
			</ul>
		</div>
		<div>
			<p>Social Committee 2</p>
			<ul id="Social">
			</ul>
		</div>
		<div>
			<p>Social Committee 3</p>
			<ul id="Social">
			</ul>
		</div>
		<div>
			<p>Social Committee 4</p>
			<ul id="Social">
			</ul>
		</div>
		<div>
			<p>Social Committee 5</p>
			<ul id="Social">
			</ul>
		</div>
		<div>
			<p>Sports Committee 1</p>
			<ul id="Sports">
			</ul>
		</div>		<div>
			<p>Sports Committee 2</p>
			<ul id="Sports">
			</ul>
		</div>		<div>
			<p>Sports Committee 3</p>
			<ul id="Sports">
			</ul>
		</div>		
		<div>
			<p>Sports Committee 4</p>
			<ul id="Sports">
			</ul>
		</div>
		<div>
			<p>Sports Committee 5</p>
			<ul id="Sports">
			</ul>
		</div>
		




	</div>
	

	


</p>




<!-- The submit button contain hidden values to check for session id and stuff
	 Not the greatest or leanest of coding but gets the job done
	 Feel free to make the code better .
	 Form data will be processed by PROCESS.PHP script
-->







<form name="myForm" method="post" action="process.php" onclick="return confirmSubmit();"> 
	<input type="hidden" name="sessionid" value="<?php echo $sessionid; ?>">
	<input type="hidden" name="fname" value="<?php echo $username; ?>" >
	<input type="hidden" name="staffid">
	<input type="hidden" name="url" value= "<?php echo getCurrentURL(); ?>" >
	<input type="hidden" name="listOfItems">
	<input type="hidden" name="userip" value="<?php echo $ipaddress; ?>" >
	<br><br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
	<div align="center">
	<input type="submit" value="Submit My Vote" name="saveButton">
	</div>
</form>


<!-- ********************** INSTRUCTION  ********************** -->
	


<strong>Instruction:</strong> <br>
1. You can drag and drop the list of available candidates' names to each position.<br>
2. Only <strong>DDs or Managers</strong> can be nominated for <strong>President & VP</strong> posts.<br>
3. Make sure all positions or posts are filled. <br>
4. Once you submit the selection is final. <br>
5. Duplicate voting will render the vote null and void. <br>
6. Please contact <a href="mailto:kamila@xyz.com"> support </a>if you have problems. <br>

<!-- *********************************************************** -->





	
	
	
	
	
	
</div>




<ul id="dragContent"></ul>
<div id="dragDropIndicator"><img src="images/insert.gif"></div>
<div id="saveContent"></div>




 </body> 
 </html> 