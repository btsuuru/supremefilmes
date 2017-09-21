<?php
    require_once("../conect.php");
    require_once("../util.php");

      $id_usuario = fromPost("id_usuario");
      $id_filme = fromPost("id_filme");
      $comentario = fromPost("comentario");

      $query = "INSERT INTO comentarios(id_usuario, id_filme, comentario) VALUES ('".$id_usuario."', '".$id_filme."', '".$comentario."');";
      $result = $conn->query($query);
      if (!$result){
          header("Location: ../index.php?p=entrar");
      } else {
          header("Location: ../index.php");
      }
      $conn->close();

 ?>
