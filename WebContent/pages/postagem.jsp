<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/menus.jsp" />
			<div class="row">
				<s:bean name="com.mediacaovirtual.dao.PostDAO" var="postDAO"/>
				<s:iterator value="#postDAO.getPost(#parameters['id'])" var="post">
						<h1>${post.categoria.nome}</h1>
						<h3>Digitado por ${post.dono.nome}</h3>
						<p>${post.texto}</p>
				</s:iterator>
			</div>
<jsp:include page="includes/footer.jsp" />
<jsp:include page="includes/end.jsp" />