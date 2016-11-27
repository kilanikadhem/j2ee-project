package session;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import entity.Article;
import entity.Categorie;

/**
 * Session Bean implementation class ArticleSession
 */
@Stateless
@LocalBean
public class ArticleSession implements ArticleSessionRemote, ArticleSessionLocal {

	/**
	 * Default constructor.
	 */
	@PersistenceContext(unitName = "ProjetJ2EEejb")
	private EntityManager em;

	public ArticleSession() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Article createArticle(String a_nom, String a_description, double a_prix, int a_qte, int a_remise, int cat_id,
			String a_image) {
		Categorie categorie = em.find(Categorie.class, cat_id);
		Article article = new Article(a_nom, a_description, a_prix, a_qte, a_remise, categorie, a_image);
		em.persist(article);
		return article;
	}

	@Override
	public Article updateArticle(int a_id, String a_nom, String a_description, double a_prix, int a_qte, int a_remise,
			int cat_id, String a_image) {
		Categorie categorie = em.find(Categorie.class, cat_id);
		Article article = em.find(Article.class, a_id);
		if (article != null) {
			article.setA_description(a_description);
			article.setA_nom(a_nom);
			article.setA_prix(a_prix);
			article.setA_remise(a_remise);
			article.setA_qte(a_qte);
			article.setCategorie(categorie);
			if(a_image !="") article.setA_image(a_image);
			em.merge(article);
		}
		return article;
	}

	@Override
	public ArrayList<Article> findArticle(String chaine) {
		// recherche Article par nom
		ArrayList<Article> articles = (ArrayList<Article>) em
				.createQuery("SELECT a FROM Article a WHERE a.a_nom LIKE CONCAT('%',:a_nom,'%')")
				.setParameter("a_nom", chaine).getResultList();
		// recherche Article par description
		articles.addAll(
				(ArrayList<Article>) em
						.createQuery(
								"SELECT a FROM Article a WHERE a.a_description LIKE CONCAT('%',:a_description,'%')")
						.setParameter("a_description", chaine).getResultList());
		return articles;
	}

	@Override
	public ArrayList<Article> listArticleByCat_Id(int cat_id) {

		ArrayList<Article> articles = (ArrayList<Article>) em
				.createQuery("SELECT a FROM Article a WHERE a.categorie.cat_id = :cat_id")
				.setParameter("cat_id", cat_id).getResultList();
		return articles;
	}

	public ArrayList<Article> listAllArticle() {

		ArrayList<Article> articles = (ArrayList<Article>) em.createQuery("SELECT a FROM Article a")
				.getResultList();
		return articles;
	}

	@Override
	public boolean deleteArticle(int a_id) {
		// TODO Auto-generated method stub
		Article article = em.find(Article.class, a_id);
		if(article != null){
		em.remove(article);
		return true;
		}
		else return false;
	}
	public Article findArticleById(int a_id) {
		// TODO Auto-generated method stub
		Article article = em.find(Article.class, a_id);
		return article;
	}
	public ArrayList<Article> findArticleRemise() {
		// TODO Auto-generated method stub
		ArrayList<Article> articles = (ArrayList<Article>) em
				.createQuery("SELECT a FROM Article a WHERE a.a_remise > 0 ")
				.getResultList();
		return articles;
	}
}
