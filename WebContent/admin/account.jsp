<%@page import="coza.royalbank.dao.AccountsDAO"%>
<%@page import="coza.royalbank.dao.CustomersDAO"%>
<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@page import="coza.royalbank.dao.CustToAccDAO"%>
<%@page import="coza.royalbank.model.*"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="coza.royalbank.util.HibernateSessionFactory"%>
<%@page import="org.hibernate.SessionFactory"%>
<%
	// Get the SessionFactory so that a Session can be created to execute queries
	SessionFactory sessionFactory = HibernateSessionFactory.getSessionFactory();
	Session sess = sessionFactory.openSession();
	int id = Integer.parseInt(request.getParameter("account"));
	CustToAcc cust = CustToAccDAO.get(id, sess);
	int cust_id = cust.getCustomer().getCust_id();
	Admin admin = (Admin) request.getSession().getAttribute("liu");
%>
<!DOCTYPE html>
<html>
	<head>
		<title>Royal Bank | Admin - Account</title>
		<%@ include file = "../links/tablelinks.jsp" %>
		<%@ include file = "../links/accountresources.jsp" %>
		
		<script type="text/javascript">

	$(document).ready(function() {
		
		$("#declineButton").on('click', function(){
		
			$('.decline').slideToggle('slow');
			
		})
		
	
	});

	

</script>
	</head>
	<body align="center" style="font-family:Segoe UI;">
		<h1>Account</h1>
		
		<div align="right">
			<%= admin.getAdmin_username() %> <a href="">Logout</a>
		</div>		
		
		<h2><%= cust.getAccount().getAcc_name() %></h2>
		<h3><% if(cust.getCust_acc_approved() == false && cust.getCust_acc_declined() == false){%>
			Pendding
			<% } else if(cust.getCust_acc_approved() == true && cust.getCust_acc_declined() == false && cust.getCust_acc_closed() == false){ %>
			Approved
			<% } else if(cust.getCust_acc_approved() == false && cust.getCust_acc_declined() == true){%>
			Decline
			<% } else if(cust.getCust_acc_approved() == true && cust.getCust_acc_closed() == true){ %>
			Closed
			<% } %>
		</h3>
		
		<div>
			Account Number <input type="text" id="account_number" name="account_number" readonly>
			
			<br>
			<br>
			
			Occupation 
			<input type="text" id="occupation" name="occupation" readonly value="<%= cust.getCustomer().getCust_occupation() %>"/>
			<br><br>
			<% if(!cust.getCustomer().getCust_occupation().equalsIgnoreCase("employed")){ %>
			<div id="student">
				Institution 	<input type="text" id="institution" name="institution" readonly value="<%= cust.getCustomer().getCust_occupation() %>"/>
				Student Number  <input type="text" id="student_number" name="student_number" readonly value="<%= cust.getCustomer().getCust_occupation() %>"/>
			</div>
			<% } else { %>
			<div id="employed">
				Company 		 <input type="text" id="company" name="company" readonly value="<%= cust.getCustomer().getCust_company() %>"/>
				Employee Number  <input type="text" id="employee_number" name="employee_number" readonly value="<%= cust.getCustomer().getCust_employee_number()%>"/>
				Salary		     <input type="text" id="salary" name="salary" readonly value="<%= cust.getCustomer().getCust_salary() %>"/>
			</div>	
			<% } %>
			<h5>FICA Documents</h5>
			<% if(!cust.getCustomer().getCust_occupation().equalsIgnoreCase("employed")){ %>
				<a href="uploads/fica_documents/customer_<%= cust.getCustomer().getCust_id() %>/identity_document.pdf" target="_blank">identity_document.pdf</a> <br>
			<% } else { %>
				<a href="FICA Documents.pdf"<%= cust.getCustomer().getCust_id() %>target="_blank">salary_slip.pdf</a>		
			<% } %>
			<br><br>
			<% if(cust.getCust_acc_approved() == false && cust.getCust_acc_declined() == false && cust.getCust_acc_closed() == false){ %>
			<div id="pending_account">
				<form action="../ApproveAccountServlet" method="post">
					<input type="submit" value="Approve Account"/>
					<input type="hidden" name="approved_customer_id" value="<%= cust_id %>"/>
					<input type="hidden" name="acc_type" value="<%= cust.getAccount().getAcc_id() %>"/>
					<input type="hidden" name="account" value="<%= id %>"/>
				</form>
				<input type="button" id="declineButton" value="Decline Account">
				<br><br>
				<div id="decline_account" style="display:none;" class="decline">
					<form action="../DeclineAccountServlet" method="post">
					<textarea rows="5" cols="30" name="decline_reason" placeholder="Reason to Decline..."></textarea> <br>
						<input type="submit" value="Decline Account"/>
						<input type="hidden" name="account" value="<%= id %>"/>
						<input type="hidden" name="customer_id" value="<%= cust_id %>"/>
					</form>							
				</div>
			</div>
			<% } else if((cust.getCust_acc_approved() == true ^ cust.getCust_acc_declined() == true) && cust.getCust_acc_closed() == false) { %>
			<div id="close_account">
				<form action="../CloseAccountServlet" method="post">
					<input type="submit" value="Close Account">
					<input type="hidden" name="account" value="<%= id %>"/>							
					<input type="hidden" name="customer_id" value="<%= cust_id %>"/>
				</form>	
			</div>
			<% } %>
		</div>
	</body>
</html>