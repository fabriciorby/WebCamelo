<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="bootstrap.jsp" />
<link rel="stylesheet" type="text/css" href="resources/style.css">
<script>
function validaCampos() {
	var login = document.getElementById('login').value;
	if (login.length >= 32) {
		alert("O login não pode ter mais de 32 caracteres!")
		return false;
	}
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
	var nome = document.getElementById('nome').value;
	if (nome == "" || nome == null) {
		alert("O campo Nome não pode ser vazio!");
		return false;
	}
	var email = document.getElementById('email').value;
	if (email == "" || email == null) {
		alert("O campo email não pode ser vazio!");
		return false;
	}
	if (email.indexOf("@") == -1) {
		alert("Digite um email válido!");
		return false;
	}
	var endereco = document.getElementById('endereco').value;
	if (endereco == "" || endereco == null) {
		alert("O campo endereço não pode ser vazio!");
		return false;
	}
	var cpf = document.getElementById('cpf').value;
	if (cpf == "" || cpf == null) {
		alert("O campo cpf não pode ser vazio!");
		return false;
	}
	if (cpf.length != 11)
	{
		alert("cpf inválido!")
		return false;
	}
	return true;
}
</script>
<title>WebCamelô - Cadastro</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container container-home">
		<div class="col-sm-8">
			<h1><span class="glyphicon glyphicon-user"></span> Cadastro</h1>
			<p><font style="color: red">${requestScope.msg}</font></p>
			<form class="form-horizontal" role="form" action="cadastroUsuario" method="post">
				<div class="form-group">
					<label class="control-label col-sm-2" for="login">Login: </label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="login" name="login" placeholder="Digite o login">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">Senha: </label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="senha" name="senha" placeholder="Digite a senha">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">Confirmar: </label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="senha2" name="senha2" placeholder="Confirme a senha">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="nome">Nome: </label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="nome" name="nome" placeholder="Digite seu nome">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">Email: </label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="email" name="email" placeholder="Digite seu email">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="idEstado">UF:</label>
					<div class="col-sm-10">
						<select class="form-control" name="idEstado" id="idEstado">
							<option value="1">Acre</option>
							<option value="2">Alagoas</option>
							<option value="3">Amapá</option>
							<option value="4">Amazonas</option>
							<option value="5">Bahia</option>
							<option value="6">Ceará</option>
							<option value="7">Distrito Federal</option>
							<option value="8">Espírito Santo</option>
							<option value="9">Goiás</option>
							<option value="10">Maranhão</option>
							<option value="11">Mato Grosso</option>
							<option value="12">Mato Grosso do Sul</option>
							<option value="13">Minas Gerais</option>
							<option value="14">Pará</option>
							<option value="15">Paraíba</option>
							<option value="16">Paraná</option>
							<option value="17">Pernambuco</option>
							<option value="18">Piauí</option>
							<option value="19">Rio de Janeiro</option>
							<option value="20">Rio Grande do Norte</option>
							<option value="21">Rio Grande do Sul</option>
							<option value="22">Rondônia</option>
							<option value="23">Roraima</option>
							<option value="24">Santa Catarina</option>
							<option value="25" selected>São Paulo</option>
							<option value="26">Sergipe</option>
							<option value="27">Tocantins</option>
					  	</select>
					  </div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="endereco">End: </label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="endereco" name="endereco" placeholder="Digite seu endereço">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="cpf">CPF: </label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="cpf" name="cpf" placeholder="Digite seu CPF">
					</div>
				</div>
				<div class="form-group"> 
					<div class="col-sm-offset-2 col-sm-2">
						<button type="submit" class="btn btn-default" onclick="return validaCampos()">Cadastrar</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-sm-4">
			<h1><span class="glyphicon glyphicon-log-in"></span> Já é cadastrado?</h1>
			<div class="col-sm-offset-2">
			<a href="${pageContext.request.contextPath}/login">
				<button class="btn btn-default">Faça o login</button>
			</a>
			<br />
			<br />
			<br />
			<br />
			<br />
			<span class="glyphicon glyphicon-piggy-bank logo"></span>
			</div>
		</div>
	</div>
<jsp:include page="footer.jsp" />
</body>
</html>