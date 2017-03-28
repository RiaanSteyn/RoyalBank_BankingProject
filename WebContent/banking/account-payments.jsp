<%@page import="coza.royalbank.util.Generic"%>
<%@page import="coza.royalbank.dao.CustomersDAO"%>
<%@ page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="coza.royalbank.dao.TransactionsDAO"%>
<%@page import="coza.royalbank.model.Transactions"%>
<%@page import="coza.royalbank.model.Customers"%>
<%@page import="coza.royalbank.dao.CustToAccDAO"%>
<%@page import="coza.royalbank.model.CustToAcc"%>
<%@page import="coza.royalbank.model.Beneficiaries" %>
<%@page import="coza.royalbank.dao.BeneficiariesDAO" %>
<%@page import="java.util.List"%>
<%@page import="java.text.DateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="org.hibernate.Session"%>
<%@page import="coza.royalbank.util.HibernateSessionFactory"%>
<%@page import="org.hibernate.SessionFactory"%>
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

	Customers acc = CustomersDAO.get(cust_id, sess);
	List<CustToAcc> customerAccounts = CustToAccDAO.getCustomerAccount(cust_id, sess);
	CustToAcc custtoaccs = CustToAccDAO.get(Integer.parseInt(account), sess);
	List<Transactions> trans = TransactionsDAO.getAll(sess);
  
	int ben_id=1;
	List<CustToAcc> cust = CustToAccDAO.getAllA(cust_id, sess);
	List<Beneficiaries> ben = BeneficiariesDAO.getAll(cust_id, sess);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Royal Bank | <%= acc.getCust_first_name() + " " + acc.getCust_last_name() %> Payments</title>
