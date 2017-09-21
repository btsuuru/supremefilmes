<?php
   $db_host = "localhost";
   $db_login = "supreme_admin";
   $db_password = "dab666";
   $db_db = "supremefilmes";
   $conn = new mysqli($db_host, $db_login, $db_password, $db_db);
   if ($conn->connect_error) die($conn->connect_error);


?>
