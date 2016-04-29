<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/menus.jsp" />
<div class="row">
	<div class="sixteen wide column container">
		<div class="ui form">
			<s:form action="postAction" method="post">
			    <s:textarea id="meuEditor" name="post.texto"/>
			    <s:submit class="ui teal button right floated mg-tp-15" value="Enviar"/>
			</s:form>
		</div>
	</div>
</div>
<jsp:include page="includes/footer.jsp" />
<script src="../tinymce/tinymce.min.js"></script>
<script src="../js/tinyScript.js"></script>
<jsp:include page="includes/end.jsp" />