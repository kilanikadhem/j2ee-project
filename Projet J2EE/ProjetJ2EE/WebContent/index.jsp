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
		<jsp:include page="carousel.jsp" />
		<c:if test="${requestScope.listeArticles == null}">
			<c:redirect url="index" />

		</c:if>

		<div class="row" id="bodym">
			<div class="col-lg-offset-2 col-lg-8" id="contenu">
				<c:forEach var="article" items="${requestScope.listeArticles}">
					<div class="col-lg-3">
						<div class="thumbnail">
							<img src="imagesProduits/${article.a_image}">
							<div class="caption">
								<h4>${article.a_nom}</h4>
								<p>${article.a_description}</p>
								<hr>
								<c:if test="${article.a_remise == 0}">
									<p class="prixArticle">${article.a_prix}<sub>TND</sub></p>

								</c:if>
								<c:if test="${article.a_remise != 0}">
									<p>
										<s class="remiseArticle">${article.a_prix}</s><span
											class="prixArticle">${(article.a_prix/100) * (100-article.a_remise)}<sub>TND</sub></span>
									</p>

								</c:if>

								<form action="ajouterPanier" name="ajoutPanier" method="get">
									<input type="hidden" name="a_id" value="${article.a_id}">
									<input type="image" height="40" width="40"
										src="images/ajoutPanier.png"><input
										calss="qteCommande" type="number" name="qte" size="2" min="1"
										max="99" value="1">
								</form>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- fin div row-->



		</div>
	</div>
	<jsp:include page="footer.jsp" />
	<c:if test="${requestScope.modification != null}">
		<script>
			$("#panier-modal").modal();
		</script>
	</c:if>
	<c:if test="${requestScope.commande != null}">
		<script>
			$("#panier-modal").modal();
		</script>
	</c:if>
</body>
</html>