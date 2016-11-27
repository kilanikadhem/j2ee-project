package session;

import javax.ejb.Remote;

@Remote
public interface CommandeSessionRemote {
	void addItem(int productId, int qte);
	void updateItem(int itemId, int qte);
	void deleteItem(int itemId);
	public double calculateTotale();
	boolean confirmCommande(int u_id);
	void cancelCommande();
}
