<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Check Out</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet">
	<link href="/css/linearicons.css" rel="stylesheet">
	<link href="/css/style.css" rel="stylesheet">
	<link href="/css/responsive.css" rel="stylesheet">
	<link href="/css/orderList.css" rel="stylesheet">
	<link rel="icon" type="image/x-icon" href="/images/icon.ico"></head>
<body>

<div class="header">
		<%@ include file="../fragments/topheader.jsp" %>
		<%@ include file="../fragments/middleheader.jsp" %>
		<%@ include file="../fragments/bottomheader.jsp" %>
	</div>
<div class="container box">
	<div class="name"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp; Order Information</div>
	<c:if test="${empty requestScope.order }">
	No Orders!
</c:if>
<c:if test="${!empty requestScope.order }">
	<table border="0" style="margin-top:20px;"><tr>
			<th>OrderDate</th>
			<th>FirstName</th>
			<th>LastName</th>
			<th>Email</th>
			<th>Phone</th>
			<th>Address</th>
			<th>Operation</th>
<!-- 			<th>enable</th> -->
		</tr>
		<c:forEach items="${requestScope.order }" var="order">
		<tr>		
			<td>${order.orderDate} </td>			
			<td>${order.customer.fName} </td>			
			<td>${order.customer.lName} </td>			
			<td>${order.customer.email} </td>			
			<td>${order.customer.phone} </td>			
		    <td>${order.customer.address} </td>			
			<%-- <td>${order.customer.user.enable} </td>	 --%>
			<td><a href="/customer/orderDetail/${order.id}">View Order Detail</a></td>	
		</tr>
		</c:forEach>
	</table>
</c:if>
</div>

</body>
</html>