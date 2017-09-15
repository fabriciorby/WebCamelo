<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../bootstrap.jsp" />
<link rel="stylesheet" type="text/css" href="../resources/style.css">
<title>WebCamelô - Alterar Senha</title>
<script>
function validaCampos() {
	var senha = document.getElementById('senha').value;
	if (senha.length >= 32) {
		alert("A senha não pode ter mais de 32 caracteres!")
		return false;
	}
	if (senha == "" || senha == null) {
		alert("O campo Nome não pode ser vazio!");
		return false;
	}
	var senha2 = document.getElementById('senha2').value;
	if (senha != senha2) {
		alert("Digite as senhas corretamente!")
		return false;
	}
	return true;
}
</script>
</head>
<body>
<jsp:include page="../header.jsp" />
	<div class="container container-home vertical-align">
		<div class="col-sm-6">
			<h1><span class="glyphicon glyphicon-user"></span> Alterar Senha</h1>
			<form class="form-horizontal" role="form" action="editarSenha" method="post">
				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">Senha: </label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="senha" name="senha" placeholder="Digite a senha">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">Confirme: </label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="senha2" name="senha2" placeholder="Confirmar">
					</div>
				</div>
				<div class="form-group"> 
					<div class="col-sm-offset-2 col-sm-2">
						<button type="submit" class="btn btn-default" onclick="return validaCampos()">Alterar</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-sm-offset-2 col-sm-4">
			<span class="glyphicon glyphicon-lock logo"></span>
		</div>
	</div>
<jsp:include page="../footer.jsp" />
</body>
</html>