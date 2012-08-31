<?PHP
// Include file for Local Report PHP Scripts

define("DEBUG_MODE",true);
define("ERROR_REPORTING",1);
define("DEBUG_SHOW_SQL",false);

define("DEFAULT_PERFORMANCE_ID",1);
define("DEFAULT_PARTICIPANT_ID",1);

// CHANGE THIS FOR EACH PERFORMANCE
define("CURRENT_PERFORMANCE_ID",DEFAULT_PERFORMANCE_ID);

define("MYSQL_HOSTNAME","localhost");
define("MYSQL_USERNAME","xxxxxx");
define("MYSQL_PASSWORD","xxxxxx");
define("MYSQL_DBNAME","localreport");

define("DEFAULT_AUDIOFILE_PATH","//////");
define("DEFAULT_AUDIOFILE_HTTP_PATH","http:////////");

define("DEFAULT_VIDEOFILE_PATH","//////");
define("DEFAULT_VIDEOFILE_HTTP_PATH","http:////////");

	
if (ERROR_REPORTING)
{
	ini_set('display_errors',"1");
	error_reporting (E_ALL);
}
else
{
	ini_set('display_errors',"0");
	error_reporting(0);
}

$mySql = null;

// Database Functions
function sqlConnect() 
{
	global $mySql;
	$mySql = mysql_pconnect(MYSQL_HOSTNAME, MYSQL_USERNAME, MYSQL_PASSWORD) or die(mysql_error());
	mysql_select_db(MYSQL_DBNAME, $mySql) or die(mysql_error());
	//$sn = mysql_query("SET NAMES 'utf8'",$mySql);
	return $mySql;
}

function sqlQuery($query) 
{	
	global $mySql;
	
	//$query = "select somefield from exampletable";

	$data = null; 
			
	if (DEBUG_MODE && DEBUG_SHOW_SQL)
	{
		echo "<br \>\n" . $query . "<br \>\n";
	}
	
	$result = mysql_query($query, $mySql);
	reportMysqlError();
	
	// This set's up an associative array (key->value pair) for all of the data returned
	if (sizeof($result) > 0)
	{
		$num_fields = mysql_num_fields($result);
		$row_cnt = 0;
		while ($row_data = mysql_fetch_array($result)) 
		{
			for ($cnt = 0; $cnt < $num_fields; $cnt++) 
			{
				$field_name = mysql_field_name($result, $cnt); // This might be in-efficent
				$data[$row_cnt][$field_name] = stripslashes($row_data[$cnt]);
			}
			$row_cnt++;
		}
	}
	
	return $data;
}

function sqlUpdate($query)
{
	global $mySql;

	if (DEBUG_MODE && DEBUG_SHOW_SQL)
	{
		echo "<br \>\n" . $query . "<br \>\n";
	}
	
	$result = mysql_query($query, $mySql);
	reportMysqlError();
	return $result;
}

function sqlInsert($query, $return_id = false)
{
	global $mySql;

	if (DEBUG_MODE && DEBUG_SHOW_SQL)
	{
		echo "<br \>\n" . $query . "<br \>\n";
	}
	
	$result = mysql_query($query, $mySql);
	reportMysqlError($query);
	if ($return_id == true)
	{
		if ($result != false)
		{
				return mysql_insert_id();
		}
		else
		{
				return $result;
		}
	}
	else
	{
		return $result;
	}
}

function sqlDelete($query)
{
	global $mySql;

	if (DEBUG_MODE && DEBUG_SHOW_SQL)
	{
		echo "<br \>\n" . $query . "<br \>\n";
	}
	
	
	$result = mysql_query($query, $mySql);
	reportMysqlError();
	return $result;
}

function reportMysqlError()
{
	global $mySql;
	
	if (ERROR_REPORTING)
	{
		if (mysql_error() != "")
		{
			echo mysql_error($mySql);
		}
	}
}


?>