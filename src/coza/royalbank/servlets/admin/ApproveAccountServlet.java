package coza.royalbank.servlets.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import coza.royalbank.dao.AccountsDAO;
import coza.royalbank.dao.CustToAccDAO;
import coza.royalbank.model.Accounts;
import coza.royalbank.model.CustToAcc;
import coza.royalbank.util.HibernateSessionFactory;
import coza.royalbank.util.ParameterValidate;

@WebServlet("/ApproveAccountServlet")
public class ApproveAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionFactory sessionFactory = null;
   
	
    public ApproveAccountServlet() {
        super();
        this.sessionFactory = HibernateSessionFactory.getSessionFactory();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cust_id = request.getParameter("approved_customer_id");//Customer ID
		String cust_acc_id = request.getParameter("account");//Customer Account ID
		String acc_id = request.getParameter("acc_type");//Account ID
		
		Session session = null;
		if(!ParameterValidate.isValid(cust_id, cust_acc_id, acc_id)){
			System.out.println("Customer ID is null");
			response.sendRedirect("admin/account.jsp?account=" + cust_acc_id);
		}else{
			try {
//				int id = Integer.parseInt(cust_id);
				int customerAccountID = Integer.parseInt(cust_acc_id);
				int accId = Integer.parseInt(acc_id);
				session = sessionFactory.openSession(); // open session
					
				//set active to false
				Accounts acc = AccountsDAO.get(accId, session);
				long new_acc_number = acc.getAcc_new_number() + 1;
				acc.setAcc_new_number(new_acc_number);
				CustToAcc custtoacc = CustToAccDAO.get(customerAccountID, session); //get Beneficiary from data
				custtoacc.setCust_acc_approved(true);
				custtoacc.setCust_acc_number(new_acc_number);
				CustToAccDAO.update(custtoacc, session); //update changes in database
				AccountsDAO.update(acc, session);
				
				response.sendRedirect("admin/customer.jsp?customer=" + cust_id); // go back to home page
			} finally {
				if(session != null) {
					session.close();//close session
				}
			} // end of try/finally
		}
	}
}
