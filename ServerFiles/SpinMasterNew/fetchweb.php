<?php include 'config.php';?>

<?php

$count=0;

//query declare
$sql = "Select * from website";

//getting result
$result = $conn->query($sql);

if($result -> num_rows > 0){
	// output data
	while($row = $result->fetch_assoc()){
		
	
		if($count==0)
		{
		  echo $row["websites"];
		  $count=1;
		}
		else
		{
		    	echo "|" . $row["websites"];
		
		}
    }		
}
else 
{
		
	echo "Failed";
}


$conn->close();

?>