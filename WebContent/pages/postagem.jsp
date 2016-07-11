<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/menus.jsp" />

<h4 class="ui horizontal divider header cc-blue-dark"  style="color: #3AA593 !important;">
  <i class="book icon"></i>
  Relato
</h4>

<div class="row bg-coment-principal mg-bt-15">
	<s:bean name="com.mediacaovirtual.dao.PostDAO" var="postDAO" />	
	<s:iterator value="#postDAO.getPost(#parameters['id'])" var="post">
		<div class="three wide column container">
			<div class="ui link fluid cards">
				  <div class="card">
				    <div class="image">
						<img src="${post.dono.pessoa.imagem}">
				    </div>
					<div class="content">
						<strong>
							${post.dono.nome}
						</strong>
					    <div class="meta">
					    	<span class="date">
								${post.dono.nucleo.nome}
					    	</span>
					    </div>
					</div>
				    <div class="extra">
				      Reputação:
				      <div class="ui star rating" data-rating="5" data-max-rating="5"></div>
				    </div>
				  </div>
			</div>
		</div>
		<div class="thirteen wide column container">
			<div class="ui label right floated teal">
				<i class="mail icon"></i>
				Postado em <s:date name="#post.data" format="dd/MM/yyyy"/> às <s:date name="#post.data" format="hh:mm"/>
			</div>
				
			<s:if test="%{#post.dono.id == #session.usuario.id}">
				
				<s:a href="deletarPostAction?post.id=%{#post.id}" class="ui vertical tiny circular icon button red right floated">
				  <i class="icon remove"></i>
				</s:a>
			
				<s:a href="#" class="ui vertical tiny circular icon button green right floated">
				  <i class="icon edit"></i>
				</s:a>
			
			</s:if>

			<br />
			<h1>${post.categoria.nome}</h1>
			<p>${post.texto}</p>
		</div>
	</s:iterator>
</div>

<h4 id="titulo-comentario" class="ui horizontal divider header cc-blue-dark" style="color: #3AA593 !important;">
  <i class="comments icon"></i>
  Comentários
</h4>

<c:if test='${param.delete_coment == true}'>
	<div id="mensagem-auth" class="ui success message transition sixteen wide column">
		<i class="close icon"></i>
		<div class="header">Sucesso!</div>
		<p class="text">Seu comentário foi deletado!</p>
	</div>
</c:if>
<c:if test='${param.sucesso == "comentario"}'>
	<div id="mensagem-auth" class="ui success message transition sixteen wide column">
		<i class="close icon"></i>
		<div class="header">Sucesso!</div>
		<p class="text">O post foi comentado!</p>
	</div>
</c:if>
<c:if test='${param.delete_coment_erro404 == true}'>
	<div id="mensagem-auth" class="ui error message transition sixteen wide column">
		<i class="close icon"></i>
		<div class="header">Erro!</div>
		<p class="text">Comentário não encontrado!</p>
	</div>
</c:if>

<s:bean name="com.mediacaovirtual.dao.ComentarioPostDAO" var="comentDAO" />
<s:set var="myVar" value="#comentDAO.getComentarioPost(#parameters['id'])"/>
<s:if test="#myVar.isEmpty()">
	<div class="row mg-bt-15 mg-tp-15">
		<div class="sixteen wide column">
			<h2 class="ui center aligned icon header">
			  <i class="circular users icon"></i>
			  Não há comentários, seja o primeiro a comentar!
			</h2>
		</div>
	</div>
</s:if>
<s:else>
	<s:iterator value="#myVar" var="coment">
		<div class="row bg-coment-principal mg-bt-15">
			<div class="three wide column">
				<div class="ui link fluid cards">
					<div class="card">
						<div class="image">
							<img src="${coment.dono.pessoa.imagem}">
						</div>
						<div class="content">
							<strong>
								${coment.dono.nome}
							</strong>
						    <div class="meta">
						    	<span class="date">
									${coment.dono.nucleo.nome}
						    	</span>
						    </div>
						</div>
					    <div class="extra">
					      Reputação:
					      <div class="ui star rating" data-rating="5" data-max-rating="5"></div>
					    </div>
					</div>
				</div>
			</div>
			<div class="thirteen wide column">		
				<div class="ui label right floated teal">
					<i class="mail icon"></i>
					Postado em <s:date name="#coment.data" format="dd/MM/yyyy"/> às <s:date name="#coment.data" format="hh:mm"/>
				</div>
				
				<s:if test="%{#coment.dono.id == #session.usuario.id}">
					
					<s:a href="deletarComentarioPostAction?comentario.id=%{#coment.id}&post.id=%{#parameters['id']}" class="ui vertical tiny circular icon button red right floated">
					  <i class="icon remove"></i>
					</s:a>
				
					<s:a href="#" class="ui vertical tiny circular icon button green right floated">
					  <i class="icon edit"></i>
					</s:a>
					
				</s:if>
				
	      		<a class="ui teal right ribbon label">Reviews</a>
				<p>${coment.texto}</p>
			</div>
		</div>
	</s:iterator>
</s:else>

<div id="comentario" class="row teal mg-tp-25">
	<div class="sixteen wide column container">
		<h2>Opine sobre o caso:</h2>
		<s:form action="/pages/comentarPostAction" method="post" class="ui form">
			<div class="field fluid">
		    	<s:textarea id="meuEditorComentario" name="comentario.texto"/>
		    </div>
		    <input type="hidden" name="post.id" value="${param.id}" />
		    <s:submit class="ui teal button right floated mg-tp-15" value="Enviar"/>
		</s:form>
	</div>
</div>

<jsp:include page="includes/footer.jsp" />
<script src="../tinymce/tinymce.min.js"></script>
<script src="../js/tinyScript.js"></script>
<jsp:include page="includes/end.jsp" />