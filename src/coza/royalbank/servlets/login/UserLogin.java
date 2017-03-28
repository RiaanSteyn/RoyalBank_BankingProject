package coza.royalbank.servlets.login;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import coza.royalbank.dao.CustLoginsDAO;
import coza.royalbank.dao.CustomersDAO;
import coza.royalbank.model.CustLogins;
import coza.royalbank.model.Customers;
import coza.royalbank.util.Generic;
import coza.royalbank.util.Generic.Mode;
import coza.royalbank.util.HibernateSessionFactory;

/**
 * Servlet implementation class UserLogin
 */

@WebServlet(name="UserLogin",urlPatterns={"/UserLogin"})
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionFactory sessionFactory = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
        super();
        this.sessionFactory = HibernateSessionFactory.getSessionFactory();
    }
    
    public void reDirect(HttpServletRequest request, HttpServletResponse response, String error, String page) throws ServletException, IOException {
    	
    	request.setAttribute("error", error);
    	
    	RequestDispatcher rd = getServletContext().getRequestDispatcher(page);
		
		rd.include(request, response);
    	
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Session session = null;
		
		String username = request.getParameter("login_username");
		String password = request.getParameter("login_password");
		
		Customers customer = new Customers();
		
		System.out.println(username);
		System.out.println(password);
		
		int cust_id = 0;
		
		if (username.length() > 0) {
			if (password.length() > 0) {	
				session = sessionFactory.openSession();
				
				try {
					customer = CustomersDAO.getLoginCustomer(username, session);	
					cust_id = customer.getCust_id();
				} catch (NullPointerException e) {
					
					System.out.println("Customer Does not exist");
					
					request.setAttribute("username", username);
										
					String error = "Error: Customer Does not exist.";
					String page  = "/index.jsp";
					reDirect(request, response, error, page);
					
				}
				
				
				
				System.out.println(cust_id);
				
				if(cust_id > 0) {
					if (customer.getCust_password().equals(password)) {
						//set session
						HttpSession loggedInSession = request.getSession();
						loggedInSession.setAttribute("cust_id", cust_id);
						loggedInSession.setAttribute("first_name", customer.getCust_first_name());
						loggedInSession.setAttribute("last_name", customer.getCust_last_name());
						String users_name = customer.getCust_first_name() + " " + customer.getCust_last_name();
						loggedInSession.setMaxInactiveInterval(5*60);		
						
						System.out.println("Logging In...");
						System.out.println(loggedInSession.getAttribute("first_name"));
						
						Cookie loggedInCookie = new Cookie("users_name", users_name);
						loggedInCookie.setMaxAge(5*60);
						response.addCookie(loggedInCookie);
						
						Date cust_login_time 		 = Generic.getDate();
//						String cust_login_ip   		 = request.getHeader("Remote_Addr");
//						String cust_login_ip   		 = request.getHeader("HTTP_X_FORWARDED_FOR");
						String cust_login_ip   		 = request.getRemoteAddr();
						
												
						String cust_login_user_agent = request.getHeader("User-Agent");
						String cust_login_security_key = "";
						try {
							cust_login_security_key = Generic.generateRandomString(16, Mode.ALPHA_LOWER);
							loggedInSession.setAttribute("security_key", cust_login_security_key);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						System.out.println(cust_login_time);
						System.out.println(cust_login_ip);
						System.out.println(cust_login_user_agent);
						System.out.println(cust_login_security_key);
						
						CustLogins customer_login = new CustLogins(customer, cust_login_time, cust_login_ip, cust_login_user_agent, cust_login_security_key);
						//CustLogin customer_login = new CustLogin(customer, cust_login_time, cust_login_ip, cust_login_user_agent, cust_login_security_key);
						CustLoginsDAO.save(customer_login, session);
						//CustLoginDAO.save(customer_login, session);
						
						System.out.println("Done!");
						
						response.sendRedirect("banking?key=" + cust_login_security_key);
						
						
					}
					else {
						System.out.println("Invalid Password");
						
						request.setAttribute("username", username);
												
						String error = "Error: Error: Invalid Password";
						String page  = "/index.jsp";
						reDirect(request, response, error, page);						
						
					}
				}
				
				
			} else {
				System.out.println("Password required!");

				request.setAttribute("username", username);
								
				String error = "Error: Error: Password required!";
				String page  = "/index.jsp";
				reDirect(request, response, error, page);										
				
			}
		}
		else {
			System.out.println("Username required!");
			
			request.setAttribute("username", username);
						
			String error = "Error: Error: Username required!";
			String page  = "/index.jsp";
			reDirect(request, response, error, page);												
			
		}
		
	}

}
