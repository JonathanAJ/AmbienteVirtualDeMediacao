<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/menus.jsp" />
<div class="row">
	<div class="sixteen wide column container">
		<s:form action="/pages/cadastrarPostAction" method="post" class="ui form">
			<div class="field">
				<s:bean name="com.mediacaovirtual.dao.CategoriaDAO" var="catDAO"/>
				<select id="categoriaPost" class="ui fluid dropdown" name="post.idCategoria">
			    	<option value="">Selecione...</option>
					<s:iterator value="#catDAO.listarCategorias()" var="cat">				
						<option value="<s:property value="#cat.getId()"/>">
							<s:property value="#cat.getNome()"/>
						</option>
					</s:iterator>
			    </select>
		    </div>
			<div class="field">
		    	<s:textarea id="meuEditor" name="post.texto"/>
		    </div>
			<div class="field">
		    	<input type="hidden" name="post.idPertence" value="<s:property value="#session.usuario.id"/>"/>
		    </div>
		    <s:submit class="ui teal button right floated mg-tp-15" value="Enviar"/>
		</s:form>
	</div>
</div>
<jsp:include page="includes/footer.jsp" />
<script src="../tinymce/tinymce.min.js"></script>
<script src="../js/tinyScript.js"></script>
<jsp:include page="includes/end.jsp" />