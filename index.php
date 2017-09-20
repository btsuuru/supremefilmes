<?php
// "IMPORTA" a conexão com o banco e deixa conectado
require_once('./conect.php');
// "IMPORTA" alguns metodos pre definidos
require_once('./util.php');
// Mostra as mensagems
if(isset($_GET['msg'])){
  $msg=$_GET['msg'];
  echo '<script>var msg="'.$msg.'";</script>';
}
if(!isset($_SESSION))
session_start();
if (isset($_SESSION['nome'])){
  $nome = $_SESSION['nome'];
  echo "Você está logado como: $nome";
}else if(isset($_GET['p'])&& $_GET['p']!= 'entrar'){
header("Location: ./index.php?p=entrar");
}

if(isset($_SESSION['logado_supreme']) && ($_SESSION['logado_supreme']) == true){
  $logado = true;
}else{
  $logado = false;
}

if($_SESSION['privilegio']==1){
  $admin = true;
}else{
  $admin = false;
}



?>
<!DOCTYPE html>
<html>
<head>
  <title>Supreme Filmes</title>
  <link rel="icon" href="./imgs/Supreme-logo-newyork.ico" type="image/x-icon" />
  <link rel="shortcut icon" href="./imgs/Supreme-logo-newyork.ico" type="image/x-icon" />
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <!--Import Google Icon Font-->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!-- Import custom Fonts -->
  <link rel="stylesheet" href="./fonts/fonts.css"/>
  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="./css/materialize.css" />
  <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css"> -->
  <!-- Custom CSS -->
  <link rel="stylesheet" href="./css/style.css" />
