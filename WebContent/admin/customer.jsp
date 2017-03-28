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
	
	int id = Integer.parseInt(request.getParameter("customer"));
	Customers cust = CustomersDAO.get(id, sess);
	List<CustToAcc> approved = CustToAccDAO.getAllApproved(sess, id);
	List<CustToAcc> pending = CustToAccDAO.getAllPending(sess, id);
	List<CustToAcc> closed = CustToAccDAO.getAllClosed(sess, id);
	Admin admin = (Admin) request.getSession().getAttribute("liu");
%>
<!DOCTYPE html>
<html>
	<head>
		<title>Royal Bank | Admin - Customer</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<%@ include file = "../links/tablelinks.jsp" %>
		<%@ include file = "../links/accountresources.jsp" %>
	</head>
	<body align="center" style="font-family:Segoe UI;">
		<h1 align="center">Customer</h1>
		
		<div align="right">
			<%= admin.getAdmin_username() %> <a href="">Logout</a>
		</div>		
		
		<h2 align="center"><%= cust.getCust_first_name() + " " + cust.getCust_last_name() %></h2>
		
		<%if(pending.size() != 0) { %>
		<h2>PENDING ACCOUNTS</h2>
		<table class="table table-bordered col-md-4 col-md-offset-4">
			<thead>
				<tr>
					<th><h3>Account</h3></th>
					<th><h3>Application Date</h3></th>
				</tr>
			</thead>
			<% for(CustToAcc p : pending) { %>
			<tbody>
				<tr>				
					<td><a href="account.jsp?account=<%= p.getCust_acc_id() %>"><%= p.getAccount().getAcc_name() %></a></td>
					<td><%= p.getCust_acc_alerts() %></td>
				</tr>
			<% }  %>
			</tbody>
		</table>		
		<% }  %>
		<%if(approved.size() != 0) { %>
		<h3>APPROVED ACCOUNTS</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th><h3>Account Name</h3></th>
					<th><h3>Account Number</h3></th>
					<th><h3>Balance</h3></th>
					<th><h3>Available Balance</h3></th>
				</tr>
			</thead>
			<tbody>
			<% for(CustToAcc a : approved) { %>
				<tr>				
					<td><a href="account.jsp?account=<%= a.getCust_acc_id() %>"><%= a.getAccount().getAcc_name() %></a></td>
					<td><%= a.getCust_acc_number() %></td>
					<td><%= a.getCust_acc_current_balance() %></td>
					<td><%= a.getCust_acc_available_balance() %></td>
				</tr>
			<% } %>
			</tbody>
		</table>
		<% } %>		
		<%if(closed.size() != 0) { %>
		<h3>CLOSED ACCOUNTS</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th><h3>Account Name</h3></th>
					<th><h3>Account Number</h3></th>
					<th><h3>Date Closed</h3></th>
				</tr>
			</thead>
			<tbody>
			<% for(CustToAcc c : closed) { %>
				<tr>				
					<td><a href="account.jsp?account=<%= c.getCust_acc_id() %>"><%= c.getAccount().getAcc_name() %></a></td>
					<td><%= c.getCust_acc_number() %></td>
					<td><%= c.getCust_acc_closed_date() %></td>
				</tr>
			<% } %>
			</tbody>
		</table>
		<% } %>		
	</body>
</html>