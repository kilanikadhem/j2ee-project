package entity;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.*;

/** 
 * Entity implementation class for Entity: Article
 *
 */
@Entity
@SequenceGenerator(name="PRIVATE_Article",allocationSize=1)
public class Article implements Serializable {
	
	 @Id
	 @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="PRIVATE_Article")
	private int a_id ;
	private String a_nom;
	private String a_description;
	private String a_image;
	private double a_prix;
	private int a_qte;
	private int a_remise;
	//cle etrangere
	@ManyToOne
	private Categorie categorie;
	private static final long serialVersionUID = 1L;
 
	public Article() {
		super();
	}
    
	public Article(String a_nom, String a_description, double a_prix,
			int a_qte, int a_remise, Categorie categorie,String a_image) {
		super();
		this.a_nom = a_nom;
		this.a_image = a_image;
		this.a_description = a_description;
		this.a_prix = a_prix;
		this.a_qte = a_qte;
		this.a_remise = a_remise;
		this.categorie=categorie;
	}
	public String getA_image() {
		return a_image;
	}

	public void setA_image(String a_image) {
		this.a_image = a_image;
	}
	public Categorie getCategorie() {
		return categorie;
	}

	public void setCategorie(Categorie categorie) {
		this.categorie = categorie;
	}

	public int getA_id() {
		return a_id;
	}

	public void setA_id(int a_id) {
		this.a_id = a_id;
	}

	public String getA_nom() {
		return a_nom;
	}

	public void setA_nom(String a_nom) {
		this.a_nom = a_nom;
	}

	public String getA_description() {
		return a_description;
	}

	public void setA_description(String a_description) {
		this.a_description = a_description;
	}

	public double getA_prix() {
		return a_prix;
	}

	public void setA_prix(double a_prix) {
		this.a_prix = a_prix;
	}

	public int getA_qte() {
		return a_qte;
	}

	public void setA_qte(int a_qte) {
		this.a_qte = a_qte;
	}

	public int getA_remise() {
		return a_remise;
	}

	public void setA_remise(int a_remise) {
		this.a_remise = a_remise;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
   
}
