<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../bootstrap.jsp" />
<link rel="stylesheet" type="text/css" href="../resources/style.css">
<title>WebCamelô - Meu perfil</title>
<script>
function selectItemByValue(select, value) {
    for (var i = 0; i < select.options.length; i++)
   	{
   		if(select.options[i].value == value)
   		{
   			select.selectedIndex = i;
   		}
   	}
}
</script>
</head>
<body  onload="selectItemByValue(document.getElementById('idEstado'), ${requestScope.nome.idEstado})">
<jsp:include page="../header.jsp" />
	<div class="container container-home vertical-align">
		<div class="col-sm-6">
			<h1><span class="glyphicon glyphicon-user"></span> Meu perfil</h1>
			<form class="form-horizontal" role="form" action="editarPerfil" method="post">
				<div class="form-group">
					<label class="control-label col-sm-2" for="nome">Nome: </label>
					<div class="col-sm-10">
						<p class="form-control-static">${requestScope.nome.nome}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="login">Login: </label>
					<div class="col-sm-10">
						<p class="form-control-static">${requestScope.nome.login}</p>
					</div>
				</div>
				<div class="form-group"> 
					<label class="control-label col-sm-2" for="senha">Senha: </label>
					<div class="col-sm-10">
						<c:choose>
							<c:when test="${requestScope.msg != null}">
								<p class="form-control-static"><font style="color: red">${requestScope.msg}</font></p>
							</c:when>
							<c:otherwise>
								<a href="senha">
									<button type="button" class="btn btn-default">Alterar Senha</button>
								</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="cpf">CPF: </label>
					<div class="col-sm-10">
						<p class="form-control-static">${requestScope.nome.cpf}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">Email: </label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="email" name="email" value="${requestScope.nome.email}">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">End.: </label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="endereco" name="endereco" value="${requestScope.nome.endereco}">
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
							<option value="25">São Paulo</option>
							<option value="26">Sergipe</option>
							<option value="27">Tocantins</option>
					  	</select>
					  </div>
				</div>
				<div class="form-group"> 
					<div class="col-sm-offset-2 col-sm-2">
						<button type="submit" class="btn btn-default">Editar</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-sm-offset-2 col-sm-4">
			<span class="glyphicon glyphicon-pencil logo"></span>
		</div>
	</div>
<jsp:include page="../footer.jsp" />
</body>
</html>