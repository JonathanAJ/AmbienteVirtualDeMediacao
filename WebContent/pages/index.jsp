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
						<s:bean name="com.mediacaovirtual.dao.PostDAO" var="postDAO"/>
						<s:iterator value="#postDAO.listarPosts()" var="post">
				<div class="column">
					<div class="ui items">
							<div class="item">
								<div class="ui tiny image">
									<img src="../img/person.jpg">
								</div>
								<div class="middle aligned content">
									<div class="header">
										<a href="postagem.jsp?id=${post.id}">
											${post.categoria.nome}
										</a>
									</div>
									<div class="description color-white">
										<p>${fn:substring(post.texto, 0, 100)}</p>
										<span class="ui left floated"> <i class="comment icon"></i>
											3 Comentários
										</span> <span class="ui right floated"> <i
											class="calendar icon"></i> 31/08/2016 | 22:59
										</span>
									</div>
								</div>
							</div>
					</div>
				</div>
						</s:iterator>
			</div>
<jsp:include page="includes/footer.jsp" />
<jsp:include page="includes/end.jsp" />