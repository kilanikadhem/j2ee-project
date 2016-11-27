<!-- Modal -->
<div id="signinModal" class="modal fade" role="dialog" >
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Nouveau Compte</h4>
      </div>
      <div class="modal-body">

		<!-- Fromulaire -->

			<form method="get" action="inscription" class="form-horizontal" role="form">
				<div class="form-group">
				  <label class="control-label col-sm-3" for="nom">Nom:</label>
				  <div class="col-sm-9">
					<input type="text" class="form-control" name="nom" id="nom" placeholder="Entrer nom">
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-3" for="prenom">Prenom:</label>
				  <div class="col-sm-9">
					<input type="text" class="form-control" name="prenom" id="prenom" placeholder="Entrer prenom">
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-3" for="email">Email:</label>
				  <div class="col-sm-9">
					<input type="email" class="form-control" id="email" name="email" placeholder="Entrer email">
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-3" for="pwd">Mot de passe:</label>
				  <div class="col-sm-9">          
					<input type="password" class="form-control" name="mdp" id="pwd" placeholder="Entrer Mot de passe">
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-3" for="ville">Ville : </label>
				  <div class="col-sm-9"> 
					  <select id="ville"  name="ville" class="form-control">
						<option>Sousse</option>
						<option>Tunis</option>
						<option>Sfax</option>
						<option>Kairouan</option>
						<option>Gabès</option>
						<option>Bizerte</option>
						<option>Gafsa</option>
						<option>Ariana</option>
						<option>Kasserine</option>
						<option>Ben Arous</option>
						<option>Monastir</option>
						<option>Madenin</option>
						<option>Tataouine</option>
						<option>Béja</option>
						<option>Nabeul</option>
						<option>Mahdia</option>
						<option>Kef</option>
						<option>Jandouba</option>
						<option>Sidi Bouzid</option>
						<option>Tozeur</option>
						<option>Mannouba</option>
						<option>Siliana</option>
						<option>Zagouhan</option>
					  </select>
				  </div>
				</div>
				<div class="form-group">
					<label  class="control-label col-sm-3" for="sexe">Sexe : </label>
					<div class="col-sm-9">
						<label for="masculin" class="radio-inline"><input id="masculin" type="radio" name="sexe" value="Masculin">Masculin</label>
						<label for="feminin" class="radio-inline"><input id="feminin" type="radio" name="sexe" value="Feminin">Feminin</label>
					</div>
				</div>
				<div class="form-group">        
				  <div class="col-sm-offset-3 col-sm-9">
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