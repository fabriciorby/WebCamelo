<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="bootstrap.jsp" />
<link rel="stylesheet" type="text/css" href="resources/style.css">
<script type="application/javascript">
	function detalhes(id){
		document.getElementById('id').value = id;
		document.getElementById('formulario').submit();
	}
</script>
<title>Webcamelô - Produtos</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:useBean id="bd" class="br.edu.ufabc.webcamelo.dao.ProdutoDAO" />
	<div class="container container-home">
	<p><font style="color: red">${requestScope.msg}</font></p>
		<c:forEach var="produto" items="${bd.lista}">
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-heading text-center">
					<h3>${produto.nome}</h3>
				</div>
				<div class="panel-body vertical-align">
					<div class="col-sm-6">
						<p><span class="glyphicon glyphicon-star"></span> Produto ${bd.getEstadoProduto(produto.estadoProduto)}</p>
						<p><span class="glyphicon glyphicon-user"></span> ${bd.getVendedor(produto.idVendedor)}</p>
					</div>
					<div class="col-sm-offset-3 col-sm-3 text-center">
					<c:choose>
						<c:when test="${produto.preco > requestScope.nome.carteira}">
							<p class="lead preco">
							<span class="label label-danger">
								<fmt:formatNumber value="${produto.preco}" type="currency"/>
							</span>
							</p>
						</c:when>
						<c:otherwise>
							<p class="lead preco">
							<span class="label label-success">
								<fmt:formatNumber value="${produto.preco}" type="currency"/>
							</span>
							</p>
						</c:otherwise>
					</c:choose>
					<a href="#" id="${produto.id}" onclick="detalhes(${produto.id})">
						<button type="button" class="btn btn-default">Detalhes</button>
					</a>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
	<form action="produto" method="post" id="formulario">
	<input type="hidden" id="id" name="id" value="" />
	</form>
<jsp:include page="footer.jsp" />
</body>
</html>