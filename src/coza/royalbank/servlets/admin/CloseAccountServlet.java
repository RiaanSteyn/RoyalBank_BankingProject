package coza.royalbank.servlets.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import coza.royalbank.dao.CustToAccDAO;
import coza.royalbank.model.CustToAcc;
import coza.royalbank.util.HibernateSessionFactory;
import coza.royalbank.util.ParameterValidate;

@WebServlet("/CloseAccountServlet")
public class CloseAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionFactory sessionFactory = null;
  
    public CloseAccountServlet() {
        super();
        this.sessionFactory = HibernateSessionFactory.getSessionFactory();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cust_id = request.getParameter("customer_id");
		String cust_acc_id = request.getParameter("account");

		if(!ParameterValidate.isValid(cust_id)){
			System.out.println("Customer ID is null");
			response.sendRedirect("admin/account.jsp?account=" + cust_acc_id);
		}else{
//			int id = Integer.parseInt(cust_id);
			int customerAccountID = Integer.parseInt(cust_acc_id);
			Session session = null;
			try {
				session = sessionFactory.openSession(); // open session
					
				//set active to false
				CustToAcc custtoacc = CustToAccDAO.get(customerAccountID, session); //get Beneficiary from data
				custtoacc.setCust_acc_closed(true);
				CustToAccDAO.update(custtoacc, session); //update changes in database
				
				response.sendRedirect("admin/customer.jsp?customer=" + cust_id); // go back to home page
				
			} finally {
				if(session != null) {
					session.close();//close session
				}
			} // end of try/finally
		}
	}
}
