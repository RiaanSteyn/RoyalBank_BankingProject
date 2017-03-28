<%@page import="coza.royalbank.dao.CustomersDAO"%>
<%@page import="coza.royalbank.util.Generic"%>
<%@page import="java.util.Objects"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="coza.royalbank.dao.TransactionsDAO"%>
<%@page import="coza.royalbank.model.Transactions"%>
<%@page import="coza.royalbank.model.Customers"%>
<%@page import="coza.royalbank.dao.CustToAccDAO"%>
<%@page import="coza.royalbank.model.CustToAcc"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="coza.royalbank.util.HibernateSessionFactory"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	SessionFactory sf = HibernateSessionFactory.getSessionFactory();
	Session sess = sf.openSession();
	
	CustToAcc custtoaccs = CustToAccDAO.get(cust_id, sess);
	List<Transactions> trans = TransactionsDAO.getAll(sess);
	List<CustToAcc> cust = CustToAccDAO.getAllA(cust_id, sess);
	
	Customers acc = CustomersDAO.get(cust_id, sess);
	List<CustToAcc> customerAccounts = CustToAccDAO.getCustomerAccount(cust_id, sess);

%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Royal Bank | <%= acc.getCust_first_name() + " " + acc.getCust_last_name() %> Account Settings</title>
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
					<li class="sub-menu">
	                	<a href="javascript:;" class="">
		                    <i class="icon_document_alt"></i>
		                    <span>Account</span>
		                    <span class="menu-arrow arrow_carrot-right"></span>
	                    </a>
						<ul class="sub">
		                    <li><a class="" href="account-settings.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">Settings</a></li>
							<li><a class="" href="account-payments.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">Payments</a></li>
	                    </ul>
					</li>       
					<li class="sub-menu">
	                	<a href="javascript:;" class="">
		                    <i class="icon_desktop"></i>
		                    <span>Beneficiaries</span>
		                    <span class="menu-arrow arrow_carrot-right"></span>
	                    </a>
	                    <ul class="sub">
	                        <li><a class="" href="beneficiaries/index.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">My beneficiaries</a></li>
	                    	<li><a class="" href="beneficiaries/new.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">New</a></li>
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
							<li><i class="fa fa-home"></i><a href="index.jsp?key=<%= Generic.getSecurityKey(request, response) %>">Home</a></li>
							<li><i class="fa fa-home"></i><a href="account-application.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">Application</a></li>
							<li><i class="fa fa-home"></i><a href="account-settings.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">Account Settings</a></li>
							<li><i class="fa fa-home"></i><a href="account-payments.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">Account Payments</a></li>
							<li><i class="fa fa-home"></i><a href="beneficiaries/index.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">My beneficiary</a></li>
							<li><i class="fa fa-home"></i><a href="beneficiaries/new.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">New Beneficiary</a></li>
						</ol>
					</div>
				</div>              
  
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#setting">Settings</a></li>
    <li><a data-toggle="tab" href="#detailedbalance">Detailed Balance</a></li>
    <li><a data-toggle="tab" href="#transactionhistory">Transaction History</a></li>
    <li><a data-toggle="tab" href="#statements">Statements</a></li>
	<li><a  href="account-payments.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">Payments</a></li>
  </ul>

  <div class="tab-content">
    <div id="setting" class="tab-pane fade in active">
      
	  <div class="panel panel-default">
					<form class="form-inline" method="post" action="../UpdateSettings">
						<p></p>
						<p></p>
						<p></p>
						<div class="row">
							<div class="col-md-2 padding-top-25">
								 <label for="alerts" class="control-label">Alerts</label>
							<select name="method" id="alert" class="form-control">
							<%if(custtoaccs.getCust_acc_alerts().equalsIgnoreCase("email")){ %>
								<option  <%= custtoaccs.getCust_acc_alerts()%> >email</option>
								<option  <%= custtoaccs.getCust_acc_alerts()%>>sms</option>
							<% } else if(custtoaccs.getCust_acc_alerts().equalsIgnoreCase("sms")){ %>
							    <option  <%= custtoaccs.getCust_acc_alerts()%> >sms</option>
								<option  <%= custtoaccs.getCust_acc_alerts()%>>email</option>
							<% } %>
							</select>
							</div>
						</div>

						<p></p>
						<p></p>

						<div class="row">
							<div class="col-md-4 padding-top-5">
								<label for="daily" class="control-label">Daily Limit:</label> <input
									type="text" class="form-control" id="daily"
									name="daily_limit"
									value="<%=custtoaccs.getCust_acc_daily_limit()%>" />
							</div>
						</div>
						<p></p>
						<p></p>
						<div class="row">
							<div class="col-md-4 padding-top-5">
								<label for="monthly" class="control-label">Monthly
									Limit:</label> <input type="text" class="form-control" id="monthly"
									name="monthly_limit"
									value="<%=custtoaccs.getCust_acc_monthly_limit()%>" />
							</div>
						</div>
						<p></p>
						<p></p>
						<div class="row">
							<div class="col-md-2"></div>
								<div class="col-md-2">
									<input type="submit" class="btn btn-default" value="Update"/>
								<input type="hidden" name="account"
									value="<%= account %>" />
							</div>
						</div>
						<p></p>
						<p></p>
					</form>
				</div>
		    </div>
	 <!-- end of settings -->
	 
	  <!-- start detailed balance -->
    <div id="detailedbalance" class="tab-pane fade">
      <div class="panel panel-default">
					<form class="form-inline" action="">
						<p></p>
						<p></p>
						<p></p>
						<div class="row">
							<div class="col-md-4 padding-top-5">
								<label for="city" class="control-label">Balance:</label> <input
									type="text" class="form-control" id="balance"
									name="cust_acc_current_balance"
									value="<%=custtoaccs.getCust_acc_current_balance()%>" />
							</div>
						</div>
						<p></p>
						<p></p>
						<div class="row">
							<div class="col-md-4 padding-top-5">
								<label for="city" class="control-label">Pending Debits:</label>
								<input type="text" class="form-control" id="daily"
									placeholder="pending debits" value="0.0" />
							</div>
						</div>
						<p></p>
						<p></p>
						<div class="row">
							<div class="col-md-4 padding-top-5">
								<label for="city" class="control-label">Pending Credits:</label>
								<input type="text" class="form-control" id="daily"
									placeholder="monthly limit" value="0.0" />
							</div>
						</div>
						<p></p>
						<p></p>
						<div class="row">
							<div class="col-md-4 padding-top-5">
								<label for="city" class="control-label">Available
									Balance:</label> <input type="text" class="form-control" id="balance"
									name="cust_acc_current_balance"
									value="<%=custtoaccs.getCust_acc_available_balance()%>" />
							</div>
						</div>
						<p></p>
						<p></p>
					</form>
				</div>
		    </div>
			 <!-- end of detailed balance -->
			 
			  <!-- start of transaction -->
		<div id="transactionhistory" class="tab-pane fade">
			<div class="panel panel-default">
				<div class="table-responsive">
					<table class="table">
						<thead>
						 	<tr>
						        <th>Date</th>
						        <th>Description</th>
								<th>Service Fee</th>
								<th>Amount</th>
								<th>Bal</th>
					    	</tr>
					    </thead>
					    <tbody>
					    	<% for(Transactions  d : trans) { %>
					      	<tr>
						        <td><%= d.getTrans_date() %></td>
						        <td><%= d.getTrans_description() %></td>
								<td><%= d.getTrans_service_fee() %></td>
						        <td><%= d.getTrans_amount()  %></td>
								<td><%= d.getTrans_balance() %></td>
					      	</tr>
					    	<%} %>	
						</tbody>
					</table>
				</div>
			</div>
		</div>
			 <!-- end of transaction -->
			
			 <!-- start of statements -->
		    <div id="statements" class="tab-pane fade">
		     <div class="panel panel-default">
							<div class="table-responsive">          
		  <table class="table">
		    <thead>
		      <tr>
		        <th>Month</th>
		        <th>Pages</th>
				<th>View</th>
		      </tr>
		    </thead>
		    <tbody>
		    <% for(Transactions  d : trans) { %>
			
			<%  Format ed = new SimpleDateFormat("MMMMyyyy");%>
		   
		      <tr>
		        <td><a href="#"><%= ed.format(d.getTrans_date()) %></a></td>
		        
		        <td>page here</td>
				<td>view</td>
		        
				
		      </tr>
		
		     <%} %>	
			    </tbody>
			  </table>
							</div>
						</div>
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
