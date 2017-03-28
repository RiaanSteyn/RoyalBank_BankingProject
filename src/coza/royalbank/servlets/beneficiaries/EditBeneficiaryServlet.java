package coza.royalbank.servlets.beneficiaries;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import coza.royalbank.dao.BeneficiariesDAO;
import coza.royalbank.model.Beneficiaries;
import coza.royalbank.util.Generic;
import coza.royalbank.util.HibernateSessionFactory;
import coza.royalbank.util.ParameterValidate;

@WebServlet("/EditBeneficiaryServlet")
public class EditBeneficiaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private SessionFactory sessionFactory = null;
	 
    public EditBeneficiaryServlet() {
        super();
        this.sessionFactory = HibernateSessionFactory.getSessionFactory();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String ben_id = request.getParameter("ben_id");
		String account = request.getParameter("account");
//		String key = request.getParameter("key");
		String beneficiary_name = request.getParameter("payment_name");
		String accountno = request.getParameter("accountno");
		String accounttype = request.getParameter("accounttype");
		String myref = request.getParameter("myRef");
		String theirRef = request.getParameter("theirRef");
		String method = request.getParameter("method");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		
		if (!ParameterValidate.isValid(beneficiary_name,accountno, accounttype, myref,theirRef, method, mobile, email)){
			System.out.println("Beneficiary not added because of blank parameters.");
			response.sendRedirect("banking/beneficiaries/index.jsp?beneficiary=" + ben_id + "&account=" + account + "&key=" + Generic.getSecurityKey(request, response));
		}
		else{
				int id = Integer.parseInt(ben_id); 
//				long account_number = Long.parseLong(accountno);
				Session session = null;
				try {
					session = sessionFactory.openSession(); // open session
					Beneficiaries ben = BeneficiariesDAO.get(id, session); // get the correct Beneficiary object
					// change the properties of the Beneficiary
					ben.setBen_payment_name(beneficiary_name);
					ben.setBen_from_reference(myref);
					ben.setBen_to_reference(theirRef);
					ben.setBen_pop_type(method);
					ben.setBen_mobile(mobile);
					ben.setBen_email(email);
					
					BeneficiariesDAO.update(ben, session); // save the changes to the database
					String req = "banking/beneficiaries/index.jsp?beneficiary=" + ben_id + "&account=" + account + "&key=" + Generic.getSecurityKey(request, response);
					response.sendRedirect(req);
					
				}catch(Exception e){
					String req = "banking/beneficiaries/index.jsp?beneficiary=" + ben_id +  "&account=" + account + "&key=" + Generic.getSecurityKey(request, response);
					response.sendRedirect(req);
				}
				finally {
					if(session != null) {
						session.close();
					}
				} // end of try/finally
			 // end of if/else
		}
	}
}
