<?php include 'config.php';?>

<?php

$count=0;


//query declare
$sql = "Select link from otherAdsLinks";

//getting result
$result = $conn->query($sql);

if($result -> num_rows > 0){
	// output data
	while($row = $result->fetch_assoc()){
		
	
		if($count==0)
		{
		  echo   $row["link"] ;
		  $count=1;
		}
		else
		{
		    	echo "," . $row["link"] ;
		
		}
    }		
}
else 
{
		
	echo "Failed";
}


$conn->close();

?>