package dao;

import hibernateUtil.HibernateUtil;
import model.Rubrica;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class RubricaDao {

	/// AGGIUNGI 
	public Rubrica aggiungiRubrica(String nome){
		Session session =HibernateUtil.openSession();
		Transaction tx=null;
		
		Rubrica r = null;

		try{
		tx=session.getTransaction();
		tx.begin();
		
		r = new Rubrica();
		r.setNome(nome);
		
		session.persist(r);
		 tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		return r;
	}
	
	
	
	/// LEGGI DA NOME E COGNOME
	public Rubrica cercaRubrica(String nome){
		
		Session session =HibernateUtil.openSession();
		Transaction tx=null;
		
		Rubrica r = null;

		try{
		tx=session.getTransaction();
		tx.begin();
		
		Query query = session.createQuery("from Rubrica where nome=:nome");
		query.setString("nome", nome);
		
		r = (Rubrica) query.uniqueResult();
		
		 tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		return r;		
	}
	
	
	
	/// LEGGI ID DA RUBRICA
	public int leggiId(String username){
		
		Session session =HibernateUtil.openSession();
		Transaction tx=null;
		
		int id = -1;

		try{
		tx=session.getTransaction();
		tx.begin();
		
		Query query = session.createQuery("from Rubrica where nome=:nome");
		query.setString("nome", username);
		
		Rubrica r = (Rubrica) query.uniqueResult();
		id = r.getId_rubrica();
		
		 tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		return id;		
	}
	
	
	/// LEGGI DA TELEFONO
	
	
	
	/// MODIFICA
	
	
	
	/// ELIMINA
	
	
}
