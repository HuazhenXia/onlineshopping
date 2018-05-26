<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Cart</title>
</head>
<body>
<c:if test="${empty requestScope.shoppingCart }">
	No Items!
</c:if>
	<c:if test="${!empty requestScope.shoppingCart }">
		<h1>Your Shopping Cart</h1>
		<table border="1">
			<tr>
				<th>Product Name</th>
				<th>Unit Price</th>
				<th>Quantity</th>
				<th>Sub Total</th>


			</tr>
			<c:forEach items="${requestScope.shoppingCart }" var="shoppingCart">
				<tr>
					<td>${shoppingCart.orderDetails.product.name}</td>
					<td>${shoppingCart.orderDetails.unitCost}</td>
					<td>${shoppingCart.quantity}</td>
					<td>${shoppingCart.orderDetails.subTotal}</td>



					<td><a href="/removeShoppingCart/${shoppingCart.id}">Cancel	Item</a></td>
				</tr>
			</c:forEach>
			<tr>
				<th></th>
				<th></th>
			</tr>
			<tr>
				<th>Total</th>
				<th>$ ${totalPrice}</th>
			</tr>
			<tr>
			<td><a href="/checkout">Check Out</a>
			</td>
			<td></td>
			<td></td>
			<td><a href="/removeAllShoppingCart" onclick="deleteAllCarts()">Cancel Shopping</a></td>
			</tr>
		</table>
	</c:if>
</body>
</html>