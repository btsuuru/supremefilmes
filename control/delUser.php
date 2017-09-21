<?php
require_once('../conect.php');
require_once('../util.php');
$id = $_GET['id'];
$query = 'DELETE FROM usuarios WHERE id='.$id.';';
$result = $conn->query($query);
if (!$result) die($conn->error);
if($result){
  header("Location: ../index.php?p=listUser&msg=Sucesso!");
} else {
  header("Location: ../index.php?p=listUser&msg=$conn->error");
}

?>
