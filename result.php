<html>
<head>
<title>Results</title>
</head>

<body>
<link rel="stylesheet" type="text/css" href="./css/result-style.css">

<?php 



// file_get_contents() reads the file, cleanup [new line & whitespace], and places the contents in a string
// source file is sanitized.txt 

$fileString = file_get_contents('sanitized.txt');
$myfile = preg_replace('/\n+/', '', $fileString);
$myfile = preg_replace('/\s+/', '', $myfile);



// sort function
function my_sort($a, $b)
  {
  if ($a == $b) return 0;
  return ($a > $b) ? 1 : -1;
  }

//turns the string containing file contents into a key value array using ';' as string separator 
$converted_string_array = explode(';',$myfile);

// sort the converted array using a user defined comparison function my_sort above
usort($converted_string_array, "my_sort");

//after it is sorted, change it back into a string
$sorted_string = implode(';',$converted_string_array);

//change into an array again so that we can perform incremental count below
$string_array = explode(";",$sorted_string);

//$myArray = file('countfee.txt');
//$newArray = array_count_values($myArray);

//echo "&nbsp; &nbsp; Increase JIT Cares Fees    :";
//foreach ($newArray as $key => $value) {
//        echo " &nbsp; &nbsp; $key - <strong>&nbsp; $value</strong>"; }


//count each occurrence of a value in a string and increment it
foreach($string_array as $value)
{
	if(isset($str_count[$value]))
		$str_count[$value]++;
	else
		$str_count[$value]=1;
}

//sort the $str_count variable by descending value [ arsort() ]
arsort($str_count);


// start the html formatting and put in test codes...
// a table with 2 columns
print "<table>         <col class=\"col1\" />     <col class=\"col2\" /> <tr> <th>Name</th> <th>Count</th> </tr>";


    
    foreach($str_count as $key => $value)
    {
		$horizontal_bar = $value + 2;  // so that progress bar for candidates with only one vote is centered and formatted properly
		
			$slash = strpos($key,"|"); 
			$position = substr($key,0,$slash);
			$name = substr($key,$slash+1);
		


			print "<tr>"."<td>".$key."</td>"."<td>"." <div id=\"progress-bar-percentage\" class=\"all-rounded\" style=\"width: $horizontal_bar%\"><span> $value</span></div>";




	}

	

print "</table>";


?>


