<?php

include("include.inc");

// Make sure form was submitted
if (isset($_POST['form_submitted']) && $_POST['form_submitted'] == "true")
{
	$uploadfilename = time() . "_" . rand(1000,9999) . "_" . basename($_FILES['file']['name']);
	
	if (isset($_POST['audio_or_video']) && $_POST['audio_or_video'] == "audio") {
		$uploadfilepath = DEFAULT_AUDIOFILE_PATH . $uploadfilename;
	} else {
		$uploadfilepath = DEFAULT_VIDEOFILE_PATH . $uploadfilename;
	}
	
	if (move_uploaded_file($_FILES['file']['tmp_name'], $uploadfilepath))
	{
		// Make sure the file isn't executable and you can delete it if you need
		chmod($uploadfilepath, 0666);
		
		$participant_id = DEFAULT_PARTICIPANT_ID;
		if (isset($_POST['participant_id'])) {
			$participant_id = $_POST['participant_id'];
		}
		
		sqlConnect();
		
		if (isset($_POST['audio_or_video']) && $_POST['audio_or_video'] == "audio") {
			sqlInsert("insert into audio_files (audio_file, participant_id, performance_id) values ('$uploadfilename', $participant_id, CURRENT_PERFORMANCE_ID)");
		} else {
			sqlInsert("insert into video_files (video_file, participant_id, performance_id) values ('$uploadfilename', $participant_id, CURRENT_PERFORMANCE_ID)");		
		}
		
		echo("Uploaded Succeeded!");
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
