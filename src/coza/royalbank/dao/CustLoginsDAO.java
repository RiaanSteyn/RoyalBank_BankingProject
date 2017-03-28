package coza.royalbank.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import coza.royalbank.model.CustLogins;

public class CustLoginsDAO {
	
	public static void save(CustLogins custlogin, Session session) {
		Transaction tx = session.beginTransaction();
		try {
			session.save(custlogin);
			tx.commit();
		} finally {
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack()) {
				tx.rollback();
			}
		}
	} 
		
	public static void update(CustLogins CustLogin, Session session) {
		Transaction tx = session.beginTransaction();
		try {
			session.update(CustLogin);
			tx.commit();
			session.refresh(CustLogin);
		} finally {
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack()) {
				tx.rollback();
			}
		}
	} 
	
	public static void delete(int cust_login_id, Session session) {
		Transaction tx = session.beginTransaction();
		try {
			CustLogins cl = get(cust_login_id, session);
			session.delete(cl);
			tx.commit();
			
		} finally {
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack()) {
				tx.rollback();
			}
		}
	}
	
	public static CustLogins get(int cust_login_id, Session session) {
		Query query = session.createQuery("FROM cust_logins WHERE cust_login_id = :cust_acc_id");
		query.setInteger("cust_acc_id", cust_login_id);
		
		return (CustLogins) query.uniqueResult();
	}
	

	@SuppressWarnings("unchecked")
	public static List<CustLogins> getAll(Session session, int cust_login_id) {
		Query query = session.createQuery("FROM cust_logins WHERE cust_login_id = :cust_login_id ORDER BY name ASC");
		query.setInteger("cust_login_id", cust_login_id);
		
		List<CustLogins> list = (List<CustLogins>) query.list();
	    return list;
	} 
	
	
	
	
	
	

}
