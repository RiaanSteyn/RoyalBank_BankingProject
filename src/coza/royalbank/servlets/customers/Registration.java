package coza.royalbank.servlets.customers;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
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
import coza.royalbank.util.Generic.Mode;
import coza.royalbank.util.HibernateSessionFactory;

@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionFactory sessionFactory = null;
       
    public Registration() {
        super();
        this.sessionFactory = HibernateSessionFactory.getSessionFactory();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Session session = null;
		session 		= sessionFactory.openSession();
		Customers customer;
		
		String title 				= request.getParameter("title");
		String first_name 			= request.getParameter("first_name");
		String last_name 			= request.getParameter("last_name");
		String id_number 			= request.getParameter("id_num");
		String email 				= request.getParameter("email");
		String landline 			= request.getParameter("landline");
		String mobile 				= request.getParameter("mobile");
		String residential_address 	= request.getParameter("residential_address");
		String residential_province = request.getParameter("residential_province");
		String residential_postcode = request.getParameter("residential_postcode");
		String same_address			= request.getParameter("same_address");
		String postal_address 		= request.getParameter("postal_address");
		String postal_province 		= request.getParameter("postal_province");
		String postal_postcode 		= request.getParameter("postal_code");
		String username 			= request.getParameter("username");
		String password 			= request.getParameter("password");
		Date reg_date				= Generic.getDate();
		
		System.out.println(same_address);
		String verification_key = null;
		try {
			verification_key = Generic.generateRandomString(32, Mode.ALPHANUMERIC);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
					
		
		try {
			if(same_address.equals("on")) {
				postal_address  = residential_address;
				postal_province = residential_province;
				postal_postcode = residential_postcode;
			}
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		boolean customer_exists = false;
		
		try {
			customer = CustomersDAO.checkCustomerExists(id_number, username, email, session);			
			if (customer.getCust_id() > 0) {
				customer_exists = true;
			}
			else {
				customer_exists = false;
			}
		} catch (Exception e) {
			customer_exists = false;
			String error = "This customer already exists!";
	    	request.setAttribute("errorReg", error);	    	
	    	RequestDispatcher rd = getServletContext().getRequestDispatcher("/");			
			rd.include(request, response);						
		}
		
		if (!customer_exists) {
			customer = new Customers(title, first_name, last_name, id_number, username, password, residential_address, residential_province, residential_postcode, postal_address, postal_province, postal_postcode, landline, mobile, email, reg_date, true, false, verification_key);
			long new_cust_id = CustomersDAO.save(customer, session);
			
//			int last_insert_id = 1;
			String verification_url = "royalbank.co.za/?customer=" + new_cust_id + "&verify=" + verification_key;
			System.out.println(verification_url);
			
			// Send email verification
			
			String successMsg = "Registration Successful! Please check your mail and click on the verification email to verify your account.";
	    	request.setAttribute("successMsg", successMsg);	    	
			response.sendRedirect("index.jsp");
			
		}
		else {
			
			String error = "This customer already exists!";
	    	request.setAttribute("errorReg", error);	    	
			response.sendRedirect("index.jsp");
		}
	}

}
