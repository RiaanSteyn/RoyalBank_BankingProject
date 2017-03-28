package coza.royalbank.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class sendEmailServlet
 */
@WebServlet("/sendEmailServlet")
public class sendEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sendEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String to 	    = request.getParameter("to");
		String subject  = request.getParameter("subject");
		String message  = request.getParameter("message");
		String user     = request.getParameter("user");
		String password = request.getParameter("password");
		
		if(to == null || subject == null || message == null || user == null || password == null){
			System.out.println("Null Parameters!");
			request.getRequestDispatcher("send-mail.jsp").forward(request, response);
			
		}
		else {
			System.out.println("Sending Email...");
			coza.royalbank.util.SendMail.send(to, subject, message, user, password);
			request.getRequestDispatcher("send-mail.jsp").forward(request, response);
		}
		
	}

}
