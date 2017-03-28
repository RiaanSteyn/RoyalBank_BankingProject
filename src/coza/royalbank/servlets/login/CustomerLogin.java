package coza.royalbank.servlets.login;

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
import coza.royalbank.util.HibernateSessionFactory;
import coza.royalbank.util.ParameterValidate;

/**
 * Servlet implementation class CustomerLogin
 */
@WebServlet("/CustomerLogin")
public class CustomerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionFactory sessionFactory = null;

	public CustomerLogin() {
        super();
        this.sessionFactory = HibernateSessionFactory.getSessionFactory();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String q_username = request.getParameter("login_username");
		String q_password = request.getParameter("login_password");
		
		if(!ParameterValidate.isValid(q_username, q_password)){
			response.sendRedirect("index.jsp");
			System.out.println("null found");
		}else{
			Session session = null;
			try {
				session = sessionFactory.openSession(); // open session
				Customers u = CustomersDAO.login(q_username, q_password, session);
				if(u != null){
					request.getSession().setAttribute("liu", u);
					request.getRequestDispatcher("banking/custhome.jsp").forward(request, response);;
					System.out.println("User logged in successfully");
					
				}else{
					response.sendRedirect("index.jsp");
					System.out.println("User login failed");
				}
			} finally {
				if(session != null) {
					session.close();
				}
			} // end of try/finally
		}
	}


}
