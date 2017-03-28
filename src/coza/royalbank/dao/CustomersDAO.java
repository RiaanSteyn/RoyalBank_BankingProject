package coza.royalbank.dao;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import coza.royalbank.model.Customers;

public class CustomersDAO {
	
	public static long save(Customers customers, Session session) {
		Transaction tx = session.beginTransaction();
		Long lastId = null;
		try {
			session.save(customers);
			tx.commit();
			lastId = ((BigInteger) session.createSQLQuery("SELECT LAST_INSERT_ID()").uniqueResult()).longValue();
		}
		finally {
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack()) {
				tx.rollback();
			}
		}
		
		return lastId;
	
	}	
	
	public static void update(Customers customers, Session session) {
		Transaction tx = session.beginTransaction();
		try {
			session.update(customers);
			tx.commit();
			session.refresh(customers);
		}
		finally {
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack()) {
				tx.rollback();
			}
		}
	}	
	
	public static void delete(int cust_id, Session session)	{
		Transaction tx = session.beginTransaction();
		try {
			Customers c = get(cust_id, session);
			session.delete(c);
			tx.commit();			
		}
		finally {
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack()) {
				tx.rollback();
			}
		}
	}		
	
	public static Customers login(String username, String password, Session session){
		Query query = session.createQuery("FROM Customers WHERE cust_username = :username AND cust_password = :password");
		query.setString("username", username);
		query.setString("password", password);
		return (Customers) query.uniqueResult();
	}
	
	public static Customers get(int cust_id, Session session) {
		Query query = session.createQuery("FROM Customers WHERE cust_id = :cust_id");
		query.setInteger("cust_id", cust_id);
		
		return (Customers) query.uniqueResult();
	}
	
	public static Customers getLoginCustomer(String cust_username, Session session)	{
		Query query = session.createQuery("FROM Customers WHERE cust_username = :cust_username");
		query.setString("cust_username", cust_username);
		
		return (Customers) query.uniqueResult();
	}
			
	public static List<Customers> getAll(Session session) {
		Query query = session.createQuery("FROM Customers");
		List<Customers> list = (List<Customers>) query.list();
		
		return list;
		
	}
	
	public static Customers checkIdNumberExists(String cust_id_number, Session session) {
		Query query = session.createQuery("FROM Customers WHERE cust_id_number = :cust_id_number");
		query.setString("cust_id_number", cust_id_number);		
		return (Customers) query.uniqueResult();		
	}
	
	public static Customers checkUsernameExists(String cust_username, Session session) {
		Query query = session.createQuery("FROM Customers WHERE cust_username = :cust_username");
		query.setString("cust_username", cust_username);
		return (Customers) query.uniqueResult();		
	}
	
	public static Customers checkEmailExists(String cust_email, Session session) {
		Query query = session.createQuery("FROM Customers WHERE cust_email = :cust_email");
		query.setString("cust_email", cust_email);		
		return (Customers) query.uniqueResult();		
	}
	
	public static Customers checkCustomerExists(String cust_id_number, String cust_username, String cust_email, Session session) {
		Query query = session.createQuery("FROM Customers WHERE cust_id_number = :cust_id_number OR cust_username = :cust_username OR cust_email = :cust_email");
		query.setString("cust_id_number", cust_id_number);
		query.setString("cust_username", cust_username);
		query.setString("cust_email", cust_email);		
		return (Customers) query.uniqueResult();		
	}
		
	public static int verifyCustomer(int cust_id, String cust_verification_key, Session session) {
		Query query = session.createQuery("UPDATE Customers SET cust_verifed = true WHERE cust_id = :cust_id AND cust_verification_key = :cust_verification_key");
		query.setInteger("cust_id", cust_id);
		query.setString("cust_verification_key", cust_verification_key);
		int result = query.executeUpdate();
		return result;		
	}
	
	public static Customers getPayeeCustomerID(int cust_acc_number, Session session)
	{
		Query query = session.createQuery("FROM CustToAcc WHERE cust_acc_number = :cust_acc_number");
		query.setInteger("cust_acc_number", cust_acc_number);
		
		return (Customers) query.uniqueResult();
	}//End of get // This method will retrieve 
	
}
