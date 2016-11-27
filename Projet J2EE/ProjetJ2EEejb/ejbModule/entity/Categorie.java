package entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.*;

/**
 * Entity implementation class for Entity: Categorie
 *
 */
@Entity
@SequenceGenerator(name="PRIVATE_Categorie",allocationSize=1)
public class Categorie implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator="PRIVATE_Categorie")
	private int cat_id ;
	private String cat_nom;
	private String cat_type;
	private String cat_description;

    @OneToMany(mappedBy="categorie")
    private Collection<Article> articles ;
	private static final long serialVersionUID = 1L;
	
	
	public ArrayList<Article> getArticles() {
		return (ArrayList<Article>) articles;
	}


	public Categorie(String cat_nom, String cat_description,String cat_type) {
		super();
		this.cat_nom = cat_nom;
		this.cat_type = cat_type;
		this.cat_description = cat_description;
		articles = new ArrayList<Article>(); 
	}


	public String getCat_type() {
		return cat_type;
	}


	public void setCat_type(String cat_type) {
		this.cat_type = cat_type;
	}


	public void setArticles(ArrayList<Article> articles) {
		this.articles = articles;
	}


	public Categorie() {
		super();
	}


	public int getCat_id() {
		return cat_id;
	}


	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}


	public String getCat_nom() {
		return cat_nom;
	}


	public void setCat_nom(String cat_nom) {
		this.cat_nom = cat_nom;
	}


	public String getCat_description() {
		return cat_description;
	}


	public void setCat_description(String cat_description) {
		this.cat_description = cat_description;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
   
}
