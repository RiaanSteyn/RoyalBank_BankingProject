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

import coza.royalbank.dao.CustomersDAO;
import coza.royalbank.model.Customers;
import coza.royalbank.util.HibernateSessionFactory;

/**
 * Servlet implementation class RegistrationCheckIdNum
 */
@WebServlet("/RegistrationCheckIdNum")
public class RegistrationCheckIdNum extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionFactory sessionFactory = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationCheckIdNum() {
        super();
        this.sessionFactory = HibernateSessionFactory.getSessionFactory();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id_number = request.getParameter("id_num");
		System.out.println(id_number);
		
		Session session 		 = null;
		Customers customer 		 = null;
		boolean id_number_exists = false;
		
		try {
			
			session = sessionFactory.openSession();
			
			try {
				customer = CustomersDAO.checkIdNumberExists(id_number, session);				
				if(customer.getCust_id() > 0) {
					id_number_exists = true;
				}
			} catch (Exception e) {
				System.out.println("No Customer ID");
				id_number_exists = false;
			}
						
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		JSONObject obj = new JSONObject();
		obj.put("id_number_exists", id_number_exists);
		System.out.println(obj);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
//		response.getWriter().write(id_number_exists);
		
	}

}
