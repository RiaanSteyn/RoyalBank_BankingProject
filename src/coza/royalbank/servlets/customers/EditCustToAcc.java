package coza.royalbank.servlets.customers;

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

@WebServlet("/EditCustToAcc")
public class EditCustToAcc extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionFactory sessionFactory = null;
    
    public EditCustToAcc() {
        super();
        this.sessionFactory = HibernateSessionFactory.getSessionFactory();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cust_acc_ids = request.getParameter("Cust_acc_id");
		String cust_acc_alerts = request.getParameter("cust_acc_alerts");
		String cust_acc_daily_limit = request.getParameter("cust_acc_daily_limit");
		String cust_acc_monthly_limit = request.getParameter("cust_acc_monthly_limit");
		
		if(!ParameterValidate.isValid(cust_acc_ids, cust_acc_alerts, cust_acc_daily_limit, cust_acc_monthly_limit)) {
			response.sendRedirect("banking/account-settings.jsp"); // Send user back to addclient page
		} else {
			int cust_acc_id = Integer.parseInt(cust_acc_ids);
			
			double daily = 0.0;
			double monthly = 0.0;
			daily = Double.parseDouble(cust_acc_daily_limit);
			monthly = Double.parseDouble(cust_acc_monthly_limit);
			
			Session session = null;
			try{
				session = sessionFactory.openSession();
				CustToAcc c = CustToAccDAO.get(cust_acc_id, session);
				
				c.setCust_acc_alerts(cust_acc_alerts);
				c.setCust_acc_daily_limit(daily);
				c.setCust_acc_monthly_limit(monthly);
							
				CustToAccDAO.update(c, session);
				response.sendRedirect("banking/account-settings.jsp");
			}finally{
				if(session != null){
					session.close();
				}
			}//end of try/fanally
		}
	}
}