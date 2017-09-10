$( document ).ready(function(){
  $(".button-collapse").sideNav();
  $('select').material_select();
  $('#menu').pushpin({top: $('#menu').offset().top});
  $('#menu').css("background-color: white");
  $('.modal').modal();
  $('ul.tabs').tabs('select_tab', 'tab_id');
});


// var senha = document.getElementById("senha");
// var confirma_senha = document.getElementById("confirma_senha");
// var teste = document.getElementById("teste");
//
// function validaSenha(){
//   // alert(senha.value);
//   teste.innerHTML=senha.value + confirma_senha.value;
//   if(senha.value != confirma_senha.value) {
//     confirma_senha.setCustomValidity("Senhas diferentes");
//     // teste.innerHTML="Diferentes";
//   } else {
//     confirma_senha.setCustomValidity("");
//     // teste.innerHTML="Igual";
//   }
// }

// senha.onkeypress = validaSenha;
// confirma_senha.onkeypress = validaSenha;
