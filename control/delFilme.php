<?php
require_once('../conect.php');
require_once('../util.php');

$id = $_GET['id'];
$query = 'DELETE FROM filmes WHERE id_filmes='.$id.';';
$result = $conn->query($query);
if (!$result) die($conn->error);
if($result){
  header("Location: ../index.php?p=listFilmes&msg=Sucesso!");
} else {
  header("Location: ../index.php?p=listFilmes&msg=$conn->error");
}

?>
