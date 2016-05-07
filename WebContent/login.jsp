<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<a href="login.jsp">		
				<img class="logo-login" src="img/logo.png">
			</a>
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
		    
		    <!-- Login -->
		    
			<s:form action="logarLoginAction" class="ui large form content1">
		        <div class="field">
		          <div class="ui left icon input">
		            <i class="user icon"></i>
		            <s:textfield name="usuario.cpfLogin" placeholder="CPF" required="true"/>
		          </div>
		        </div>
		        <div class="field">
		          <div class="ui left icon input">
		            <i class="lock icon"></i>
		            <s:password name="usuario.senha" placeholder="Senha" required="true"/>
		          </div>
		        </div>
		        <s:submit class="ui inverted fluid submit button" value="Autenticar" />
		    </s:form>
		    
		    <!-- Cadastro -->
		    
			<s:form action="cadastrarLoginAction" class="ui large form content2">
				<div class="field">
					<select id="" class="ui fluid action-show dropdown" name="usuario.nucleo.id">
				    	<option value="">Selecione seu Núcleo...</option>
						<s:bean name="com.mediacaovirtual.dao.NucleoDAO" var="nucleoDAO"/>
						<s:iterator value="#nucleoDAO.listarNucleos()" var="nucleo">				
							<option value="${nucleo.id}">
								${nucleo.nome}
							</option>
						</s:iterator>
				    </select>
			    </div>
		        <div class="field">
		          <div class="ui left icon input">
		            <i class="user icon"></i>
		            <s:textfield name="usuario.nome" placeholder="Insira seu Nome" required="true"/>
		          </div>
		        </div>
		        <div class="field">
		          <div class="ui left icon input">
		            <i class="user icon"></i>
		            <s:textfield name="usuario.cpfLogin" placeholder="Insira seu CPF" required="true"/>
		          </div>
		        </div>
		        <div class="field">
		          <div class="ui left icon input">
		            <i class="lock icon"></i>
		            <s:password name="usuario.senha" placeholder="Insira a senha desejada" required="true"/>
		          </div>
		        </div>
		        <!-- <div class="field">
		          <div class="ui left icon input">
		            <i class="lock icon"></i>
		            <input type="password" name="senha2" placeholder="Insira a senha novamente" />
		          </div>
		        </div> -->
		        <s:submit class="ui inverted fluid submit button" value="Cadastrar" />
		    </s:form>
		</div>
	    
	    <!-- Mensagens -->
	    
		<c:if test='${param.sucesso == "cadastro"}'>
		    <div id="mensagem-auth" class="ui success message transition">
				<i class="close icon"></i>
				<div class="header">Cadastro efetuado com sucesso!</div>
				<p class="text">Logue-se para entrar.</p>
			</div>
		</c:if>
		<c:if test='${param.erro == "nucleo"}'>
		    <div id="mensagem-auth" class="ui error message transition">
				<i class="close icon"></i>
				<div class="header">Erro no Cadastro!</div>
				<p class="text">Insira seu Núcleo</p>
			</div>
		</c:if>
		<c:if test='${param.erro == "nome"}'>
		    <div id="mensagem-auth" class="ui error message transition">
				<i class="close icon"></i>
				<div class="header">Erro no Cadastro!</div>
				<p class="text">Insira seu Nome</p>
			</div>
		</c:if>
		<c:if test='${param.erro == "cpf"}'>
		    <div id="mensagem-auth" class="ui error message transition">
				<i class="close icon"></i>
				<div class="header">Erro no Cadastro!</div>
				<p class="text">Insira seu CPF</p>
			</div>
		</c:if>
		<c:if test='${param.erro == "senha"}'>
		    <div id="mensagem-auth" class="ui error message transition">
				<i class="close icon"></i>
				<div class="header">Erro no Cadastro!</div>
				<p class="text">Insira sua Senha</p>
			</div>
		</c:if>
		<c:if test='${param.erro == "padrao"}'>
		    <div id="mensagem-auth" class="ui error message transition">
				<i class="close icon"></i>
				<div class="header">Erro no Cadastro!</div>
				<p class="text">O CPF já está cadastrado.</p>
			</div>
		</c:if>
	    
	</div>
	<script src="js/jquery-2.2.1.min.js"></script>
	<script src="js/semantic.min.js"></script>
	<script src="js/myScript.js"></script>
</body>
</html>