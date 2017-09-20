<!-- <?php
// if(!isset($_SESSION))
// session_start();
// else{
// header("Location: ./index.php");
//}
?> -->
<div class="">
  <div class="row">
    <!-- LOGIN -->
    <div id="login" class="col s12 m6 l6">
      <div class="container">
        <form action="./control/logar.php" method="POST">
          <h1 class="center Courgette">Login</h1>
          <div class="input-field col s12 m6 l6">
            <input name="email" id="email_login" type="email" class="validate" required/>
            <label for="email_login" data-error="Insira um e-mail válido">E-mail</label>
          </div>
          <div class="input-field col s12 m6 l6">
            <input name="senha" id="senha_login" type="password" class="validate" required/>
            <label for="senha_login">Senha</label>
          </div>
          <input class="btn waves-effect waves-light center white black-text col s12 m12 l12" type="submit" value="Logar"/>
        </form>
      </div>

    </div>

    <!-- CADASTRO -->
    <div id="cadastrar" class="col s12 m6 l6" style="border-left: 1px solid black">
      <div class="container">
        <div class="row">
          <h1 class="center Courgette">Cadastro</h1>
          <!-- <h4 class="center">Cadastro</h4> -->
          <!-- INÍCIO FORM onsubmit="return validarSenha();"-->
          <form action="./control/cadUser.php" method="POST" class="col s12" >
            <div class="row">
              <div class="input-field col s12 m6 l6">
                <input name="nome" id="nome" type="text" class="validate" pattern="^[A-z ]{6,}"
                data-error="Digite um nome valido" required/>
                <label for="nome" data-error="Nome inválido">Nome Completo</label>
              </div>
              <!-- Pattern pattern="[a-zA-Z0-9._-]+@[a-z._-]+.[a-z]+?" -->
              <div class="input-field col s12 m6 l6">
                <input name="email" id="email" type="email" class="validate" required>
                <label for="email" data-error="Digite um e-mail válido!">Email</label>
              </div>
            </div>
            <div class="row">
              <div class="input-field col s12 m6 l6">
                <input name="senha" id="senha" type="password" class="validate" minlength="8"
                pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required>
                <label for="senha" data-error="Digite uma senha válida(Mínimo 8 dígitos, pelo menos 1 letra maiúscula, 1 minúscula, 1 caracter especial e 1 número)">Senha</label>
              </div>
              <div class="input-field col s12 m6 l6">
                <input id="confirma_senha" type="password" class="validate" minlength="8"
                oninput="validaSenha()" required>
                <label for="confirma_senha" data-error="As senhas não são iguais." >Confirme a senha</label>
              </div>
              <span id="teste"></span>
            </div>
            <div class="row">
              <div class="col l2"></div>
              <div class="input-field col s12 m12 l8">
                <select name="cat_fav">
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
              <div class="col s12 m4 l4" style="margin-bottom: calc(100% + )">
                <button class="btn waves" style="width: 100%" type="submit">Cadastrar
                  <i class="material-icons right">send</i>
                </button>
              </div>
              <br /><br /><br />
              <div class="col m2 l2"></div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
