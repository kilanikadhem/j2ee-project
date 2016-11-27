package session;

import java.util.ArrayList;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import entity.Article;
import entity.Utilisateur;

/**
 * Session Bean implementation class UtilisateurSession
 */
@Stateless
@LocalBean
public class UtilisateurSession implements UtilisateurSessionRemote, UtilisateurSessionLocal {
	@PersistenceContext(unitName = "ProjetJ2EEejb")
	private EntityManager em;

	public UtilisateurSession() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Utilisateur createUtilisateur(String nom, String prenom, String mdp, String ville, String email,
			String sexe) {
		Utilisateur utilisateur = new Utilisateur(nom, prenom, mdp, ville, email, sexe);
		em.persist(utilisateur);
		return utilisateur;
	}

	@Override
	public Utilisateur updateUtilisateur(int u_id, String nom, String prenom, String mdp, String ville,String email,
			String sexe) {
		Utilisateur utilisateur = em.find(Utilisateur.class, u_id);
		if (utilisateur != null) {
			utilisateur.setMdp(mdp);
			utilisateur.setNom(nom);
			utilisateur.setPrenom(prenom);
			utilisateur.setVille(ville);
			utilisateur.setSexe(sexe);
			utilisateur.setEmail(email);
			em.merge(utilisateur);
		}
		return utilisateur;
	}

	@Override
	public Utilisateur connect(String email, String mdp) {
		ArrayList<Utilisateur> listeUtilisateur;
		listeUtilisateur= (ArrayList<Utilisateur>) em.createQuery("SELECT u FROM Utilisateur u where u.email = :value1 AND u.mdp = :value2")
				.setParameter("value1", email).setParameter("value2", mdp).getResultList();
		if(listeUtilisateur.size() == 1){
			return listeUtilisateur.get(0);
			
		}else return null;
	}

}
