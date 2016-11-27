package com.essthspower.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import entity.Article;
import entity.Categorie;
import entity.Item;
import entity.Utilisateur;
import session.ArticleSession;
import session.CategorieSession;
import session.CommandeSession;
import session.UtilisateurSession;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB

@WebServlet(urlPatterns = { "/index", "/modifier", "/supprimer", "/afficher", "/redirection", "/inscription",
		"/supprimerItem", "/modifierArticle", "/modifierArticle2", "/supprimerCategorie", "/supprimerArticle",
		"/connexion", "/recherche", "/confirmerCommande", "/modifierPanier", "/ajouterPanier", "/ajoutArticle",
		"/promotion", "/admin","/modifierCategorie2", "/modifierCategorie", "/deconnexion", "UploadServlet", "/ajoutCategorie" })
public class EssthsServlet extends HttpServlet {
	private static final String SAVE_DIR = "imagesProduits";
	private static final long serialVersionUID = 1L;

	public EssthsServlet() {
		super();

	}

	@EJB
	private UtilisateurSession utilisateur;
	@EJB
	private CategorieSession categorie;
	@EJB
	private ArticleSession article;
	@EJB
	private CommandeSession commande;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		RequestDispatcher nextPage = null;
		System.out.println(request.getRequestURL());
		if (path.endsWith("/inscription")) {
			nextPage = inscription(request, response);
		} else if (path.endsWith("/connexion")) {
			nextPage = connexion(request, response);
		} else if (path.endsWith("/deconnexion")) {
			nextPage = this.getServletContext().getRequestDispatcher("/index.jsp");
			commande.cancelCommande();
			request.getSession().invalidate();
		} else if (path.endsWith("/ajoutCategorie")) {
			this.getServletContext().setAttribute("categories", categorie.listCategorie());
			System.out.println(categorie.listCategorie().toString());
			nextPage = ajouterCategorie(request, response);
		} else if (path.endsWith("/redirection")) {

			nextPage = this.getServletContext().getRequestDispatcher("/index.jsp");

		} else if (path.endsWith("/index")) {

			request.setAttribute("listeArticles", article.listAllArticle());
			nextPage = this.getServletContext().getRequestDispatcher("/index.jsp");

		} else if (path.endsWith("/afficher")) {

			if (request.getParameter("catid") != null) {
				int cat_id = Integer.parseInt(request.getParameter("catid"));
				request.setAttribute("listeArticles", article.listArticleByCat_Id(cat_id));

			} else
				request.setAttribute("listeArticles", article.listAllArticle());

			nextPage = this.getServletContext().getRequestDispatcher("/afficher.jsp");

		} else if (path.endsWith("/supprimer")) {

			if (request.getParameter("catid") != null) {
				int cat_id = Integer.parseInt(request.getParameter("catid"));
				request.setAttribute("listeArticles", article.listArticleByCat_Id(cat_id));

			} else {
				request.setAttribute("test", "tout");
				request.setAttribute("listeArticles", article.listAllArticle());
			}
			nextPage = this.getServletContext().getRequestDispatcher("/supprimer.jsp");

		} else if (path.endsWith("/modifier")) {
			if (request.getParameter("catid") != null) {
				int cat_id = Integer.parseInt(request.getParameter("catid"));
				request.setAttribute("listeArticles", article.listArticleByCat_Id(cat_id));

			} else {
				request.setAttribute("listeArticles", article.listAllArticle());
				request.setAttribute("test", "tout");
			}

			nextPage = this.getServletContext().getRequestDispatcher("/modifier.jsp");

		} else if (path.endsWith("/recherche")) {
			String recherche = request.getParameter("recherche");
			request.setAttribute("listeArticles", article.findArticle(recherche));
			nextPage = this.getServletContext().getRequestDispatcher("/afficher.jsp");

		} else if (path.endsWith("/promotion")) {
			request.setAttribute("listeArticles", article.findArticleRemise());
			nextPage = this.getServletContext().getRequestDispatcher("/afficher.jsp");

		} else if (path.endsWith("/supprimerArticle")) {
			int a_id = Integer.parseInt(request.getParameter("a_id"));
			boolean test = article.deleteArticle(a_id);
			request.setAttribute("testSuppArticle", test);
			nextPage = this.getServletContext().getRequestDispatcher("/supprimer");

		} else if (path.endsWith("/supprimerCategorie")) {
			int cat_id = Integer.parseInt(request.getParameter("catid"));
			boolean test = categorie.deleteCategorie(cat_id);
			this.getServletContext().setAttribute("categories", categorie.listCategorie());
			request.setAttribute("testSupp", test);
			nextPage = this.getServletContext().getRequestDispatcher("/supprimer");

		} else if (path.endsWith("/modifierArticle")) {
			int a_id = Integer.parseInt(request.getParameter("a_id"));
			Article art = article.findArticleById(a_id);
			request.setAttribute("article", art);
			nextPage = this.getServletContext().getRequestDispatcher("/modifierArticle.jsp");

		} else if (path.endsWith("/modifierCategorie")) {
			int cat_id = Integer.parseInt(request.getParameter("cat_id"));
			Categorie cat = categorie.findCategorieById(cat_id);
			request.setAttribute("categorie", cat);
			nextPage = this.getServletContext().getRequestDispatcher("/modifierCategorie.jsp");

		} else if (path.endsWith("/modifierCategorie2")) {
			String nom = request.getParameter("cat_nom");
			String type = request.getParameter("cat_type");
			String description = request.getParameter("cat_description");
			int cat = Integer.parseInt(request.getParameter("cat_id"));
			categorie.updateCategorie(cat, nom, description, type);
			this.getServletContext().setAttribute("categories", categorie.listCategorie());
			nextPage = this.getServletContext().getRequestDispatcher("/modifier");

		} else if (path.endsWith("/ajouterPanier")) {
			int qte = Integer.parseInt(request.getParameter("qte"));
			int a_id = Integer.parseInt(request.getParameter("a_id"));
			commande.addItem(a_id, qte);
			HttpSession session = request.getSession();
			session.setAttribute("panier", commande.getCommande().getitems());
			session.setAttribute("totaleCommande", commande.calculateTotale());
			nextPage = this.getServletContext().getRequestDispatcher("/index");

		} else if (path.endsWith("/modifierPanier")) {
			int qte = Integer.parseInt(request.getParameter("it_qte"));
			int it_id = Integer.parseInt(request.getParameter("it_id"));
			commande.updateItem(it_id, qte);
			HttpSession session = request.getSession();
			session.setAttribute("panier", commande.getCommande().getitems());
			session.setAttribute("totaleCommande", commande.calculateTotale());
			request.setAttribute("modification", "vrai");
			System.out.println(request.getAttribute("modification"));
			nextPage = this.getServletContext().getRequestDispatcher("/index");

		} else if (path.endsWith("/confirmerCommande")) {
			HttpSession session = request.getSession();
			Utilisateur u = (Utilisateur) session.getAttribute("utilisateur");
			// pour persist ( ta8fiss style )
			for (Item item : commande.getCommande().getitems()) {
				item.setIt_id(0);
			}
			if(commande.confirmCommande(u.getU_id())){
				request.setAttribute("commande", "confirmer");
				commande.cancelCommande(); // vider la liste
			}
			else request.setAttribute("commande", "refuser");	
			session.setAttribute("panier", commande.getCommande().getitems());
			nextPage = this.getServletContext().getRequestDispatcher("/index");

		} else if (path.endsWith("/supprimerItem")) {
			HttpSession session = request.getSession();
			int itemId = Integer.parseInt(request.getParameter("it_id"));
			commande.deleteItem(itemId);
			session.setAttribute("panier", commande.getCommande().getitems());
			request.setAttribute("commande", "supprimer");
			nextPage = this.getServletContext().getRequestDispatcher("/index");

		}
		else if (path.endsWith("/admin")) {
			request.setAttribute("nbCommande", commande.nbCommande());
			nextPage = this.getServletContext().getRequestDispatcher("/admin.jsp");

		}

