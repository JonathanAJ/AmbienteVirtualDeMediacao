<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/menus.jsp" />
<div class="row">
	<div class="sixteen wide column container">
        <c:if test='${param.erro == "categoria"}'>
		    <div id="mensagem-auth" class="ui error message transition">
				<i class="close icon"></i>
				<div class="header">Erro na categoria!</div>
				<p class="text">Verifique a categoria escolhida.</p>
			</div>
        </c:if>
        <c:if test='${param.erro == "texto"}'>
		    <div id="mensagem-auth" class="ui error message transition">
				<i class="close icon"></i>
				<div class="header">Erro no texto!</div>
				<p class="text">Verifique se o texto tem mais de 100 caracteres!</p>
			</div>
        </c:if>
        <c:if test='${param.erro == "padrao"}'>
		    <div id="mensagem-auth" class="ui error message transition">
				<i class="close icon"></i>
				<div class="header">Erro no desconhecido!</div>
				<p class="text">Verifique com o suporte do sistema!</p>
			</div>
        </c:if>
		<s:form action="/pages/cadastrarPostAction" method="post" class="ui form">
			<div class="field">
				<s:bean name="com.mediacaovirtual.dao.CategoriaDAO" var="catDAO"/>
				<select id="categoriaPost" class="ui fluid action-show dropdown" name="post.categoria.id">
			    	<option value="0">Selecione...</option>
					<s:iterator value="#catDAO.listarCategorias()" var="cat">				
						<option value="${cat.id}">
							${cat.nome}
						</option>
					</s:iterator>
			    </select>
		    </div>
			<div class="field">
		    	<s:textarea id="meuEditor" name="post.texto"/>
		    </div>
		    <s:submit class="ui teal button right floated mg-tp-15" value="Enviar"/>
		</s:form>
	</div>
</div>
<jsp:include page="includes/footer.jsp" />
<script src="../tinymce/tinymce.min.js"></script>
<script src="../js/tinyScript.js"></script>
<jsp:include page="includes/end.jsp" />