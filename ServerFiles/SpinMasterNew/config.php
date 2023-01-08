<?php

$servername = "localhost";
$username = "xoxogaurav";
$password = "xoxogaurav";
$dbname = "spinMasterFlutter";



// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

//echo "Connected successfully" . "<br>";

?>