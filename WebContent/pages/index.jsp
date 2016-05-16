<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/menus.jsp" />
<div class="row">
	<div class="sixteen wide column container">
        <c:if test='${param.sucesso == "post"}'>
		    <div id="mensagem-auth" class="ui success message transition">
				<i class="close icon"></i>
				<div class="header">Sucesso!</div>
				<p class="text">Seu post está disponível, veja abaixo!</p>
			</div>
        </c:if>
		<div class="ui form">
			<s:form action="index.jsp" method="GET">
				<div class="ui action input fluid">	
					<input type="text" name="busca"
						placeholder="Pesquise aqui os posts do sistema">
					<button class="ui teal icon button">
						<i class="search icon"></i>
					</button>
				</div>
			</s:form>
		</div>
	</div>
</div>
<div class="two column row">
	<s:bean name="com.mediacaovirtual.dao.PostDAO" var="postDAO"/>
	
	<s:set var="busca" value="#parameters.busca[0]"/>
	<s:if test="#busca == null || #busca.isEmpty()">
	
		<s:set var="meus" value="#parameters.meus[0]"/>
		<s:set var="nucleo" value="#parameters.nucleo[0]"/>
		<s:set var="fav" value="#parameters.fav[0]"/>
		
		<s:if test="#meus == 'true'">
			<s:set var="listarPosts" value="#postDAO.listarMeusPosts(#session.usuario.id)"/>
			<s:set var="namePosts">Meus Posts</s:set>
		</s:if>
		<s:elseif test="#nucleo == 'true'">
			<s:set var="listarPosts" value="#postDAO.listarNucleoPosts(#session.usuario.nucleo.id)"/>
			<s:set var="namePosts">Posts do Núcleo</s:set>
		</s:elseif>
		<s:elseif test="#fav == 'true'">
			<s:set var="listarPosts" value="null"/>
			<s:set var="namePosts">Posts Favoritos</s:set>
		</s:elseif>
		<s:else>
			<s:set var="listarPosts" value="#postDAO.listarPosts()"/>
			<s:set var="namePosts">Todos os posts</s:set>
		</s:else>

		<h4 class="ui horizontal divider header teal" style="color: #3AA593 !important;">
		  <i class="check circle icon"></i>
		  <s:property value="#namePosts"/>
		</h4>

		<s:iterator value="#listarPosts" var="post">
			<div class="column mg-bt-30">
				<div class="ui items">
					<div class="item">
						<div class="" style="margin-right: 15px;">
							<img src="${post.dono.pessoa.imagem}" width="100">
						</div>
						<div class="middle aligned content">
							<div class="header">
								<a href="postagem.jsp?id=${post.id}">
									${post.categoria.nome}
								</a>
							</div>
							<div class="description color-white">
								<p>${fn:substring(post.texto, 0, 100)}</p>
								<span class="ui left floated">
									<i class="comment icon"></i>
									<s:bean name="com.mediacaovirtual.dao.ComentarioPostDAO" var="comentDAO"/>
									<s:set var="numComent" value="#comentDAO.getNumComentarios(#post.id)"/>
									<s:if test="#numComent == 1">
										<s:property value="#numComent"/> Comentário						
									</s:if>
									<s:else>
										<s:property value="#numComent"/> Comentários
									</s:else>
								</span>
								
								<span class="ui right floated">
									<i class="calendar icon"></i>
									<s:date name="#post.data" format="dd/MM/yyyy | hh:mm"/>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</s:iterator>
	</s:if>
	<s:else>
		<s:set var="posts" value="#postDAO.listarPosts(#busca)"/>
		<s:if test="#posts.isEmpty()">
			<h2 class="ui center aligned icon header">
			  <i class="settings icon"></i>
			  <div class="content">
			  	Não há postagens com '<s:property value="#busca" />'
			    <div class="sub header">
			  		Faça uma nova pesquisa com outra palavra.
			  	</div>
			  </div>
			</h2>
		</s:if>
		<s:else>
		
			<s:set var="namePosts">
				Resultados da busca por '<s:property value="#busca"/>'
			</s:set>
		
			<h4 class="ui horizontal divider header" style="color: #3AA593 !important;">
			  <i class="search icon"></i>
			  <s:property value="#namePosts"/>
			</h4>
			
			<s:iterator value="#posts" var="post">
				<div class="column mg-bt-30">
					<div class="ui items">
						<div class="item">
							<div class="" style="margin-right: 15px;">
								<img src="${post.dono.pessoa.imagem}" width="100">
							</div>
							<div class="middle aligned content">
								<div class="header">
									<a href="postagem.jsp?id=${post.id}">
										${post.categoria.nome}
									</a>
								</div>
								<div class="description color-white">
									<p>${fn:substring(post.texto, 0, 100)}</p>
									
									<span class="ui left floated">
										<i class="comment icon"></i>
										<s:bean name="com.mediacaovirtual.dao.ComentarioPostDAO" var="comentDAO"/>
										<s:set var="numComent" value="#comentDAO.getNumComentarios(#post.id)"/>
										<s:if test="#numComent == 1">
											<s:property value="#numComent"/> Comentário						
										</s:if>
										<s:else>
											<s:property value="#numComent"/> Comentários
										</s:else>
									</span>
								
									<span class="ui right floated">
										<i class="calendar icon"></i>
										<s:date name="#post.data" format="dd/MM/yyyy | hh:mm"/>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</s:iterator>
		</s:else>
	</s:else>
</div>

<!-- MODAL -->

<div class="ui basic modal">
	<i class="close icon"></i>
	<div class="header">
		  Mudar imagem do perfil
	</div>
	<div class="content centered">
		<div class="sixteen wide collum">
			<div id="imagem-crop"></div>
			
			<div class="ui centered grid">
				<div class="six wide column fluid">
				    <label for="upload" class="ui icon button fluid">
				        <i class="file icon"></i>
				        Abrir imagem
				    </label>
					<input id="upload" type="file" accept="image/*" name="" style="display:none"/>		
				</div>
			</div>
		</div>
	</div>
	<div class="actions">
		<div class="two fluid ui buttons">
		    <div id="cancelar-modal" class="ui red basic button">
		      <i class="remove icon"></i>
		      Cancelar
		    </div>
		    <div id="bt-crop-imagem" class="ui green basic button">
		    	<i class="checkmark icon"></i>
		    	Salvar
		  	</div>
	  	</div>
	</div>
</div>


<jsp:include page="includes/footer.jsp" />
<script src="../js/croppie.min.js"></script>
<script src="../js/cropScript.js"></script>
<jsp:include page="includes/end.jsp" />