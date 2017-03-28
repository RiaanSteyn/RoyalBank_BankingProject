package coza.royalbank.servlets.payments;

import java.io.IOException;
import java.util.Date;

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

@WebServlet("/SaveInterAccTransServlet")
public class SaveInterAccTransServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionFactory sessionFactory = null;
    
    public SaveInterAccTransServlet() {
        super();
        this.sessionFactory = HibernateSessionFactory.getSessionFactory();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String payeroriginalbal = request.getParameter("payer_original_bal");
		String custid = request.getParameter("cust_id");//save to cust_Id field in db
		String custtoaccid = request.getParameter("cust_acc_id");//insert into cust_acc_id field 
		String transpayeename = request.getParameter("trans_payee_name");//insert into trans_payee_name field
		String payeeaccno = request.getParameter("payee_acc_num");
		//String payeeacctype = request.getParameter("payee_account_type");
		String transdesc = request.getParameter("payer_trans_description");//insert intp trans_description field 
		String transdescr = request.getParameter("payee_trans_description");//insert intp trans_description field
		String transamount = request.getParameter("trans_amount");// insert intp trans_amount field 
		
		

		Session session = null;
		try{
			
			session = sessionFactory.openSession();
			
			int custID = Integer.parseInt(custid);
			int custToAcc = Integer.parseInt(custtoaccid);
			int payeeAccNo = Integer.parseInt(payeeaccno);
			boolean debit = false;
			boolean credit = false;
			
			
			Date dat = new Date();
			double amount = Double.parseDouble(transamount);
			
			double payerOriginalBal = Double.parseDouble(payeroriginalbal);
			
			
			double payernewBal =TransactionsDAO.getPayerNewBalance(payerOriginalBal, amount);
			double payeenewBal =TransactionsDAO.getPayeeNewBalance(payerOriginalBal, amount);
			double serviceFee = 0;
			
			Customers customer = CustomersDAO.get(custID, session);//payer
			CustToAcc custta = CustToAccDAO.get(custToAcc, session);// payer
			CustToAcc cust = CustToAccDAO.getPayeeCustAccID(payeeAccNo, session);
			int payeecustta = cust.getCust_acc_id();
			CustToAcc payeeCustta = CustToAccDAO.get(payeecustta, session);
			
			Transactions tpayer = new Transactions(customer, custta, transpayeename, dat, transdesc, debit, credit, amount, serviceFee, payernewBal);
			TransactionsDAO.save(tpayer, session);//transaction for payer
			
			Transactions tpayee = new Transactions(customer, payeeCustta, transpayeename, dat, transdesc, debit, credit, amount, serviceFee, payeenewBal);
			TransactionsDAO.save(tpayee, session);//transaction for payer
			
			custta.setCust_acc_available_balance(payernewBal);
			custta.setCust_acc_current_balance(payernewBal);
			payeeCustta.setCust_acc_available_balance(payeenewBal);
			payeeCustta.setCust_acc_current_balance(payeenewBal);
			CustToAccDAO.update(custta, session);//update available and current balance in cust_acc table for payer
			CustToAccDAO.update(payeeCustta, session);//update available and current balance in cust_acc table for payer
			
			response.sendRedirect("banking/account-settings.jsp?account="+ custToAcc +"&key=" + Generic.getSecurityKey(request, response));
			
		}
		finally
		{
			if(session != null)
			{
				session.close();
			}// end of try/finally
		}
	}

}
