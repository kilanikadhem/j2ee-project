<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Modal -->
<div id="panier-modal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Votre Panier</h4>
			</div>
			<div class="modal-body">
				<c:if test="${requestScope.commande == 'confirmer'}">
					<h2 class="bg-success">Commande traitée avec succée !</h2>

				</c:if>
				<c:if test="${requestScope.commande == 'refuser'}">
					<h2 class="bg-danger">Quantité non disponible !</h2>

				</c:if>
				<c:if test="${empty sessionScope.panier}">
					<h2>Votre panier est vide</h2>

				</c:if>
				<c:if test="${!empty sessionScope.panier}">
					<table class="table">
						<thead>
							<tr>
								<th></th>
								<th>Article</th>
								<th>Quantité</th>
								<th>Totale</th>
							</tr>
						</thead>
						<c:forEach var="item" items="${sessionScope.panier}">
							<tr>
								<td><img src="imagesProduits/${item.article.a_image}"
									height="30" width="30"></td>
								<td>${item.article.a_nom}</td>
								<td><input id="${item.it_id}"
									onChange="location.href = 'modifierPanier?it_id=${item.it_id}&it_qte='+document.getElementById('${item.it_id}').value;"
									type="number" value="${item.it_qte}" min="1" max="99"></td>
								<td>${item.it_totale}</td>
								<td><button onClick="location.href = 'supprimerItem?it_id=${item.it_id}';" type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button></td>
						</c:forEach>
					</table>
					<h3>
						Totale : ${sessionScope.totaleCommande}<a href="confirmerCommande"
							class="btn btn-primary" role="button">Confirmer</a>
					</h3>
				</c:if>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
			</div>
		</div>

	</div>
</div>