</head>
<body>
  <header>
    <img src="./imgs/banner.jpg" style="width: 100%"/>
    <nav class="pin-top" id="menu">
      <!-- Menu DESKTOP -->
      <div class="nav-wrapper">
        <a class="brand-logo center" style="font-family: Arial; cursor:default"><i><b>SupremeFilmes</b></i></a>
        <a data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
        <ul id="nav-mobile" class="left hide-on-med-and-down">
          <li><a href="./index.php">Início</a></li>
          <?php
          if ($logado and $admin){
            echo '<li><a href="./index.php?p=listCat">Listar Categorias</a></li>
                  <li><a href="./index.php?p=listFilmes">Listar Filmes</a></li>
                        <li><a href="./index.php?p=listUser">Listar Usuarios</a></li>';
          }
          if(!$admin){
          echo '<li><a href="./index.php?p=categorias">Categorias</a></li>
          <li><a href="./index.php?sugestao=1">Sugestões</a></li>';
          }
          ?>
        </ul>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
          <li>
            <form action="./index.php" method="GET">
              <div class="input-field">
                <input name="nomefilme" id="search" type="search" id="autocomplete-input" class="autocomplete" style="margin: 0"/>
                <label for="search"><i class="material-icons">search</i></label>
              </div>
            </form>
          </li>
          <?php
          if ($logado){
            echo "<li><a href='./control/desloga.php' class='waves-effect waves-red btn black-text white' >Sair</a></li>";
          }else{
            echo "<li><a href='index.php?p=entrar' class='waves-effect waves-red btn black-text white' >Entrar</a></li>";
          }
          ?>
           <!-- <li><a href="./index.php?p=entrar" class="waves-effect waves-red btn black-text white">Entrar</a></li> -->
        </ul>

        <!-- Menu do celular -->
        <ul class="side-nav" id="mobile-demo">
          <li><a href="">Início</a></li>
          <li><a href="./index.php?p=categorias">Categorias</a></li>
          <li class="divider"></li>
          <li>
            <form action="./index.php" method="GET">
              <div class="input-field">
                <input name="nomefilme" id="search" type="search" id="autocomplete-input" class="autocomplete" style="margin: 0"/>
                <label for="search"><i class="material-icons black-text">search</i>Procurar</label>
              </div>
            </form>
          </li>
          <?php
          if (isset($_SESSION['logado_supreme'])&& ($_SESSION['logado_supreme']) == true ){
            echo "<li><a href='./control/desloga.php' class='waves-effect waves-red btn black-text white' >Sair</a></li>";
          }else{
            echo "<li><a href='index.php?p=entrar' class='waves-effect waves-red btn black-text white' >Entrar</a></li>";
          }

          ?>
          <!-- <li><a href="./index.php?p=entrar" class="waves-effect waves-red btn black-text white" >Entrar</a></li> -->


        </ul>
      </div>
    </nav>
  </header>
  <!-- CARREGANDO -->
  <div id="carrega" class="center" style="padding: 0 0 10% 0">
    <h3>Carregando Conteúdo</h3>
    <div class="preloader-wrapper big active">
      <div class="spinner-layer spinner-red-only">
        <div class="circle-clipper left">
          <div class="circle"></div>
        </div>
        <div class="gap-patch">
          <div class="circle"></div>
        </div>
        <div class="circle-clipper right">
          <div class="circle"></div>
        </div>
      </div>
    </div>
  </div>
  <!-- CONTEÚDO -->

  <section id="secao" style="padding: 0% 0 1% 0; display: none">
    <?php
    // Se chamar a index com um paramentro "p" entra aqui
    if(isset($_GET['p'])) {
      if(file_exists("./pages/".$_GET['p'].".php")) {
        require_once("./pages/".$_GET['p'].".php");
      }else {
        require_once('./pages/404notfound.php');
      }
    }else if(isset($_GET['categoria'])) {
      // Se não passar o parametro "p" e
      // passar categoria entra aqui
      $categoria = $_GET['categoria'];
      $nomefilme = "";
      require_once('./pages/listar.php');
    } else if(isset($_GET['nomefilme'])) {
      $nomefilme = $_GET['nomefilme'];
      $categoria = null;
      require_once('./pages/listar.php');
    }else if(isset($_GET['sugestao'])) {
      $nomefilme = null;
      $categoria = null;
      $sugestao = 1;
      require_once('./pages/listar.php');
    }
    else if(count($_GET) > 0 && !isset($_GET['msg'])) {
      require_once('./pages/404notfound.php');
    }
    else {
      $categoria = null;
      $nomefilme=null;
      require_once('./pages/listar.php');
    }
    ?>
  </section>
  <footer class="page-footer">
    <div class="container">
      <div class="row">
        <div class="col l6 s12">
          <h5 class="white-text">Supreme Filmes</h5>
          <p class="grey-text text-lighten-4">
            Trabalho da disciplina de programação III<br />
            Universidade Estadual do Norte do Paraná
          </p>
        </div>
        <div class="col l4 offset-l2 s12">
          <h5 class="white-text">Acompanhe este projeto</h5>
          <ul>
            <!-- <li><iframe src="https://ghbtns.com/github-btn.html?user=btsuuru&repo=supremefilmes&type=watch&count=true&v=2" frameborder="0" scrolling="0" width="170px" height="20px"></iframe></li> -->
            <!-- <li><iframe src="https://www.facebook.com/plugins/like.php?href=https%3A%2F%2Fwww.facebook.com%2Fsupremefilmes%2F&width=450&layout=standard&action=like&size=small&show_faces=true&share=true&height=80&appId"  style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe></li> -->
          </ul>
        </div>
      </div>
    </div>
    <div class="footer-copyright">
      <div class="container">
        © 2017 Copyright Supreme Filmes
        <a class="grey-text text-lighten-4 right" href="#!">More Links</a>
      </div>
    </div>
  </footer>
</body>
<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- Compiled and minified JavaScript -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script> -->
<script src="./js/materialize.js"></script>
<script src="./js/script.js"></script>
<script>
window.onload(mostraSecao());
mostrarMSG();
</script>
</html>
