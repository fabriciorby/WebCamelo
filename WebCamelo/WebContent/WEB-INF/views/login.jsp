<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="bootstrap.jsp" />
<link rel="stylesheet" type="text/css" href="resources/style.css">
<script>
</script>
<title>WebCamelô - Login</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container container-home">
		<div class="col-sm-4">
			<h1><span class="glyphicon glyphicon-log-in"></span> Login</h1>
			<p><font style="color: red">${requestScope.msg}</font></p>
			<form class="form-horizontal" role="form" action="loginUsuario" method="post">
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
					<div class="col-sm-offset-2 col-sm-2">
						<button type="submit" class="btn btn-default">Entrar</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-sm-offset-1 col-sm-4">
			<h1><span class="glyphicon glyphicon-user"></span> Sem cadastro?</h1>
			<div class="col-sm-offset-2">
			<a href="${pageContext.request.contextPath}/cadastro">
				<button class="btn btn-default">Cadastre-se</button>
			</a>
			</div>
		</div>
		<div class="col-sm-offset-1 col-sm-2 text-center">
			<span class="glyphicon glyphicon-piggy-bank logo"></span>
		</div>
	</div>
<jsp:include page="footer.jsp" />
</body>
</html>