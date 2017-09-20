<?php
  require_once('./conect.php');
?>
<header>
  <div class="row lighten-1" style="background-color: #f23">
    <div class="nav-wrapper col s10 m10 l10">
      <div>
        <a href="./index.php" class="breadcrumb">Início</a>
        <a href="./index.php?p=categorias" class="breadcrumb">Categorias</a>
      </div>
    </div>
  </div>
</header>
<?php
  $query = "SELECT categoria.*, count(*) AS quantidade FROM filmes, categoria WHERE filmes.categoria = categoria.id_categoria GROUP BY categoria.categoria";
  $result = $conn->query($query);
  if (!$result) die($conn->error);
  echo '<div class="container">';
  echo '<div class="row">';
  $rows = $result->num_rows;
  for ($i = 0 ; $i < $rows ; ++$i) {
    $result->data_seek($i);
    $row = $result->fetch_array(MYSQLI_ASSOC);
    $categoria=$row['categoria'];
    $quantidade=$row['quantidade'];
    $id_categoria=$row['id_categoria'];
    echo '<div class="col s12 m3">
            <div class="card white">
              <div class="card-content red-text">
                <span class="card-title">'.$categoria.'</span>
                <p class="black-text">Quantidade de filmes: <span class="badge">'.$quantidade.'</span></p>
              </div>
              <div class="card-action">
                <a class="blue-text" href="./index.php?categoria='.$id_categoria.'">Selecionar Categoria</a>
              </div>
            </div>
          </div>';
  }
  echo '</div>';
  echo '</div>';
?>
