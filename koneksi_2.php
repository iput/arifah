<?php 
/**
 * 
 */
 class database
 {
 	private $dbhost;
	private $dbuser;
	private $dbpass;
	private $dbName;
	
 	function __construct($a,$b,$c,$d)
 	{
 		$this->dbhost = $a;
 		$this->dbuser = $b;
 		$this->dbpass = $c;
 		$this->dbName = $d;
 	}

 	public function connectionSQL()
 	{
 		mysql_connect($this->dbhost,$this->dbuser, $this->dbpass);
 		mysql_select_db($this->dbName);
 	}
 } ?>