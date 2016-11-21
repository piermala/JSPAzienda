package servizi;

import java.util.ArrayList;
import java.util.List;
import utility.ConvertiPassword;
import model.AdminBean;
import model.BustaPaga;
import model.UtenteBean;
import model.ClienteBean;
import model.DipendenteBean;
import dao.AdminDao;
import dao.BustaDao;
import dao.ClienteDao;
import dao.DipendenteDao;
import dao.RubricaDao;
import dao.UtenteDao;

public class Servizi {

	private UtenteDao uDao = new UtenteDao();
	private AdminDao aDao = new AdminDao();
	private ClienteDao cDao = new ClienteDao();
	private DipendenteDao dDao = new DipendenteDao();
	private BustaDao bDao = new BustaDao();
	
	
	
	/// AGGIUNGI UTENTE
	public UtenteBean createUtente(String nome, String cognome, String username, String password, char ruolo)
	{
		UtenteBean utente = uDao.createUtente(nome, cognome, username, password, ruolo);
		
		return utente;	
	}
	
		
	/// CERCA CON USERNAME
	public UtenteBean cercaConUsername(String username) {
			
		UtenteBean u = null;
		u = uDao.cercaConUsername(username);
			
		return u;		
	}	
	
	/// CERCA UTENTE CON ID
	public UtenteBean cercaUtenteConId(long id) {
		
		UtenteBean u = null;
		u = uDao.trovaUtenteConId(id);
			
		return u;		
	}	
	
	
	/// ELIMINA UTENTE DA ID	
	public void eliminaUtenteById(long id) {

		UtenteBean u = cercaUtenteConId(id);

		uDao.eliminaUtente(u);
	}

	
	
	/// AGGIUNGI ADMIN
	public AdminBean createAdmin(String nome, String cognome, String username, String password, String livelloAccesso)
	{
		AdminBean admin = aDao.createAdmin(nome, cognome, username, password, livelloAccesso);
			
		return admin;	
	}
		
		
		
	/// CERCA CON USERNAME
	public AdminBean trovaAdminConUsername(String username) {
			
		AdminBean admin = null;
		admin = aDao.trovaAdminConUsername(username);
			
		return admin;			
	}
		
		
	
	/// AGGIUNGI CLIENTE
	public ClienteBean createCliente(String nome, String cognome, String username, String password, String partitaIVA, String ragioneSociale)
	{
			ClienteBean cliente = cDao.createCliente(nome, cognome, username, password, partitaIVA, ragioneSociale);
			
			return cliente;	
	}
		
		
		
	/// CERCA CON USERNAME
	public ClienteBean trovaClienteConUsername(String username) {
			
		ClienteBean cliente = null;
		cliente = cDao.trovaClienteConUsername(username);
			
		return cliente;
			
	}
	
	
	/// TUTTI I CLIENTI
	public List<ClienteBean> getTuttiClienti(){
		List<ClienteBean> clienti = null;
		clienti = cDao.leggiTuttiClienti();
		
		return clienti;
		
	}
	
	
	/// MODIFICA DIPENDENTE
	public void modificaCliente(ClienteBean c) {
		cDao.modificaCliente(c);
	}

	
	/// ELIMINA DIPENDENTE
	public void eliminaCliente(ClienteBean c) {
		cDao.eliminaDipendente(c);
	}
		
		
	
	
	/// AGGIUNGI DIPENDENTE
	public DipendenteBean createDipendente(String nome, String cognome, String username, String password, String posizione, double stipendio)
	{
		DipendenteBean dipendente = dDao.createDipendente(nome, cognome, username, password, posizione, stipendio);
			
		return dipendente;	
		
	}
		
		
		
	/// CERCA CON USERNAME
	public DipendenteBean trovaDipendenteConUsername(String username) {
			
		DipendenteBean dipendente = null;
		dipendente = dDao.trovaDipendenteConUsername(username);
			
		return dipendente;	
		
	}
	
	
	
	/// GET DIPENDENTE DA ID
	public DipendenteBean getDipendenteConId(long id){
		
		DipendenteBean dipendente = null;
		dipendente = dDao.getDipendenteDaId(id);
		
		return dipendente;
	}
	
	
	
	/// TUTTI I DIPENDENTI
	public List<DipendenteBean> getTuttiDipendenti(){
		List<DipendenteBean> dipendenti = null;
		dipendenti = dDao.leggiTuttiDipendenti();
		
		return dipendenti;
	}
	
	
	
	/// MODIFICA DIPENDENTE
	public void modificaDipendente(DipendenteBean d){
		dDao.modificaDipendente(d);
	}
	
	/// ELIMINA DIPENDENTE
	public void eliminaDipendente(DipendenteBean d){
		dDao.eliminaDipendente(d);
	}
	
	
	/// CREA BUSTA PAGA
	public void creaBustaPaga(BustaPaga bp){
		bDao.aggiungiBustaPaga(bp);
	}
	
	
	/// LEGGI BUSTA PAGA DA ID
	public BustaPaga leggiBustaPagaDaId(long id){
		BustaPaga bp = null;
		bp = bDao.getBustaPaga(id);
		
		return bp;
	}
	
	/// LEGGI TUTTE LE BUSTE PAGA
	public List<BustaPaga> leggiTutteBustePaga(){
		
		List<BustaPaga> bustePaga = new ArrayList<BustaPaga>();
		bustePaga = bDao.getBustePaga();
		
		return bustePaga;		
	}
	
	
	/// LEGGI TUTTE LE BUSTE PAGA
	public List<BustaPaga> leggiBustePagaDaId(long id) {

		List<BustaPaga> bustePaga = new ArrayList<BustaPaga>();
		bustePaga = bDao.getBustePagaDaId(id);

		return bustePaga;

	}
	
	 
	/// MODIFICA BUSTA PAGA
	public void modificaBustaPaga(BustaPaga bPaga){
		bDao.modificaBustaPaga(bPaga);
	}
	
	
	/// ELIMINA BUSTA PAGA
	public void eliminaBustaPaga(BustaPaga bPaga){
		bDao.eliminaBustaPaga(bPaga);
	}
	
	
	
	
	/// CODIFICA PASSWORD
	public String codificaPassword(String password){
		String pass = ConvertiPassword.codificatePass(password);
		return pass;		
	}
	
}
