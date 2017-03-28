package coza.royalbank.dao;

import java.util.List;
import coza.royalbank.model.Beneficiaries;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class BeneficiariesDAO {
	
	public static void save(Beneficiaries beneficiaries, Session session) {
		Transaction tx = session.beginTransaction();
		try {
			session.save(beneficiaries);
			tx.commit();
		}
		finally {
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack()) {
				tx.rollback();
			}
		}
	
	}
		
	public static void update(Beneficiaries beneficiaries, Session session) {
		Transaction tx = session.beginTransaction();
		try {
			session.update(beneficiaries);
			tx.commit();
			session.refresh(beneficiaries);
		}
		finally {
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack()) {
				tx.rollback();
			}
		}
	}
	
	public static void delete(int ben_id, Session session) {
		Transaction tx = session.beginTransaction();
		try{
			Beneficiaries b = get(ben_id, session);
			session.delete(b);
			tx.commit();		
		}
		finally {
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack()) {
				tx.rollback();
			}
		}
	}
	
	public static Beneficiaries get(int ben_id, Session session) {
		Query query = session.createQuery("FROM Beneficiaries WHERE ben_id = :ben_id");
		query.setInteger("ben_id", ben_id);
		
		return (Beneficiaries) query.uniqueResult();
	}
	
	public static List<Beneficiaries> getAll(int cust_id, Session session) {
		Query query = session.createQuery("FROM Beneficiaries WHERE cust_id = :cust_id ");
		query.setInteger("cust_id", cust_id);
		List<Beneficiaries> list = (List<Beneficiaries>) query.list();
		return list;
		
	}
	
}
