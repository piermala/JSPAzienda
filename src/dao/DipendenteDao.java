package dao;

import java.util.ArrayList;
import java.util.List;

import hibernateUtil.HibernateUtil;
import model.DipendenteBean;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class DipendenteDao {

	/// AGGIUNGI
	public DipendenteBean createDipendente(String nome, String cognome, String username, String password, String posizione, double stipendio){
		
		DipendenteBean dipendente = null;
			
		Session session =HibernateUtil.openSession();
		Transaction tx=null;

		try{
			tx=session.getTransaction();
			tx.begin();
			
			dipendente = new DipendenteBean(nome, cognome, username, password, 'D', posizione, stipendio);
			session.persist(dipendente);
			
			tx.commit();
			
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
			
		return dipendente;	
	}
		
		
		
	/// CERCA CON USERNAME
	public DipendenteBean trovaDipendenteConUsername(String username) {
			
		DipendenteBean dipendente = null;
			
		Session session =HibernateUtil.openSession();
		Transaction tx=null;

		try{
			tx=session.getTransaction();
			tx.begin();
			
			Query query=session.createQuery("from UtenteBean where username=:username");
			query.setString("username", username);
				
			dipendente = (DipendenteBean)query.uniqueResult();
		
			tx.commit();
			
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		return dipendente;			
	}
	
	
	/// CERCA DIPENDENTE DA ID
	public DipendenteBean getDipendenteDaId(long id) {

		DipendenteBean dipendente = null;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			Query query = session
					.createQuery("from DipendenteBean where idutente=:id");
			query.setLong("id", id);

			dipendente = (DipendenteBean) query.uniqueResult();

			tx.commit();

		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
		return dipendente;
	}
		
	
	/// TUTTI I DIPENDENTI
	public List<DipendenteBean> leggiTuttiDipendenti() {
		
		Session session =HibernateUtil.openSession();
		Transaction tx=null;
		
		List<DipendenteBean> dipendenti = new ArrayList<DipendenteBean>();

		try{
			tx=session.getTransaction();
			tx.begin();
			
			Query query=session.createQuery("from DipendenteBean");
				
			dipendenti = (List<DipendenteBean>)query.list();
				
			tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		return dipendenti;			
	}
	
	
	/// MODIFICA DIPENDENTE
	public void modificaDipendente(DipendenteBean d) {

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			session.update(d);

			tx.commit();

		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
	}
		
		
	
	/// ELIMINA DIPENDENTE
	public void eliminaDipendente(DipendenteBean d) {

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			session.delete(d);
			
			tx.commit();

		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
	}
	
}
