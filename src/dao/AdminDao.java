package dao;

import hibernateUtil.HibernateUtil;
import model.AdminBean;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class AdminDao {

	/// AGGIUNGI
	public AdminBean createAdmin(String nome, String cognome, String username, String password, String livelloAccesso){
			
		AdminBean admin = null;
			
		Session session =HibernateUtil.openSession();
		Transaction tx=null;

		try{
			tx=session.getTransaction();
			tx.begin();
			
			admin = new AdminBean(nome, cognome, username, password, 'A');
			admin.setLivelloAccesso(livelloAccesso);
			session.persist(admin);
			
			tx.commit();
			
		}catch(Exception ex){
			tx.rollback();
		}finally{
			session.close();
		}
			
		return admin;	
	}
		
		
		
		/// CERCA CON USERNAME
		public AdminBean trovaAdminConUsername(String username) {
			
			AdminBean admin = null;
			
			Session session =HibernateUtil.openSession();
			Transaction tx=null;

			try{
				tx=session.getTransaction();
				tx.begin();
			
				Query query=session.createQuery("from AdminBean where username=:username");
				query.setString("username", username);
				
				admin=(AdminBean)query.uniqueResult();
		
				tx.commit();
			}catch(Exception ex){
				tx.rollback();
			}finally{
				session.close();
			}
			return admin;			
		}
}
