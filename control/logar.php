<?php
	//  require_once("../conect.php");
	 require_once("../util.php");
	 $root = "../index.php";


   function login($conn, $root){
      $email = $_POST["email"];
      $senha = $_POST["senha"];
      $lembrar = isset($_POST["lembrar"]);

      $query = "select id, nome, email, senha from usuarios where email = '$email'";

      $result = $conn->query($query);
      if (!$result) die($conn->error);
      $rows = $result->num_rows;

      if ($rows == 0){
         header("Location: $root?p=login&msg=usuário não encontrado");
      } else {
         $usuario = $result->fetch_array(MYSQLI_ASSOC);
         if ($usuario['senha'] == $senha && $usuario['admin']){
            if(!isset($_SESSION)) {
               session_start();
            }
            $_SESSION['email'] = $usuario['email'];
            $_SESSION['nome'] = $usuario['nome'];
            if ($lembrar){
               setcookie('email', $email, time() + 60 * 60 * 24 * 7, '/');
            } else {
               setcookie('email', $email, time() - 2592000 , '/');
            }
            header("Location: $root");
         } else {
            header("Location: $root?p=login&msg=senha incorreta");
         }
      }
      $result->close();
      $conn->close();
   }

   function logout($root){
      session_start();
      $_SESSION = array();
      setcookie(session_name(), '', time() - 2592000, '/');
      session_destroy();
      header("Location: $root");
   }

   if (isset($_GET["sair"])){
      logout($root);
   } else {
      login($conn, $root);
   }

?>
