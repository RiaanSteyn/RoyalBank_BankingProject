package coza.royalbank.dao;

import java.util.List;
import coza.royalbank.model.Transactions;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class TransactionsDAO {
	
	public static void save(Transactions transactions, Session session) {
		Transaction tx = session.beginTransaction();
		try {
			session.save(transactions);
			tx.commit();
		}
		finally {
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack()) {
				tx.rollback();
			}
		}
	
	}
		
	public static void update(Transactions transactions, Session session) {
		Transaction tx = session.beginTransaction();
		try {
			session.update(transactions);
			tx.commit();
			session.refresh(transactions);
		}
		finally	{
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack())	{
				tx.rollback();
			}
		}
	}
	
	public static void delete(int trans_id, Session session) {
		Transaction tx = session.beginTransaction();
		try {
			Transactions t = get(trans_id, session);
			session.delete(t);
			tx.commit();		
		}
		finally {
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack())	{
				tx.rollback();
			}
		}
	}
	
	public static Transactions get(int trans_id, Session session) {
		Query query = session.createQuery("FROM Transactions WHERE trans_id = :trans_id");
		query.setInteger("trans_id", trans_id);
		
		return (Transactions) query.uniqueResult();
	}
	

	public static List<Transactions> getAll(Session session)
	{
		Query query = session.createQuery("FROM Transactions");
		
		List<Transactions> list = (List<Transactions>) query.list();
		return list;
	}//end of getAll
	
	public static double getPayerNewBalance(double oldBal, double newBal)
	{
		double result;
		result = oldBal - newBal;
		return result;
	}

	public static double getPayeeNewBalance(double oldBal, double newBal)
	{
		double result;
		result = oldBal + newBal;
		return result;
	}

}
