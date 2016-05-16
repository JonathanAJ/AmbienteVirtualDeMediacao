$(document).ready(function(){
	iniciaConfigMask();
});

function iniciaConfigMask(){
	$(".cpf").mask("999.999.999-99");
	$("#cep").mask("99999-999");
	$("#tel_res").mask("(99)9999-9999");
	$("#tel_cel").mask("(99)9 9999-9999");
}