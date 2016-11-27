package session;

import java.util.ArrayList;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import entity.Article;
import entity.Categorie;

/**
 * Session Bean implementation class CategorieSession
 */
@Stateless
@LocalBean
public class CategorieSession implements CategorieSessionRemote, CategorieSessionLocal {

	@PersistenceContext(unitName="ProjetJ2EEejb")
	private EntityManager em;
	
    public CategorieSession() {
       
    }
    
    public Categorie findCategorieById(int cat_id){
    	return em.find(Categorie.class, cat_id);
    }
    
    public void createCategorie(String cat_nom, String cat_description, String cat_type){
    	Categorie categorie = new Categorie(cat_nom,cat_description,cat_type);
    	em.persist(categorie);
    }
    
    public void updateCategorie(int categorieId, String cat_nom, String cat_description, String cat_type){
    	Categorie categorie = em.find(Categorie.class, categorieId);
		if (categorie!= null) {
			categorie.setCat_description(cat_description);
			categorie.setCat_nom(cat_nom);
			categorie.setCat_type(cat_type);
			em.persist(categorie);
		}
    }
    
    public boolean deleteCategorie(int categorieId){
    	ArrayList<Article> articles = (ArrayList<Article>) em
				.createQuery("SELECT a FROM Article a WHERE a.categorie.cat_id = :cat_id")
				.setParameter("cat_id", categorieId).getResultList();
    	if (articles.size()==0){
    		Categorie categorie = em.find(Categorie.class, categorieId);
    		System.out.println(categorie.getCat_nom());
        	em.remove(categorie);
        	return true;
    	}
    	
    	else return false;
    }
    
    public ArrayList<Categorie> listCategorie(){
    	ArrayList<Categorie> categories = (ArrayList<Categorie>) em
				.createQuery("SELECT c FROM Categorie c").getResultList();
		return categories;
    }
}
