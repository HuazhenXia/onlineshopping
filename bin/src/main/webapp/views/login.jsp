<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Shopping</title>
</head>
<body>
	<h1>Welcome To My Shop</h1>
	<form action="/login" method="post">
		<div>
			<label> Username: <input type="text" name="username" />
			</label>
		</div>
		<div>
			<label> Password: <input type="password" name="password" />
			</label>
		</div>
		<div>
			<input type="submit" value="login" />
			
		</div>
		
	</form>
	<h2>New member!SignUp Here</h2>
	<a href="register">Register</a>
</body>
</html>