package coza.royalbank.dao;

import java.util.List;

import coza.royalbank.model.Admin;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class AdminDAO {
	
	public static void save(Admin admin, Session session) {
		Transaction tx = session.beginTransaction();
		try {
			session.save(admin);
			tx.commit();
		}
		finally {
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack()) {
				tx.rollback();
			}
		}
	}
	
	public static void update(Admin admin, Session session)	{
		Transaction tx = session.beginTransaction();
		try {
			session.update(admin);
			tx.commit();
			session.refresh(admin);
		}
		finally	{
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack())	{
				tx.rollback();
			}
		}
	}
			
	public static void delete(int admin_id, Session session) {
		Transaction tx = session.beginTransaction();
		try {
			Admin ad = get(admin_id, session);
			session.delete(ad);
			tx.commit();			
		}
		finally {
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack()) {
				tx.rollback();
			}
		}
	}
	
	public static Admin login(String username, String password, Session session){
		Query query = session.createQuery("FROM Admin WHERE admin_username = :username AND admin_password = :password");
		query.setString("username", username);
		query.setString("password", password);
		return (Admin) query.uniqueResult();
	}
	
	public static Admin get(int admin_id, Session session) {
		Query query = session.createQuery("FROM Accounts WHERE admin_id = :admin_id");
		query.setInteger("acc_id", admin_id);
		
		return (Admin) query.uniqueResult();
	}
	
	public static List<Admin> getAll(Session session) {
		Query query = session.createQuery("FROM Accounts");
		List<Admin> list = (List<Admin>) query.list();
		return list;
		
	}
}
