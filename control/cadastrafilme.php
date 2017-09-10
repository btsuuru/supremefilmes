<?php
  $nome = $_POST["nome"];
  $categoria = $_POST["categoria"];
  $resumo = $_POST["resumo"];
  $poster = $_POST["poster"];
  $trailer = $_POST["trailer"];
  $duracao = $_POST["duracao"];
  $ano = $_POST["ano"];

$conn = new mysqli("localhost", "supreme_admin", "dab666", "supremefilmes");
  $query = "INSERT INTO filmes(nome, categoria, resumo, poster, trailer, duracao, ano)
   VALUES ('".$nome."', '".$categoria."', '".$resumo."', '".$poster."', '".$trailer."', '".$duracao."', '".$ano."')";

$result = $conn->query($query);
if (!$result) die($conn->error);
header('Location: ../../index.php?p=cadastrafilmes');
$result->close();
$conn->close();
?>
