package session;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.ejb.LocalBean;
import javax.ejb.Stateful;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import entity.Article;
import entity.Categorie;
import entity.Commande;
import entity.Item;
import entity.Utilisateur;

/**
 * Session Bean implementation class CommandeSession
 */
@Stateful
@LocalBean
public class CommandeSession implements CommandeSessionRemote, CommandeSessionLocal {
	@PersistenceContext(unitName = "ProjetJ2EEejb")
	private EntityManager em;

	Commande commande;

	public Commande getCommande() {
		return commande;
	}

	public void setCommande(Commande commande) {
		this.commande = commande;
	}

	public CommandeSession() {
		commande = new Commande();
	}

	public void addItem(int productId, int qte) {
		Article article = em.find(Article.class, productId);
		if (article != null) {
			double prix = 0;
			if (article.getA_remise() == 0) {
				prix = article.getA_prix() * qte;
			} else {
				prix = ((article.getA_prix() / 100) * (100 - article.getA_remise())) * qte;
			}
			// synchronized (commande.getitems()) {
			Iterator<Item> iter = commande.getitems().iterator();
			int size = commande.getitems().size();
			while (iter.hasNext()) {
				Item it = iter.next();

				if (it.getArticle().getA_id() == productId) {
					it.setIt_qte(it.getIt_qte() + qte);
					it.setIt_totale(it.getIt_totale() + prix);
				}
			}
			Iterator<Item> iter2 = commande.getitems().iterator();
			boolean test=true;
			while (iter2.hasNext()) {
				Item it = iter2.next();
				if (it.getArticle().getA_id() == productId) {
						test= false;
				}
				
			}
			if(test==true){
				Item item = new Item(size, qte, prix, article);
				System.out.println("HEllo1");
				this.commande.getitems().add(item);
				System.out.println("HEllo2");
			}

			// for(Item it : commande.getitems()){
			// if(it.getArticle().getA_id()==productId){
			// it.setIt_qte(it.getIt_qte()+qte);
			// it.setIt_totale(it.getIt_totale()+prix);
			// }
			// else{
			// Item item = new Item(commande.getitems().size(), qte, prix,
			// article);
			// this.commande.getitems().add(item);
			// }
			//
			// }
//			if (commande.getitems().size() == 0) {
//				Item item = new Item(commande.getitems().size(), qte, prix, article);
//				this.commande.getitems().add(item);
//			}

			// em.persist(item);

		}

	}

	@Override
	public void updateItem(int itemId, int qte) {
		double prix = 0;
		for (Item it : commande.getitems()) {
			if (it.getIt_id() == itemId) {
				it.setIt_qte(qte);
				if (it.getArticle().getA_remise() == 0) {
					prix = it.getArticle().getA_prix() * qte;
				} else {
					prix = ((it.getArticle().getA_prix() / 100) * (100 - it.getArticle().getA_remise())) * qte;
				}
				it.setIt_totale(prix);
				break;
			}
		}
	}

	@Override
	public void deleteItem(int itemId) {
		Iterator<Item> iter = commande.getitems().iterator();

		while (iter.hasNext()) {
			Item it = iter.next();

			if (it.getIt_id() == itemId)
				iter.remove();
		}
	}

	@Override
	public boolean confirmCommande(int u_id) {
		commande.setUtilisateur(em.find(Utilisateur.class, u_id));
		// verification quantité stock
		for (Item it : commande.getitems()) {
			if (it.getIt_qte() > it.getArticle().getA_qte()) {
				return false;
			}

		}
		// substitution qte article
		for (Item it : commande.getitems()) {
			it.getArticle().setA_qte(it.getArticle().getA_qte() - it.getIt_qte());
			Article article = new Article(it.getArticle().getA_nom(), it.getArticle().getA_description(),
					it.getArticle().getA_prix(), it.getArticle().getA_qte(), it.getArticle().getA_remise(),
					it.getArticle().getCategorie(), it.getArticle().getA_image());
			article.setA_id(it.getArticle().getA_id());
			em.merge(article);
		}

		this.commande.setCom_date(new Date());
		this.commande.setCom_prix(calculateTotale());
		System.out.println("avant persist");
		em.persist(commande);
		return true;
	}

	public double calculateTotale() {
		double totale = 0;
		for (Item item : this.commande.getitems()) {
			totale += item.getIt_totale();
		}
		return totale;
	}
	public int nbCommande() {
		int nb = ((Long)( em
				.createQuery("SELECT COUNT(*) FROM Commande").getSingleResult())).intValue();

		return nb;
	}


	@Override
	public void cancelCommande() {
		this.commande.getitems().clear();
	}

}
