<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
				<div class="column">
					<div class="ui items">
						<div class="item">
							<div class="ui tiny image">
								<img src="../img/person.jpg">
							</div>
							<div class="middle aligned content">
								<div class="header">Lorem ipsum dolor sit.</div>
								<div class="description color-white">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Dolor, quasi.</p>
									<span class="ui left floated"> <i class="comment icon"></i>
										3 Comentários
									</span> <span class="ui right floated"> <i
										class="calendar icon"></i> 31/08/2016 | 22:59
									</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="ui tiny image">
								<img src="../img/person.jpg">
							</div>
							<div class="middle aligned content">
								<div class="header">Lorem ipsum dolor.</div>
								<div class="description color-white">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Dignissimos, animi, voluptatum.</p>
									<span class="ui left floated"> <i class="comment icon"></i>
										9 Comentários
									</span> <span class="ui right floated"> <i
										class="calendar icon"></i> 31/08/2016 | 13:30
									</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="ui tiny image">
								<img src="../img/person.jpg">
							</div>
							<div class="middle aligned content">
								<div class="header">Lorem ipsum dolor sit amet.</div>
								<div class="description color-white">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing.</p>
									<span class="ui left floated"> <i class="comment icon"></i>
										14 Comentários
									</span> <span class="ui right floated"> <i
										class="calendar icon"></i> 30/08/2015 | 16:57
									</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="ui tiny image">
								<img src="../img/person.jpg">
							</div>
							<div class="middle aligned content">
								<div class="header">Lorem ipsum.</div>
								<div class="description color-white">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Praesentium.</p>
									<span class="ui left floated"> <i class="comment icon"></i>
										23 Comentários
									</span> <span class="ui right floated"> <i
										class="calendar icon"></i> 29/08/2015 | 12:30
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="column">
					<div class="ui items">
						<div class="item">
							<div class="ui tiny image">
								<img src="../img/person.jpg">
							</div>
							<div class="middle aligned content">
								<div class="header">Lorem ipsum.</div>
								<div class="description color-white">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Praesentium.</p>
									<span class="ui left floated"> <i class="comment icon"></i>
										23 Comentários
									</span> <span class="ui right floated"> <i
										class="calendar icon"></i> 29/08/2015 | 10:30
									</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="ui tiny image">
								<img src="../img/person.jpg">
							</div>
							<div class="middle aligned content">
								<div class="header">Lorem ipsum dolor sit.</div>
								<div class="description color-white">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Dolor, quasi.</p>
									<span class="ui left floated"> <i class="comment icon"></i>
										3 Comentários
									</span> <span class="ui right floated"> <i
										class="calendar icon"></i> 27/08/2016 | 21:59
									</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="ui tiny image">
								<img src="../img/person.jpg">
							</div>
							<div class="middle aligned content">
								<div class="header">Lorem ipsum dolor.</div>
								<div class="description color-white">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Dignissimos, animi, voluptatum.</p>
									<span class="ui left floated"> <i class="comment icon"></i>
										9 Comentários
									</span> <span class="ui right floated"> <i
										class="calendar icon"></i> 26/08/2016 | 18:30
									</span>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="ui tiny image">
								<img src="../img/person.jpg">
							</div>
							<div class="middle aligned content">
								<div class="header">Lorem ipsum dolor sit amet.</div>
								<div class="description color-white">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing.</p>
									<span class="ui left floated"> <i class="comment icon"></i>
										14 Comentários
									</span> <span class="ui right floated"> <i
										class="calendar icon"></i> 26/08/2015 | 17:57
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
<jsp:include page="includes/footer.jsp" />
<jsp:include page="includes/end.jsp" />