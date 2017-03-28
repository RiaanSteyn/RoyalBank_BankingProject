package coza.royalbank.servlets.beneficiaries;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import coza.royalbank.dao.AccountsDAO;
import coza.royalbank.dao.BeneficiariesDAO;
import coza.royalbank.dao.CustomersDAO;
import coza.royalbank.model.Accounts;
import coza.royalbank.model.Beneficiaries;
import coza.royalbank.model.Customers;
import coza.royalbank.util.HibernateSessionFactory;

/**
 * Servlet implementation class NewBen
 */
@WebServlet("/NewBen")
public class NewBen extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionFactory sessionFactory = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewBen() {
        super();
        this.sessionFactory = HibernateSessionFactory.getSessionFactory();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cust_id = 1;
		int acc_id  = 2;
		
		String ben_payment_name 	  = request.getParameter("payee_name");
		long account_number   	  	  = Long.parseLong(request.getParameter("account_number"));
		String ben_from_reference 	  = request.getParameter("my_ref");
		String ben_to_reference 	  = request.getParameter("their_ref");
		String ben_pop_type 		  = request.getParameter("pop_method");
		String ben_email 			  = request.getParameter("email");
		String ben_mobile 			  = request.getParameter("mobile");
		String submit_new_beneficiary = request.getParameter("submit_new_beneficiary");
		
		Session session = null;
		try {
			session = sessionFactory.openSession();
			
			Customers customer = CustomersDAO.get(cust_id, session);
			Accounts account   = AccountsDAO.get(acc_id, session);
			
			Beneficiaries beneficiary = new Beneficiaries(customer, account, ben_payment_name, account_number, ben_to_reference, ben_from_reference, ben_pop_type, ben_email, ben_mobile);
			
			BeneficiariesDAO.save(beneficiary, session);
		}
		finally {
			if(session != null) {
				session.close();
			}
		}
		
		
		
		
		System.out.println(ben_payment_name);
//		System.out.println(account);
		System.out.println(account_number);
		System.out.println(ben_from_reference);
		System.out.println(ben_to_reference);
		System.out.println(ben_pop_type);
		System.out.println(ben_email);
		System.out.println(ben_mobile);
		System.out.println(submit_new_beneficiary);	
		
		

	}

}
