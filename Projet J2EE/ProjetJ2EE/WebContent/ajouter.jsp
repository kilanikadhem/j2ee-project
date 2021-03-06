<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<jsp:include page="header.jsp" />
	<jsp:include page="menu.jsp"></jsp:include>

	<c:if test="${empty applicationScope.categories}">
		<c:redirect url="redirection" />

	</c:if>

	<div class="row" id="bodym">
		<div class="col-lg-offset-2 col-lg-8" id="contenu">
			<div class="row">
				<div class="col-lg-6">
					<div class="page-header">
						<h1>Ajout produit</h1>
						<c:if test="${requestScope.testAjoutArticle == true}">
							<p class="bg-success">Article ajouté avec succée !</p>
						</c:if>
					</div>

					<form method="post" action="ajoutArticle"
						enctype="multipart/form-data" class="form-horizontal" role="form">
						<div class="form-group">
							<label class="control-label col-sm-3" for="nom">Nom:</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="nom" name="nom"
									placeholder="Entrer nom">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3" for="prix">Prix:</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="prix" name="prix"
									placeholder="Entrer Prix">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3" for="qte">Quantite:</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="qte" name="qte"
									placeholder="Entrer Quantite">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3" for="remise">Remise:</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="remise" name="remise"
									placeholder="%" > 
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3" for="description">Description:</label>
							<div class="col-sm-9">
								<textarea class="form-control" rows="3" id="description"
									name="description" placeholder="Entrer Description"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3" for="cat">Categorie
								: </label>
							<div class="col-sm-9">
								<select id="cat" class="form-control" name="cat">
									<c:forEach var="cat" items="${applicationScope['categories']}">
										<option value="${cat.cat_id}">${cat.cat_nom}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3" for="uploadimage">Choisissez
								l'image</label>
							<div class="col-sm-9">
								<input id="uploadimage" type="file" name="file" class="btn">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="submit" class="btn btn-danger">Ajouter</button>
							</div>
						</div>
					</form>
					<!-- Fin Fromulaire -->

				</div>
				<div class="col-lg-6">
					<div class="page-header">
						<h1>Ajout Categorie</h1>
						<c:if test="${requestScope.testAjoutCategorie == true}">
							<p class="bg-success">Categorie ajouté avec succée !</p>
						</c:if>
					</div>
					<form action="ajoutCategorie" method="get" 
						class="form-horizontal" role="form">
						<div class="form-group">
							<label class="control-label col-sm-3" for="sexe">Type : </label>
							<div class="col-sm-9">
								<label for="nutrition" class="radio-inline"><input
									checked="checked" id="nutrition" type="radio" name="type"
									value="Nutrition">Nutrition</label> <label for="equipement"
									class="radio-inline"><input id="equipement"
									type="radio" name="type" value="Equipement">Equipement</label>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-3" for="nom">Nom:</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="nom" name="nom"
									placeholder="Entrer nom Categorie">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3" for="description">Description:</label>
							<div class="col-sm-9">
								<textarea class="form-control" rows="3" id="description"
									name="description" placeholder="Entrer Description"></textarea>

							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="submit" class="btn btn-danger">Ajouter</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>