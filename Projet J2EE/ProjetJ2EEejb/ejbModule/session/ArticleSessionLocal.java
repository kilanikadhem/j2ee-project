package session;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.Local;

import entity.Article;
import entity.Categorie;

@Local
public interface ArticleSessionLocal {
	public Article createArticle(String a_nom, String a_description, double a_prix,
			int a_qte, int a_remise,int cat_ide,String a_image);
	public Article  updateArticle(int a_id, String a_nom, String a_description, double a_prix,
			int a_qte, int a_remise,int cat_id,String a_image);
	public List<Article>findArticle(String chaine);
	public boolean deleteArticle(int a_id);
	public ArrayList<Article> listArticleByCat_Id(int cat_id);

}
