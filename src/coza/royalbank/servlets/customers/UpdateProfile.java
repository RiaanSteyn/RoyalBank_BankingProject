package coza.royalbank.servlets.customers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import coza.royalbank.dao.CustomersDAO;
import coza.royalbank.model.Customers;
import coza.royalbank.util.Generic;
import coza.royalbank.util.HibernateSessionFactory;

@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionFactory sessionFactory = null;
       
    public UpdateProfile() {
        super();
        this.sessionFactory = HibernateSessionFactory.getSessionFactory();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int cust_id = Generic.getLoggedInCustID(request, response);
		
		String title 	   			= request.getParameter("title");		
		String first_name 	   		= request.getParameter("first_name");		
		String last_name 	   		= request.getParameter("last_name");

		String landline 			= request.getParameter("landline");				
		String mobile 	   			= request.getParameter("mobile");		
		
		String residential_address 	= request.getParameter("residential_address");		
		String residential_province = request.getParameter("residential_province");
		String residential_post  	= request.getParameter("residential_post");
		
		String postal_address 		= request.getParameter("postal_address");
		String postal_province 		= request.getParameter("postal_province");				
		String postal_post 	   		= request.getParameter("postal_post");	
		
		Session session = null;
		
		try {
			
			session = sessionFactory.openSession();
			
			Customers customer = CustomersDAO.get(cust_id, session);
			
			customer.setCust_title(title);
			customer.setCust_first_name(first_name);
			customer.setCust_last_name(last_name);
			customer.setCust_landline(landline);
			customer.setCust_mobile(mobile);
			customer.setCust_residential_address(residential_address);
			customer.setCust_residential_province(residential_province);
			customer.setCust_residential_postcode(residential_post);
			customer.setCust_postal_address(postal_address);
			customer.setCust_postal_province(postal_province);
			customer.setCust_postal_postcode(postal_post);
			
			CustomersDAO.update(customer, session);
			
			// Check if update was successful and redirect to profile/index.jsp with a message of successful
			response.sendRedirect("banking/profile/index.jsp?key=" + Generic.getSecurityKey(request, response));
		} catch (Exception e) {
			response.sendRedirect("banking/profile/update.jsp?key=" + Generic.getSecurityKey(request, response));
		}
		finally
		{
			if(session != null)
			{
				session.close();
			}
		}
	}
}
