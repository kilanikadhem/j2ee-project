package entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

/**
 * Entity implementation class for Entity: Commande
 *
 */
@Entity

public class Commande implements Serializable {
	@OneToMany(cascade = {CascadeType.ALL})
    private Collection<Item> items ;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int com_id;
	
	private double com_prix;
	private Date com_date;
	@ManyToOne
	Utilisateur utilisateur;
	
	
	private static final long serialVersionUID = 1L;

	public Commande() {
	
		items = new ArrayList<Item>();
	}

	public Collection<Item> getitems() {
		return items;
	} 

	public Collection<Item> getItems() {
		return items;
	}

	public void setItems(Collection<Item> items) {
		this.items = items;
	}

	public Utilisateur getUtilisateur() {
		return utilisateur;
	}

	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
	}

	public void setitems(ArrayList<Item> items) {
		this.items = items;
	}

	public int getCom_id() {
		return com_id;
	}

	public void setCom_id(int com_id) {
		this.com_id = com_id;
	}

	public double getCom_prix() {
		return com_prix;
	}

	public void setCom_prix(double com_prix) {
		this.com_prix = com_prix;
	}

	public Date getCom_date() {
		return com_date;
	}

	public void setCom_date(Date com_date) {
		this.com_date = com_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
   
}
