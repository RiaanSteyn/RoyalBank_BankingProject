<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Royal Bank</title>
<%@ include file="links/landingpage.jsp"%>

<style>
.error {
	color: red;
	font-style: arial;
	font-size: 8px;
	display: none;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
	margin: auto;
}

body {
	background: #f2f2f2;
}

.container {
	background-color: #ffffff;
}

.list-group-item active {
	background-color: #f19123;
}

.wrapper {
	background-color: #1a2733;
	min-hieght: 100% height:auto !important;
	height: 100%;
	margin: 0 auto;
}

.footer, .push {
	height: 35px;
}
</style>


<script>
	function lookforfrmgrp(obj) {
		var valid = false;
		if ($(obj).hasClass('form-group')) {
			return obj;

		} else {
			return lookforfrmgrp($(obj).parent());
		}

	}// end of lookforfrmgrp function

	$(document)
			.ready(
					function() {
						$(".validate")
								.blur(
										function() {
											if ($(this).val().trim() == 0) {
												$(lookforfrmgrp($(this)))
														.addClass("has-error");
												$(this).next().css("display",
														"inline");
												valid = false;
											} else {
												$(lookforfrmgrp($(this)))
														.removeClass(
																"has-error");
												$(this).next().css("display",
														"none");
												valid = true;
											}
										});

						$(".text-only")
								.blur(
										function() {

											var str = $(this).val();
											var pattern = /^[a-zA-Z]+$/; //^from start you want letter until the end +$
											var result = pattern.test(str)
											//if(/[a-zA-A]/.test($(this).val())){ shorter vision
											//var pattern = /[0-9]/; only take numbers
											if (result) {
												$(this).next().css("display",
														"none");
												$(this).css("background-color",
														"white");
												valid = true;
											}
											//$(".error").next().css("display","none");
											else {
												$(this).css("background-color",
														"#ff2626", "display",
														"inline");
												$(this).next().css("display",
														"inline");
												valid = false;
											}
											//$(".error").next().css("display","inline");		
										}); // end of blur

						$(".id-only")
								.blur(
										function() {

											var str = $(this).val();
											var pattern = /[0-9]/; //only take numbers
											//var pattern = /^[a-zA-Z]+$/; //^from start you want letter until the end +$
											var result = pattern.test(str)
											//if(/[a-zA-A]/.test($(this).val())){ shorter vision

											if (result) {
												$(this).next().css("display",
														"none");
												$(this).css("background-color",
														"white");
												valid = true;
											}
											//$(".error").next().css("display","none");
											else {
												$(this).css("background-color",
														"#ff2626", "display",
														"inline");
												$(this).next().css("display",
														"inline");
												valid = false;
											}
											//$(".error").next().css("display","inline");		
										}); // end of blur

						$(".password").blur(function() {

							var str = $(this).val();
							var res1 = /[a-z]+/.test(str);
							var res2 = /[A-Z]+/.test(str);
							var res3 = /[0-9]+/.test(str);
							var len = (str.length > 5);
							if (res1 && res2 && res3 && len) {
								//var pattern = /[a-Z]+[A-Z-0-9]+/; //^from start you want letter until the end +$
								//var result = pattern.test(str)
								//if(/[a-zA-A]/.test($(this).val())){ shorter vision
								//var pattern = /[0-9]/; only take numbers
								//if(result){
								$(this).css("background-color", "white");
								valid = true;
							} else {
								$(this).css("background-color", "#ff2626");
								valid = false;
							}

						}); // end of blur

						$(".email")
								.blur(
										function() {

											var str = $(this).val();
											var res1 = /^[a-zA-Z0-9\.]+@[a-zA-Z0-9\.]+\.+[a-zA-Z\.]+$/
													.test(str);
											var res2 = (str.substring(0, 1) != ".");
											var res3 = (str.substring(
													str.length - 1, str.length) != '.');
											var res4 = /\.\./.test(str);

											//var res3= /[0-9]+/.test(str);

											if (res1 && res2 && res3 && !res4) {

												$(this).css("background-color",
														"white");
												$(this).next().css("display",
														"none");
												valid = true;
											} else {
												$(this).css("background-color",
														"#ff2626");
												$(this).next().css("display",
														"inline");
												valid = false;
											}

										}); // end of 

					});///end of ready
</script>


<script type="text/javascript">
	$(document).ready(function() {

		$("#same_address").on('click', function() {

			$('.postal_address_div').slideToggle('slow');

		})

	});
