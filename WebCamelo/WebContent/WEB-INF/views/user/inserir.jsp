<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../bootstrap.jsp" />
<link rel="stylesheet" type="text/css" href="../resources/style.css">
<script type="text/javascript">
	function validaCampos() {
		var nome = document.getElementById('nome').value;
		if (nome == "" || null) {
			alert("O campo Nome não pode ser vazio!");
			return false;
		}
		if (nome.length >= 100) {
			alert("O campo Nome não pdoe ter mais de 100 caracteres!")
			return false;
		}
		var descricao = document.getElementById('descricao').value;
		if (email == "" || null) {
			alert("O campo descrição não pode ser vazio!");
			return false;
		}
		var preco = document.getElementById('preco').value;
		if (!isNaN(preco)) {
			alert("O campo preco é inválido!");
			return false;
		}
	}
</script>
<title>WebCamelô - Anuncie seu Produto</title>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="container container-home vertical-align">
		<div class="col-sm-8">
			<h1><span class="glyphicon glyphicon-tag"></span> Anuncie seu produto!</h1>
			<form class="form-horizontal" role="form" action="anunciar" method="post">
				<div class="form-group">
					<label class="control-label col-sm-2" for="nome">Nome: </label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="nome" name="nome" placeholder="Digite o nome do produto">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="descricao">Descrição:</label>
					<div class="col-sm-10">
					  	<textarea class="form-control" rows="5" id="descricao" name="descricao" placeholder="Descreva o produto"></textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="preco">Preço:</label>
					<div class="col-sm-10">
					  	<input type="text" class="form-control" id="preco" name="preco" placeholder="Digite o preço">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="estadoProduto">Estado:</label>
					<div class="col-sm-10">
						<label class="radio-inline">
							<input type="radio" name="estadoProduto" value="1" checked>Novo
						</label>
						<label class="radio-inline">
							<input type="radio" name="estadoProduto" value="2">Usado
						</label>
					</div>
				</div>
				<div class="form-group"> 
					<div class="col-sm-offset-2 col-sm-2">
						<button type="submit" class="btn btn-default" onclick="return validaCampos()">Anunciar</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-sm-offset-2 col-sm-2">
			<span class="glyphicon glyphicon-flag logo"></span>
		</div>
	</div>
<jsp:include page="../footer.jsp" />
</body>
</html>