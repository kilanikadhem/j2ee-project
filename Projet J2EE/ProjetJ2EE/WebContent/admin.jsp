<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<c:if test="${empty applicationScope.categories}"> 
 		<c:redirect url="redirection"/> 
	</c:if> 
	<jsp:include page="header.jsp" />
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="row" id="bodym">
		<div class="col-lg-offset-2 col-lg-8" id="contenu">
			<div class="row">
				<div class="col-lg-offset-1 col-lg-6 statsize">
					Statistiques  <img src="images/stats.png"> : <img src="images/visiteur.png" width="60" height="60"> 800 <sub>visiteurs cette
						semaine</sub>
				</div>
				<div class="col-lg-5 statsize">
					<img src="images/panierstat.png" width="60" height="60">${requestScope.nbCommande} <sub>Commandes effectués
						</sub>
				</div>
			</div>
			<div class="row operation" >
				<div class="col-lg-4">
					<a href="ajouter.jsp"><img src="images/add2.png" width="100" height="100"></a>
					<br>Ajouter
				</div>
				<div class="col-lg-4">
					<a href="supprimer"><img src="images/delete2.png" width="100" height="100"></a>
					<br>Supprimer
				</div>
				<div class="col-lg-4">
					<a href="modifier"><img src="images/configure2.png" width="100" height="100"></a>
					<br>Modifier
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>