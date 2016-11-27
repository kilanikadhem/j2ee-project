package session;

import java.util.ArrayList;

import javax.ejb.Local;

import entity.Categorie;

@Local
public interface CategorieSessionLocal {
	public Categorie findCategorieById(int cat_id);
	public void createCategorie(String cat_nom, String cat_description, String cat_type);
	public void updateCategorie(int categorieId, String cat_nom, String cat_description, String cat_type);
	public boolean deleteCategorie(int categorieId);
	public ArrayList<Categorie> listCategorie();
}
