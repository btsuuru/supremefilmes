<?php
if (isset($_SESSION['id'])){
  $id_user = $_SESSION['id'];
}else{
  header('Location: ./index.php?p=entrar');
}
$id_filme = $_GET['id_filme'];

?>

<div class="row">
  <div class="col s12 m12 l12">
    <ul class="tabs">
      <li class="tab col s6 m6 l6"><a class="active" href="#comentar">Comentar</a></li>
      <li class="tab col s6 m6 l6"><a class="" href="#comentarios">Comentarios</a></li>
    </ul>
  </div>
</div>
<div class="modal-content">
  <div id="comentar" class="container">
    <div class="row">
      <form action="./control/comentar.php" method="POST">
        <h1 class="center Courgette">Escrever Comentário</h1>
          <input name="id_usuario" type="hidden" value=<?php echo "\"".$id_user."\"" ?>/>
          <input name="id_filme" type="hidden" value=<?php echo "\"".$id_filme."\"" ?>/>
        <div class="input-field col s12 m12 l12">
          <textarea name="comentario" id="comentario" type="text" class="materialize-textarea validate" data-error="Comentário invalido!" required></textarea>
          <label for="comentario">Comentário</label>
        </div>
        <input class="btn waves-effect waves-light center white black-text" type="submit" value="Enviar"></input>
      </form>
    </div>
  </div>

  <!-- COMENTARIOS -->
  <div id="comentarios" class="container">
    <div class="row">
      <ul class="collection">
      <?php
        require_once('./conect.php');
        $query = "SELECT * FROM comentarios INNER JOIN usuarios ON usuarios.id = comentarios.id_usuario WHERE id_filme =".$id_filme;
        // $query = "SELECT * FROM usuarios, comentarios WHERE id_filme = ".$id_filme."AND usuarios.id = ".;
        $result = $conn->query($query);
        if (!$result) die($conn->error);
        $rows = $result->num_rows;
        for ($i = 0 ; $i < $rows ; ++$i) {
          $result->data_seek($i);
          $row = $result->fetch_array(MYSQLI_ASSOC);
          $nome = $row['nome'];
          $comentario = $row['comentario'];
          echo '<li class="collection-item avatar">
                  <a href="#!" class="collection-item">
                  <span class="title">'.$nome.'</span>
                  <p>'.$comentario.'</p></a>';
        }
      ?>

     </ul>
   </div>
  </div>

</div>
<?php



?>
