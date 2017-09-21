<?php
require_once("../conect.php");
require_once("../util.php");

$id = fromPost("id");
$nome = fromPost("nome");
$email = fromPost("email");
$senha = md5(fromPost("senha"));
//$catfav = fromPost("cat_fav");



if (isset($id)){
   $query = "update usuarios set nome = '$nome', email = '$email', senha = '$senha', privilegio = '$admin' where id = $id";
}
$result = $conn->query($query);
if (!$result){
    header("Location: ../index.php?p=listUser&msg=$conn->error");
} else {
    header("Location: ../index.php?p=listUser");
}
$conn->close();


 ?>
