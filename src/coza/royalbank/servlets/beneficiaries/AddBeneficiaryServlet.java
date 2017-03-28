package coza.royalbank.servlets.beneficiaries;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import coza.royalbank.dao.AccountsDAO;
import coza.royalbank.dao.BeneficiariesDAO;
import coza.royalbank.dao.CustToAccDAO;
import coza.royalbank.dao.CustomersDAO;
import coza.royalbank.model.Accounts;
import coza.royalbank.model.Beneficiaries;
import coza.royalbank.model.CustToAcc;
import coza.royalbank.model.Customers;
import coza.royalbank.util.Generic;
import coza.royalbank.util.HibernateSessionFactory;
import coza.royalbank.util.ParameterValidate;


@WebServlet("/AddBeneficiaryServlet")
public class AddBeneficiaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private SessionFactory sessionFactory = null;
   
    public AddBeneficiaryServlet() {
        super();
        this.sessionFactory = HibernateSessionFactory.getSessionFactory();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String beneficiary_name = request.getParameter("payment_name");
		String cutomerId = request.getParameter("cust_id");
		String account = request.getParameter("account");
		String accountno = request.getParameter("accountno");
		String accounttype = request.getParameter("accounttype");
		String myref = request.getParameter("myRef");
		String theirRef = request.getParameter("theirRef");
		String method = request.getParameter("method");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		
		if (!ParameterValidate.isValid(beneficiary_name, accountno, myref, theirRef, method, mobile, email)){
			response.sendRedirect("banking/beneficiaries/index.jsp?account=" + account + "&key=" + Generic.getSecurityKey(request, response));
		}
		else
		{
			System.out.println(beneficiary_name + accountno + accounttype + myref + theirRef + method + mobile + email);
			Session session = null;
			session = sessionFactory.openSession(); // open session
			 try{
				 	long acc_num = Long.parseLong(accountno);
				 	List<CustToAcc> cta = CustToAccDAO.getAll(session);
				 	for(CustToAcc c : cta){
				 		if(c.getCust_acc_number() == acc_num){
							int cust_id = Integer.parseInt(cutomerId);
							Customers customer = CustomersDAO.get(cust_id, session); // get Product Object
							int acc_id = c.getAccount().getAcc_id();
							Accounts acc = AccountsDAO.get(acc_id, session); // get Product Object
						    long account_number;
						    account_number = Long.parseLong(accountno);
							Beneficiaries ben = new Beneficiaries(customer , acc, beneficiary_name, account_number, myref, theirRef, method, mobile, email);// Create the new instance to be saved to the database	
							BeneficiariesDAO.save(ben, session); // save to database
				 		
							String req = "banking/beneficiaries/index.jsp?account=" + account + "&key=" + Generic.getSecurityKey(request, response);
							response.sendRedirect(req);
				 		}
				 	}
			 }catch(Exception e){
				 	String req = "banking/beneficiaries/index.jsp?account=" + account + "&key=" + Generic.getSecurityKey(request, response);
				 	response.sendRedirect(req);
			 }
			 finally{
				 
						if(session != null) {
							session.close();
						}
			} // end of try/finally	
	}
	}

}
