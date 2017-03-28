<%@page import="coza.royalbank.dao.CustomersDAO"%>
<%@page import="coza.royalbank.dao.CustToAccDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="org.hibernate.*" %>
<%@ page import="coza.royalbank.util.HibernateSessionFactory" %>
<%@ page import="org.hibernate.SessionFactory" %>

<%@ page import="coza.royalbank.model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="coza.royalbank.dao.AccountsDAO" %>
<%@ page import="coza.royalbank.dao.BeneficiariesDAO" %>


<%@page import="coza.royalbank.util.Generic"%>

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
	String account = request.getParameter("account");
	// Get the SessionFactory so that a Session can be created to execute queries
	SessionFactory sessionFactory = HibernateSessionFactory.getSessionFactory();
	Session sess = sessionFactory.openSession();
	
	List<Beneficiaries> ben = BeneficiariesDAO.getAll(cust_id, sess); 
	Customers acc = CustomersDAO.get(cust_id, sess);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Royal Bank | Beneficiaries</title>
<%@ include file = "../../links/profileresources.jsp" %>
</head>
 <body>
<!-- container section start -->
		<section id="container" class="">
			<header class="header dark-bg">
				<div class="toggle-nav">
					<div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"></div>
	            </div>
	            <!--logo start-->
	            <a href="../../index.jsp" class="logo">Royal <span class="lite">Bank</span></a>
	            <!--logo end-->
	            <div class="top-nav notification-row">                
					<!-- notificatoin dropdown start-->
	                <ul class="nav pull-right top-menu">
	                    <li>
	                        <a href="../../index.jsp"> Log Out </a>
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
	                	<a class="" href="../index.jsp?key=<%= Generic.getSecurityKey(request, response) %>">
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
	                    	<li><a class="" href="../profile/index.jsp?key=<%= Generic.getSecurityKey(request, response) %>">View</a></li>                          
	                        <li><a class="" href="../profile/update.jsp?key=<%= Generic.getSecurityKey(request, response) %>">Update</a></li>
						</ul>
					</li> 
					<li class="sub-menu">
	                	<a href="javascript:;" class="">
		                    <i class="icon_document_alt"></i>
		                    <span>Account</span>
		                    <span class="menu-arrow arrow_carrot-right"></span>
	                    </a>
						<ul class="sub">
		                    <li><a class="" href="../account-application.jsp?<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">Application</a></li>                          
		                    <li><a class="" href="../account-settings.jsp?<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">Settings</a></li>
							<li><a class="" href="../account-payments.jsp?<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">Payments</a></li>
	                    </ul>
					</li>       
					<li class="sub-menu">
	                	<a href="javascript:;" class="">
		                    <i class="icon_desktop"></i>
		                    <span>Beneficiaries</span>
		                    <span class="menu-arrow arrow_carrot-right"></span>
	                    </a>
	                    <ul class="sub">
	                        <li><a class="" href="index.jsp?key=<%= Generic.getSecurityKey(request, response) %>">My beneficiaries</a></li>
	                    	<li><a class="" href="new.jsp?key=<%= Generic.getSecurityKey(request, response) %>">New</a></li>
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
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i><a href="../index.jsp?key=<%= Generic.getSecurityKey(request, response) %>">Home</a></li>
							<li><i class="fa fa-home"></i><a href="../account-application.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">Application</a></li>
							<li><i class="fa fa-home"></i><a href="../account-settings.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">Account Settings</a></li>
							<li><i class="fa fa-home"></i><a href="../account-payments.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">Account Payments</a></li>
							<li><i class="fa fa-home"></i><a href="../beneficiaries/new.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">New Beneficiary</a></li>
						</ol>
					</div>
				</div>              
			 	  
			<div class="panel panel-default">
				<div class="table-responsive">          
					<table class="table" onclick="forward(update.jsp)">
					    <thead>
					    	<tr>
						        <th>Payee</th>
						        <th>Account</th>
								<th>Account Number</th>
							</tr>
					    </thead>
					    <tbody>
			 				 <% for(Beneficiaries beneficiary : ben) { %>
								<tr>				
									<td><%= beneficiary.getBen_payment_name() %></td>
									<td><%= beneficiary.getAccount().getAcc_name() %></td>
									<td><%= beneficiary.getBen_acc_number() %></td>
									<td><a href="update.jsp?beneficiary=<%= beneficiary.getBen_id() %>&account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">Update</a></td>
									<td></td>									
								</tr>
							<% } %> 
	    				</tbody>
					</table>
				</div>
			</div>
			<!-- end of statements -->		  
        	</section>
	    </section>
	    <!--main content end-->
	 </section>
	 <!-- container section start -->
  </body>
</html>
