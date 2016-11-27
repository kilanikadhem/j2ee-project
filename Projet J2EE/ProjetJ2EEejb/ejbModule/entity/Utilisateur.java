package entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.*;

@Entity
@SequenceGenerator(name="PRIVATE_Utilisateur",allocationSize=1)
public class Utilisateur implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator="PRIVATE_Utilisateur")
	private int u_id;
	private String nom;
	private String prenom;
	private String mdp;
	private String ville;
	private String email;
	private String sexe;
	@Column(columnDefinition="tinyint(1) default 0")
	private boolean privilege;
	
	@OneToMany(mappedBy="utilisateur")
    private Collection<Commande> commandes ;
	private static final long serialVersionUID = 1L;

	public Utilisateur() {
		super();
	}

	public Collection<Commande> getCommandes() {
		return commandes;
	}

	public void setCommandes(Collection<Commande> commandes) {
		this.commandes = commandes;
	}
	
	public boolean isPrivilege() {
		return privilege;
	}

	public void setPrivilege(boolean privilege) {
		this.privilege = privilege;
	}

	public int getU_id() {
		return u_id;
	}
	public Utilisateur(String nom, String prenom, String mdp, String ville, String email, String sexe) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.mdp = mdp;
		this.ville = ville;
		this.email = email;
		this.sexe = sexe;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSexe() {
		return sexe;
	}

	public void setSexe(String sexe) {
		this.sexe = sexe;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getMdp() {
		return mdp;
	}

	public void setMdp(String mdp) {
		this.mdp = mdp;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
   
}
