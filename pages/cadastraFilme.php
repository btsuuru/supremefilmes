<div class="container">
  <form action="./pages/backend/cadastrafilme.php" method="POST">
    <div class="input-field col s12 m6 l6">
      <input name="titulo" id="titulo" type="text" class="validate" data-error="Digite um nome valido" required>
      <label for="titulo">Título</label>
    </div>
    <div class="input-field col s12 m6 l6">
      <input name="categoria" id="categoria" type="text" class="validate" data-error="Digite um nome valido" required>
      <label for="categoria">Categoria</label>
    </div>
    <div class="input-field col s12 m6 l6">
      <input name="resumo" id="resumo" type="text" class="validate" data-error="Digite um nome valido" required>
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
    <input class="btn waves" type="reset" value="limpar"/>
    <input class="btn waves" type="submit" value="enviar"/>
  </form>
</div>
