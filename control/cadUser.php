<?php

  //  require_once("../conect.php");
   require_once("../util.php");



    #  var_dump($_POST);
      $nome = fromPost("nome");
      $email = fromPost("email");
      $senha = fromPost("senha");
      $catfav = fromPost("cat_fav");









    $query = "insert into usuarios(nome, email, senha,cat_fav) values ('$nome','$email','$senha','$catfav')";
    echo $query;


   $result = $conn->query($query);
   if (!$result){
     echo"Falha";
      #header("Location: index.php?p=listUser&msg=$conn->error");
   } else {
     echo "Sucesso";
    # header("Location: index.php?p=listUser");
   }
   $conn->close();
?>
