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

	<s:set var="busca" value="#parameters['busca']"/>
	<s:bean name="com.mediacaovirtual.dao.PostDAO" var="postDAO"/>
	<s:if test="#busca == null || #busca.isEmpty()">
		<s:iterator value="#postDAO.listarPosts()" var="post">
			<div class="column mg-bt-30">
				<div class="ui items">
					<div class="item">
						<div class="" style="margin-right: 15px;">
							<img src="../img/person.jpg" width="100">
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
									<i class="calendar icon"></i> 31/08/2016 | 22:59
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</s:iterator>
	</s:if>
	<s:else>
		<s:iterator value="#postDAO.listarPosts(#busca)" var="post">
			<div class="column mg-bt-30">
				<div class="ui items">
					<div class="item">
						<div class="" style="margin-right: 15px;">
							<img src="../img/person.jpg" width="100">
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
									<i class="calendar icon"></i> 31/08/2016 | 22:59
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</s:iterator>
	</s:else>
</div>
<jsp:include page="includes/footer.jsp" />
<jsp:include page="includes/end.jsp" />