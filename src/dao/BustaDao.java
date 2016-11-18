package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;

import hibernateUtil.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.BustaPaga;

public class BustaDao {

	
	/// AGGIUNGI
	public void aggiungiBustaPaga(BustaPaga bPaga){
		
		Session session =HibernateUtil.openSession();
		Transaction tx=null;

		try{
			tx=session.getTransaction();
			tx.begin();
			
			session.persist(bPaga);
			
			tx.commit();
			
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}		
	}
	
	
	
	/// TUTTE LE BUSTE PAGHE
	public List<BustaPaga> getBustePaga() {

		List<BustaPaga> buste = new ArrayList<BustaPaga>();

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			Query query = (Query) session.createQuery("from BustaPaga");
			buste = (List<BustaPaga>)query.list();

			tx.commit();

		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}

		return buste;
		
	}
	
	
	/// TUTTE LE BUSTE PAGHE DEL DIPENDENTE TRAMITE L'ID
	public List<BustaPaga> getBustePagaDaId(long id) {

		List<BustaPaga> buste = new ArrayList<BustaPaga>();

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			Query query = (Query) session.createQuery("from BustaPaga where dipendente_idutente=:id");
			query.setLong("id", id);
			
			buste = (List<BustaPaga>)query.list();

			tx.commit();

		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}

		return buste;
		
	}
}
