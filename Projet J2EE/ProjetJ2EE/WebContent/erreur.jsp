<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ESSTHS Power</title>
<link rel="icon" href="images/favicon.png" />
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="style.css" rel="stylesheet">
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
</head>
<body>
	<div class="container-fluid">
		<jsp:include page="header.jsp" />
		<jsp:include page="menu.jsp" />
		<div class="row" id="bodym">
			<h2>Votre email ou mot de passe et incorrecte !!</h2>
		</div>
	</div>
	<jsp:include page="inscription.jsp" />
	<jsp:include page="connexion.jsp" />
	<jsp:include page="footer.jsp" />
</body>
</html>
</body>
</html>