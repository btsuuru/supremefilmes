<?php

    require_once("../conect.php");
    require_once("../util.php");

      $nome = fromPost("nome");

      $query = "insert into categoria(categoria) values ('$nome')";
      echo $query;
      $result = $conn->query($query);
      if (!$result){
        echo"Falha";
         header("Location: ../index.php?p=listCat&msg=$conn->error");
      } else {
        echo "Sucesso";
       header("Location: ../index.php?p=listCat");
      }
      $conn->close();

 ?>
