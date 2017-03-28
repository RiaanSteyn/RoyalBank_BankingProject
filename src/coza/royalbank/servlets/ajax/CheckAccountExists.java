package coza.royalbank.servlets.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.json.simple.JSONObject;

import coza.royalbank.dao.CustToAccDAO;
import coza.royalbank.model.CustToAcc;
import coza.royalbank.util.HibernateSessionFactory;


/**
 * Servlet implementation class CheckAccountExists
 */
@WebServlet("/CheckAccountExists")
public class CheckAccountExists extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionFactory sessionFactory = null;
       
   
    public CheckAccountExists() {
        super();
        this.sessionFactory = HibernateSessionFactory.getSessionFactory();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		long accountno = Long.parseLong(request.getParameter("accountno"));
		System.out.println(accountno);
		
		Session session 		 = null;
		CustToAcc custAccounts = null;
		boolean account_exists = false;
		
		try {
			
			session = sessionFactory.openSession();
			
		
			try {
				custAccounts = CustToAccDAO.checkAccountNumberExists(accountno, session);			
				if(custAccounts.getCust_acc_id() > 0 ) {
					account_exists = true;
				}
			} 
			catch (Exception e) {
				// System.out.println("No Customer ID");
				account_exists = false;
			}
						
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		JSONObject obj = new JSONObject();
		obj.put("account_exists", account_exists);
		System.out.println(obj);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(obj.toJSONString());
		
		
					
	}

}
