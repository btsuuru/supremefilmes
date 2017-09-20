<?php
  require_once('./conect.php');
  $query = "SELECT * FROM categoria WHERE 1";
  $result = $conn->query($query);
  if (!$result) die($conn->error);
  $rows = $result->num_rows;
?>
<div class="container" style="margin-bottom: 1%">
  <form action="./control/altFilmes.php" method="POST">
    <input type="hidden" name="id" value="<?php echo $_GET['id'] ?>" />
    <div class="input-field col s12 m6 l6">
      <input name="nome" id="nome" type="text" class="validate" data-error="Digite um nome valido" required>
      <label for="nome">Título</label>
    </div>
    <!-- <div class="input-field col s12 m6 l6">
      <input name="categoria" id="categoria" type="text" class="validate" data-error="Digite um nome valido" required>
      <label for="categoria">Categoria</label>
    </div> -->
    <div class="input-field col s12 m6 l6">
    <select name="categoria" id="categoria">
      <!-- <option value="999" disabled selected>Choose your option</option> -->
      <?php
      for ($i = 0 ; $i < $rows ; ++$i) {
        $result->data_seek($i);
        $row = $result->fetch_array(MYSQLI_ASSOC);
        $categoria=$row['categoria'];
        $id_categoria=$row['id_categoria'];
        echo '<option value="'.$id_categoria.'">'.$categoria.'</option>';
      }
      ?>
    </select>
    <label for="categoria">Categoria</label>
  </div>
    <div class="input-field col s12 m6 l6">
      <textarea name="resumo" id="resumo" type="text" class="materialize-textarea validate" data-error="Digite um nome valido" required></textarea>
      <label for="resumo">Resumo</label>
    </div>
    <div class="input-field col s12 m6 l6">
      <input name="poster" id="poster" type="text" class="validate" data-error="Digite um nome valido" required>
      <label for="poster">Poster</label>
    </div>
    <div class="input-field col s12 m6 l6">
      <input name="trailer" id="trailer" type="text" class="validate" data-error="Digite um nome valido" required>
      <label for="trailer">Trailer</label>
    </div>
    <div class="input-field col s12 m6 l6">
      <input name="duracao" id="duracao" type="text" class="validate" data-error="Digite um nome valido" required>
      <label for="duracao">Duração</label>
    </div>
    <div class="input-field col s12 m6 l6">
      <input name="ano" id="ano" type="text" class="validate" data-error="Digite um nome valido" required>
      <label for="ano">Ano</label>
    </div>
    <div class="row">
      <input class="btn waves red col s12 m2 l2" type="reset" value="limpar campos"/>
      <input class="btn waves green col s12 m10 l10" type="submit" value="cadastrar"/>
    </div>
  </form>
</div>
