package coza.royalbank.servlets.accounts;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import coza.royalbank.dao.AccountsDAO;
import coza.royalbank.dao.CustToAccDAO;
import coza.royalbank.dao.CustomersDAO;
import coza.royalbank.model.Accounts;
import coza.royalbank.model.CustToAcc;
import coza.royalbank.model.Customers;
import coza.royalbank.util.Generic;
import coza.royalbank.util.HibernateSessionFactory;

/**
 * Servlet implementation class AccountApplication
 */
@WebServlet("/AccountApplication")
public class AccountApplication extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SessionFactory sessionFactory = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountApplication() {
        super();
        this.sessionFactory = HibernateSessionFactory.getSessionFactory();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cust_id = Generic.getLoggedInCustID(request, response);

		String acc_type 	   = request.getParameter("account_type");		
		String occupation 	   = request.getParameter("occupation");		
		String institution 	   = request.getParameter("institution");
		String student_number  = request.getParameter("student_number");
		String company 		   = request.getParameter("company");
		String employee_number = request.getParameter("employee_number");
		String salary 		   = request.getParameter("salary");
		
//		System.out.println(occupation);
//		System.out.println(institution);
//		System.out.println(student_number);
//		System.out.println(company);
//		System.out.println(employee_number);
		
		int acc_id = 0;
		double sal = 0;
		if(occupation.equalsIgnoreCase("Student")){
			company = null;
			employee_number = null;
			salary = null;
			acc_id = 1;
		}else if(occupation.equalsIgnoreCase("Employed")){
			institution = null;
			student_number = null;
			sal = Double.parseDouble(salary);
		}
		Session session = null;
		try {
			if(((sal >= 3000.00) && (sal <= 8000.00)) && acc_type.equalsIgnoreCase("Cheque")){
				acc_id = 2; 
			} else if(((sal > 8000.00) && (sal <= 20000.00)) && acc_type.equalsIgnoreCase("Cheque")){
				acc_id = 3;
			} else if((sal > 20000.00) && acc_type.equalsIgnoreCase("Cheque")){
				acc_id = 4;
			} else if(acc_type.equalsIgnoreCase("islamic")){
				acc_id = 5;
			} else if(acc_type.equalsIgnoreCase("Business")){
				acc_id = 6;
			}
			session = sessionFactory.openSession();
			
			Customers customer = CustomersDAO.get(cust_id, session);			
			
			customer.setCust_occupation(occupation);
			customer.setCust_institution(institution);
			customer.setCust_student_number(student_number);
			customer.setCust_company(company);
			customer.setCust_employee_number(employee_number);
			customer.setCust_salary(sal);
			
			CustomersDAO.update(customer, session);
			
			System.out.println(acc_type);
			//check if update was successful
			
			
				
				Accounts account = AccountsDAO.get(acc_id, session);
				
				long cust_acc_number = 0;
				double cust_acc_daily_limit = 250.00;
				double cust_acc_monthly_limit = 1000.00;
				String cust_acc_alerts		  = "email";
				double cust_acc_current_balance = 0.00;
				double cust_acc_available_balance = 0.00;
				CustToAcc custAcc = new CustToAcc(customer, account, Generic.getDate(), cust_acc_number, cust_acc_daily_limit, cust_acc_monthly_limit, cust_acc_alerts, cust_acc_current_balance, cust_acc_available_balance);
				CustToAccDAO.save(custAcc, session);
			
//			 File Upload
			
			String saveFile = new String();
			String contentType = request.getContentType();
			
			if((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)){
				
				DataInputStream in = new DataInputStream(request.getInputStream());
				
				int formDataLength = request.getContentLength();
				byte dataBytes[] = new byte[formDataLength];
				int byteRead = 0;
				int totalBytesRead = 0;
				
				while(totalBytesRead < formDataLength){
					byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
					totalBytesRead += byteRead;
				}
				
				String file = new String(dataBytes);

				saveFile = file.substring(file.indexOf("filename=\"") + 10);
				saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
				saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
				

//				int lastIndex = contentType.lastIndexOf("*");
				
//				String boundary = contentType.substring(lastIndex + 1, contentType.length());
				
				int pos;
				
				pos = file.indexOf("filename=\"");
				pos = file.indexOf("\n", pos) + 1;
				pos = file.indexOf("\n", pos) + 1;
				pos = file.indexOf("\n", pos) + 1;
				
//				int boundaryLocation = file.indexOf(boundary, pos) - 4;
				
				int startPos = ((file.substring(0, pos)).getBytes()).length;
				int endPos = ((file.substring(0, pos)).getBytes()).length;

				saveFile = "C:/Users\\Riaan\\workspace\\royalBank_last_final\\WebContent\\uploadss/" + saveFile;
				
															 			 
   			    File filess = new File("C:\\Users\\Riaan\\workspace\\royalBank_last_final\\WebContent\\uploadss");
						  
				if (!filess.exists()) {
				    if (filess.mkdir()) {
				        System.out.println("Directory is created!");
				} else {
				    System.out.println("Failed to create directory!");
				    }
				}
				
				
				File ff = new File(saveFile);
				
				
				try{
					FileOutputStream fileOut = new FileOutputStream(ff);
					fileOut.write(dataBytes, startPos, (endPos - startPos ));
					fileOut.flush();
					fileOut.close();
					
				} catch (Exception e){
					 System.err.println(e);
				}
			}			
			response.sendRedirect("index.jsp?key=" + Generic.getSecurityKey(request, response));
		}
		finally {
			if(session != null) {
				session.close();
			}//end of if
		}//end of finally
	}//end of do post
}
