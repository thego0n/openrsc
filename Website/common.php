<?php

$config = array(
	'mysqlhost' => 'localhost',
	'mysqldb' => 'DATABASE',
	'mysqluser' => 'USERNAME',
	'mysqlpass' => 'PASSWORD'
);	
function error($s) {
		global $db;
		if($db) {
			$db->close();
		}
		exit($s);
	}

	include 'data_conversions.php';
	include 'mysql.php';
	$db = new DBLayer($config['mysqlhost'], $config['mysqluser'], $config['mysqlpass'], $config['mysqldb'], '', false);
	
