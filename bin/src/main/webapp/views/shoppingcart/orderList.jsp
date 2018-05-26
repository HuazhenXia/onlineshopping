<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:if test="${empty requestScope.order }">
	No products!
</c:if>
<c:if test="${!empty requestScope.order }">
	<table border="1"><tr>
			<th>id</th>
			<th>orderDate</th>
			<th>firstName</th>
			<th>lastName</th>
			<th>email</th>
			<th>phone</th>
			<th>city</th>
			<th>state</th>
			<th>country</th>
			<th>zipcode</th>
<!-- 			<th>enable</th> -->
		</tr>
		<c:forEach items="${requestScope.order }" var="order">
		<tr>
			<td>${order.id} </td>			
			<td>${order.orderDate} </td>			
			<td>${order.customer.fName} </td>			
			<td>${order.customer.lName} </td>			
			<td>${order.customer.email} </td>			
			<td>${order.customer.phone} </td>			
		    <td>${order.customer.address.city} </td>			
			<td>${order.customer.address.state} </td>			
			<td>${order.customer.address.country} </td>			
			<td>${order.customer.address.zip} </td>			
			<%-- <td>${order.customer.user.enable} </td>	 --%>
			<td><a href="/user<%-- removeShoppingCart/${shoppingCart.id} --%>">View Order Detail</a></td>	
		</tr>
		</c:forEach>
	</table>
</c:if>
<a href="/user">go back</a>
</body>
</html>