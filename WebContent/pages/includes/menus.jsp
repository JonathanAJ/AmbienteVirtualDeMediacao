<%@ taglib prefix="s" uri="/struts-tags" %>
	<div class="ui grid container">
		<div class="two wide column">
			<div class="ui grid menu-esquerdo">
				<div class="ui row menu-perfil">
					<div class="column">
						<a id="perfil-imagem" href="#">
							<img class="ui medium image centered" src="${session.usuario.pessoa.imagem}">
						</a>
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
							<a href="post.jsp?post=true" class="ui button ${param.post==true?'active':''}">
								<i class='icon plus'></i> Novo Post
							</a>
							<a href="index.jsp?meus=true"  class="ui button ${param.meus==true?'active':''}">
								<i class='icon book'></i> Meus Posts
							</a>
							<a href="index.jsp?nucleo=true"  class="ui button ${param.nucleo==true?'active':''}">
								<i class='icon sitemap'></i> Núcleo
							</a>
							<a href="index.jsp?fav=true"  class="ui button ${param.fav==true?'active':''}">
								<i class='icon empty star'></i> Favoritos
							</a>
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
							<a href="graficos.jsp"  class="ui button">
								<i class='icon pie chart'></i> Geomapa
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="one wide column"></div>
		<div class="thirteen wide column">
			<div class="ui grid">
				<div class="row">
					<div class="sixteen wide column mg-tp-30">
						<h2>
							${session.usuario.nome}
						</h2>
						<p class="mg-tp-15-menos">
							${session.usuario.nucleo.nome}
							<i class='icon user teal'></i>
						</p>
					</div>
				</div>