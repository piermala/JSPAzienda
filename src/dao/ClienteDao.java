package dao;

import java.util.ArrayList;
import java.util.List;

import hibernateUtil.HibernateUtil;
import model.ClienteBean;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class ClienteDao {

	
	/// AGGIUNGI
	public ClienteBean createCliente(String nome, String cognome, String username, String password, String partitaIVA, String ragioneSociale){
		
		ClienteBean cliente = null;
			
		Session session =HibernateUtil.openSession();
		Transaction tx=null;

		try{
			tx=session.getTransaction();
			tx.begin();
			
			cliente = new ClienteBean(nome, cognome, username, password, 'C', ragioneSociale, partitaIVA);
			session.persist(cliente);
			
			tx.commit();
			
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
			
		return cliente;	
	}
		
		
		
	/// CERCA CON USERNAME
	public ClienteBean trovaClienteConUsername(String username) {
			
		ClienteBean cliente = null;
			
		Session session =HibernateUtil.openSession();
		Transaction tx=null;

		try{
			tx=session.getTransaction();
			tx.begin();
			
			Query query=session.createQuery("from ClienteBean where username=:username");
			query.setString("username", username);
				
			cliente =(ClienteBean)query.uniqueResult();
				
			tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		return cliente;			
	}
	
	
	/// TUTTI I CLIENTI
	public List<ClienteBean> leggiTuttiClienti() {
		
		List<ClienteBean> clienti = new ArrayList<ClienteBean>();
			
		Session session =HibernateUtil.openSession();
		Transaction tx=null;

		try{
			tx=session.getTransaction();
			tx.begin();
			
			Query query=session.createQuery("from ClienteBean");
				
			clienti = (List<ClienteBean>)query.list();
				
			tx.commit();
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
		return clienti;			
	}
	
}
