<?php
 require_once("base.php");
 require_once("$dir/lib/data.php");
 require_once("$dir/lib/util.php");

 $remover = fromGet("remover");
 if (isset($remover)){
    $query = "delete from usuarios where id = $remover";
 } else {
    $id = fromPost("id");
    $nome = fromPost("nome");
    $email = fromPost("email");
    $senha = fromPost("senha");
  //  $pAdmin = fromPost("admin");
    $admin = isset($pAdmin);

    if (isset($id)){
       $query = "update usuarios set nome = '$nome', email = '$email', senha = '$senha' where id = $id";
    } else {
       $query = "insert into usuarios(nome, email, senha) values ('$nome','$email','$senha')";
    }
 }

 $result = $conn->query($query);
 if (!$result){
     header("Location: $root?p=listUser&msg=$conn->error");
 } else {
     header("Location: $root?p=listUser");
 }
 $conn->close();
?>
