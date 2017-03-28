<%@page import="coza.royalbank.dao.BeneficiariesDAO"%>
<%@page import="coza.royalbank.model.Beneficiaries"%>
<%@page import="coza.royalbank.util.Generic"%>
<%@page import="coza.royalbank.model.Customers"%>
<%@page import="coza.royalbank.dao.CustomersDAO"%>
<%@page import="coza.royalbank.util.HibernateSessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="coza.royalbank.dao.CustToAccDAO"%>
<%@page import="coza.royalbank.model.CustToAcc"%>
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
	String ben_id = request.getParameter("beneficiary");
	String key = request.getParameter("key");
	
	SessionFactory sessionFactory = HibernateSessionFactory.getSessionFactory();
	Session sess = sessionFactory.openSession();

	Customers acc = CustomersDAO.get(cust_id, sess);
	Beneficiaries ben = BeneficiariesDAO.get(Integer.parseInt(ben_id), sess);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Royal Bank | Beneficiary Update</title>
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
	                	<a class="" href="../index.jsp">
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
		                    <li><a class="" href="../account-settings.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">Settings</a></li>
							<li><a class="" href="../account-payments.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">Payments</a></li>
	                    </ul>
					</li>       
					<li class="sub-menu">
	                	<a href="javascript:;" class="">
		                    <i class="icon_desktop"></i>
		                    <span>Beneficiaries</span>
		                    <span class="menu-arrow arrow_carrot-right"></span>
	                    </a>
	                    <ul class="sub">
	                        <li><a class="" href="index.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">My beneficiaries</a></li>
	                    	<li><a class="" href="new.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">New</a></li>
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
							<li><i class="fa fa-home"></i><a href="../index.jsp?key=<%= Generic.secureString() %>">Home</a></li>
							<li><i class="fa fa-home"></i><a href="../account-application.jsp?account=<%= account %>&key=<%= Generic.secureString() %>">Application</a></li>
							<li><i class="fa fa-home"></i><a href="../account-settings.jsp?account=<%= account %>&key=<%= Generic.secureString() %>">Account Settings</a></li>
							<li><i class="fa fa-home"></i><a href="../account-payments.jsp?account=<%= account %>&key=<%= Generic.secureString() %>">Account Payments</a></li>
							<li><i class="fa fa-home"></i><a href="../beneficiaries/new.jsp?account=<%= account %>&key=<%= Generic.secureString() %>">New Beneficiary</a></li>
						</ol>
					</div>
				</div>
             <div class="row">
                  <div class="col-lg-6">
                      <section class="panel">
                          <header class="panel-heading">
                              Update Beneficiary
                          </header>
                          <div class="panel-body">
						  
						     
                              <form action="../../EditBeneficiaryServlet" method="post">
							     <div class="form-group">
								 <h3><strong>Payee</strong></h3>
								 
                                      <label for="exampleInputEmail1">Name</label>
                                      <input type="institution" class="form-control" name="payment_name" id="institution" placeholder="Payee name" value="<%= ben.getBen_payment_name() %>"/>
                                  </div>
								 
								   <div class="form-group">
                                      <label  for="Occupation">Account Type</label>
                                     
                                          <select id="occupation" name="accounttype">
                                              <option value="0">select</option>
                                              <option value="student">Student</option>
                                              <option value="cheque">Cheque</option>
                                             
                                          </select>
						            </div>
									 
									 <div class="form-group">
                                      <label for="exampleInputEmail1">Account Number</label>
                                      <input type="account_no" class="form-control" name="accountno" id="institution" placeholder="account number" value="<%= ben.getBen_acc_number() %>"/>
                                  </div>
									
							   <h3><strong>Reference</strong></h3>
							  
                                  <div class="form-group">
                                      <label for="exampleInputEmail1">My Reference</label>
                                      <input type="my_reference" class="form-control" name="myRef" id="institution" placeholder="my reference" value="<%= ben.getBen_to_reference() %>">
                                  </div>
                                  <div class="form-group">
                                      <label for="exampleInputPassword1">Their Reference</label>
                                      <input type="their-reference" class="form-control" name="theirRef" id="studentno" placeholder="their reference" value="<%= ben.getBen_from_reference() %>"/>
                                  </div>
								  <h3><strong>Proof of Payment</strong></h3>
								  
								   <div class="form-group">
                                      <label  for="Occupation">Method</label>
                                     
                                          <select id="occupation" name="method">
                                              <option value="0">Select Method</option>
                                              <option value="student">SMS</option>
                                              <option value="cheque">Email</option>
                                             
                                          </select>
						            </div>
								  
								   <div class="form-group">
                                      <label for="exampleInputPassword1">Email</label>
                                      <input type="email" class="form-control" name="email" id="company" placeholder="Enter email" value="<%= ben.getBen_email() %>"/>
                                  </div>
								   <div class="form-group">
                                      <label for="exampleInputPassword1">Mobile</label>
                                      <input type="mobile" class="form-control" name="mobile" id="employee" placeholder="Enter mobile" value="<%= ben.getBen_mobile() %>"/>
                                      <input type="hidden" class="form-control" name="key" id="employee" placeholder="Enter mobile" value="<%= key %>"/>
                                      <input type="hidden" class="form-control" name="ben_id" id="employee" placeholder="Enter mobile" value="<%= ben_id %>"/>
                                  	  <input type="hidden" name="account" value="<%= account %>"/>
                                  </div>
								  
                                  <button type="submit" class="btn btn-primary">Update Beneficiary</button>
                              </form>

                          </div>
     		 </section>
      <!--main content end-->
  	</section>
 	<!-- container section start -->

    <!-- javascripts -->
    <!-- javascripts -->
        
    <script src="js/jquery-1.8.3.min.js"></script>
    <!-- javascripts -->
    
    <!-- bootstrap -->
    <script src="js/bootstrap.min.js"></script>
	
    <!-- nice scroll -->
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <!-- nice scroll -->
    
    <!--custome script for all page-->
    <script src="js/scripts.js"></script>
    <!-- custom script for this page-->
	<script src="jss/jquery1.11.3"></script>
  </body>
</html>
