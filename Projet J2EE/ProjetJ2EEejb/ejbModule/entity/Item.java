package entity;

import java.io.Serializable;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: Item
 *
 */
@Entity

public class Item implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int it_id;
	private int it_qte;
	private double it_totale;
	@ManyToOne
	private Article article;
	
	private static final long serialVersionUID = 1L;

	public Item() {
		super();
	}
	public Item(int it_id,int it_qte, double it_totale, Article article) {
		super();
		this.it_id=it_id;
		this.it_qte = it_qte;
		this.it_totale = it_totale;
		this.article = article;
	}
	
	
	public boolean equals(Object obj) {
		Item item = (Item)obj;		
		return this.it_id==item.it_id;
	}
	public int getIt_id() {
		return it_id;
	}
	public void setIt_id(int it_id) {
		this.it_id = it_id;
	}
	public int getIt_qte() {
		return it_qte;
	}
	public void setIt_qte(int it_qte) {
		this.it_qte = it_qte;
	}
	public double getIt_totale() {
		return it_totale;
	}
	public void setIt_totale(double it_totale) {
		this.it_totale = it_totale;
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
