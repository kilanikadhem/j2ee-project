<!-- Modal -->
<div id="modifyModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Modifier Produit</h4>
			</div>
			<div class="modal-body">

				<!-- Fromulaire -->

				<form action="uploadServlet" method="post"
					enctype="multipart/form-data" class="form-horizontal" role="form">
					<div class="form-group">
						<label class="control-label col-sm-3" for="nom">Nom:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="nom"
								placeholder="Entrer nom">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="prix">Prix:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="prix"
								placeholder="Entrer Prix">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="qte">Quantite:</label>
						<div class="col-sm-9">
							<input type="email" class="form-control" id="email"
								placeholder="Entrer Quantite">
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
						<label class="control-label col-sm-3" for="cat">Categorie
							: </label>
						<div class="col-sm-9">
							<select id="cat" class="form-control">
								<option>Proteine</option>
								<option>Creatine</option>
								<option>L-canitine</option>
								<option>Energie</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="uploadimage">Choisissez
							l'image</label>
						<div class="col-sm-9">
							<input id="uploadimage" type="file" class="btn">
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