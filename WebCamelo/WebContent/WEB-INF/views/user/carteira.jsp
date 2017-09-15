<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../bootstrap.jsp" />
<link rel="stylesheet" type="text/css" href="../resources/style.css">
<title>WebCamelô - Carteira</title>
</head>
<body>
<jsp:include page="../header.jsp" />
	<div class="container container-home">
		<div class="col-sm-6">
			<h1><span class="glyphicon glyphicon-usd"></span> Minha carteira</h1>
			<p><font style="color: red">${requestScope.msg}</font></p>
			<form class="form-horizontal" role="form" action="adicionaCarteira" method="post">
			<div class="form-group">
				<label class="control-label col-sm-6" for="carteira">Quanto deseja adicionar?</label>
				<div class="col-sm-6">
					<select class="form-control" name="carteira" id="carteira">
						<option value="5">R$ 5,00</option>
						<option value="10">R$ 10,00</option>
						<option value="20">R$ 20,00</option>
						<option value="50">R$ 50,00</option>
						<option value="100">R$ 100,00</option>
						<option value="150">R$ 150,00</option>
						<option value="200">R$ 200,00</option>
						<option value="500">R$ 500,00</option>
						<option value="1000">R$ 1000,00</option>
				  	</select>
				</div>
			</div>
			<div class="form-group"> 
				<div class="col-sm-offset-6 col-sm-2">
					<button type="submit" class="btn btn-default">Adicionar</button>
				</div>
			</div>
			</form>
		</div>
		<div class="col-sm-offset-2 col-sm-4">
		<span class="glyphicon glyphicon-credit-card logo"></span>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>