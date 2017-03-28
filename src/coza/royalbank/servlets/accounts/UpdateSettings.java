package coza.royalbank.servlets.accounts;

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
import coza.royalbank.util.Generic;
import coza.royalbank.util.HibernateSessionFactory;

@WebServlet("/UpdateSettings")
public class UpdateSettings extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionFactory sessionFactory = null;
       
    public UpdateSettings() {
        super();
        this.sessionFactory = HibernateSessionFactory.getSessionFactory();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		int cust_id 		 = Generic.getLoggedInCustID(request, response);
		
		int acc_id			 = Integer.parseInt(request.getParameter("account"));
		String method 		 = request.getParameter("method");
		double daily_limit   = Double.parseDouble(request.getParameter("daily_limit"));
		double monthly_limit = Double.parseDouble(request.getParameter("monthly_limit"));
		
		Session session = null;
		
		try {
			session = sessionFactory.openSession();
			//Update the account settings
			CustToAcc cust_acc = CustToAccDAO.get(acc_id, session);
			cust_acc.setCust_acc_alerts(method);
			cust_acc.setCust_acc_daily_limit(daily_limit);
			cust_acc.setCust_acc_monthly_limit(monthly_limit);
			//Save changes to the database
			CustToAccDAO.update(cust_acc, session);	
			
			//check if update was successful, then redirect
			String success_msg = "Success: your settings have been updated.";
	    	request.setAttribute("success_msg", success_msg);
	    	response.sendRedirect("banking/account-settings.jsp?account="+ acc_id +"&key=" + Generic.getSecurityKey(request, response));
		}
		finally {
			if(session != null) {
				session.close();
			}
		}		
	}
}