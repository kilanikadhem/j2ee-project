
<!-- Modal -->
<div id="login-modal" class="modal fade" role="dialog" >
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Connectez-vous</h4>
      </div>
      <div class="modal-body">

		<!-- Fromulaire -->
			<form method="get" action="connexion" class="form-horizontal" role="form">
				<div class="form-group">
				  <label class="control-label col-sm-3" for="email">Email:</label>
				  <div class="col-sm-9">
					<input type="email" class="form-control" name="email" id="email" placeholder="Entrer email">
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-3" for="pwd">Mot de passe:</label>
				  <div class="col-sm-9">          
					<input type="password" class="form-control" name="mdp" id="mdp" placeholder="Entrer Mot de passe">
				  </div>
				</div>
				<div class="form-group">        
				  <div class="col-sm-offset-3 col-sm-9">
					<div class="checkbox">
					  <label><input type="checkbox"> Rester connecté(e)</label>
					</div>
				  </div>
				</div>
				<div class="form-group">        
				  <div class="col-sm-offset-3 col-sm-10">
					<button type="submit" class="btn btn-danger">Envoyer</button>
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
