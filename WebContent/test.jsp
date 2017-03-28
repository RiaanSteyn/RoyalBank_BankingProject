<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="coza.royalbank.dao.AdminDAO"%>
<%@page import="coza.royalbank.dao.CustToAccDAO"%>
<%@page import="coza.royalbank.model.*"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="coza.royalbank.util.HibernateSessionFactory"%>
<%@page import="org.hibernate.SessionFactory"%>
<%! @SuppressWarnings("unchecked") %>
<%
	// Get the SessionFactory so that a Session can be created to execute queries
	SessionFactory sessionFactory = HibernateSessionFactory.getSessionFactory();
	Session sess = sessionFactory.openSession();
	
	//List<Admin> admin = AdminDAO.getAll(sess);

%>

<!DOCTYPE html>
<html>
	<head>
		<title>TEST</title>
	</head>
	<body>
	
		<h1>TEST</h1>
		
		<form action="test" method="POST">
		
			<p>
				First Name
				<input type="text" id="first_name" name="first_name">
			</p>
			<p>
				Last Name
				<input type="text" id="last_name" name="last_name">
			</p>
			<p>
				Username
				<input type="text" id="username" name="username">
			</p>
			<p>
				Password
				<input type="password" id="password" name="password">
			</p>
			<p>
				Email
				<input type="text" id="email" name="email">
			</p>
			
			
			<input type="submit" id="submit_test" name="submit_test" value="Test">
				
		</form>
		
		<hr>
		<br>
		<hr>
		
		<table style="border:1px #000 solid;">
			<thead>
				<tr>
					<th>ID</th>
					<th>First Name</th>
					<th>Second Name</th>
					<th>Username</th>
					<th>Password</th>
					<th>Email</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>			
		
	</body>
</html>