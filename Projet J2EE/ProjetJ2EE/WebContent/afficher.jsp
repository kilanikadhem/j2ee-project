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
		<c:if test="${requestScope.listeArticles == null}">
			<c:redirect url="afficher" />

		</c:if>
		<div class="row" id="bodym">
			<div class="col-lg-offset-2 col-lg-8" id="contenu">
				<c:if test="${empty requestScope.listeArticles}">
					<h2>Pas de produit !!</h2>
				</c:if>
				<c:forEach var="article" items="${requestScope.listeArticles}">
					<div class="col-lg-3">
						<div class="thumbnail">
							<img src="imagesProduits/${article.a_image}">
							<div class="caption">
								<h4>${article.a_nom}</h4>
								<p>${article.a_description}</p>
								<hr>
								<p class="prixArticle">${article.a_prix}TND</p>
								<a href="#" class="btn btn-primary" role="button">Acheter</a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- fin div row-->

			<jsp:include page="inscription.jsp" />
			<jsp:include page="connexion.jsp" />

		</div>
		<jsp:include page="footer.jsp" />
</body>
</html>