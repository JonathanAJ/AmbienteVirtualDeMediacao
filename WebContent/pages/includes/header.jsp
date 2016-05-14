<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Ambiente Virtual de Mediação e Conciliação</title>
	<link rel="stylesheet" type="text/css" href="../css/semantic.min.css">
	<link rel="stylesheet" type="text/css" href="../css/myStyle.css">
</head>
<body>
	<div class="ui grid menu-principal">
		
		<div class="ui grid container">
			
			<div class="three wide column"></div>
			
			<div class="thirteen wide column">
					
				<div id="menu-dropdown" class="ui red right floated labeled icon dropdown button tiny mg-tp-10">
					<i class="sidebar icon"></i> <span class="text">Opções</span>
					<div class="menu">
						<a class="item" href="index.jsp"><i class="home icon"></i> Início</a>
						<a class="item" href="#link2"><i class="setting icon"></i> Config</a>
						<a class="item" href="../logoutLoginAction">
							<i class="remove circle outline icon"></i>
							Logout
						</a>
					</div>
				</div>
				
				<a href="index.jsp">
					<img class="ui centered image logo-acao" src="../img/logo.png">		
				</a>
			</div>
		</div>
	</div>