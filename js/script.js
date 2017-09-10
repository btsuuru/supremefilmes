$( document ).ready(function(){
  $(".button-collapse").sideNav();
  $('select').material_select();
  $('#menu').pushpin({top: $('#menu').offset().top});
  $('#menu').css("background-color: white");
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