		nextPage.forward(request, response);
	}

	// ********************************************************************************************
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		RequestDispatcher nextPage = null;

		if (path.endsWith("/ajoutArticle")) {
			nextPage = ajoutArticle(request, response);
		}
		if (path.endsWith("/modifierArticle2")) {
			nextPage = modifierArticle(request, response);
		}

		nextPage.forward(request, response);
	}

	private RequestDispatcher ajouterCategorie(HttpServletRequest request, HttpServletResponse response) {
		String nom = request.getParameter("nom");
		String description = request.getParameter("description");
		String type = request.getParameter("type");
		categorie.createCategorie(nom, description, type);
		request.setAttribute("testAjoutCategorie", true);
		this.getServletContext().setAttribute("categories", categorie.listCategorie());
		return this.getServletContext().getRequestDispatcher("/ajouter.jsp");

	}

	public RequestDispatcher inscription(HttpServletRequest request, HttpServletResponse response) {
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String ville = request.getParameter("ville");
		String email = request.getParameter("email");
		String sexe = request.getParameter("sexe");
		String mdp = request.getParameter("mdp");
		utilisateur.createUtilisateur(nom, prenom, mdp, ville, email, sexe);
		return this.getServletContext().getRequestDispatcher("/index.jsp");
	}

	public RequestDispatcher connexion(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String mdp = request.getParameter("mdp");
		Utilisateur u1 = utilisateur.connect(email, mdp);
		if (u1 != null) {
			HttpSession session = request.getSession();
			session.setAttribute("utilisateur", u1);
			System.out.println("Connexion réussite !!");
			if (u1.isPrivilege()) {
				return this.getServletContext().getRequestDispatcher("/admin");
			} else
				return this.getServletContext().getRequestDispatcher("/index.jsp");
		} else
			return this.getServletContext().getRequestDispatcher("/erreur.jsp");

	}

	public RequestDispatcher ajoutArticle(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String nom = request.getParameter("nom");
		int cat = Integer.parseInt(request.getParameter("cat"));
		double prix = Double.parseDouble(request.getParameter("prix"));
		int qte = Integer.parseInt(request.getParameter("qte"));
		int remise = Integer.parseInt(request.getParameter("remise"));
		String description = request.getParameter("description");
		// Upload image
		String appPath = request.getServletContext().getRealPath("");
		String savePath = appPath + File.separator + SAVE_DIR;
		// creé dossier s'il n'existe pas
		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		Part part = request.getPart("file");
		String fileName = part.getSubmittedFileName();
		part.write(savePath + File.separator + fileName);
		System.out.println(savePath + File.separator + fileName);

		article.createArticle(nom, description, prix, qte, remise, cat, fileName);
		request.setAttribute("testAjoutArticle", true);
		return this.getServletContext().getRequestDispatcher("/ajouter.jsp");
	}

	public RequestDispatcher modifierArticle(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String nom = request.getParameter("nom");
		int cat = Integer.parseInt(request.getParameter("cat"));
		double prix = Double.parseDouble(request.getParameter("prix"));
		int qte = Integer.parseInt(request.getParameter("qte"));
		int remise = Integer.parseInt(request.getParameter("remise"));
		String description = request.getParameter("description");
		// Upload image
		Part part = request.getPart("file");
		String nomFichier = part.getSubmittedFileName();
		if (nomFichier != null && !nomFichier.isEmpty()) {
			String appPath = request.getServletContext().getRealPath("");
			String savePath = appPath + File.separator + SAVE_DIR;
			// creé dossier s'il n'existe pas
			File fileSaveDir = new File(savePath);
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdir();
			}

			part.write(savePath + File.separator + nomFichier);
		} else
			nomFichier = "";
		int a_id = Integer.parseInt(request.getParameter("a_id"));
		article.updateArticle(a_id, nom, description, prix, qte, remise, cat, nomFichier);

		return this.getServletContext().getRequestDispatcher("/modifier.jsp");
	}

	public void init() {
		this.getServletContext().setAttribute("categories", categorie.listCategorie());
		// System.out.println(this.getServletContext().getAttribute("categories"));
	}
}