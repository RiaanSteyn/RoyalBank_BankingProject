<%@page import="coza.royalbank.util.Generic"%>
<%@page import="coza.royalbank.dao.CustomersDAO"%>
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
		
	String 
		title 			  	  = null, 
		first_name 		      = null, 
		last_name 			  = null, 
		id_number 			  = null, 
		email 				  = null, 
		landline 	 		  = null, 
		mobile 		 		  = null, 
		residential_address   = null,
		residential_province  = null, 
		residential_post	  = null, 
		postal_address		  = null, 
		postal_province		  = null, 
		postal_post			  = null,
		username 			  = null;	
	
	if(Generic.checkLogin(request, response)){
		cust_id = Generic.getLoggedInCustID(request, response);
		users_name = Generic.getLoggedInUsersName(request, response);
		if(!Generic.getSecurityKey(request, response).equals(request.getParameter("key"))) {
			Generic.userLogOut(request, response);
		}		
	
		// Get the SessionFactory so that a Session can be created to execute queries
		SessionFactory sessionFactory = HibernateSessionFactory.getSessionFactory();
		Session sess = sessionFactory.openSession();
		
		
		Customers customer = CustomersDAO.get(cust_id, sess);
		
		title 				 = customer.getCust_title();
		first_name 			 = customer.getCust_first_name();
		last_name 			 = customer.getCust_last_name();
		id_number 			 = customer.getCust_id_number();
		email				 = customer.getCust_email();
		landline 			 = customer.getCust_landline();
		mobile 			     = customer.getCust_mobile();
		residential_address  = customer.getCust_residential_address();
		residential_province = customer.getCust_residential_province();
		residential_post 	 = customer.getCust_residential_postcode();
		postal_address 		 = customer.getCust_postal_address();
		postal_province 	 = customer.getCust_postal_province();
		postal_post 		 = customer.getCust_postal_postcode();
		username 			 = customer.getCust_username();
		
	}
			
%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Royal Bank | Profile Update</title>
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
		                    	<li><a class="" href="index.jsp?key=<%= Generic.getSecurityKey(request, response) %>">View</a></li>                          
		                        <li><a class="" href="update.jsp?key=<%= Generic.getSecurityKey(request, response) %>">Update</a></li>
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
									<h3 class="page-header"><i class="fa fa-laptop"></i><%= first_name + " " + last_name + " Homepage" %></h3>
									<ol class="breadcrumb">
										<li><i class="fa fa-home"></i><a href="../index.jsp?key=<%= Generic.getSecurityKey(request, response) %>">Home</a></li>
										<li><i class="fa fa-home"></i><a href="index.jsp?key=<%= Generic.getSecurityKey(request, response) %>">View Details</a></li>
									</ol>
								</div>
							</div>              
							 <div class="panel-body">
								<form action="../../UpdateProfile" method="post">
									<div class="row">
										<div class="col-md-2 padding-top-5">
											<label for="title" class="control-label">Title:</label>
											<select id="title" name="title" class="form-control">
												<option value="mr">Mr</option>
												<option value="mrs">Mrs</option>
												<option value="mrs">Ms</option>
												<option value="mrs">Dr</option>
											</select>
										</div>
										<div class="col-md-3 padding-top-5">
										    <label for="city" class="control-label">Name:</label>
										    <input type="text" class="form-control" id="first_name" name="first_name" placeholder="First Name" value="<%= first_name %>" />
										</div>
										<div class="col-md-3 padding-top-5">
										    <label for="city" class="control-label">Last Name:</label>
										    <input type="text" class="form-control" id="last_name" name="last_name" placeholder="Last Name" value="<%= last_name %>" />
										</div>
											<div class="col-md-4 padding-top-5">
											<label for="city" class="control-label">Identity Number:</label>
											<input type="text" class="form-control" id="id_num" name="id_num" placeholder="ID Number" readonly value="<%= id_number %>" />
										</div>
									</div>
									<div class="row">
										<div class="col-md-4 padding-top-10">
											<label for="email" class="control-label">Email Adress:</label>
										    <input type="text" class="form-control" id="email" name="email" placeholder="Email" readonly value="<%= email %>" />
										</div>
										<div class="col-md-4 padding-top-10">
										    <label for="city" class="control-label">LandLine:</label>
										    <input type="text" class="form-control" id="landline" name="landline" placeholder="Landline" value="<%= landline %>" />
										</div>
										<div class="col-md-4 padding-top-10">
										    <label for="city" class="control-label">Mobile:</label>
										    <input type="text" class="form-control" id="mobile" name="mobile" placeholder="Mobile" value="<%= mobile %>" />
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 padding-top-10">
											<label for="address1" class="control-label">Residential Address:</label>
											<input type="text" class="form-control" name="residential_address" placeholder="Residential Address" value="<%= residential_address %>" />
										</div>
									</div> 
									<div class="row">
										<div class="col-md-4 padding-top-10">
											<label for="title" class="control-label">Province:</label>
											<select id="title" class="form-control" name="residential_province">
												<option value="Gauteng">Gauteng</option>
												<option value="Limpopo">Limpopo</option>
												<option value="North West">North West</option>
												<option value="Mpumalanga">Mpumalanga</option>
												<option value="Free State">Free State</option>
												<option value="KwaZulu Natal">KwaZulu Natal</option>
												<option value="Northern Cape">Northern Cape</option>
												<option value="Eastern Cape">Eastern Cape</option>
												<option value="Western Cape">Western Cape</option>
											</select>
										</div>
										<div class="col-md-3 padding-top-10">
											<label for="city" class="control-label">Postal Code:</label>
											<input type="text" class="form-control" id="residential_post" name="residential_post" placeholder="Post Code" value="<%= residential_post %>" />
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 padding-top-10">
											<div class="checkbox">
												<label><input type="checkbox" id="same_address" name="same_address" />Same as Residential</label>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 padding-top-10">
											<label for="address1" class="control-label">Postal Address:</label>
											<input type="text" class="form-control" name="postal_address" placeholder="Residential Address" value="<%= postal_address %>" />
										</div>
									</div> 
									<div class="row">
										<div class="col-md-4 padding-top-10">
											<label for="title" class="control-label">Province:</label>
											<select id="postal_address" name="postal_province" class="form-control" >
												<option value="Gauteng">Gauteng</option>
												<option value="Limpopo">Limpopo</option>
												<option value="North West">North West</option>
												<option value="Mpumalanga">Mpumalanga</option>
												<option value="Free State">Free State</option>
												<option value="KwaZulu Natal">KwaZulu Natal</option>
												<option value="Northern Cape">Northern Cape</option>
												<option value="Eastern Cape">Eastern Cape</option>
												<option value="Western Cape">Western Cape</option>
											</select>
										</div>
										<div class="col-md-3 padding-top-10">
											<label for="city" class="control-label">Postal Code:</label>
											<input type="text" class="form-control" id="postal_post" name="postal_post" placeholder="Post Code" value="<%= postal_post %>" />
										</div>
									</div>
									<div class="row">
										<div class="col-md-2"> 
											<button type="submit" id="submit_reg" name="submit_reg" class="btn btn-success">Update Profile</button>
										</div>
									</div>
								</form>
							</div>
							<!-- end of statements -->		  
            			</section>
 	     			</section>
				<!--main content end-->
			</section>
		<!-- container section start -->
	</body>
</html>
