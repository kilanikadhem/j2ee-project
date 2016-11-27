<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="panier.jsp"></jsp:include>

<header class="row" id="barre">

	<div class="col-lg-offset-1 col-lg-3">
		Service Client <img src="images/telephone.png" width="20" Height="20">
		: 00216 98 123 123
	</div>
	<div class="col-lg-3">
		<%@page import="entity.Utilisateur"%>
		<%
			Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");
		%>
		<c:if test="${empty utilisateur}">


			<a data-toggle="modal" data-target="#login-modal">Connectez vous
			</a>
		ou <a data-toggle="modal" data-target="#signinModal">Creer un
				nouveau compte</a>

		</c:if>
		<c:if test="${not empty utilisateur}">
			<c:if test="${utilisateur.privilege}">
				<a href="admin"> Dashboard </a>
				&emsp;
			</c:if>
			<span>${utilisateur.nom} ${utilisateur.prenom}</span>
			&emsp;
			<a href="deconnexion"> Déconnexion </a>
		</c:if>
	</div>
	<div class="col-lg-3">

		<a Data-toggle="modal" data-target="#panier-modal"><img
			src="images/panier3.png" width="25" Height="25"></a> TND 00.00
	</div>
	<div class="col-lg-2"></div>

</header>
	<jsp:include page="inscription.jsp" />
	<jsp:include page="connexion.jsp" />
