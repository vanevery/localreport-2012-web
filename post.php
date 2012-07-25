<?php
ini_set('display_errors', 'On');
error_reporting(E_ALL|E_STRICT);


// Make sure form was submitted
if (isset($_POST['form_submitted']) && $_POST['form_submitted'] == "true")
{
	$uploadfilename = time() . "_" . rand(1000,9999) . "_" . basename($_FILES['file']['name']);
	// Make sure apache can write to this folder	
	$uploaddir = dirname(__FILE__) . "/videouploads/";
	$uploadfile = $uploaddir . $uploadfilename;
	$uploadrelativefile = 'http://23.23.89.21/var/www/html/videouploads/'. $uploadfilename;
	
	if (move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile))
	{
		// Make sure the file isn't executable and you can delete it if you need
		chmod($uploadfile, 0666);
	}
	else
	{
		echo "<p>Error on upload...!  Here is some debugging info:</p>";
		var_dump($_FILES);
	}
} 
else 
{
	echo "<p>Form not submitted</p>";
	var_dump($_FILES);
}
?>
