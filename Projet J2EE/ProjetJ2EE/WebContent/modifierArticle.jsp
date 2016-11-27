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

	<jsp:include page="header.jsp" />
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row" id="bodym">
			<div class="col-lg-offset-2 col-lg-8" id="contenu">
				<form action="modifierArticle2" method="post"
					enctype="multipart/form-data" class="form-horizontal" role="form">
					<div class="form-group">
						<input type="hidden" name="a_id" value="${article.a_id}">
						<label class="control-label col-sm-3" for="nom">Nom:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="nom" name="nom"
								value="${article.a_nom}">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="prix">Prix:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="prix" name="prix"
								value="${article.a_prix}">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="qte">Quantite:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="qte" name="qte"
								value="${article.a_qte}">
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3" for="remise">Remise:</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="remise"
									name="remise" value="${article.a_remise}">
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="description">Description:</label>
						<div class="col-sm-9">
							<textarea class="form-control" rows="3" id="description"
								name="description">${article.a_description}</textarea>
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
							<input id="uploadimage" name="file" type="file" class="btn">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-9">
							<button type="submit" class="btn btn-danger">Modifier</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>