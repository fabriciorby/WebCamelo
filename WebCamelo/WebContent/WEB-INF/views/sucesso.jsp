<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="bootstrap.jsp" />
<link rel="stylesheet" type="text/css" href="../resources/style.css">
<title>WebCamelô - Sucesso</title>
</head>
<body>
<jsp:include page="header.jsp" />
	<div class="container container-home text-center">
	<h1>${requestScope.msg}</h1>
	<c:choose>
	    <c:when test="${requestScope.msg=='Usuário cadastrado com sucesso!'}">
		<p><a href="login">
			<button class="btn btn-default">Faça o login</button>
		</a></p>
	    </c:when>    
	    <c:otherwise>
		<p><a href="../index" class="button">
			<button class="btn btn-default">Home</button>
		</a></p>
	    </c:otherwise>
	</c:choose>
	</div>
<jsp:include page="footer.jsp" />
</body>
</html>