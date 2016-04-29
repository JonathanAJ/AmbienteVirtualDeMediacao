<%@ taglib prefix="s" uri="/struts-tags" %>
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
							<a href="post.jsp" class="ui button">
								<i class='icon plus'></i> Novo Post
							</a>
							<a href="#"  class="ui button">
								<i class='icon book'></i> Meus Posts
							</a>
							<a href="#"  class="ui button">
								<i class='icon sitemap'></i> Núcleo
							</a>
							<a href="#"  class="ui button">
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
					<div class="sixteen wide column mg-tp-30">
						<h2>
							<s:property value="#session.usuario.nome" />
						</h2>
						<p class="mg-tp-15-menos">
							CPF: <s:property value="#session.usuario.cpfLogin" /><i class='icon user teal'></i>
						</p>
					</div>
				</div>