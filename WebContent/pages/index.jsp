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
				<div class="ui red floating labeled icon dropdown button mg-tp-5">
					<i class="sidebar icon"></i> <span class="text">Opções</span>
					<div class="menu">
						<a class="item" href="#link1"><i class="home icon"></i> Home</a>
						<a class="item" href="#link2"><i class="users icon"></i> Browse</a>
						<a class="item" href="#link3"><i class="search icon"></i> Search</a>
						<a class="item" href="../logoutLoginAction"><i class="remove circle outline icon"></i> Sair</a>
					</div>
				</div>
			</div>
			<img class="logo-acao" src="../img/logo.png">
		</div>
	</div>
	<div class="ui grid container">
		<div class="two wide column">
			<div class="ui grid menu-esquerdo">
				<div class="ui row menu-perfil">
					<div class="column">
						<img class="ui medium image centered" src="../img/person.jpg">
						<div class="ui huge star rating mg-tp-5" data-rating="5"
							data-max-rating="5"></div>
						<div class="ui small gray label mg-tp-5">
							Reputação
							<div class="detail">214</div>
						</div>
					</div>
				</div>
				<div class="ui row menu-opcoes">
					<div class="column">
						<div class="ui teal tiny vertical buttons">
							<button class="ui button">
								<i class='icon plus'></i> Novo Post
							</button>
							<button class="ui button">
								<i class='icon book'></i> Meus Posts
							</button>
							<button class="ui button">
								<i class='icon sitemap'></i> Núcleo
							</button>
							<button class="ui button">
								<i class='icon empty star'></i> Favoritos
							</button>
						</div>
						<div class="ui divider"></div>
						<div class="ui teal tiny vertical buttons">
							<button class="ui button">
								<i class='icon comments'></i> Mensagens
							</button>
							<button class="ui button">
								<i class='icon trash'></i> Excluídos
							</button>
							<button class="ui button">
								<i class='icon users'></i> Amigos
							</button>
							<button class="ui button">
								<i class='icon cubes'></i> Geomapa
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="one wide column"></div>
		<div class="thirteen wide column">
			<div class="ui grid">
				<div class="row">
					<div class="sixteen wide column mg-tp-25">
						<h2>
							<s:property value="#session.usuario.nome" />
						</h2>
						<p class="mg-tp-15-menos">
							Mediadora, Fortaleza-CE - <s:property value="#session.usuario.cpfLogin" /><i class='icon user teal'></i>
						</p>
						<div class="ui form mg-tp-30">
							<div class="ui action input fluid">
								<input type="text" name="busca"
									placeholder="Pesquise aqui os posts do sistema">
								<button class="ui teal icon button">
									<i class="search icon"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="two column row">
					<div class="column">
						<div class="ui items">
							<div class="item">
								<div class="ui tiny image">
									<img src="../img/person.jpg">
								</div>
								<div class="middle aligned content">
									<div class="header">Lorem ipsum dolor sit.</div>
									<div class="description color-white">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Dolor, quasi.</p>
										<span class="ui left floated"> <i class="comment icon"></i>
											3 Comentários
										</span> <span class="ui right floated"> <i
											class="calendar icon"></i> 31/08/2016 | 22:59
										</span>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="ui tiny image">
									<img src="../img/person.jpg">
								</div>
								<div class="middle aligned content">
									<div class="header">Lorem ipsum dolor.</div>
									<div class="description color-white">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Dignissimos, animi, voluptatum.</p>
										<span class="ui left floated"> <i class="comment icon"></i>
											9 Comentários
										</span> <span class="ui right floated"> <i
											class="calendar icon"></i> 31/08/2016 | 13:30
										</span>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="ui tiny image">
									<img src="../img/person.jpg">
								</div>
								<div class="middle aligned content">
									<div class="header">Lorem ipsum dolor sit amet.</div>
									<div class="description color-white">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing.</p>
										<span class="ui left floated"> <i class="comment icon"></i>
											14 Comentários
										</span> <span class="ui right floated"> <i
											class="calendar icon"></i> 30/08/2015 | 16:57
										</span>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="ui tiny image">
									<img src="../img/person.jpg">
								</div>
								<div class="middle aligned content">
									<div class="header">Lorem ipsum.</div>
									<div class="description color-white">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Praesentium.</p>
										<span class="ui left floated"> <i class="comment icon"></i>
											23 Comentários
										</span> <span class="ui right floated"> <i
											class="calendar icon"></i> 29/08/2015 | 12:30
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="column">
						<div class="ui items">
							<div class="item">
								<div class="ui tiny image">
									<img src="../img/person.jpg">
								</div>
								<div class="middle aligned content">
									<div class="header">Lorem ipsum.</div>
									<div class="description color-white">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Praesentium.</p>
										<span class="ui left floated"> <i class="comment icon"></i>
											23 Comentários
										</span> <span class="ui right floated"> <i
											class="calendar icon"></i> 29/08/2015 | 10:30
										</span>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="ui tiny image">
									<img src="../img/person.jpg">
								</div>
								<div class="middle aligned content">
									<div class="header">Lorem ipsum dolor sit.</div>
									<div class="description color-white">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Dolor, quasi.</p>
										<span class="ui left floated"> <i class="comment icon"></i>
											3 Comentários
										</span> <span class="ui right floated"> <i
											class="calendar icon"></i> 27/08/2016 | 21:59
										</span>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="ui tiny image">
									<img src="../img/person.jpg">
								</div>
								<div class="middle aligned content">
									<div class="header">Lorem ipsum dolor.</div>
									<div class="description color-white">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Dignissimos, animi, voluptatum.</p>
										<span class="ui left floated"> <i class="comment icon"></i>
											9 Comentários
										</span> <span class="ui right floated"> <i
											class="calendar icon"></i> 26/08/2016 | 18:30
										</span>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="ui tiny image">
									<img src="../img/person.jpg">
								</div>
								<div class="middle aligned content">
									<div class="header">Lorem ipsum dolor sit amet.</div>
									<div class="description color-white">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing.</p>
										<span class="ui left floated"> <i class="comment icon"></i>
											14 Comentários
										</span> <span class="ui right floated"> <i
											class="calendar icon"></i> 26/08/2015 | 17:57
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="../js/jquery-2.2.1.min.js"></script>
	<script src="../js/semantic.min.js"></script>
	<script src="../js/myScript.js"></script>
</body>
</html>