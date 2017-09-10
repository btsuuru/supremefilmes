<!-- Modal login -->
<div id="modal1" class="modal modal-fixed-footer" style="z-index: 9999">
  <div class="row">
    <div class="col s12 m12 l12">
      <ul class="tabs">
        <li class="tab col s6 m6 l6"><a class="active" href="#login">Login</a></li>
        <li class="tab col s6 m6 l6"><a class="" href="#cadastrar">Cadastrar</a></li>
      </ul>
    </div>
  </div>
  <div class="modal-content">

    <!-- LOGIN -->
    <div id="login" class="container">
      <form action="./control/logar.php" method="POST">
        <div class="input-field col s12 m6 l6">
          <input name="email" id="email" type="text" class="validate" required/>
          <label for="email">E-mail</label>
        </div>
        <div class="input-field col s12 m6 l6">
          <input name="senha" id="senha" type="password" class="validate" required/>
          <label for="senha">Senha</label>
        </div>
        <!-- <div class="input-field col s12 m6 l6">
        <input name="lembrar" id="lembrar" type="checkbox"/>
        <label for="lembrar">Lembrar email?</label>
      </div> -->
      Lembrar email?
      <div class="switch">
        <label>
          Não
          <input type="checkbox">
          <span class="lever"></span>
          Sim
        </label>
      </div>
      <input class="btn waves-effect waves-light center" type="submit" value="Logar"/>
    </form>
  </div>

  <!-- CADASTRO -->
  <div id="cadastrar" class="container">
    <div class="row">
      <h4 class="center">Cadastro</h4>
      <!-- INÍCIO FORM -->
      <form action="./control/cadUser.php" method="POST" class="col s12">
        <div class="row">
          <div class="input-field col s12 m6 l6">
            <input name="nome" id="nome" type="text" class="validate" pattern="^[A-z ]{4,}"
            data-error="Digite um nome valido" required/>
            <label for="nome">Nome Completo</label>
          </div>
          <!-- Pattern pattern="[a-zA-Z0-9._-]+@[a-z._-]+.[a-z]+?" -->
          <div class="input-field col s12 m6 l6">
            <input name="email" id="email" type="email" class="validate" required>
            <label for="email" data-error="Digite um e-mail válido!">Email</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s12 m6 l6">
            <input name="senha" id="senha" type="password" class="validate"
            pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required>
            <label for="senha" data-error="Digite uma senha válida(Mínimo 8 dígitos, pelo menos 1 letra maiúscula, 1 minúscula, 1 caracter especial e 1 número)">Senha</label>
          </div>
          <div class="input-field col s12 m6 l6">
            <input id="confirma_senha" type="password" class="validate" oninput="validaSenha()" required>
            <label for="confirma_senha" data-error="As senhas não são iguais.">Confirme a senha</label>
          </div>
          <span id="teste"></span>
        </div>
        <div class="row">
          <div class="col l2"></div>
          <div class="input-field col s12 m12 l8">
            <select name="cat_fav" multiple>
              <option value="" disabled selected>Nenhuma</option>
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
                echo '<option value="'.$id_categoria.'">'.$categoria.'</option>';
              }
              ?>
            </select>
            <label>Categoria Favorita</label>
          </div>
          <div class="col l2"></div>
        </div>
        <div class="row">
          <div class="col m2 l2"></div>
          <div class="col s12 m4 l4">
            <input class="btn waves red" style="width: 100%" type="reset" value="Limpar"/>
          </div>
          <div class="col s12 m4 l4">
            <button class="btn waves" style="width: 100%" type="submit">Cadastrar
              <i class="material-icons right">send</i>
            </button>
          </div>
          <div class="col m2 l2"></div>
        </div>
      </form>
    </div>
  </div>

</div>
<div class="modal-footer">
  <a href="#!" class="modal-action modal-close waves-effect waves-red btn-flat ">Fechar</a>
</div>
</div>
