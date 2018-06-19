<!-- 不用了 -->
<?php

$conn = new mysqli("binwang", "btkzwddhjx", "Bi63942657!", "UncleLi"); 
if(conn->connect_error){
    die("Could not connect to the database");
}

$res=array('error'=>false);
 
















$conn->close();
header("Content-type: application/json");
echo json_encode($res);
die();
