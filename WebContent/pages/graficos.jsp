<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="includes/header.jsp" />
<jsp:include page="includes/menus.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.2/Chart.min.js"></script>
<div class="row">
	<div class="sixteen wide column container">
		<s:bean name="com.mediacaovirtual.dao.PostDAO" var="postDAO"/>
		<div class="grafico">		

			<h4 class="ui horizontal divider header cc-blue-dark" style="color: #3AA593 !important;">
			  <i class="pie chart icon"></i>
			  Conflitos em Fortaleza
			</h4>

			<canvas id="myChart"></canvas>
		</div>
	</div>
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
<%-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.2/Chart.min.js"></script> --%>
<jsp:include page="includes/end.jsp" />