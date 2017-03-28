<%@page import="coza.royalbank.dao.CustomersDAO"%>
<%@page import="coza.royalbank.model.Customers"%>
<%@page import="java.util.List"%>
<%@page import="coza.royalbank.dao.CustToAccDAO"%>
<%@page import="coza.royalbank.model.CustToAcc"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="coza.royalbank.util.HibernateSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="coza.royalbank.util.Generic"%>

<%
	String account_type = request.getParameter("account_type");
	int cust_id = 4;
	String users_name = null;
	if(Generic.checkLogin(request, response)){
		cust_id = Generic.getLoggedInCustID(request, response);
		users_name = Generic.getLoggedInUsersName(request, response);
		if(!Generic.getSecurityKey(request, response).equals(request.getParameter("key"))) {
			Generic.userLogOut(request, response);
		}
	}
	
	SessionFactory sessionFactory = HibernateSessionFactory.getSessionFactory();
	Session sess = sessionFactory.openSession();

	Customers acc = CustomersDAO.get(cust_id, sess);
	List<CustToAcc> customerAccounts = CustToAccDAO.getCustomerAccount(cust_id, sess);

%>

<!DOCTYPE html>
<html>
	<head>
		<title>Royal Bank | <%= acc.getCust_first_name() + " " + acc.getCust_last_name() %> Account Application</title>
		<%@ include file = "../links/accountresources.jsp" %>
	</head>
	<body>
		<!-- container section start -->
		<section id="container" class="">
			<header class="header dark-bg">
				<div class="toggle-nav">
					<div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"></div>
	            </div>
	            <!--logo start-->
	            <a href="../index.jsp" class="logo">Royal <span class="lite">Bank</span></a>
	            <!--logo end-->
	            <div class="top-nav notification-row">                
					<!-- notificatoin dropdown start-->
	                <ul class="nav pull-right top-menu">
	                    <li>
	                        <a href="../index.jsp"> Log Out </a>
	                    </li>
	                </ul>
	                <!-- notificatoin dropdown end-->
	            </div>
			</header>      
			<!--header end-->
	
			<!--sidebar start-->
			<aside>
				<div id="sidebar"  class="nav-collapse ">
					<!-- sidebar menu start-->
					<ul class="sidebar-menu">                
					<li class="active">
	                	<a class="" href="index.jsp?key=<%= Generic.getSecurityKey(request, response) %>">
	                    	<i class="icon_house_alt"></i>
	                        <span>Home</span>
	                    </a>
					</li>
					<li class="sub-menu">
						<a href="javascript:;" class="">
		                    <i class="icon_document_alt"></i>
		                    <span>Profile</span>
		                    <span class="menu-arrow arrow_carrot-right"></span>
	                    </a>
						<ul class="sub">
	                    	<li><a class="" href="profile/index.jsp?key=<%= Generic.getSecurityKey(request, response) %>">View</a></li>                          
	                        <li><a class="" href="profile/update.jsp?key=<%= Generic.getSecurityKey(request, response) %>">Update</a></li>
						</ul>
					</li> 
				</ul>
	            <!-- sidebar menu end-->
			</div>
		</aside>
		<!--sidebar end-->
	      
		<!--main content start-->
		<section id="main-content">
	    	<section class="wrapper">            
	        	<!--overview start-->
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header"><i class="fa fa-laptop"></i><%= acc.getCust_first_name() + " " + acc.getCust_last_name() + " Homepage" %></h3>
					</div>
				</div>		
		<h1>Account Application</h1>
		
		<form action="../AccountApplication" method="post">
		
<%-- 			<input type="hidden" id="account_type" name="account_type" value="<%= request.getParameter("type") %>"> --%>
			<p>
				<label class="control-label">Occupation</label>
				<select id="occupation" class="form-control" name="occupation">
					<option value="0">Select</option>
					<option value="student">Student</option>
					<option value="employed">Employed</option>
				</select>
			</p>
			
			<p>
				<h3>Account type : <%= account_type %></h3>
				<input id="account_type" class="form-control" name="account_type" type="hidden" value="<%= account_type %>">
			</p>
			
			<div id="student">
				<p>
					<label class="control-label">Institution</label>
					<input type="text" class="form-control" id="institution" name="institution">
				</p>
				<p>
					<label class="control-label">Student Number</label>
					<input type="text" class="form-control" id="student_number" name="student_number">
				</p>			
			</div>
			
			<div id="employed">
				<p>
					<label class="control-label">Company</label>
					<input type="text" class="form-control" id="company" name="company">
				</p>
				<p>
					<label class="control-label">Employee Number</label>
					<input type="text" class="form-control" id="employee_number" name="employee_number">
				</p>
				<p>
					<label class="control-label">Salary</label>
					<input type="text" class="form-control" id="salary" name="salary">
				</p>			
			</div>
			
			<hr>
			<h3>FICA Documents</h3>
			<p>
				<label class="control-label">Uplaod Document</label>
				<input type="file" class="form-control" id="id_doc" name="id_doc">
			</p>
			<input type="submit" class="form-control" id="submit_application" name="submit_application" value="Apply">
		</form>
		</section>
		</section>
		</section>
	</body>
</html>