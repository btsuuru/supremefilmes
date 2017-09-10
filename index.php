<?php
// "IMPORTA" a conexão com o banco e deixa conectado
require_once('./conect.php');
// "IMPORTA" o modal e o deixa pronto para ser chamado
require_once('./pages/login.php');
?>
<!DOCTYPE html>
<html>
<head>
  <title>Supreme Filmes</title>
  <link rel="icon" href="./imgs/Supreme-logo-newyork.ico" type="image/x-icon" />
  <link rel="shortcut icon" href="./imgs/Supreme-logo-newyork.ico" type="image/x-icon" />
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
        <a href="#" class="brand-logo center" style="font-family: Arial"><i><b>SupremeFilmes</b></i></a>
        <a data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
        <ul id="nav-mobile" class="left hide-on-med-and-down">
          <li><a href="./index.php">Início</a></li>
          <li><a href="./index.php?p=cadastrafilmes">Cadastrar Filme</a></li>
          <li><a class='dropdown-button' data-activates='dd-categoria'>Categorias<i class="material-icons right">arrow_drop_down</i></a></li>
          <ul id='dd-categoria' class='dropdown-content'>
            <?php
            $query = "SELECT * FROM categoria WHERE 1;";
            $result = $conn->query($query);
            if (!$result) die($conn->error);
            $rows = $result->num_rows;
            for ($i = 0 ; $i < $rows ; ++$i) {
              $result->data_seek($i);
              $row = $result->fetch_array(MYSQLI_ASSOC);
              $id_categoria = $row['id_categoria'];
              $categoria = $row['categoria'];
              echo '<li><a href="./index.php?categoria='.$id_categoria.'">'.$categoria.'</a></li>';
            }
            ?>
          </ul>
          <li><a href="">Favoritos</a></li>
        </ul>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
          <li>
            <div class="nav-wrapper">
              <form>
                <div class="input-field">
                  <input id="search" type="search" required>
                  <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                  <i class="material-icons">close</i>
                </div>
              </form>
            </div>
          </li>

          <!-- Botão que chama o Modal Cadastrar -->
          <li><a href="#modal1" class="waves-effect waves-red btn modal-trigger black-text white" >Entrar</a></li>
        </ul>

        <!-- Menu do celular -->
        <ul class="side-nav" id="mobile-demo">
          <li><a href="">Início</a></li>
          <li><a class='dropdown-button' href='#' data-activates='dd-categoria2'>Categorias</a></li>
          <ul id='dd-categoria2' class='dropdown-content'>
            <?php
            $query = "SELECT * FROM categoria WHERE 1;";
            $result = $conn->query($query);
            if (!$result) die($conn->error);
            $rows = $result->num_rows;
            for ($i = 0 ; $i < $rows ; ++$i) {
              $result->data_seek($i);
              $row = $result->fetch_array(MYSQLI_ASSOC);
              $id_categoria = $row['id_categoria'];
              $categoria = $row['categoria'];
              echo '<li><a href="./index.php?categoria='.$id_categoria.'">'.$categoria.'</a></li>';
            }
            ?>
          </ul>
          <li><a href="">Favoritos</a></li>
          <li class="divider"></li>
          <li><a href="#modal1" class="waves-effect waves-light btn modal-trigger black-text white" >Entrar</a></li>

        </ul>
      </div>
    </nav>
  </header>


  <section style="padding: 1% 0 1% 0">
    <?php
    if(isset($_GET['p'])){
      // Se chamar a index com um paramentro "p" entra aqui
      if(file_exists("./pages/".$_GET['p'].".php")){
        require_once("./pages/".$_GET['p'].".php");
      }else {
        // 404 ERROR PAGE NOT FOUND
        echo "<div class='container'>
                <div class='row'>
                  <div class='col s12 m4 l4 center'>
                    <h2 class='pressStart'>404<small class> PAGE NOT FOUND</small></h2>
                    <a class='btn waves-light red pulse' href='./index.php'>Voltar ao início</a>
                  </div>
                  <div class='col s12 m8 l8'>
                    <img src='./imgs/404.gif' style='width: 100%'/>
                  </div>
                </div>
              </div>";
      }
    } else if(isset($_GET['categoria'])){
      // Se não passar o parametro "p" e
      // passar categoria entra aqui
      $categoria = $_GET['categoria'];
      require_once('./pages/listar.php');
    } else {
      $categoria = null;
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
            <li><a class="grey-text text-lighten-3" href="#">Bruno Tsurushima</a></li>
            <li><a class="grey-text text-lighten-3" href="#">Lucas Cassanho</a></li>
            <li><a class="grey-text text-lighten-3" href="#">Lucas José</a></li>
            <li><iframe src="https://ghbtns.com/github-btn.html?user=btsuuru&repo=supremefilmes&type=watch&count=true&v=2" frameborder="0" scrolling="0" width="170px" height="20px"></iframe></li>
            <li><iframe src="https://www.facebook.com/plugins/like.php?href=https%3A%2F%2Fwww.facebook.com%2Fsupremefilmes%2F&width=450&layout=standard&action=like&size=small&show_faces=true&share=true&height=80&appId"  style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe></li>
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
</html>
