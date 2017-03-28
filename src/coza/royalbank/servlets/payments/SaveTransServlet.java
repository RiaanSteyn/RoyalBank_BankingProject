package coza.royalbank.servlets.payments;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import coza.royalbank.dao.CustToAccDAO;
import coza.royalbank.dao.CustomersDAO;
import coza.royalbank.dao.TransactionsDAO;
import coza.royalbank.model.CustToAcc;
import coza.royalbank.model.Customers;
import coza.royalbank.model.Transactions;
import coza.royalbank.util.Generic;
import coza.royalbank.util.HibernateSessionFactory;


@WebServlet("/SaveTransServlet")
public class SaveTransServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionFactory sessionFactory = null;
        
   
    public SaveTransServlet() {
        super();
        this.sessionFactory = HibernateSessionFactory.getSessionFactory();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String payeroriginalbal = request.getParameter("payer_original_bal");
		String custid = request.getParameter("cust_id");//save to cust_Id field in db
		String custtoaccid = request.getParameter("cust_acc_id");//insert into cust_acc_id field 
		String transpayeename = request.getParameter("trans_payee_name");//insert into trans_payee_name field
		String payeeaccno = request.getParameter("payee_acc_num");
//		String payeeacctype = request.getParameter("payee_account_type");
		String transdesc = request.getParameter("payer_trans_description");//insert intp trans_description field 
		String transdescr = request.getParameter("payer_trans_description");//insert intp trans_description field 
		String transamount = request.getParameter("trans_amount");// insert intp trans_amount field 
		
		Session session = null;
		try{
			
			session = sessionFactory.openSession();
			
			int custID = Integer.parseInt(custid);
			int custToAcc = Integer.parseInt(custtoaccid);
			long payeeAccNo = Long.parseLong(payeeaccno);
			boolean t = true;
			boolean f = false;
			boolean flag = false;
			
			
			List<CustToAcc> accNumber = CustToAccDAO.getAllAcc(session);// checking if account number exists
				for(CustToAcc ac : accNumber)
				{ 
					
					if(payeeAccNo == ac.getCust_acc_number())
					{
						 flag = true;
						 	//int payeeAccType = Integer.parseInt(payeeacctype);
							Date dat = new Date();
							double amount = Double.parseDouble(transamount);
							double payerOriginalBal = Double.parseDouble(payeroriginalbal);
							double payernewBal =TransactionsDAO.getPayerNewBalance(payerOriginalBal, amount);
							
							double serviceFee = 0;
							Customers customer = CustomersDAO.get(custID, session);
							CustToAcc custta = CustToAccDAO.get(custToAcc, session);
							
							CustToAcc cust = CustToAccDAO.getPayeeCustAccID(payeeAccNo, session); // Method for retrieving cust_id and cust_acc_id of payee via account number
							int payeecustta =  cust.getCust_acc_id();
							double payeeOriginalBal = cust.getCust_acc_available_balance();
							double payeenewBal =TransactionsDAO.getPayeeNewBalance(payeeOriginalBal, amount);//adds incoming amount to payee available balance
							int custom = cust.getCustomer().getCust_id();
							CustToAcc payeeCustta = CustToAccDAO.get(payeecustta, session);//payee cust_acc_id
							Customers custo = CustomersDAO.get(custom, session);//payee cust_id
								
								
											Transactions tpayer = new Transactions(customer, custta, transpayeename, dat, transdesc, t, f,  amount, serviceFee, payernewBal);
											TransactionsDAO.save(tpayer, session);//save transaction for payer
											
											Transactions tpayee = new Transactions(custo, payeeCustta, transpayeename, dat, transdescr, f, t, amount, serviceFee, payeenewBal);
											TransactionsDAO.save(tpayee, session);//transaction for payee
											
											custta.setCust_acc_available_balance(payernewBal);
											custta.setCust_acc_current_balance(payernewBal);
											payeeCustta.setCust_acc_available_balance(payeenewBal);
											payeeCustta.setCust_acc_current_balance(payeenewBal);
											CustToAccDAO.update(custta, session);//update available and current balance in cust_acc table for payer
											CustToAccDAO.update(payeeCustta, session);//update available and current balance in cust_acc table for payer
											
											System.out.println("Transaction logged");
											response.sendRedirect("banking/account-settings.jsp?account="+ custToAcc +"&key=" + Generic.getSecurityKey(request, response));	
								
						}
				}
				if(!flag)
				{
					System.out.println("Invalid Account Number/Type");
					response.sendRedirect("banking/payments.jsp");
				}	
		}
		finally
		{
			if(session != null)
			{
				session.close();
			}
		}// end of try/finally
		
		
	}// End of doPost

}
