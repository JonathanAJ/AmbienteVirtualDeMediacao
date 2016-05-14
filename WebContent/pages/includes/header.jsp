<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8">
	<title>Ambiente Virtual de Mediação e Conciliação</title>
	<link rel="stylesheet" type="text/css" href="../css/semantic.min.css">
	<link rel="stylesheet" type="text/css" href="../css/myStyle.css">
</head>
<body>
	<div class="ui grid conteiner menu-principal">
		<div class="ui grid container">
			<div class="two wide right floated column">
				<div id="menu-dropdown" class="ui red floating labeled icon dropdown button mg-tp-5">
					<i class="sidebar icon"></i> <span class="text">Opções</span>
					<div class="menu">
						<a class="item" href="#link1"><i class="home icon"></i> Home</a>
						<a class="item" href="#link2"><i class="users icon"></i> Browse</a>
						<a class="item" href="#link3"><i class="search icon"></i> Search</a>
						<a class="item" href="../logoutLoginAction"><i class="remove circle outline icon"></i> Sair</a>
					</div>
				</div>
			</div>
			<a href="index.jsp">
				<img class="logo-acao" src="../img/logo.png">		
			</a>
		</div>
	</div>
	<div class="ui grid container">