<?php
  require_once("../conect.php");
  $nome = $_POST["nome"];
  $categoria = $_POST["categoria"];
  $resumo = $_POST["resumo"];
  $poster = $_POST["poster"];
  $trailer = $_POST["trailer"];
  $duracao = $_POST["duracao"];
  $ano = $_POST["ano"];


  $query = "INSERT INTO filmes(nome, categoria, resumo, poster, trailer, duracao, ano)
   VALUES ('".$nome."', '".$categoria."', '".$resumo."', '".$poster."', '".$trailer."', '".$duracao."', '".$ano."')";

$result = $conn->query($query);
if (!$result) die($conn->error);
header('Location: ../index.php?msg=Filme cadastrado com sucesso');
$result->close();
$conn->close();
?>
