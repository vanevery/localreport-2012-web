<?php
ini_set('display_errors', 'On');
error_reporting(E_ALL|E_STRICT);
// Limit what people can upload for security reasons
$allowed_mime_types = array("video/3gpp"=>"3gp", 
			"audio/x-wav"=>"wav", 
			"video/mp4"=>"mp4",
			"video/3gpp2"=>"3g2",
			"video/mpeg"=>"mpg",
			"video/quicktime"=>"mov",
			"video/x-quicktime"=>"mov",
			"video/x-msvideo"=>"avi",
			"image/jpg"=>"jpg",
			"image/jpeg"=>"jpg",
			"image/pjpeg"=>"jpg",
			"image/png"=>"png",
			"audio/vnd.wave"=>"wav"
		);

// Make sure form was submitted
if (isset($_POST['form_submitted']) && $_POST['form_submitted'] == "true")
{
	// Check the mime type
	$allowed_types = array_keys($allowed_mime_types);
	$allowed = false;
	if (isset($_FILES['bytes']['type']))
	{		
		for ($i = 0; $i < sizeof($allowed_types) && !$allowed; $i++)
		{
			if (strstr($_FILES['bytes']['type'], $allowed_types[$i]))
			{
				$allowed = true;
			}
		}
		
		// If the mime type is good, save it..
		if ($allowed)
		{
			$uploadfilename = time() . "_" . rand(1000,9999) . "_" . basename($_FILES['bytes']['name']);
			// Make sure apache can write to this folder	
			$uploaddir ='/var/www/html/videouploads/';
			$uploadfile = $uploaddir . $uploadfilename;
				$uploadrelativefile = 'http://23.23.89.21/var/www/html/videouploads/'. $uploadfilename;
				if (move_uploaded_file($_FILES['bytes']['tmp_name'], $uploadfile))
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
				echo "<p>Type not allowed...! Here is some debugging info:</p>";
				var_dump($_FILES);
			}
		}
		else
		{
			echo "<p>Strange, file type not sent by browser...!  Here is some debugging info:</p>";
			var_dump($_FILES);
		}
	} 
	else 
	{

	}
} 
?>
