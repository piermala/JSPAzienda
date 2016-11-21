package dao;

import hibernateUtil.HibernateUtil;
import model.DipendenteBean;
import model.UtenteBean;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class UtenteDao {

	
	/// AGGIUNGI
	public UtenteBean createUtente(String nome, String cognome, String username, String password, char ruolo)
	{
		UtenteBean utente = null;
		
		Session session =HibernateUtil.openSession();
		Transaction tx=null;

		try{
		tx=session.getTransaction();
		tx.begin();
		
		utente = new UtenteBean(nome, cognome, username, password, ruolo);
		session.persist(utente);
		
		tx.commit();
		
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		
		return utente;	
	}
	
	
	
	/// CERCA CON ID
	public UtenteBean trovaUtenteConId(long id) {
		
		UtenteBean u = null;
		
		Session session =HibernateUtil.openSession();
		Transaction tx=null;

		try{
			tx=session.getTransaction();
			tx.begin();
		
			Query query=session.createQuery("from UtenteBean where idUtente=:id");
			query.setLong("id", id);
			
			u =(UtenteBean)query.uniqueResult();
			
			tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		return u;
		
	}
	
	
	
	/// CERCA CON USERNAME 
	public UtenteBean cercaConUsername(String username) {
		
		UtenteBean u = null;
		
		Session session =HibernateUtil.openSession();
		Transaction tx=null;

		try{
			tx=session.getTransaction();
			tx.begin();
		
			Query query=session.createQuery("from UtenteBean where username=:username");
			query.setString("username", username);
			
			u =(UtenteBean)query.uniqueResult();
	
			tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		return u;		
	}
	
	
	
	/// ELIMINA UTENTE
	public void eliminaUtente(UtenteBean u) {

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			session.delete(u);
			
			tx.commit();

		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
	}
}
