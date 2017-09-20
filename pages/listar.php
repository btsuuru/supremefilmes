<?php
// $conn = new mysqli("localhost", "supreme_admin", "dab666", "supremefilmes");
if($categoria != null){
  //$query = "SELECT nome, categoria.categoria, resumo, poster, trailer, duracao, ano FROM filmes INNER JOIN categoria ON filmes.categoria = categoria.id_categoria WHERE filmes.categoria = '".$categoria."';";
  $query = "SELECT id_filmes, nome, (SELECT categoria.categoria FROM categoria WHERE categoria.id_categoria = filmes.categoria) as categoria,resumo, poster, trailer, duracao, ano,(SELECT COUNT(*) as curtiu FROM avaliacoes WHERE avaliacoes.id_filme = filmes.id_filmes AND avaliacoes.avaliacao = 1) as curtiu,(SELECT COUNT(*) as curtiu FROM avaliacoes WHERE avaliacoes.id_filme = filmes.id_filmes AND avaliacoes.avaliacao = -1) as descurtiu FROM filmes WHERE categoria = $categoria";
} else if($nomefilme != null){
  $query = "SELECT id_filmes, nome, (SELECT categoria.categoria FROM categoria WHERE categoria.id_categoria = filmes.categoria) as categoria,resumo, poster, trailer, duracao, ano,(SELECT COUNT(*) as curtiu FROM avaliacoes WHERE avaliacoes.id_filme = filmes.id_filmes AND avaliacoes.avaliacao = 1) as curtiu,(SELECT COUNT(*) as curtiu FROM avaliacoes WHERE avaliacoes.id_filme = filmes.id_filmes AND avaliacoes.avaliacao = -1) as descurtiu FROM filmes WHERE lower(nome) LIKE lower('%$nomefilme%')";
} else if($sugestao != null){
  $query = "SELECT * FROM avaliacoes, filmes WHERE avaliacoes.avaliacao > 0 AND filmes.id_filmes = avaliacoes.id_filme";
}
else{
#  $query = "SELECT nome, categoria.categoria, resumo, poster, trailer, duracao, ano, avaliacoes.avaliacao FROM filmes INNER JOIN categoria ON filmes.categoria = categoria.id_categoria INNER JOIN avaliacoes ON avaliacoes.id_filme = filmes.id_filmes";
# SELECT nome, (SELECT categoria.categoria FROM categoria WHERE categoria.id_categoria=filmes.categoria) as categoria, resumo, poster, trailer, duracao, ano, (SELECT COUNT(*) as curtiu FROM avaliacoes WHERE avaliacoes.id_filme=filmes.id_filmes AND avaliacoes.avaliacao=1) as curtiu, (SELECT COUNT(*) as curtiu FROM avaliacoes WHERE avaliacoes.id_filme=filmes.id_filmes AND avaliacoes.avaliacao=-1) as descurtiu FROM filmes
  $query = "SELECT id_filmes, nome, (SELECT categoria.categoria FROM categoria WHERE categoria.id_categoria=filmes.categoria) as categoria, resumo, poster, trailer, duracao, ano, (SELECT COUNT(*) as curtiu FROM avaliacoes WHERE avaliacoes.id_filme=filmes.id_filmes AND avaliacoes.avaliacao=1) as curtiu, (SELECT COUNT(*) as curtiu FROM avaliacoes WHERE avaliacoes.id_filme=filmes.id_filmes AND avaliacoes.avaliacao=-1) as descurtiu FROM filmes";
}
$result = $conn->query($query);
if (!$result) die($conn->error);
$rows = $result->num_rows;
$result->data_seek(0);
$row = $result->fetch_array(MYSQLI_ASSOC);
if ($categoria!=null){
  echo '<header>
          <div class="row lighten-1" style="background-color: #f23">
            <div class="nav-wrapper col s10 m10 l10">
              <div class="col s12">
                <a href="./index.php" class="breadcrumb">Início</a>
                <a href="./index.php?p=categorias" class="breadcrumb">Categorias</a>
                <a href="#!" class="breadcrumb">'.$row["categoria"].'</a>
              </div>
            </div>
          </nav>
        </header>';
      }
  echo '<div class="container">
          <div class="row">';
  for ($i = 0 ; $i < $rows ; ++$i) {
    $result->data_seek($i);
    $row = $result->fetch_array(MYSQLI_ASSOC);
    $id = $row['id_filmes'];
    $nome =  $row['nome'];
    $poster = $row['poster'];
    $ano =  $row['ano'];
    $resumo = $row['resumo'];
    $categoria =  $row['categoria'];
    $duracao = $row['duracao'];
    $trailer = $row['trailer'];
    $curtiu = $row['curtiu'];
    $descurtiu = $row['descurtiu'];

    echo '<div class="col s12 m3 l3 lista-filmes">
            <div class="card">
              <div class="card-image waves-effect waves-block waves-light">
                <img class="activator" src="'.$poster.'">
              </div>
              <div class="card-content">
                <span class="card-title activator grey-text text-darken-4">'.$nome.'</span>
                <div class="col s12 m12 l12" style="padding: 0">
                  <a href="./control/curtir.php?id='.$id.'&user='.$_SESSION['id'].'" style="margin-bottom: 12px" class=" btn waves-effect waves-light col s12 m6 l6 green "><i class="material-icons left">sentiment_very_satisfied</i>'.$curtiu.'</a>
                  <a href="./control/descurtir.php?id='.$id.'&user='.$_SESSION['id'].'" style="margin-bottom: 12px" class=" btn waves-effect waves-light col s12 m6 l6 red "><i class="material-icons left">sentiment_very_dissatisfied</i>'.$descurtiu.'</a>
                </div>
                <a style="margin-bottom: 12px; width:100%; background-color: #222" href="./index.php?p=comentarios&id_filme='.$id.'" class="waves-effect waves-red btn modal-trigger">Comentários<i class="material-icons left">create</i></a>
                <button style="margin-bottom: 12px; width:100%; background-color: #222" class="activator btn waves-effect waves-light">Informações<i class="material-icons left">library_books</i></button>
                <a style="width:100%; background-color: #222" href="'.$trailer.'" target="_blank" class="waves-effect waves-red btn"><i class="material-icons left red-text">play_circle_filled</i>Trailer</a>
              </div>
              <div class="card-reveal">
                <span class="card-title grey-text text-darken-4">Informações<i class="material-icons right">close</i></span>
                <p><strong>Lançamento: </strong>'.$ano.'</p>
                <p><strong>Duração: </strong>'.$duracao.'</p>
                <p><strong>Categoria: </strong>'.$categoria.'</p>
                <p><strong>Resumo: </strong>'.$resumo.'</p>
              </div>
            </div>
          </div>';
  }
  echo '</div>';
  echo '</div>';

  $result->close();
  $conn->close();
?>
<script>
   function processa(str) {
      console.log("Inicio da funcao");
     var xmlhttp = new XMLHttpRequest();
     xmlhttp.onreadystatechange = function() {
         document.getElementById("msg").innerText = (100/(this.readyState+1));
         if (this.readyState == 4 && this.status == 200) {
             document.getElementById("msg").innerText = "Pronto";
             document.getElementById("rsp").innerHTML = this.responseText;
         }
     };
     xmlhttp.open("POST", "processa.php", true);
     xmlhttp.setRequestHeader("Content-type",
               "application/x-www-form-urlencoded");
     xmlhttp.send("nome=" + str);
     document.getElementById("msg").innerText = "Aguarde...";
     console.log("Apos o send");
   }
   </script>
