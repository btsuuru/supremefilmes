<?php
require_once("../conect.php");
require_once("../util.php");

   $remover = fromGet("remover");
   if (isset($remover)){
      $query = "delete from usuarios where id = $remover";
   } else {
      $id = fromPost("id");
      $nome = fromPost("nome");
      $email = fromPost("email");
      $senha = fromPost("senha");
      $pAdmin = fromPost("admin");
      $admin = isset($pAdmin);
      if (isset($id)){
         $query = "update usuarios set nome = '$nome', email = '$email', senha = '$senha', privilegio = '$admin' where id = $id";
      } else {
         $query = "insert into usuarios(nome, email, senha, privilegio) values ('$nome','$email','$senha','$admin')";
      }
   }
   $result = $conn->query($query);
   if (!$result){
       header("Location: ../index.php?p=listUser&msg=$conn->error");
   } else {
       header("Location: ../index.php?p=listUser");
   }
   $conn->close();
?>