</script>



</head>
<body>

	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Royal Bank</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Services <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="docs/STUDENT CHEQUE ACCOUNT.pdf" target="_blank">Student
								Cheque Account</a></li>
						<li><a href="docs/SIILVER.pdf" target="_blank">Silver/Gold/Platinum
								Account</a></li>
						<li><a href="docs/ISLAMIC CHEQUE ACCOUNT.pdf" target="_blank">Islamic
								Cheque Account</a></li>
						<li><a href="BUSINESS CHEQUE ACCOUNT.pdf" target="_blank">Business
								Cheque Accouunt</a></li>
					</ul></li>
				<li><a data-toggle="modal" data-target="#aboutus" href="#">About
						Us</a></li>
				<li><a data-toggle="modal" data-target="#contact" href="#">Contact
						Us</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#" data-toggle="modal" data-target="#myModals">
						<span class="glyphicon glyphicon-user"></span> Register
				</a></li>
				<li><a href="#myModal" data-toggle="modal"> <span
						class="glyphicon glyphicon-log-in"></span> Login
				</a></li>
			</ul>
		</div>
	</div>
	</nav>


	<div class="container">

		<!-- Nav menu -->
		<div class="row">

			<div class="col-md-10">
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-left">
						<li class="hidden"><a href="#page-top"></a></li>
						<li class="page-scroll"><a data-toggle="modal"
							data-target="#islamic" href="#">Islamic Banking</a></li>
						<li class="page-scroll"><a data-toggle="modal"
							data-target="#business" href="#">Business Banking</a></li>
						<li class="page-scroll"><a data-toggle="modal"
							data-target="#personal" href="#">Personal Banking</a></li>
						<li class="page-scroll"><a data-toggle="modal"
							data-target="#student" href="#">Student Banking</a></li>

					</ul>
				</div>
			</div>
		</div>




		<!-- Modal -->
		<div class="modal fade" id="aboutus" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">About Us</h4>
					</div>
					<div class="modal-body">



						<ul>
							<Strong>Vision </Strong>
							<p></p>
							<li>Royal bank is committed to making a positive difference
								in the financial lives of our members and in the community we
								serve. We want to be the financial institution that our members
								choose first, use the most and grow with throughout their lives.
							</li>


						</ul>

						<p></p>
						<ul>
							<Strong>Mission </Strong>
							<p></p>
							<li>Our mission is to be the premier provider of superior
								financial solutions by earning people’s trust in the most
								friendly, professional manner possible.</li>
							<li>Our mission is to provide a wide range of quality
								entertainment options to families and children of all ages.</li>




						</ul>
						</p>
						</p>





						<ul>
							<strong>Our Values</strong>
							<li>We have a single, simple purpose – to serve customers
								well. This is at the core of our ambition to build a bank known
								for its consistent, high quality customer service.</li>
							<li>We want to be trusted, respected and valued by our
								customers, shareholders and communities.</li>
							<li>We have put a common set of values at the heart of how
								we do business. Our values are not new, but capture what we do
								when we are at our best:</li>
						</ul>

						<ul>
							<strong>Serving customers</strong>
							<li>We exist to serve customers.</li>
							<li>We earn their trust by focusing on their needs and
								delivering excellent service.</li>
							</u>

							<ul>
								<strong>Working together</strong>
								<li>We care for each other and work best as one team.</li>
								<li>We bring the best of ourselves to work and support one
									another to realise our potential.</li>
							</ul>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<!--end  careers content-->



		<!-- Modal -->
		<div class="modal fade" id="contact" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Contact Us</h4>
					</div>
					<div class="modal-body">

						<h1>Contact Details</h1>


						<h2>Phone</h2>
						<p>
							(+72)71-091-4939<br /> (+72)76-509-2829<br /> (+72)76-687-0834<br />
							(+72)76-818-7769<br /> (+72)79-422-0221
						</p>

						<h2>Email</h2>

						<p>
							<a href="mailto:tebogoleshiba@gmail.com;">tebogoleshiba@gmail.com</a>
						</p>

						<h2>Social Networks</h2>
						<ul>
							<li><a href="http://www.facebook.com/webcoursesbangkok"
								target="_blank">www.facebook.com/RoyalBank</a></li>
							<li><a href="http://www.twitter.com/webcoursesbkk"
								target="_blank">www.twitter.com/RoyalBank</a></li>
						</ul>

						<h2>Address</h2>
						<address>
							90 CNR PARKLAND DRIVE AND AMANTUNGULU STR, <br /> ESTHER PARK <br />
							KEMPTON PARK, <br /> 1619
							</p>
						</address>







					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<!--end  car



   
      <!-- start of modal -->

		<!-- Modal -->
		<div class="modal fade" id="islamic" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Islamic Cheque Account</h4>
					</div>
					<div class="modal-body">
						<h5 style="color: 0a7aa6;">To Qualify for Ilsamic Cheque
							Accout You might need the following:</h5>
						<ul>
							<li>Minimum Balance : R100.00</li>
						</ul>
						<ul>
							<Strong>Required Documents</Strong>
							<p></p>
							<li>Identity Documents</li>
							<li>Proof of Address</li>

						</ul>

						<ul>
							<Strong>Benefits</Strong>
							<p></p>
							<li>3 Withdrawals</li>
							<li>Free Internet Banking</li>
							<li>Unlimited Swipes</li>

						</ul>



						<p>
							If you are looking for an interest free salary account, our
							cheque account is for you.Dependable , Reliable and absolutely
							effortless.<br />Trust us , it does not get better with Royal
							Bank Islamic cheque account
						</p>


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<!--end  careers content-->







		<!-- Modal -->
		<div class="modal fade" id="business" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">business Cheque Account</h4>
					</div>
					<div class="modal-body">
						<h5 style="color: 0a7aa6;">To Qualify for Business Cheque
							Accout You might need the following:</h5>
						<ul>
							<li>Minimum Balance : R5000.00</li>
						</ul>
						<ul>
							<Strong>Required Documents</Strong>
							<p></p>
							<li>Identity Documents, Proof of Address for all Directors</li>
							<li>Company Registration(CK, 14.3)</li>

						</ul>

						<ul>
							<Strong>Benefits</Strong>
							<p></p>
							<li>R200.00 Bundle</li>
							<li>Free internet Banking</li>
							<li>50 Withdrawals</li>
							<li>Unlimited Swipes</li>


						</ul>



						<p>
							If you are looking for an best cheque account, our cheque
							accounts is for you.Dependable , Reliable and absolutely
							effortless.<br />Trust us , it does not get better with Royal
							Bank Islamic cheque account
						</p>


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<!--end  careers content-->




		<!-- Modal -->
		<div class="modal fade" id="personal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Personal Cheque Account</h4>
					</div>
					<div class="modal-body">
						<h5 style="color: 0a7aa6;">To Qualify for
							Sliver/Gold/Platinum Accounts Cheque Accout You might need the
							following:</h5>
						<ul>
							<li>Sliver from R3000.00 to R8000.00</li>
							<li>Gold from R801.00 to R20000.00</li>
							<li>Platinum from R20001.00 up to infinity</li>
						</ul>


						<ul>
							<Strong>Required Documents</Strong>
							<p></p>
							<li>Latest PaySlip</li>
							<li>Proof of Address</li>
							<li>ID/ Passport</li>


						</ul>
						<ul>
							<Strong>For Foreign Nationals</Strong>
							<p></p>
							<li>Valid Passport</li>
							<li>Valid Residential Address</li>
							<li>Latest Payslip</li>




						</ul>

						<ul>
							<Strong>Benefits</Strong>
							<p></p>
							<li>R50.00 Bundle/3 free Withdrawals/50
								Withdrawals/Unlimited Swipes - Silver Account</li>
							<li>R100 Bundle/6 Free Withdrawals/Free Internet
								Banking/Unlimited Swipes - Gold Account</li>
							<li>R150.00 Bundle/Unlimited Swipes/Free Withdrawals/ -
								Platinum Account</li>



						</ul>



						<p>
							If you are looking for an best cheque account, our cheque
							accounts is for you.Dependable , Reliable and absolutely
							effortless.<br />Trust us , it does not get better with Royal
							Bank Islamic cheque account
						</p>


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<!--end  careers content-->



		<!-- Modal -->
		<div class="modal fade" id="student" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Student Cheque Account</h4>
					</div>
					<div class="modal-body">
						<h5 style="color: 0a7aa6;">To Qualify for Student Cheque
							Accout You must be:</h5>
						<ul>
							<li>Age from 14 to 22</li>

						</ul>


						<ul>
							<Strong>Required Documents</Strong>
							<p></p>
							<li>Students Proof of Registration</li>
							<li>ID/Birth Certificate</li>
							<li>Proof of Address</li>







						</ul>

						<ul>
							<Strong>Benefits</Strong>
							<p></p>
							<li>No fees</li>
							<li>R20.00</li>



						</ul>



						<p>
							If you are looking for an best cheque account, our cheque
							accounts is for you.Dependable , Reliable and absolutely
							effortless.<br />Trust us , it does not get better with Royal
							Bank Islamic cheque account
						</p>


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<!--end  careers content-->

		<!-- Modal -->
		<div id="myModal" class="modal fade" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Login</h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="login" method="post"
							action="UserLogin" data-bv-message="This value is not valid"
							data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
							data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
							data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
							<div class="form-group">
								<label class="control-label col-md-4" for="first_name">Username:</label>
								<div class="col-md-6">
									<input type="text" class="form-control" id="username"
										name="login_username" placeholder="First Name"
										data-bv-notempty
										data-bv-notempty-message="You're required to fill in a username!" />
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-4" for="last_name">Password</label>
								<div class="col-md-6">
									<input type="text" class="form-control" id="password"
										name="login_password" placeholder="Password" data-bv-notempty
										data-bv-notempty-message="You're required to fill in a password!" />
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-6">
									<button type="submit" value="Submit" class="btn btn-default">Submit</button>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<!--end  Modal content-->

		<!--start Modal2 content-->
		<div id="myModals" class="modal fade" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Register</h4>
					</div>
					<div class="modal-body">
						<div class="panel panel-default">
							<div class="panel-heading">Registration form</div>
							<div class="panel-body">
								<form action="Registration" id="register" method="post"
									data-bv-message="This value is not valid"
									data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
									data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
									data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">

									<div class="row">
										<div class="form-group">
											<div class="col-md-2 padding-top-10">
												<label for="title" class="control-label">Title:</label> <select
													id="title" name="title" class="form-control">
													<option value="mr">Mr</option>
													<option value="mrs">Mrs</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-3 padding-top-5">
												<label for="name" class="control-label">Name:</label> <input
													type="text" class="form-control validate text-only"
													name="first_name" id="name" placeholder="Name"
													data-bv-notempty
													data-bv-notempty-message="You're required to fill in name!" /><span
													class="error">YOur name should only contain letters</span>

											</div>
										</div>
										<div class="form-group">
											<div class="col-md-3 padding-top-5">
												<label for="city" class="control-label">Last Name:</label> <input
													type="text" class="form-control" name="last_name"
													id="last_name" placeholder="Last name" data-bv-notempty
													data-bv-notempty-message="You're required to fill in lastname!" />
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-4 padding-top-5">
												<label for="city" class="control-label">Identity
													Number:</label> <input type="text"
													class="form-control validate id-only" name="id_num"
													id="IDnumber" placeholder="Identity Number"
													data-bv-notempty
													data-bv-notempty-message="You're required to fill in identity number!" /><span
													class="error">only name numbers</span>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-md-4 padding-top-10">
												<label for="email" class="control-label">Email
													Adress:</label> <input type="text" class="form-control"
													name="email" id="email" placeholder="email"
													data-bv-notempty
													data-bv-notempty-message="You're required to fill in the identity number!" />
											</div>

											<div class="col-md-4 padding-top-10">
												<label for="city" class="control-label">LandLine:</label> <input
													type="text" class="form-control" name="landline"
													id="landine" placeholder="landline" />
											</div>

											<div class="col-md-4 padding-top-10">
												<label for="city" class="control-label">Mobile:</label> <input
													type="text" class="form-control" name="mobile" id="mobile"
													placeholder="Mobile" data-bv-notempty
													data-bv-notempty-message="You're required to fill in the mobile number!" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-md-12 padding-top-10">
												<label for="address1" class="control-label">Residential
													Address:</label> <input type="text" class="form-control"
													name="residential_address" id="address1"
													placeholder="Residential Address" data-bv-notempty
													data-bv-notempty-message="You're required to fill in the residential address!" />
											</div>
										</div>
									</div>
									<div class="row">

										<div class="col-md-4 padding-top-10">
											<label for="title" class="control-label">Province:</label> <select
												id="title" class="form-control" name="residential_province">
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
										<div class="form-group">
											<div class="col-md-3 padding-top-10">
												<label for="city" class="control-label">Postal Code:</label>
												<input type="text" class="form-control"
													name="residential_postcode" id="Postal1"
													placeholder="Postal Code" data-bv-notempty
													data-bv-notempty-message="You're required to fill in the postal code!" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-md-12 padding-top-10">
												<label for="address1" class="control-label">Postal
													Address:
													<div class="checkbox">
														<label> <input type="checkbox" id="same_address"
															name="same_address" />Same as Residential
														</label>
													</div>
												</label>

												<div class="postal_address_div">
													<input type="text" class="form-control"
														name="postal_address" id="address1"
														placeholder="Postal Address" />
												</div>
											</div>
										</div>
									</div>

									<div class="postal_address_div">

										<div class="row">

											<div class="col-md-4 padding-top-10">
												<label for="title" class="control-label">Province:</label> <select
													id="title" name="postal_province" class="form-control">
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
											<div class="form-group">
												<div class="col-md-3 padding-top-10">
													<label for="city" class="control-label">Postal
														Code:</label> <input type="text" class="form-control"
														name="postal_code" id="Postal2" placeholder="Postal Code" />
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-md-6 padding-top-10">
												<label for="city" class="control-label">Username:</label> <input
													type="text" class="form-control" name="username"
													id="username" placeholder="Username" data-bv-notempty
													data-bv-notempty-message="You're required to fill in the username!" />
											</div>

											<div class="col-md-6 padding-top-10">
												<label for="password" class="control-label">Password:</label>
												<input type="password" class="form-control" name="password"
													id="password" placeholder="Password" data-bv-notempty
													data-bv-notempty-message="You're required to fill in the password" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6 padding-top-10">
											<div class="checkbox">
												<label> <input type="checkbox" />I accept Royal
													bank terms and conditions
												</label>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-2">
											<button type="submit" class="btn btn-success">Register</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!--end Modal2 content-->

		<!-- start of modals-->


		<!-- start of modal careers-->

		<!-- Modal -->
		<div class="modal fade" id="career" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Careers</h4>
					</div>
					<div class="modal-body">
						<h2 style="color: red;">Ops No Careers Avaliable</h2>
						<br />
						<h4 style="color: blue;">Career Portal will open in October
							2015</h4>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<!--end  careers content-->


		<!-- Modal -->
		<div class="modal fade" id="newinternet" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Banking</h4>
					</div>
					<div class="modal-body">
						<h2 style="color: blue;">Please register</h2>
						<br />
						<h4 style="color: blue;">To experience our new banking
							technology</h4>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<!--end  careers content-->



		<!-- start of modal careers-->
		<!-- Modal -->
		<div class="modal fade" id="sponsors" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Sponsorships</h4>
					</div>
					<div class="modal-body">
						<h4 style="color: #0a7aa6;">
							Building a better community starts with the right foundation
							</h2>
							<br /> <img src="images/community.jpg"
								style="float: left; width: 160px; height: 140px; padding: 5px;" />
							<p>
								Creating a vital, healthy community is a group effort.And at the
								heart of it, you will find local organizations.fuelled by
								committed people who are passionate about building a better
								future for us all.That's why Royal Bank celebrates community
								based organizations through the contribution of our resources,
								time and talents.Togehter we can build the right foundation for
								our community<br />We are proud to sponsor the <strong>Phomolong
									Community centre</strong> in support of the<strong> Ekhuruleni
									Manicipality.</strong>
							</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>

			</div>
		</div>
		<!--end  Modal content-->

		<!--Starting of couresel content-->
		<div class="row">
			<div class="col-md-8">

				<div class="sliderContainer">
					<div class="iosSlider">
						<div class="slider">

							<div class="item item1">
								<div class="inner">
									<div class="text1">
										<span>Student Account.</span>
									</div>
									<div class="text2">
										<span>We look after our student atRoyal bank</span>
									</div>
								</div>
							</div>

							<div class="item item2">
								<div class="inner">
									<div class="text1">
										<span>register now.</span>
									</div>
									<div class="text2">
										<span>Start living a life with royal bank</span>
									</div>
								</div>
							</div>

							<div class="item item3">
								<div class="inner">
									<div class="text1">
										<span>best products.</span>
									</div>
									<div class="text2">
										<span><br>choose the one that will work for you</span>
									</div>
								</div>
							</div>

							<div class="item item4">
								<div class="inner">
									<div class="text1">
										<span>Life made easier at royal bank.</span>
									</div>
									<div class="text2">
										<span>register with us</span>
									</div>
								</div>
							</div>

							<div class="item item5">
								<div class="inner">
									<div class="text1">
										<span>get salary alerts.</span>
									</div>

									<div class="text2">
										<span>know your balance at anytime.</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- end of col md 8 -->

			<div class="col-md-4">

				<div class="list-group">
					<a href="#" class="list-group-item active">Quick Topics</a> <a
						href="docs/fica.pdf" class="list-group-item">Fica Information</a>
					<a href="docs/Account management.pdf" class="list-group-item">FAQ's</a>
					<a href="docs/rates.pdf" class="list-group-item">Exchange Rates</a>
				</div>

				<p></p>
				<div class="list-group">
					<a href="#" class="list-group-item active">Related Topics</a> <a
						href="#" data-toggle="modal" data-target="#newinternet"
						class="list-group-item">New Internet Banking</a> <a href="#"
						data-toggle="modal" data-target="#sponsors"
						class="list-group-item">Sponsorships</a> <a href="#"
						data-toggle="modal" data-target="#career" class="list-group-item">Careers</a>


				</div>
			</div>
			<!-- end of col md 3 -->
		</div>
		<!-- end of row-->

		<div class="row">

			<div class="col-md-6 padding-top-10">

				<div class="panel-group m-bot20" id="accordion">
					<div class="panel panel-warning">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion" href="#collapseOne"> Dear Customer
								</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="panel-body">
								We value your relationship with Royal Bank to serve you
								better,we building the best banking app and would require you to
								register with us.This is being done to secure your accounts and
								to protect your personal information from being compromised.We
								at Royal Bank are committed in making sure that your online
								transactions are secure.The Sooner you register yourself with us
								the better life.<br />
								<span style="color: #1a2733;">Life made easier with Royal
									Bank online banking</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- end of col -->

			<div class="col-md-3 padding-top-10">

				<div class="panel-group m-bot20" id="accordion">
					<div class="panel panel-info">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion" href="#"> Platinum Card </a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">

							<a class="thumbnail" href="#"> <img class="img-responsive"
								src="images/platinum.jpg" alt="">
							</a>


						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3 padding-top-10">

				<div class="panel-group m-bot20" id="accordion">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion" href="#"> Gold Card </a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">

							<a class="thumbnail" href="#"> <img class="img-responsive"
								src="images/card4.jpg" alt="">
							</a>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- end of row -->

	</div>
	<!-- end of container -->
	<div class="wrapper">
		<p style="color: white;">Royal Bank</p>
		<div class="push"></div>
		<div class="footer">
			<p>copyright @2015</p>
		</div>
	</div>

		<script type="text/javascript">
			$(document)
					.ready(
							function() {

								$('.iosSlider')
										.iosSlider(
												{
													desktopClickDrag : true,
													snapToChildren : true,
													navSlideSelector : '.sliderContainer .slideSelectors .item',
													onSlideComplete : slideComplete,
													onSliderLoaded : sliderLoaded,
													onSlideChange : slideChange,
													scrollbar : false,
													autoSlide : true,
													autoSlideTimer : 3500,
													infiniteSlider : true,
												});

							});

			function slideChange(args) {

				$('.sliderContainer .slideSelectors .item').removeClass(
						'selected');
				$(
						'.sliderContainer .slideSelectors .item:eq('
								+ (args.currentSlideNumber - 1) + ')')
						.addClass('selected');

			}

			function slideComplete(args) {

				if (!args.slideChanged)
					return false;

				$(args.sliderObject).find('.text1, .text2').attr('style', '');

				$(args.currentSlideObject).find('.text1').animate({
					right : '100px',
					opacity : '0.8'
				}, 400, 'easeOutQuint');

				$(args.currentSlideObject).find('.text2').delay(200).animate({
					right : '140px',
					opacity : '0.8'
				}, 400, 'easeOutQuint');

			}

			function sliderLoaded(args) {

				$(args.sliderObject).find('.text1, .text2').attr('style', '');

				$(args.currentSlideObject).find('.text1').animate({
					right : '100px',
					opacity : '0.8'
				}, 400, 'easeOutQuint');

				$(args.currentSlideObject).find('.text2').delay(200).animate({
					right : '140px',
					opacity : '0.8'
				}, 400, 'easeOutQuint');

				slideChange(args);

			}
		</script>

		<script>
			$('#login').bootstrapValidator();
		</script>
		<script>
			$('#register').bootstrapValidator();
		</script>
</body>
</html>
