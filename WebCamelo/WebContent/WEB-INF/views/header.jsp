<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="jumbotron text-center">
		<h1>WebCamelô</h1>
		<p>O camelô mais prático do mundo.</p>
</div>
	<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
	  			<a class="navbar-brand" href="#">WebCamelô</a>
	    	</div>
	    	<ul class="nav navbar-nav">
	    		<li class="" id="l1"><a href="${pageContext.request.contextPath}/">Home</a></li>
		    	<li class="" id="l2"><a href="${pageContext.request.contextPath}/listar">Produtos</a></li>
		    	<li class="" id="l3"><a href="${pageContext.request.contextPath}/user/inserir">Anuncie</a></li> 
		    	<li class="" id="l4"><a href="#">Contato</a></li> 
	    	</ul>
	    	<ul class="nav navbar-nav navbar-right">
	    		<c:choose>
		    		<c:when test="${requestScope.logado == false}">
				      	<li>
					      	<a href="${pageContext.request.contextPath}/cadastro">
					      		<span class="glyphicon glyphicon-user"></span> Cadastro
					      	</a>
				      	</li>
				      	<li>
				      		<a href="${pageContext.request.contextPath}/login">
				      			<span class="glyphicon glyphicon-log-in"></span> Login
				      		</a>
				      	</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="${pageContext.request.contextPath}/user/perfil">
								<span class="glyphicon glyphicon-user"></span> ${requestScope.nome.login}
							</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/user/carteira">
								<span class="glyphicon glyphicon-credit-card"></span>
								<fmt:formatNumber value="${requestScope.nome.carteira}" type="currency"/>
							</a>
						</li>
			      		<li>
			      			<a href="${pageContext.request.contextPath}/logout">
			      				<span class="glyphicon glyphicon-log-out"></span> Deslogar
			      			</a>
			      		</li>
			      	</c:otherwise>
		      	</c:choose>
		    </ul>
		</div>
	</nav>