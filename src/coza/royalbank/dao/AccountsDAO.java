package coza.royalbank.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import coza.royalbank.model.Accounts;

public class AccountsDAO {
	
	public static void save(Accounts accounts, Session session)	{
		Transaction tx = session.beginTransaction();
		try{
			session.save(accounts);
			tx.commit();
		}
		finally {
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack()) {
				tx.rollback();
			}
		}
	
	}
	
	public static void update(Accounts accounts, Session session) {
		Transaction tx = session.beginTransaction();
		try {
			session.update(accounts);
			tx.commit();
			session.refresh(accounts);
		}
		finally {
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack()) {
				tx.rollback();
			}
		}
	}

	public static void delete(int acc_id, Session session) {
		Transaction tx = session.beginTransaction();
		try {
			Accounts a = get(acc_id, session);
			session.delete(a);
			tx.commit();
			
		}
		finally {
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack()) {
				tx.rollback();
			}
		}
	}

	public static Accounts get(int acc_id, Session session) {
		Query query = session.createQuery("FROM Accounts WHERE acc_id = :acc_id");
		query.setInteger("acc_id", acc_id);
		
		return (Accounts) query.uniqueResult();
	}

	public static List<Accounts> getAll(Session session) {
		Query query = session.createQuery("FROM Accounts");
		@SuppressWarnings("unchecked")
		List<Accounts> list = query.list() != null ? (List<Accounts>) query.list(): new ArrayList<>();
		return list;	
	}
	public static List<Accounts> getAllAcc(Session session)
	{
		Query query = session.createQuery("FROM Accounts");
		List<Accounts> list = (List<Accounts>) query.list();
		return list;
		
	}//End of getAllAcc


}
