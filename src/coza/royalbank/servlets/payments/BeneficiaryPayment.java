package coza.royalbank.servlets.payments;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
import coza.royalbank.dao.TransactionsDAO;
import coza.royalbank.model.Accounts;
import coza.royalbank.model.Beneficiaries;
import coza.royalbank.model.CustToAcc;
import coza.royalbank.model.Customers;
import coza.royalbank.model.Transactions;
import coza.royalbank.util.Generic;
import coza.royalbank.util.HibernateSessionFactory;

/**
 * Servlet implementation class BeneficiaryPayment
 */
@WebServlet("/BeneficiaryPayment")
public class BeneficiaryPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionFactory sessionFactory = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BeneficiaryPayment() {
        super();
        this.sessionFactory = HibernateSessionFactory.getSessionFactory();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Session session = null;
		
		try {
			session = sessionFactory.openSession();
			
			int cust_id = Generic.getLoggedInCustID(request, response);
			
			int from_account_id    = Integer.parseInt(request.getParameter("from_account_id"));
			int ben_id    = Integer.parseInt(request.getParameter("beneficiary"));
			double amount = Double.parseDouble(request.getParameter("amount"));
			
			Beneficiaries beneficiary = BeneficiariesDAO.get(ben_id, session);
					
			String payee_name 	   		= beneficiary.getBen_payment_name();
			long to_account_number 		= beneficiary.getBen_acc_number();
			Accounts to_account_type    = beneficiary.getAccount();
			String my_ref 		   		= beneficiary.getBen_from_reference();
			String their_ref 	   		= beneficiary.getBen_to_reference();
			
//			String method 		   		= beneficiary.getBen_pop_type();
//			String mobile 		   		= beneficiary.getBen_mobile();
//			String email 		   		= beneficiary.getBen_email();
			Date trans_date 	   		= Generic.getDate();
			
			// Payer
			Customers payer 		 	 = CustomersDAO.get(cust_id, session);
			CustToAcc payers_account 	 = CustToAccDAO.get(from_account_id, session);
			double payers_curr_balance	 = payers_account.getCust_acc_current_balance() - amount;
			double payers_avail_balance	 = payers_account.getCust_acc_available_balance() - amount;
			
			Transactions payers_transaction = new Transactions();
			payers_transaction.setCustomer(payer);
			payers_transaction.setCust_to_acc(payers_account);
			payers_transaction.setTrans_payee_name(payee_name);
			payers_transaction.setTrans_date(trans_date);
			payers_transaction.setTrans_description(my_ref);
			payers_transaction.setTrans_debit(true);
			payers_transaction.setTrans_credit(false);
			payers_transaction.setTrans_amount(amount);
			payers_transaction.setTrans_service_fee(0.00);
			payers_transaction.setTrans_balance(payers_avail_balance);
			
			TransactionsDAO.save(payers_transaction, session);
			
			payers_account.setCust_acc_current_balance(payers_curr_balance);
			payers_account.setCust_acc_available_balance(payers_avail_balance);
			CustToAccDAO.update(payers_account, session);
			
			// Payee
			Accounts account_type 			 = AccountsDAO.get(to_account_type.getAcc_id(), session);
			List<CustToAcc> payees_accounts	 = CustToAccDAO.getPayeesAccount(to_account_number, account_type, session);
			
			int payees_account_id = 0, payees_cust_id = 0;
			for (CustToAcc custToAcc : payees_accounts) {
				payees_account_id = custToAcc.getCust_acc_id();
				payees_cust_id    = custToAcc.getCustomer().getCust_id();
			}
			
			Customers payee 		 	 = CustomersDAO.get(payees_cust_id, session);
			
			CustToAcc payees_account 	 = CustToAccDAO.get(payees_account_id, session);
			
			double payees_curr_balance	 = payees_account.getCust_acc_current_balance() + amount;
			double payees_avail_balance	 = payees_account.getCust_acc_available_balance() + amount;
			
			
			
			Transactions payees_transaction = new Transactions();
			payees_transaction.setCustomer(payee);
			payees_transaction.setCust_to_acc(payees_account);
			payees_transaction.setTrans_payee_name(payee_name);
			payees_transaction.setTrans_date(trans_date);
			payees_transaction.setTrans_description(their_ref);
			payees_transaction.setTrans_debit(false);
			payees_transaction.setTrans_credit(true);
			payees_transaction.setTrans_amount(amount);
			payees_transaction.setTrans_service_fee(0.00);
			payees_transaction.setTrans_balance(payees_avail_balance);			
			TransactionsDAO.save(payees_transaction, session);
			
			payees_account.setCust_acc_current_balance(payees_curr_balance);
			payees_account.setCust_acc_available_balance(payees_avail_balance);
			CustToAccDAO.update(payees_account, session);
			
			//check if transactions where successful, then redirect
			String beneficiary_payment_success_msg = "Payment Successful.";
			String page  = "/banking/account.jsp?account=" + from_account_id + "&key=" + Generic.getSecurityKey(request, response);
	    	request.setAttribute("beneficiary_payment_success_msg", beneficiary_payment_success_msg);	    	
	    	RequestDispatcher rd = getServletContext().getRequestDispatcher(page);			
			rd.include(request, response);
			

			
			
		}
		finally {
			if(session != null) {
				session.close();
			}
		}
		
		
	}

}