<%@ include file = "../links/accountresources.jsp" %>
<link rel="stylesheet" href="../resources/css/bootstrapValidator.min.css"/>
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
	                        <li><a class="" href="beneficiaries/index.jsp??account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">My beneficiaries</a></li>
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
							<li><i class="fa fa-home"></i><a href="account-settings.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">Account Settings</a></li>
							<li><i class="fa fa-home"></i><a href="account-payments.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">Account Payments</a></li>
							<li><i class="fa fa-home"></i><a href="beneficiaries/index.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">My Beneficiaries</a></li>
							<li><i class="fa fa-home"></i><a href="beneficiaries/new.jsp?account=<%= account %>&key=<%= Generic.getSecurityKey(request, response) %>">New Beneficiary</a></li>
						</ol>
					</div>
				</div>  
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="pill" href="#onceoff">Once-Off-Payment</a></li>
			<li><a data-toggle="pill" href="#inter">Inter-Account Transfer </a></li>
			<li><a data-toggle="pill" href="#new">Pay Beneficiary</a></li>
			<li><a data-toggle="pill" href="#view">View</a></li>
			
  </ul>

  <div class="tab-content">
    <div id="onceoff" class="tab-pane fade in active">
      
	  <div class="panel panel-default">
          <form id="OnceOff" class="form-inline" action="../SaveTransServlet" method="post">
					<p></p>
					<p></p>
					<p></p>
					<div class="row">
						   <div class="col-md-2 padding-top-25">
						    <label for="alerts" class="control-label">Pay from Account</label>
							<select id="alert" class="form-control" name="payer_original_bal">
								<% for (CustToAcc c : cust) { %>
								<option  value="<%= c.getCust_acc_available_balance() %>"><%= c.getAccount().getAcc_name() + " - " +  c.getCust_acc_number() + " - Available Balance: R " + c.getCust_acc_available_balance() %></option>
								<%} %>	
							</select>
						     </div>
                     </div>
					 <% for (CustToAcc c : cust) { %>
					 <p><input type="hidden" name="cust_id" value="<%= c.getCustomer().getCust_id()  %>" /><br /></p>
					 <p><input type="hidden" name="cust_acc_id" value="<%= c.getCust_acc_id() %>" /><br /></p>
					 <%} %>
					 <div class="row">
					  	<div class="col-md-4 padding-top-5">
						    <label for="city" class="control-label">Payee Name:</label>
						    <input type="text" class="form-control" name="trans_payee_name" value="" id="daily" placeholder="name"
						     data-bv-notempty data-bv-notempty-message="*Required Field" />
						    
						</div>
					</div>
						   <p></p>
						   <p></p>
						   <script>
		$(document).ready(function() {
			$('#accountno').blur(function() {
		    	$.ajax(
		               {
		        		url:"../CheckAccountExists",
		                type:'POST',
		                dataType: 'json',
		                data: {
		               		"accountno": $('#accountno').val()
		                },
		                	
		                success:function(data)
		                {
		                	if(data!=null) {
		                		
		                		if(!data.account_exists) {
		                			
		                			$('#accountno_exists').html("The Account Number <span style='color:#000;'>" + $('#accountno').val() + "</span> is not valid.").css('padding-bottom', '15px');
		                			$('#accountno').css('border', '1px solid #F00');
		                		}
		                		else {
		                			
		                			$('#accountno_exists').text("");
		                			$('#accountno').css('border', '1px solid #0F0');			                			
		                		}
		                		
		                       
		                     }
		                     else {
		                         alert("Its null")
		                     }
		                 }
						}
		        	   )
					   return false;
		         
			}); 
		});
	</script>         	
						   
						    <div class="row">
						  <div class="col-md-4 padding-top-5">
						    <label for="city" class="control-label">Account Number:</label>
						    <input type="text" class="form-control" name="payee_acc_num" value="" id="accountno" placeholder="account number"
						     data-bv-notempty data-bv-notempty-message="*Required Field" />
						    
						   </div>
						   <div id="accountno_exists" style="width:100%; color:#F00;" align="center"></div>
						   </div>
						    <p></p>
						   <p></p>
						   
						   <!--  <div class="row">
						  <div class="col-md-4 padding-top-5">
						    <label for="city" class="control-label">Account type:</label>
						    <select id="alert" class="form-control" name="payee_account_type">
								<option value="0">Select Account</option>
								<option value="1">Student</option>
								<option value="2">Silver</option>
								<option value="3">Gold</option>
								<option value="4">Platinum</option>
								<option value="5">Islamic</option>
								<option value="5">Business</option>
							</select>
						   </div>
						   </div> -->
						    <p></p>
						   <p></p>
						   
						   
						   
						   <div class="row">
						  <div class="col-md-4 padding-top-5">
						    <label for="city" class="control-label">Amount:</label>
						   
						    <input type="text" class="form-control" name="trans_amount" id="account" placeholder="amount " 
						     data-bv-notempty data-bv-notempty-message="*Required Field"/>
						    
						   </div>
						   </div>
						    <p></p>
						   <p></p>
						   
						   <div class="row">
						  <div class="col-md-4 padding-top-5">
						    <label for="city" class="control-label">My REF:</label>
						    <input type="text" class="form-control" name="payer_trans_description" id="ref" placeholder="" 
						     data-bv-notempty data-bv-notempty-message="*Required Field"/>
						   </div>
						   </div>
						    <p></p>
						   <p></p>
						   
						   <div class="row">
						  <div class="col-md-4 padding-top-5">
						    <label for="city" class="control-label">Their REF:</label>
						    <input type="text" class="form-control" name="payee_trans_description" id="accounttype" placeholder="" 
						     data-bv-notempty data-bv-notempty-message="*Required Field"/>
						   </div>
						   </div>
						    
							 <div class="row">
						  <div class="col-md-4 padding-top-5">
						  <hr>
						  Proof of payment here
						  <hr>
						  </div>
						  </div>
						   <p></p>
						   
						   
						   <div class="row">
						   <div class="col-md-2 padding-top-25">
						    <label for="alerts" class="control-label">Method</label>
							<select id="alert" class="form-control">
								<option value="sms">SMS</option>
								<option value="email">Email</option>
							</select>
						     </div>
							  <div class="col-md-4 padding-top-5">
						    <label for="city" class="control-label">Mobile:</label>
						    <input type="text" class="form-control" id="accounttype" placeholder="mobile" />
						   </div>
						    <div class="col-md-4 padding-top-5">
						    <label for="city" class="control-label">Email:</label>
						    <input type="text" class="form-control" id="accounttype" placeholder="email" />
						   </div>
							 
                     </div>
					 
					 <p></p>
					 <p></p>
						   
						   
						   
						   
						    <div class="row">
							 <div class="col-md-2"> </div>
						   <div class="col-md-2"> 
						    <button type="submit" class="btn btn-primary">Transfer</button>
							</div>
							</div>
					  <p></p>
						   <p></p>
						   
			</form>
								   
	   </div>
 
	  
    </div>
	
	 <!-- end of once off -->
	 
	 
	 
	  <!-- start detailed balance -->
    <div id="inter" class="tab-pane fade">
      <div class="panel panel-default">
          <form id="InterAcc" class="form-inline" action="../SaveInterAccTransServlet" method="post">
					<p></p>
					<p></p>
					<p></p>
					<div class="row">
						   <div class="col-md-2 padding-top-25">
						    <label for="alerts" class="control-label">Pay from Account</label>
							<select id="alert" class="form-control" name="payer_original_bal">
								<% for (CustToAcc c : cust) { %>
								<option  value="<%= c.getCust_acc_available_balance() %>"><%= c.getAccount().getAcc_name() + " - " +  c.getCust_acc_number() + " - Available Balance: R " + c.getCust_acc_available_balance() %></option>
								<%} %>	
							</select>
						     </div>
                     </div>
					 <% for (CustToAcc c : cust) { %>
					 <p><input type="hidden" name="cust_id" value="<%= c.getCustomer().getCust_id()  %>" /><br /></p>
					 <p><input type="hidden" name="cust_acc_id" value="<%= c.getCust_acc_id() %>" /><br /></p>
					 <%} %>
					 
						   <p></p>
						   <p></p>
						  <div class="row">
						   <div class="col-md-2 padding-top-25">
						    <label for="alerts" class="control-label">Pay To Account</label>
							<select id="alert" class="form-control" name="payee_acc_num">
								<% for (CustToAcc c : cust) { %>
								<option  value="<%= c.getCust_acc_number() %>"><%= c.getAccount().getAcc_name() + " - " +  c.getCust_acc_number() + " - Available Balance: R " + c.getCust_acc_available_balance() %></option>
								<%} %>	
							</select>
						     </div>
                     </div>
						   
						    <p></p>
						   <p></p>
						   <div class="row">
						  <div class="col-md-4 padding-top-5">
						    <label for="city" class="control-label">Amount:</label>
						    <input type="text" class="form-control" name="trans_amount" id="account" placeholder="amount "
						      data-bv-notempty data-bv-notempty-message="*Required Field" />
						   </div>
						   </div>
						    <p></p>
						   <p></p>
						   
						   <div class="row">
						  <div class="col-md-4 padding-top-5">
						    <label for="city" class="control-label">My REF:</label>
						    <input type="text" class="form-control" name="payer_trans_description" id="ref" placeholder="my reference"
						      data-bv-notempty data-bv-notempty-message="*Required Field" /> 
						   </div>
						   </div>
						    <p></p>
						   <p></p>
						    
							 <div class="row">
						  <div class="col-md-4 padding-top-5">
						  <hr>
						  Proof of payment here
						  <hr>
						  </div>
						  </div>
						   <p></p>
						   
						   
						   <div class="row">
						   <div class="col-md-2 padding-top-25">
						    <label for="alerts" class="control-label">Method</label>
							<select id="alert" class="form-control">
								<option value="sms">SMS</option>
								<option value="email">Email</option>
							</select>
						     </div>
							  <div class="col-md-4 padding-top-5">
						    <label for="city" class="control-label">Mobile:</label>
						    <input type="text" class="form-control" id="accounttype" placeholder="mobile" />
						   </div>
						    <div class="col-md-4 padding-top-5">
						    <label for="city" class="control-label">Email:</label>
						    <input type="text" class="form-control" id="accounttype" placeholder="email" />
						   </div>
							 
                     </div>
					 
					 <p></p>
					 <p></p>
						    <div class="row">
							 <div class="col-md-2"> </div>
						   <div class="col-md-2"> 
						    <button type="submit" class="btn btn-primary">Transfer</button>
							</div>
							</div>
					  <p></p>
						   <p></p>
			</form>
		</div>	   
	   </div>
	 <!-- end of inter account -->
	 
	 
	  <!-- start of new -->
	
    <div id="new" class="tab-pane fade">
     <div class="panel panel-default">
           <form id="Ben" class="form-inline" action="../SaveBenTransServlet" method="post">
					<p></p>
					<p></p>
					<p></p>
					<div class="row">
						   <div class="col-md-2 padding-top-25">
						    <label for="alerts" class="control-label">Pay from Account</label>
							<select id="alert" class="form-control" name="payer_original_bal">
								<% for (CustToAcc c : cust) { %>
								<option  value="<%= c.getCust_acc_available_balance() %>"><%= c.getAccount().getAcc_name() + " - " +  c.getCust_acc_number() + " - Available Balance: R " + c.getCust_acc_available_balance() %></option>
								<%} %>	
							</select>
						     </div>
                     </div>
					 <% for (CustToAcc c : cust) { %>
					 <p><input type="hidden" name="cust_id" value="<%= c.getCustomer().getCust_id()  %>" /><br /></p>
					 <p><input type="hidden" name="cust_acc_id" value="<%= c.getCust_acc_id() %>" /><br /></p>
					 <%} %>
					 
						   <p></p>
						   <p></p>
						  <div class="row">
						   <div class="col-md-2 padding-top-25">
						    <label for="alerts" class="control-label">Beneficiary</label>
							<select id="alert" class="form-control" name="payee_acc_num">
								<%for(Beneficiaries b : ben){ %>
								<option  value="<%= b.getBen_acc_number() %>"><%= b.getBen_acc_number() + " - " +  b.getBen_payment_name() %></option>	
								<%} %>
							</select>
						     </div>
                     </div>
						    <p></p>
						   <p></p>
						   <div class="row">
						  <div class="col-md-4 padding-top-5">
						    <label for="city" class="control-label">Amount:</label>
						    <input type="text" class="form-control" name="trans_amount" id="account" placeholder="amount "
						     data-bv-notempty data-bv-notempty-message="*Required Field" /> 
						   </div>
						   </div>
						    <p></p>
						   <p></p>
						   
						   <div class="row">
						  <div class="col-md-4 padding-top-5">
						    <label for="city" class="control-label">My REF:</label>
						    <input type="text" class="form-control" name="payer_trans_description" id="ref" placeholder="my reference" 
						     data-bv-notempty data-bv-notempty-message="*Required Field" />
						   </div>
						   </div>
						    <p></p>
						   <p></p>
							 <div class="row">
						  <div class="col-md-4 padding-top-5">
						  <hr>
						  Proof of payment here
						  <hr>
						  </div>
						  </div>
						   <p></p>
						   <div class="row">
						   <div class="col-md-2 padding-top-25">
						    <label for="alerts" class="control-label">Method</label>
							<select id="alert" class="form-control">
								<option value="sms">SMS</option>
								<option value="email">Email</option>
							</select>
						     </div>
							  <div class="col-md-4 padding-top-5">
						    <label for="city" class="control-label">Mobile:</label>
						    <input type="text" class="form-control" id="accounttype" placeholder="mobile" />
						   </div>
						    <div class="col-md-4 padding-top-5">
						    <label for="city" class="control-label">Email:</label>
						    <input type="text" class="form-control" id="accounttype" placeholder="email" />
						   </div>
                     </div>
					 <p></p>
					 <p></p>
				<div class="row">
					<div class="col-md-2"> </div>
					<div class="col-md-2"> 
						<button type="submit" class="btn btn-primary">Transfer</button>
					</div>
				</div>
				<p></p>
				<p></p>
			</form>
	   </div>
    </div>
	 <!-- end of new -->
	
	<!-- start of view -->
	<div id="view" class="tab-pane fade">
	<div class="panel panel-default">
	<form class="form-inline">
	  <div class="table-responsive">          
	  <table class="table">
	    <thead>
	      <tr>
	        <th>Name</th>
	        <th>Update</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td>name here</td>
	        <td>update</td>
	      </tr>
	      <tr>
	        <td>name here</td>
	        <td>update</td>
	      </tr>
	    </tbody>
	  </table>
	  </div>
	  <p></p>
	  <p></p>
	  </form>
	    </div>
		
	  </div>
	<!-- end of statements -->		  
		</section>
      </section>
      <!--main content end-->
  </section>
  <!-- container section start -->


<script src="../resources/js/bootstrapValidator.min.js" type="text/javascript"></script><!-- container section start -->
<script>
$('#OnceOff').bootstrapValidator();
$('#InterAcc').bootstrapValidator();
$('#Ben').bootstrapValidator();
</script>

  </body>
</html>
