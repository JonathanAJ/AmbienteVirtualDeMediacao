<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/menus.jsp" />
<div class="row teal">
	<s:bean name="com.mediacaovirtual.dao.PostDAO" var="postDAO" />
	<s:iterator value="#postDAO.getPost(#parameters['id'])" var="post">
		<div class="three wide column container">
			<div class="ui link fluid cards">
				<div class="card">
					<div class="image">
						<img src="../img/person.jpg">
					</div>
					<div class="content">
						<div class="header">
							${post.dono.nome}
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="thirteen wide column container">
			<h1>${post.categoria.nome}</h1>
			<p>${post.texto}</p>
		</div>
	</s:iterator>
</div>
<jsp:include page="includes/footer.jsp" />
<jsp:include page="includes/end.jsp" />