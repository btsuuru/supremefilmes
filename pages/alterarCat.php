<div class="container center">
  <div class="row">
    <div class="col s0 m2 l2"></div>
    <div class="col s12 m8 l8">
    <form action="./control/altCat.php" method="POST">
      <input type="hidden" name="id" value="<?php echo $_GET['id'] ?>" />
      <div class="row">
        <h1 class="center Courgette">Cadastrar Categoria</h1>
        <div class="input-field">
          <input name="nome" id="categoria" type="text" class="validate" data-error="Digite um nome valido para a categoria" required>
          <label for="categoria">Categoria</label>
        </div>
        <input class="btn waves-effect waves-black center col s12 m12 l12 white black-text" type="submit" value="Cadastrar"/>
      </div>
    </form>
    </div>
    <div class="col s0 m2 l2"></div>
  </div>
</div>
