<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Products</title>
</head>
<body>
<div>
		<h2>Current User :</h2>
		<sec:authentication  modelAttribute="name" property="name" th:text = "${name}" />
	</div>
	<br /><h3>Products</h3>
	<br />
	<a href="/customer/listProduct">List Products</a>
	<br />
	<a href="/cartList">My Shopping Cart</a>
	<br />
	<br />
	<a href="/login">Logout</a>
	<%-- <%@ include file="admin/header.jsp"%>  --%>
</body>
</html>