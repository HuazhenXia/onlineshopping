<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>Current User :</h1>
		<sec:authentication property="name" />
		<br/>
		Dear <strong>${user}</strong>, Welcome to Home Page.
		<br/>
	</div>
	<a href="/profile"> My Profile </a>
	<br />
	<br />
	<h2>Products</h2>
	<a href="/viewProducts">View Products</a>
	
	<br />
	<!-- <br />
	<h2>Shopping Cart</h2>
	<a href="/cartList">My Shopping Cart</a>
	<br /> -->
	<br />
	<br />
	<a href="/login">Logout</a>
</body>
</html>