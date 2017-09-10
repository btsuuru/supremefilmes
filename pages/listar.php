<?php
// $conn = new mysqli("localhost", "supreme_admin", "dab666", "supremefilmes");
if($categoria!=null){
  $query = "SELECT nome, categoria.categoria, resumo, poster, trailer, duracao, ano FROM filmes INNER JOIN categoria ON filmes.categoria = categoria.id_categoria WHERE filmes.categoria = '".$categoria."';";
}
else{
  $query = "SELECT nome, categoria.categoria, resumo, poster, trailer, duracao, ano FROM filmes INNER JOIN categoria ON filmes.categoria = categoria.id_categoria";
}
$result = $conn->query($query);
if (!$result) die($conn->error);
echo '<div class="container">';
echo '<div class="row">';
$rows = $result->num_rows;
for ($i = 0 ; $i < $rows ; ++$i) {
  $result->data_seek($i);
  $row = $result->fetch_array(MYSQLI_ASSOC);
  $nome =  $row['nome'];
  $poster = $row['poster'];
  $ano =  $row['ano'];
  $resumo = $row['resumo'];
  $categoria =  $row['categoria'];
  $duracao = $row['duracao'];
  $trailer = $row['trailer'];

  echo '<div class="col s12 m3 l3 lista-filmes">
          <div class="card">
            <div class="card-image waves-effect waves-block waves-light">
              <img class="activator" src="'.$poster.'">
            </div>
            <div class="card-content">
              <span class="card-title activator grey-text text-darken-4">'.$nome.'<i class="material-icons right">library_books</i></span>
              <p>'.$ano.' - '.$duracao.'</p>
              <p>'.$categoria.'</p>
              <p><a href="'.$trailer.'">Trailer</a></p>
            </div>
            <div class="card-reveal">
              <span class="card-title grey-text text-darken-4">Resumo<i class="material-icons right">close</i></span>
              <p>'.$resumo.'</p>
            </div>
          </div>
        </div>';
}
echo '</div>';
echo '</div>';

$result->close();
$conn->close();
?>
