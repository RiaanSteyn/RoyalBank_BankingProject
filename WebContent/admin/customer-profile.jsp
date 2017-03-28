<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Royal Bank | Profile</title>
	</head>
	<body align="center" style="font-family:Segoe UI;">
		<h1>PROFILE</h1>
		
		<div id="registration">     		
			<div>
				Title
				<input type="text" id="title" name="title" placeholder="Title" style="width:45px;" readonly />									
				First Name
				<input type="text" id="first_name" name="first_name" placeholder="First Name" readonly />
				Last Name
				<input type="text" id="last_name" name="last_name" placeholder="Last Name" readonly />
				ID Number
				<input type="text" id="id_num" name="id_num" placeholder="ID Number" readonly />
			</div>
			
			
			<div>
				Email
				<input type="text" id="email" name="email" placeholder="Email" readonly />
				Landline
				<input type="text" id="landline" name="landline" placeholder="Landline" readonly />
				Mobile
				<input type="text" id="mobile" name="mobile" placeholder="Mobile" readonly />
			</div>
			
			<br>
			<h5>Residential Address</h5>
			<div>				
				<textarea rows="5" cols="70" id="residential_address" name="residential_address" placeholder="Residential Address" readonly></textarea><br>
				Province
				<input type="text" id="residential_province" name="residential_province" placeholder="Province" readonly />								
				Post Code
				<input type="text" id="residential_code" name="residential_code" placeholder="Post Code" readonly />
			</div>
			<br>
			<h5>Postal Address</h5>
			<div>
				
				<textarea rows="5" cols="70" id="postal_address" name="postal_address" placeholder="Postal Address" readonly></textarea><br>
				Province				
				<input type="text" id="postal_province" name=""postal_province"" placeholder="Province" readonly />							
				Post Code
				<input type="text" id="postal_code" name="postal_code" placeholder="Post Code" readonly />
			</div>
			<br>
			<div>
				Username
				<input type="text" id="username" name="username" placeholder="Username" readonly />
				Password
				<input type="text" id="password" name="password" placeholder="Password" readonly />
			</div>
			
			<p>
				<a href="update.jsp">
					<input type="button" id="submit_reg" name="submit_reg" value="Update Profile">
				</a> 				
			</p>			
		</div>
		
		
	</body>
</html>