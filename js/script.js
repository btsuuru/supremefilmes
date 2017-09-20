$( document ).ready(function(){
  $(".button-collapse").sideNav();
  $('select').material_select();
  $('#menu').pushpin({top: $('#menu').offset().top});
  $('.modal').modal();
  $('ul.tabs').tabs('select_tab', 'tab_id');
});

// Valida senha, se alterar o campo senha após, vai mostrar que estão diferentes
$("#senha").on("focusout", function (e) {
    if ($(this).val() != $("#confirma_senha").val()) {
        $("#confirma_senha").removeClass("valid").addClass("invalid");
    } else {
        $("#confirma_senha").removeClass("invalid").addClass("valid");
    }
});
// Valida confirma_senha, se alterar o valida senha, sempre vai comparar
$("#confirma_senha").on("keyup", function (e) {
    if ($("#senha").val() != $("#confirma_senha").val()) {
        $("#confirma_senha").removeClass("valid").addClass("invalid");
    } else {
        $("#confirma_senha").removeClass("invalid").addClass("valid");
    }
});

function mostraSecao(){
  // document.getElementById('carrega').style.display="none";
  $('#carrega').css('display', 'none');
  // document.getElementById('secao').style.display="initial";
  $('#secao').css('display', 'initial');
}

function mostrarMSG(){
  Materialize.toast(msg, 8000);
  alert(msg);
}
