<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/menus.jsp" />

<div class="row">
	<div class="sixteen wide column">
        <c:if test='${param.erro == "bairro"}'>
		    <div id="mensagem-auth" class="ui error message transition">
				<i class="close icon"></i>
				<div class="header">Erro!</div>
				<p class="text">Você esqueceu de inserir um Bairro!</p>
			</div>
        </c:if>
        <c:if test='${param.erro == "padrao"}'>
		    <div id="mensagem-auth" class="ui error message transition">
				<i class="close icon"></i>
				<div class="header">Erro desconhecido!</div>
				<p class="text">Verifique com o suporte do sistema!</p>
			</div>
        </c:if>
        <c:if test='${param.cadastro == true}'>
		    <div id="mensagem-auth" class="ui success message transition">
				<i class="close icon"></i>
				<div class="header">Sucesso!</div>
				<p class="text">Seus dados foram atualizados.</p>
			</div>
        </c:if>
        
		<s:form action="/pages/cadastrarPessoaAction" method="post" class="ui form">
			<h4 class="ui dividing header">Informações Pessoais</h4>
			<%-- <div class="field">
				<label>Nome:</label>
				<s:textfield type="text" name="" placeholder="Insira seu Nome" value="%{#session.usuario.nome}" />
			</div> --%>
			
			<div class="fields">
				
				<div class="eight wide field">
					<label>Endereço:</label>
					<s:textfield type="text" name="pessoa.endereco" placeholder="Insira seu endereço" value="%{#session.usuario.pessoa.endereco}" />
				</div>
				
				<div class="four wide field">
					<label>Bairro:</label>
					<s:bean name="com.mediacaovirtual.dao.BairroDAO" var="bairroDAO"/>
					<select id="categoriaPost" class="ui fluid action-show dropdown" name="pessoa.bairro.id">
				    	<option value="0">Selecione...</option>
						<s:iterator value="#bairroDAO.listarBairros()" var="bairro">				
							<option value="${bairro.id}" ${bairro.id == session.usuario.pessoa.bairro.id? 'selected':''}>
								${bairro.nome}
							</option>
						</s:iterator>
				    </select>
			    </div>
			    
				<div class="four wide field">
					<label>CEP:</label>
					<s:textfield id="cep" type="text" name="pessoa.cep" placeholder="Insira seu CEP" value="%{#session.usuario.pessoa.cep}" />
				</div>
				
			</div>
			
			<div class="fields">
				<div class="eight wide field">
					<label>E-mail:</label>
					<s:textfield type="text" name="pessoa.email" placeholder="Insira seu e-mail" value="%{#session.usuario.pessoa.email}" />
				</div>
			    
				<div class="four wide field">
					<label>Telefone (Residencial):</label>
					<s:textfield id="tel_res" type="text" name="pessoa.telefoneResidencial" placeholder="Insira seu telefone" value="%{#session.usuario.pessoa.telefoneResidencial}" />
				</div>
			    
				<div class="four wide field">
					<label>Telefone (Celular):</label>
					<s:textfield id="tel_cel" type="text" name="pessoa.telefoneCelular" placeholder="Insira seu telefone" value="%{#session.usuario.pessoa.telefoneCelular}" />
				</div>
			</div>
			
			<div class="field">
				<s:submit class="ui green right floated button" value="Salvar" />
			</div>
		</s:form>
	</div>
	
	<div class="sixteen wide column">	
		<form class="ui form">
			<h4 class="ui dividing header">Aparência</h4>
			<div class="field">
				<label>Imagem do Perfil:</label>
				<input id="upload" type="file" accept="image/*" name="">
			</div>
		</form>
	</div>
	
</div>

<div class="row">
	<div id="imagem-crop"></div>
	<div id="bt-crop-imagem" class="ui button">CROP</div>
</div>

<jsp:include page="includes/footer.jsp" />
<script src="../js/jquery.maskedinput.min.js"></script>
<script src="../js/maskedScript.js"></script>
<script src="../js/croppie.min.js"></script>
<script src="../js/cropScript.js"></script>
<jsp:include page="includes/end.jsp" />