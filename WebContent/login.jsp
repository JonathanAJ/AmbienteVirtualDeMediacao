<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8">
	<title>Ambiente Virtual de Mediação e Conciliação</title>
	<link rel="stylesheet" type="text/css" href="css/semantic.min.css">
	<link rel="stylesheet" type="text/css" href="css/myStyle.css">
</head>
<body>
	<div class="ui grid conteiner menu-principal-login">
		<div class="ui grid container">
		</div>
	</div>
	<div class="logo">
		<div class="bg-logo">	
			<img class="logo-login" src="img/logo.png">
		</div>
		<h3 class="nome-logo">Ambiente Virtual de Mediação e Conciliação</h3>
	</div>
	<div class="header-autentica">
		<div class="login">
			<h4>Login</h4>
		</div>
		<div class="cadastro">
			<h4>Cadastrar</h4>
		</div>
	</div>
	<div class="autenticacao color-login">
		<div class="content-autentica">
			<s:form action="logarLoginAction" class="ui large form content1">
		        <div class="field">
		          <div class="ui left icon input">
		            <i class="user icon"></i>
		            <s:textfield name="usuario.cpfLogin" placeholder="CPF" />
		          </div>
		        </div>
		        <div class="field">
		          <div class="ui left icon input">
		            <i class="lock icon"></i>
		            <s:password name="usuario.senha" placeholder="Senha" />
		          </div>
		        </div>
		        <s:submit class="ui inverted fluid submit button" value="Autenticar" />
		      <div class="ui error message"></div>
		    </s:form>
			<s:form action="cadastrarLoginAction" class="ui large form content2">
		        <div class="field">
		          <div class="ui left icon input">
		            <i class="user icon"></i>
		            <s:textfield name="usuario.nome" placeholder="Insira seu Nome"/>
		          </div>
		        </div>
		        <div class="field">
		          <div class="ui left icon input">
		            <i class="user icon"></i>
		            <s:textfield name="usuario.cpfLogin" placeholder="Insira seu CPF"/>
		          </div>
		        </div>
		        <div class="field">
		          <div class="ui left icon input">
		            <i class="lock icon"></i>
		            <s:password name="usuario.senha" placeholder="Insira a senha desejada" />
		          </div>
		        </div>
		        <!-- <div class="field">
		          <div class="ui left icon input">
		            <i class="lock icon"></i>
		            <input type="password" name="senha2" placeholder="Insira a senha novamente" />
		          </div>
		        </div> -->
		        <s:submit class="ui inverted fluid submit button" value="Cadastrar" />
		      <div class="ui error message"></div>
		    </s:form>	
		</div>
	</div>
	<script src="js/jquery-2.2.1.min.js"></script>
	<script src="js/semantic.min.js"></script>
	<script src="js/myScript.js"></script>
</body>
</html>