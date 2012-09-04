<?PHP

include("include.inc");

sqlConnect();

if (isset($_REQUEST['action'])) {

	$action = $_REQUEST['action'];
	
	if ($action == "add" && isset($_REQUEST['video_id']) && isset($_REQUEST['start_time']) && isset($_REQUEST['end_time'])) {
		$add_sql = "insert into video_queue (video_id, performance_id, start_time, end_time) values (" . $_REQUEST['video_id'] . ", " .CURRENT_PERFORMANCE_ID. ", " . $_REQUEST['start_time'] . ", " . $_REQUEST['end_time'] . ")";
		sqlInsert($add_sql);
	}
	else if ($action == "add" && isset($_REQUEST['video_id'])) {
		$add_sql = "insert into video_queue (video_id, performance_id) values (" . $_REQUEST['video_id'] . ", " .CURRENT_PERFORMANCE_ID. ")";
		sqlInsert($add_sql);		
	}
	else if ($action == "clear") {
		$clear_sql = "delete from video_queue where performance_id = ".CURRENT_PERFORMANCE_ID;
		sqlDelete($clear_sql);
	}
	else if ($action == "get" && isset($_REQUEST['last_queue_id'])) 
	{
		$next_sql = "select video_queue.queue_id, video_queue.performance_id, video_queue.video_id, video_queue.start_time, video_queue.end_time, video_files.video_file from video_queue, video_files where video_queue.video_id = video_files.video_id and queue_id > " . $_REQUEST['last_queue_id'] . " and video_queue.performance_id = ".CURRENT_PERFORMANCE_ID." order by video_queue.queue_id asc";
				
		$next_rs = sqlQuery($next_sql);
		$next_json = json_encode($next_rs);		
		echo($next_json);
	}
}

?>