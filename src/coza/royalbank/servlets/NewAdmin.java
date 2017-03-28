package coza.royalbank.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import coza.royalbank.dao.AdminDAO;
import coza.royalbank.model.Admin;
import coza.royalbank.util.Generic;
import coza.royalbank.util.HibernateSessionFactory;

/**
 * Servlet implementation class test
 */
@WebServlet("/test")
public class NewAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionFactory sessionFactory = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewAdmin() {
        super();
        this.sessionFactory = HibernateSessionFactory.getSessionFactory();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println(Generic.secureString());
		
		try {
			System.out.println(Generic.generateRandomString(16, Generic.Mode.ALPHA));
			System.out.println(Generic.generateRandomString(24, Generic.Mode.ALPHANUMERIC));
			System.out.println(Generic.generateRandomString(4, Generic.Mode.NUMERIC));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		String admin_first_name	= request.getParameter("first_name");
		String admin_last_name	= request.getParameter("last_name");
		String admin_username	= request.getParameter("username");
		String admin_password	= request.getParameter("password");
		String admin_email		= request.getParameter("email");
		
		Session session = null;
		
		try {
			session = sessionFactory.openSession();			
			Admin admin = new Admin(admin_first_name, admin_last_name, admin_username, admin_password, admin_email);			
			AdminDAO.save(admin, session);
			response.sendRedirect("index.jsp");

		}
		finally {
			
			if(session != null) {
				session.close();
			}
		}
		
	}

}
