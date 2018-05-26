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
		Current User :
		<sec:authentication property="name" />
		<a href="/logout">logout</a>
	</div>
	<br />
	<a href="/manageProduct">Manage Products</a>
	<br />
	<br />
	<br />
	<a href="/manageCategory">Manage Category</a>
	<br />
	<br />
	<a href="/manageUser">Manage Users</a>
	<!-- <br /> Manage Coment:
	<br />
	<a href="#">Manage Coment</a> -->
	<br />
	<br />
	<br />
	<a href="/logout">Logout</a>

	<br />
</body>
</html>