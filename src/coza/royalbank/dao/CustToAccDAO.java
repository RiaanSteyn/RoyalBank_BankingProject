package coza.royalbank.dao;

import java.util.List;

import coza.royalbank.model.Accounts;
import coza.royalbank.model.CustToAcc;
import coza.royalbank.model.Customers;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class CustToAccDAO {
	
	public static void save(CustToAcc custToAcc, Session session) {
		Transaction tx = session.beginTransaction();
		try {
			session.save(custToAcc);
			tx.commit();
		}
		finally {
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack()) {
				tx.rollback();
			}
		}
	}
		
	public static void update(CustToAcc custToAcc, Session session) {
		Transaction tx = session.beginTransaction();
		try {
			session.update(custToAcc);
			tx.commit();
			session.refresh(custToAcc);
		}
		finally	{
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack()) {
				tx.rollback();
			}
		}
	}
	
	public static void delete(int cust_acc_id, Session session) {
		Transaction tx = session.beginTransaction();
		try {
			CustToAcc cta = get(cust_acc_id, session);
			session.delete(cta);
			tx.commit();
		}
		finally	{
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack())	{
				tx.rollback();
			}
		}
	}
	
	public static CustToAcc get(int cust_acc_id, Session session) {
		Query query = session.createQuery("FROM CustToAcc WHERE cust_acc_id = :cust_acc_id");
		query.setInteger("cust_acc_id", cust_acc_id);
		
		return (CustToAcc) query.uniqueResult();
	}//End of get // This method will retrieve 
	
	public static CustToAcc getCustomer(int cust_id, Session session) {
		Query query = session.createQuery("FROM CustToAcc WHERE cust_id = :cust_id");
		query.setInteger("cust_id", cust_id);
		
		return (CustToAcc) query.uniqueResult();
	}//End of get // This method will retrieve
	
	public static List<CustToAcc> getCustomerAccount(int cust_id, Session session) {
		Query query = session.createQuery("FROM CustToAcc WHERE cust_id = :cust_id");
		query.setInteger("cust_id", cust_id);
		List<CustToAcc> list = (List<CustToAcc>) query.list();
		
		return list;
	}//End of get // This method will retrieve 
	
	
	public static List<CustToAcc> getAll(Session session) {
		Query query = session.createQuery("FROM CustToAcc ORDER BY cust_acc_approved DESC");
		
		List<CustToAcc> list = (List<CustToAcc>) query.list();
		
		return list;
	}
	
	public static List<CustToAcc> getPending(int cust_id, Session session) {
		Query query = session.createQuery("FROM CustToAcc WHERE cust_id = :cust_id AND cust_acc_approved = 0 AND cust_acc_declined = 0");
		query.setInteger("cust_id", cust_id);			
		List<CustToAcc> list = (List<CustToAcc>) query.list();		
		return list;		
	}
	
	public static List<CustToAcc> getOpenedApproved(int cust_id, Session session) {
		Query query = session.createQuery("FROM CustToAcc WHERE cust_id = :cust_id AND cust_acc_approved = 1 AND cust_acc_closed = 0");
		query.setInteger("cust_id", cust_id);			
		List<CustToAcc> list = (List<CustToAcc>) query.list();		
		return list;
	}	
	
	public static List<CustToAcc> getAllClosed( int cust_id, Session session) {
		Query query = session.createQuery("FROM CustToAcc WHERE  cust_id = :cust_id AND cust_acc_closed = 1");
		query.setInteger("cust_id", cust_id);		
		List<CustToAcc> list = (List<CustToAcc>) query.list();		
		return list;
	}
	
	public static List<CustToAcc> getPayeesAccount( long cust_acc_number, Accounts account, Session session) {
		Query query = session.createQuery("FROM CustToAcc WHERE  cust_acc_number = :cust_acc_number AND account = :account");
		query.setLong("cust_acc_number", cust_acc_number);
		query.setParameter("account", account);
		
		List<CustToAcc> list = (List<CustToAcc>) query.list();		
		return list;
	}
	
	public static List<CustToAcc> getAllApproved(Session session, int cust_id)
	{
		Query query = session.createQuery("FROM CustToAcc WHERE cust_acc_approved = true AND cust_acc_closed = false AND cust_id = :cust_id");
		query.setInteger("cust_id", cust_id);
		
		List<CustToAcc> list = (List<CustToAcc>) query.list();
		
		return list;
		
	}//End of getAll. This method will retrieve all of the accounts that are linked to a particular customer.

	public static List<CustToAcc> getAllPending(Session session, int cust_id)
	{
		Query query = session.createQuery("FROM CustToAcc WHERE cust_acc_approved = false AND cust_acc_declined = false  AND cust_id = :cust_id");
		query.setInteger("cust_id", cust_id);	
		
		List<CustToAcc> list = (List<CustToAcc>) query.list();
		
		return list;
		
	}
	public static List<CustToAcc> getAllClosed(Session session, int cust_id)
	{
		Query query = session.createQuery("FROM CustToAcc WHERE cust_acc_closed = true AND cust_id = :cust_id" );
		query.setInteger("cust_id", cust_id);
		
		List<CustToAcc> list = (List<CustToAcc>) query.list();
		
		return list;
	}
	
	public static List<CustToAcc> getAllA(int cust_id, Session session)
	{
		Query query = session.createQuery("FROM CustToAcc WHERE cust_id = :cust_id");
		query.setInteger("cust_id", cust_id);
		
		List<CustToAcc> list = (List<CustToAcc>) query.list();
		
		return list;
		
	}//End of getAll. This method will retrieve all of the accounts that are linked to a particular customer.
	
	public static CustToAcc getPayeeCustAccID(long cust_acc_number, Session session)
	{
		Query query = session.createQuery("FROM CustToAcc WHERE cust_acc_number = :cust_acc_number");
		query.setLong("cust_acc_number", cust_acc_number);
		
		return (CustToAcc) query.uniqueResult();
	}//End of get // This method will retrieve 
	
	public static Customers getPayeeCustomerID(int cust_acc_number, Session session)
	{
		Query query = session.createQuery("FROM CustToAcc WHERE cust_acc_number = :cust_acc_number");
		query.setInteger("cust_acc_number", cust_acc_number);
		
		return (Customers) query.uniqueResult();
		
	}//End of get // This method will retrieve 
	
	public static List<CustToAcc> getAllAcc(Session session) {
		Query query = session.createQuery("FROM CustToAcc");
		
		List<CustToAcc> list = (List<CustToAcc>) query.list();
		
		return list;
	}
	public static CustToAcc checkAccountNumberExists(long cust_acc_number, Session session)
	{
		Query query = session.createQuery("FROM CustToAcc WHERE cust_acc_number = :cust_acc_number");
		query.setLong("cust_acc_number", cust_acc_number);
		
		return (CustToAcc) query.uniqueResult();
		
	}//End of get // This method will retrieve 
}