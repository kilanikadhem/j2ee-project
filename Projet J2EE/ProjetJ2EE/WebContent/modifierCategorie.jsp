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
				<form action="modifierCategorie2" method="get"
					class="form-horizontal" role="form">
					<div class="form-group">
						<input type="hidden" name="cat_id" value="${categorie.cat_id}">
						<label class="control-label col-sm-3" for="nom">Nom:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="nom" name="cat_nom"
								value="${categorie.cat_nom}">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="description">Description:</label>
						<div class="col-sm-9">
							<textarea class="form-control" rows="3" id="description"
								name="cat_description">${categorie.cat_description}</textarea>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-3" for="sexe">Type : </label>
						<div class="col-sm-9">
							<label for="nutrition" class="radio-inline"><input
								checked="checked" id="nutrition" type="radio" name="cat_type"
								value="Nutrition">Nutrition</label> <label for="equipement"
								class="radio-inline"><input id="equipement" type="radio"
								name="cat_type" value="Equipement">Equipement</label>
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