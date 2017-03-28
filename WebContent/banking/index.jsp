<%@page import="org.hibernate.Session"%>
<%@page import="coza.royalbank.util.HibernateSessionFactory"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.List"%>
<%@page import="coza.royalbank.dao.*"%>
<%@page import="coza.royalbank.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
	SessionFactory sessionFactory = HibernateSessionFactory.getSessionFactory();
	Session sess = sessionFactory.openSession();
	
	Customers acc = CustomersDAO.get(cust_id, sess);
	List<CustToAcc> customerAccounts = CustToAccDAO.getCustomerAccount(cust_id, sess);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Royal Bank | <%= acc.getCust_first_name() + " " + acc.getCust_last_name() %> Home</title>
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
            <div class="row">
            <% for(CustToAcc account : customerAccounts){  %>
				<%if(account.getAccount().getAcc_id() == 5 && (account.getCust_acc_approved() == true && account.getCust_acc_closed() == false && account.getCust_acc_declined() == false)){ %>
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box green-bg">
					<div class="title">Islamic Card</div>	
						<div class="count"><%= account.getCust_acc_current_balance() %></div>
						<p>Balance</p>							
					</div><!--/.info-box-->			
				</div><!--/.col-->	
				<% } else if(account.getAccount().getAcc_id() == 4 && (account.getCust_acc_approved() == true && account.getCust_acc_closed() == false && account.getCust_acc_declined() == false)){ %>
								<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box brown-bg">
						<div class="title">Platinum Card</div>
						<div class="count"><%= account.getCust_acc_current_balance()  %></div>
						<p>Balance</p>							
					</div><!--/.info-box-->			
				</div><!--/.col-->	
				<% } else if(account.getAccount().getAcc_id() == 3 && (account.getCust_acc_approved() == true && account.getCust_acc_closed() == false && account.getCust_acc_declined() == false)){ %>
								<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box brown-bg">
						<div class="title">Gold Card</div>
						<div class="count"><%= account.getCust_acc_current_balance() %></div>
						<p>Balance</p>							
					</div><!--/.info-box-->			
				</div><!--/.col-->	
				<% } else if(account.getAccount().getAcc_id() == 2 && (account.getCust_acc_approved() == true && account.getCust_acc_closed() == false && account.getCust_acc_declined() == false)){ %>
								<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box brown-bg">
						<div class="title">Silver Card</div>
						<div class="count"><%= account.getCust_acc_current_balance() %></div>
						<p>Balance</p>							
					</div><!--/.info-box-->			
				</div><!--/.col-->	
				<% } else if(account.getAccount().getAcc_id() == 1 && (account.getCust_acc_approved() == true && account.getCust_acc_closed() == false && account.getCust_acc_declined() == false)){ %>
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box dark-bg">
						<div class="title">Student  Card</div>
						<div class="count"><%= account.getCust_acc_current_balance() %></div>
						<p>Balance</p>					
					</div><!--/.info-box-->			
				</div><!--/.col-->
				<%} else  if(account.getAccount().getAcc_id() == 6 && (account.getCust_acc_approved() == true && account.getCust_acc_closed() == false && account.getCust_acc_declined() == false)){ %>
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box blue-bg">
						<div class="title">Business Card</div>
						<div class="count"><%= account.getCust_acc_current_balance() %></div>
						<p>Balance</p>						
					</div><!--/.info-box-->			
				</div><!--/.col-->
				<% } %>
			<% } %>
			</div><!--/.row-->
			
           <div class="row">
		   <div class="col-lg-9">
                      <section class="panel">                        
                        <header class="panel-heading">
                              Cheque Accounts
                          </header>
                      <div class="panel-body">
                        <div class="panel panel-primary">
                          <div class="panel-heading">My Cheque Account  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; Account No:  </div>
							<% for(CustToAcc account : customerAccounts){ %>
							<% if(account.getCust_acc_approved() == true && account.getCust_acc_closed() == false){ %>
                          <a href="account-settings.jsp?account=<%= account.getCust_acc_id() %>&key=<%= Generic.getSecurityKey(request, response) %>" class="list-group-item"><%= account.getAccount().getAcc_name() %> &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;   <span></span><span><%= account.getCust_acc_number() %></span></a>
							<% } %>
							<% } %>
                        </div>          
                       
                        <div class="panel panel-danger">
                          <div class="panel-heading">My Pending Cheque Account &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp;  &nbsp;  Date: </div>
                           	<% for(CustToAcc account : customerAccounts){ %>
								<% if(account.getCust_acc_approved() == false && account.getCust_acc_declined() == false){ %>
		                        	<a href="#" class="list-group-item"><%= account.getAccount().getAcc_name() %> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span></span><span><%= account.getCust_acc_approved_date() %></span> </a>
                        		<% } %>
							<% } %>
                        </div>
                          <div class="panel panel-info">
                          <div class="panel-heading">Apply for Cheque Account</div>
								<a href="account-application.jsp?account_type=Student&key=<%= Generic.getSecurityKey(request, response) %>" class="list-group-item">Student Cheque Account</a>
	                      		<a href="account-application.jsp?account_type=Cheque&key=<%= Generic.getSecurityKey(request, response) %>" class="list-group-item">Standerd Cheque Account</a>
								<a href="account-application.jsp?account_type=Islamic&key=<%= Generic.getSecurityKey(request, response) %>" class="list-group-item">Islamic Cheque Account</a>
								<a href="account-application.jsp?account_type=Business&key=<%= Generic.getSecurityKey(request, response) %>" class="list-group-item">Business Cheque Account</a>
                        </div>
                        </div>
    	            </section>
				</div>
			</div>  
		</section>
  	<!--main content end-->
  </section>
  <!-- container section start -->
</body>
</html>