$(document).ready(function(){
	iniciaConfigSemantic();
	mudaAutenticacao();
});

function mudaAutenticacao(){
	var aut = $('.autenticacao');
	var content1 = $('.content-autentica .content1');
	var content2 = $('.content-autentica .content2');
  	$('.header-autentica .cadastro').click(function(){
		aut.removeClass('color-login');
		aut.addClass('color-cadastro');
		content1.css("display", "none");
		content2.css("display", "block");
  	});
  	$('.header-autentica .login').click(function(){
		aut.removeClass('color-cadastro');
		aut.addClass('color-login');
		content1.css("display", "block");
		content2.css("display", "none");
  	});
}

function iniciaConfigSemantic(){
	// selecionar reputação
	$('.ui.rating').rating();
	// abrir dropdowns
	$('#menu-dropdown.dropdown').dropdown({
    	action: 'hide'
  	});
	$('.action-show.dropdown').dropdown();
	// fechar mensagem
	$('.message .close')
	  .on('click', function() {
	    $(this)
	      .closest('.message')
	      .transition('fade')
	    ;
	  });
}