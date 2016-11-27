<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="row" id="menu">
	<div class="col-lg-offset-1 col-lg-2">
		<img src="images/logo.png" width="244" height="183">
	</div>
	<div class="col-lg-7 menubar">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index">Acceuil</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Nutrition <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<c:forEach var="cat" items="${applicationScope['categories']}">
									<c:if test="${cat.cat_type =='Nutrition'}">
										<li><a href="afficher?catid=${cat.cat_id}">${cat.cat_nom}</a></li>
										
									</c:if>
								</c:forEach>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Equipement <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<c:forEach var="cat" items="${applicationScope['categories']}">
									<c:if test="${cat.cat_type =='Equipement'}">
										<li><a href="afficher?catid=${cat.cat_id}">${cat.cat_nom}</a></li>
									</c:if>
								</c:forEach>
							</ul></li>
						<li><a href="promotion">Promotions</a></li>
					</ul>
					<form class="navbar-form navbar-right" role="search" action="recherche" method="get">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Recherche" name="recherche">
						</div>
						<button type="submit" class="btn btn-default">Recherche</button>
					</form>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</div>
</nav>
