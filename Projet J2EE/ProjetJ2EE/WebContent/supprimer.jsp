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
	<c:if test="${requestScope.listeArticles == null}">
		<c:redirect url="/supprimer" />
	</c:if>
	<jsp:include page="header.jsp" />
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="row" id="bodym">
		<div class="col-lg-offset-2 col-lg-8" id="contenu">
			<div class="row">
				<div class="col-lg-6">
					<div class="page-header">
						<h1>Supprimer produit</h1>
						<c:if test="${requestScope.testSupp == true}">
							<p class="bg-success">Categorie supprimer avec succée !</p>
						</c:if>
						<c:if test="${requestScope.testSuppArticle == true}">
							<p class="bg-success">Article supprimer avec succée !</p>
						</c:if>
					</div>
					<br>
					<div class="form-group">
						<label class="control-label col-sm-3" for="cat">Categorie
							: </label>
						<div class="col-sm-9">
							<select id="cat" class="form-control"
								onchange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
								<option selected="true" disabled="disabled">Choisissez
									une categorie</option>
								<option value="supprimer">Tout les produits></option>
								<c:forEach var="cat" items="${applicationScope['categories']}">
									<option value="supprimer?catid=${cat.cat_id}">${cat.cat_nom}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
			</div>
			<br>
			<c:if test="${requestScope.test == null}">
				<c:forEach var="cat" items="${applicationScope['categories']}">
					<c:if
						test="${cat.cat_id == requestScope.listeArticles[0].categorie.cat_id }">
						<center>
							<h2>${cat.cat_nom}</h2>
						</center>
						<hr>
					</c:if>
				</c:forEach>
			</c:if>
			<div class="row">
				<div class="col-lg-12">
					<c:if test="${empty requestScope.listeArticles}">
						<h2>Pas de produit !!</h2>
					</c:if>
					<c:forEach var="article" items="${requestScope.listeArticles}">
						<div class="col-lg-2">
							<div class="thumbnail">
								<img src="imagesProduits/${article.a_image}">
								<div class="caption">
									<h4>${article.a_nom}</h4>
									<p>${article.a_description}</p>
									<hr>
									<p class="prixArticle">${article.a_prix}TND</p>
									<a href="supprimerArticle?a_id=${article.a_id}"
										class="btn btn-primary" role="button">Supprimer</a>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>


		</div>
		<div class="col-lg-2" id="contenu">
			<div class="page-header">
				<h3>Supprimer Categorie</h3>
				<c:if test="${requestScope.testSupp == false}">
					<p class="bg-danger">Cette categorie est liée a des articles !</p>
				</c:if>
			</div>
			<div class="list-group">
				<c:forEach var="cat" items="${applicationScope['categories']}">
					<a class="list-group-item"
						href="supprimerCategorie?catid=${cat.cat_id}">${cat.cat_nom}</a>
				</c:forEach>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
