<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Shipping Information</h1>
	<div style="align:center">
	 
		<table>
			<tr>
				<td>Name</td>
				<td>Phone Number</td>
				<td>Email</td>
				<td>Address</td> 
			</tr>
			<tr>
				<td>${customer.fName } ${customer.lName }</td>
				<td>${customer.phone }</td>
				<td>${customer.email }</td>
				<td>${customer.address }</td> 
			</tr>
			</table>
	</div>
	<h1>Billing Information</h1>
	<div style="align:center">
	 
		<table>
			<tr>
				<td>Product Name</td>
				<td>Unit Price</td>
				<td>Quantity</td>
				<td>Sub Total</td>
			</tr>
			 
			<c:forEach items="${billingInfo }" var="shoppingCart">
			<tr>
				<td>${shoppingCart.orderDetails.product.name }</td>
				<td>${shoppingCart.orderDetails.unitCost }</td>
				<td>${shoppingCart.quantity }</td>
				<td>$ ${shoppingCart.orderDetails.subTotal }</td>
			</tr>
			</c:forEach>
			<tr>
					<th></th>
					<th></th>
					<th>Total</th>
					<th>$ ${totalPrice}</th>
					<th></th>
			</tr>
			<tr>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<tr> 
					 
					<td></td>
					<td></td>
					<td><a href="/user"> Continue Shopping	</a>
					</td>
			</tr>
		</table>
	</div>
</body>
</html>