<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="org.hibernate.*" %>
<%@ page import="coza.royalbank.util.HibernateSessionFactory" %>
<%@ page import="org.hibernate.SessionFactory" %>

<%@page import="coza.royalbank.dao.BeneficiariesDAO"%>
<%@page import="coza.royalbank.model.Beneficiaries"%>

<%@page import="coza.royalbank.util.Generic"%>

<%@page import="coza.royalbank.util.Generic"%>
<%@ page import="java.util.*" %>

<%
	
	int cust_id = 0;
	String users_name = null;
	if(Generic.checkLogin(request, response)){
		cust_id = Generic.getLoggedInCustID(request, response);
		users_name = Generic.getLoggedInUsersName(request, response);
		if(!Generic.getSecurityKey(request, response).equals(request.getParameter("key"))) {
			Generic.userLogOut(request, response);
		}
	}
	
	String S_beneficiary = request.getParameter("beneficiary");
	int ben_id 			 = Integer.parseInt(S_beneficiary);
	
	SessionFactory sessionFactory = HibernateSessionFactory.getSessionFactory();
	Session sess = sessionFactory.openSession();
	
	Beneficiaries benef = BeneficiariesDAO.get(ben_id, sess);

%>

<!DOCTYPE html>
<html>
	<head>
		<title>Royal Bank | Add Beneficiary</title>
	</head>
	<body align="center" style="font-family:Segoe UI;">
		<h1>Update Beneficiary</h1>
		
		<form action="login" method="POST">
			
			<h3>Payee</h3>
			<p>
				Name
				<input type="text" id="payee_name" name="payee_name" placeholder="Payee Name" value="<%= benef.getBen_payment_name() %>" >
			</p>
			<p>
				Account Type
				<input type="text" id="account_type" name="account_type" placeholder="Account Number" value="<%= benef.getAccount().getAcc_id() %> - <%= benef.getAccount().getAcc_name() %>" readonly >
			</p>
			<p>
				Account Number
				<input type="text" id="account_number" name="account_number" placeholder="Account Number" value="<%= benef.getBen_acc_number() %>" readonly>
			</p>

			<h3>Reference</h3>
			<p>
				My Reference
				<input type="text" id="my_ref" name="my_ref" placeholder="My Reference" value="<%= benef.getBen_from_reference() %>">
			</p>
			<p>
				Their Reference
				<input type="text" id="their_ref" name="their_ref" placeholder="Their Reference" value="<%= benef.getBen_pop_type() %>">
			</p>

			<h3>Proof of Payment</h3>
			<p>
				Method
				<select>
					<option value="0">Select Method</option>
					<option value="sms">SMS</option>
					<option value="email">Email</option>
				</select>
			</p>
			
			<p>
				Email
				<input type="text" id="email" name="email" placeholder="Email" value="<%= benef.getBen_email() %>" >
			</p>
			<p>
				Mobile
				<input type="text" id="mobile" name="mobile" placeholder="Mobile" value="<%= benef.getBen_mobile() %>" >
			</p>

			
			<input type="submit" id="submit_update_beneficiary" name="submit_update_beneficiary" value="Update Beneficiary">
				
		</form>
		
		
	</body>
</html>