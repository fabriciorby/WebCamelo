<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="bootstrap.jsp" />
<link rel="stylesheet" type="text/css" href="resources/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WebCamelô - Detalhes do Produto</title>
</head>
<body>
<jsp:include page="header.jsp" />
<jsp:useBean id="bd" class="br.edu.ufabc.webcamelo.dao.ProdutoDAO" />
	<div class="container container-home vertical-align">
	<c:forEach var="produto" items="${bd.getProduto(requestScope.id)}">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-heading text-center">
				<h1>${produto.nome}</h1>
				</div>
				<div class="panel-body vertical-align container-home">
					<div class="col-sm-3">
						<p><span class="glyphicon glyphicon-star"></span> Produto ${bd.getEstadoProduto(produto.estadoProduto)}</p>
						<p><span class="glyphicon glyphicon-user"></span> ${bd.getVendedor(produto.idVendedor)}</p>
					</div>
					<div class="col-sm-6 text-center">
						<p class="lead">${produto.descricao}</p>
					</div>
					<div class="col-sm-offset-2 col-sm-1">
					<c:choose>
						<c:when test="${produto.preco > requestScope.nome.carteira}">
							<p class="lead preco">
							<span class="label label-danger">
								<fmt:formatNumber value="${produto.preco}" type="currency"/>
							</span>
							</p>
							<a href="user/carteira">
								<button type="button" class="btn btn-default">Carteira</button>
							</a>
						</c:when>
						<c:otherwise>
							<p class="lead preco">
							<span class="label label-success">
								<fmt:formatNumber value="${produto.preco}" type="currency"/>
							</span>
							</p>
							<a href="#" onclick="document.getElementById('formulario').submit();">
								<button type="button" class="btn btn-default">Comprar</button>
							</a>
						</c:otherwise>
					</c:choose>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	</div>
	<p class="text-center"><a href="listar">
		<button type="button" class="btn btn-default">Voltar</button>
	</a></p>
	<form action="user/comprarProduto" method="post" id="formulario">
	<input type="hidden" id="id" name="id" value="${requestScope.id}" />
	<input type="hidden" id="opcao" name="opcao" value="CompraProduto" />
	</form>
	<jsp:include page="footer.jsp" />
	</body>
</html>