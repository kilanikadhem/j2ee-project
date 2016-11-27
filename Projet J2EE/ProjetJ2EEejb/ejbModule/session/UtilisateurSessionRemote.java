package session;

import javax.ejb.Remote;

import entity.Utilisateur;

@Remote
public interface UtilisateurSessionRemote {
	public Utilisateur createUtilisateur(String nom, String prenom, String mdp, String ville, String email,
			String sexe);
	public Utilisateur updateUtilisateur(int u_id, String nom, String prenom, String mdp, String ville, String email,
			String sexe);
	public Utilisateur connect(String email, String mdp);
}
