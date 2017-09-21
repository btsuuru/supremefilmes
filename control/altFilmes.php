<?php
require_once("../conect.php");
require_once("../util.php");

$id= $_POST["id"];
$nome = $_POST["nome"];
$categoria = $_POST["categoria"];
$resumo = $_POST["resumo"];
$poster = $_POST["poster"];
$trailer = $_POST["trailer"];
$duracao = $_POST["duracao"];
$ano = $_POST["ano"];

if (isset($id)){
   $query = "update filmes set nome = '$nome', categoria = '$categoria' , resumo ='$resumo' , poster='$poster', trailer='$trailer', duracao='$duracao', ano='$ano'  where id_filmes = $id";
}
$result = $conn->query($query);
if (!$result){
    header("Location: ../index.php?p=listFilmes&msg=$conn->error");
} else {
    header("Location: ../index.php?p=listFilmes");
}
$conn->close();


 ?>
