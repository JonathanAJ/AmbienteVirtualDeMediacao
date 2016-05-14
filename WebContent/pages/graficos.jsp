<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/menus.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.2/Chart.min.js"></script>
<div class="row">
	<h4 class="ui horizontal divider header cc-blue-dark" style="color: #3AA593 !important;">
	  <i class="pie chart icon"></i>
	  Conflitos em Fortaleza
	</h4>
			
	<%-- <div class="two wide column">
		<div class="ui vertical buttons teal">
		  <button class="ui button">Regional</button>
		  <button class="ui button">Bairro</button>
		  <button class="ui button">Núcleo</button>
		</div>
	</div>
	
	
	<div class="fourteen wide column">
		<div class="grafico">
			<canvas id="myChart"></canvas>
		</div>
	</div> --%>
	
	<div class="sixteen wide column">
		<div class="grafico">
			<canvas id="myChart"></canvas>
		</div>
	</div>
	
	<s:bean name="com.mediacaovirtual.dao.PostDAO" var="postDAO"/>
	<script>
		Chart.defaults.global.legend.position = "bottom";
		var ctx = document.getElementById("myChart");
		var myChart = new Chart(ctx, {
		    type: 'pie',
		    data : {
		    	    labels: [
						"Conflito Familiar",
						"Conflito Trabalhista",
						"Conflito Escolar",
						"Agressão",
						"Conflito de bens",
						"Desrespeito ao Consumidor",
						"Cobrança de Dívida",
						"Conflito de Vizinhos",
						"Ameaça"
		    	    ],
		    	    datasets: [
		    	        {
		    	            data: [
		    	       			<s:iterator value="#postDAO.getNumPost()" var="num" >	
			    	   			 <s:property value="num"/>,
			    	   			</s:iterator>
		    	               ],
		    	            backgroundColor: [
		    	                "#FAC8CD",
		    	                "#D7BCC8",
		    	                "#98B6B1",
		    	                "#629677",
		    	                "#495D63",
		    	                "#EB5E28",
		    	                "#D3EA77",
		    	                "#809BCE",
		    	                "#934683"
		    	            ]
		    	        }],
		    	    options: {
		    	    	
		    	    }
		    	}
			});
	</script>
</div>
<jsp:include page="includes/footer.jsp" />
<jsp:include page="includes/end.jsp" />
