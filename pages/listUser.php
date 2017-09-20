<?php
$query = "select id, nome, email, senha, privilegio from usuarios";
$result = $conn->query($query);
if (!$result) die($conn->error);
$count = $result->num_rows;
?>

<section>
  <header class="page-header">
    <h2 class="center Courgette">Usuários do Sistema</h2>
  </header>
    <table class="bordered highlight" >
      <?php
      if ($count == 0){
        echo "<tr><th>Nenhum usuário foi encontrado.</th></tr>";
      } else {
        echo
        "<tr class='text-uppercase'>
        <th class='text-center'> id </th>
        <th> nome </th>
        <th> e-mail </th>
        <th> Admin </th>
        </tr>";
        while($row = $result->fetch_array()) {
          $id = $row['id'];
          echo "<tr>";
          echo "<td class='text-center'>$id</td>";
          echo "<td>".$row['nome']."</td>";
          echo "<td>".$row['email']."</td>";
          echo "<td>".($row['privilegio']==1?"Sim":"Não")."</td>";
          echo "<td class='text-center'>";
          echo "<div class='btn-group btn-group-sm' role='group' >";
          echo "<a href='index.php?p=alterarUser&id=$id'  class='btn btn-warning glyphicon glyphicon-pencil' role='button'>Alt</a>";
          echo "<a href='./control/delUser.php?id=$id'class='btn btn-danger glyphicon glyphicon-trash' role='button'>Del</a>";
          echo "</div>";
          echo "</td>";
          echo "</tr>";
        }
      }
      ?>
    </table>
  <a href="index.php?p=entrar" class="btn btn-primary"><i class="glyphicon glyphicon-plus"></i> Adicionar</a>

</section>
