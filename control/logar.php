<?php
require_once("../conect.php");
require_once("../util.php");
//$root = "../index.php";


//function login($conn, $root){
	$email = $_POST["email"];
	$senha = md5($_POST["senha"]);
	//$lembrar = isset($_POST["lembrar"]);

	$query = "SELECT id, nome, email, senha, privilegio FROM usuarios WHERE email = '$email'";

	$result = $conn->query($query);
	if (!$result) die($conn->error);
	$rows = $result->num_rows;

	if ($rows == 0){
		header("Location: $root?p=login&msg=usuário não encontrado");
	} else {
		$usuario = $result->fetch_array(MYSQLI_ASSOC);
		if ($usuario['senha'] == $senha){
			if(!isset($_SESSION)) {
				session_start();
			}
			$_SESSION['id'] = $usuario['id'];
			$_SESSION['email'] = $usuario['email'];
			$_SESSION['nome'] = $usuario['nome'];
			$_SESSION['privilegio'] = $usuario['privilegio'];
			$_SESSION['logado_supreme'] = true;
			// if ($lembrar){
			//    setcookie('email', $email, time() + 60 * 60 * 24 * 7, '/');
			// } else {
			//    setcookie('email', $email, time() - 2592000 , '/');
			// }
			header("Location: ".'../index.php');
		} else {
			header("Location: '../index.php?p=login&msg=senha incorreta");
		}
	}
	$result->close();
	$conn->close();
//}

// function logout($root){
// 	session_start();
// 	$_SESSION = array();
// 	setcookie(session_name(), '', time() - 2592000, '/');
// 	session_destroy();
// 	header("Location: $root");
// }
//
// if (isset($_GET["sair"])){
// 	logout($root);
// } else {
// 	login($conn, $root);
// }

?>
