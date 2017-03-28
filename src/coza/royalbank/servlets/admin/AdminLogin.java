package coza.royalbank.servlets.admin;

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
import coza.royalbank.util.HibernateSessionFactory;
import coza.royalbank.util.ParameterValidate;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionFactory sessionFactory = null;
	
    public AdminLogin() {
        super();
        this.sessionFactory = HibernateSessionFactory.getSessionFactory();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String q_username = request.getParameter("username");
		String q_password = request.getParameter("password");
		
		if(!ParameterValidate.isValid(q_username, q_password)){
			response.sendRedirect("index.jsp");
			System.out.println("null found");
		}else{
			Session session = null;
			try {
				session = sessionFactory.openSession(); // open session
				Admin u = AdminDAO.login(q_username, q_password, session);
				if(u != null){
					request.getSession().setAttribute("liu", u);
					request.getRequestDispatcher("admin/home.jsp").forward(request, response);
					System.out.println("User logged in successfully");
				}else{
					response.sendRedirect("admin/index.jsp");
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
