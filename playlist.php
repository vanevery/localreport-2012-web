<?PHP

include("include.inc");

$last_video_id = -1;
if (isset($_REQUEST['last_video_id'])) {	
	$last_video_id = $_REQUEST['last_video_id'];
}

sqlConnect();
$playlist_data = sqlQuery("select video_id, video_file, video_ts, participant_id, performance_id from video_files where video_id > ".$last_video_id." and performance_id = ".CURRENT_PERFORMANCE_ID." order by video_id asc");

//print_r($playlist_data);
$playlist_data_json = json_encode($playlist_data);
echo($playlist_data_json);
?>