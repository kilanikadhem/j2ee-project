<!-- Modal -->
<div id="modifyCatModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Modifier Produit</h4>
			</div>
			<div class="modal-body">

				<!-- Fromulaire -->
				<form action="" method="post" class="form-horizontal" role="form">
					<div class="form-group">
						<label class="control-label col-sm-3" for="nom">Nom:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="nom"
								placeholder="Entrer nom Categorie">
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-3" for="description">Description:</label>
						<div class="col-sm-9">
							<textarea class="form-control" rows="3" id="description"
								placeholder="Entrer Description"></textarea>

						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-9">
							<button type="submit" class="btn btn-danger">Modifier</button>
						</div>
					</div>
				</form>
				<!-- Fin Fromulaire -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
			</div>
		</div>

	</div>
</div>