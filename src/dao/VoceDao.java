package dao;

import hibernateUtil.HibernateUtil;
import model.Rubrica;
import model.Voce;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.Query;

public class VoceDao {

	/// AGGIUNGI 
	public Voce aggiungiVoce(String nome, String cognome, String telefono, Rubrica r){
		Session session =HibernateUtil.openSession();
		Transaction tx=null;
		
		Voce v = null;

		try{
		tx=session.getTransaction();
		tx.begin();
		
		v = new Voce(nome,cognome,telefono, r);
		
		session.persist(v);
		 tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		return v;
	}
	
	
	
	/// LEGGI DA NOME E COGNOME
	public Voce cercaVoce(String nome, String cognome){
		Session session =HibernateUtil.openSession();
		Transaction tx=null;
		
		Voce v = null;

		try{
		tx=session.getTransaction();
		tx.begin();
		
		Query query = session.createQuery("from Voce where nome=:nome AND cognome=:cognome");
		query.setParameter("nome", nome);
		query.setParameter("cognome", cognome);
		
		v = (Voce) query.uniqueResult();
		
		 tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		return v;
	}
	
	
	
	/// LEGGI DA TELEFONO
	public Voce cercaTelefono(String telefono){
		Session session =HibernateUtil.openSession();
		Transaction tx=null;
		
		Voce v = null;

		try{
		tx=session.getTransaction();
		tx.begin();
		
		Query query = session.createQuery("from Voce where telefono=:telefono");
		query.setParameter("telefono", telefono);
		
		v = (Voce) query.uniqueResult();
		
		 tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		return v;
	}
	
	
	/// MODIFICA
	public boolean modificaVoce(Voce v){
		Session session =HibernateUtil.openSession();
		Transaction tx=null;
		
		boolean modificato = false;

		try{
		tx=session.getTransaction();
		tx.begin();
		
		/*Query query = session.createQuery("UPDATE VOCE SET nome=:nome1, cognome=:cognome1, telefono=:telefono1 WHERE nome=:nome2, cognome=:cognome2, telefono=:telefono2");
		query.setString("nome1", v1.getNome());
		query.setString("cognome1", v1.getCognome());
		query.setString("telefono1", v1.getTelefono());
		query.setString("nome2", v2.getNome());
		query.setString("cognome2", v2.getCognome());
		query.setString("telefono2", v2.getTelefono());
		
		query.uniqueResult();*/
		
		/*if (result > 1){
			modificato = true;
		}*/		
		session.update(v);
		modificato = true;
		
		 tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		return modificato;
	}
	
	
	/// ELIMINA
	public boolean eliminaVoce(Voce v){
		Session session =HibernateUtil.openSession();
		Transaction tx=null;
		
		boolean eliminato = false;

		try{
		tx=session.getTransaction();
		tx.begin();
		
		Query query = session.createQuery("delete from Voce where nome=:nome, cognome=:cognome, telefono=:telefono");
		query.setParameter("nome", v.getNome());
		query.setParameter("cognome", v.getCognome());
		query.setParameter("telefono", v.getTelefono());
		
		int result = query.executeUpdate();
		
		if (result > 0){
			eliminato = true;
		}
		
		 tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		return eliminato;
	}
	
}
