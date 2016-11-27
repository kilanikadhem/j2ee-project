package session;

import javax.ejb.Local;

import entity.Utilisateur;

@Local
public interface UtilisateurSessionLocal {

	public Utilisateur createUtilisateur(String nom, String prenom, String mdp, String ville, String email,
			String sexe);
	public Utilisateur updateUtilisateur(int u_id, String nom, String prenom, String mdp, String ville, String email,
			String sexe);
	public Utilisateur connect(String email, String mdp);
	
	
}
 