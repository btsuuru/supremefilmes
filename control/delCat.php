<?php
require_once('../conect.php');
require_once('../util.php');

$id = $_GET['id'];
$query = 'DELETE FROM categoria WHERE id_categoria ='.$id.';';
$result = $conn->query($query);
if (!$result) die($conn->error);
if($result){
  header("Location: ../index.php?p=listCat&msg=Sucesso!");
} else {
  header("Location: ../index.php?p=listCat&msg=$conn->error");
}

?>
