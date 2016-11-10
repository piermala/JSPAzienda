package dao;

import hibernateUtil.HibernateUtil;
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
	
	
	
	/// CERCA CON USERNAME
	public boolean trovaUtenteConUsername(String username) {
		
		boolean trovato = false;
		
		Session session =HibernateUtil.openSession();
		Transaction tx=null;

		try{
			tx=session.getTransaction();
			tx.begin();
		
			Query query=session.createQuery("from UtenteBean where username=:username");
			query.setString("username", username);
			
			int result=(int)query.uniqueResult();
			
			if (result > 0){
				trovato = true;
			}
	
			tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		return trovato;
		
	}
	
	
	
	/// CERCA CON USERNAME 2
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
}
