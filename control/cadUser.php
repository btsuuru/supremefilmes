<?php

require_once("../conect.php");
require_once("../util.php");




$nome = fromPost("nome");
$email = fromPost("email");
$senha = md5(fromPost("senha"));
$catfav = fromPost("cat_fav");






$query = "INSERT INTO usuarios(nome, email, senha,categoria_favorita) VALUES ('$nome','$email','$senha','$catfav');";








$result = $conn->query($query);
if (!$result){

  header("Location: index.php?p=listUser&msg=$conn->error");
} else {

  header("Location: ../index.php?p=listUser");
}
$conn->close();
?>
