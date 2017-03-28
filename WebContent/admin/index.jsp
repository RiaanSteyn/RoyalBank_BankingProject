<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Royal Bank | Admin - Login</title>
		<%@ include file = "../links/homeuser.jsp" %>
	</head>
	<body>
		<h1 align="center">Admin Login</h1>
		<br /><br />
		<form action="../AdminLogin" method="post" class="col-md-4 col-md-offset-4">
		  <div class="form-group ">
		    <label for="exampleInputEmail1">Username</label>
		    <input type="text" class="form-control" name="username" id="username" placeholder="Username">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">Password</label>
		    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
		  </div>
		  <button type="submit" class="btn btn-default" id="submit_login" name="submit_login">Submit</button>
		</form>
	</body>
</html>