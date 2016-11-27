package session;

import java.util.ArrayList;

import javax.ejb.Remote;

import entity.Categorie;

@Remote
public interface CategorieSessionRemote {
	public Categorie findCategorieById(int cat_id);
	public void createCategorie(String cat_nom, String cat_description, String cat_type);
	public void updateCategorie(int categorieId, String cat_nom, String cat_description, String cat_type);
	public boolean deleteCategorie(int categorieId);
	public ArrayList<Categorie> listCategorie();

}
