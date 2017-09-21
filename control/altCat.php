<?php
require_once("../conect.php");
require_once("../util.php");

$id = fromPost("id");
$nome = fromPost("nome");




if (isset($id)){
   $query = "update categoria set categoria = '$nome' where id_categoria = $id";
}
$result = $conn->query($query);
if (!$result){
    header("Location: ../index.php?p=listCat?msg=$conn->error");
} else {
    header("Location: ../index.php?p=listCat");
}
$conn->close();


 ?>
