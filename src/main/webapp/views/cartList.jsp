<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="/js/autoUpdate.js" type="text/javascript"></script>
<title>Shopping Cart</title>

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet">
	<link href="/css/linearicons.css" rel="stylesheet">
	<link href="/css/style.css" rel="stylesheet">
	<link href="/css/responsive.css" rel="stylesheet">
	<link rel="icon" type="image/x-icon" href="/images/icon.ico">
	<link href="/css/cartlist.css" rel="stylesheet">
</head>
<body>
<div class="header">
		<%@ include file="fragments/topheader.jsp" %>
		<%@ include file="fragments/middleheader.jsp" %>
		<%@ include file="fragments/bottomheader.jsp" %>
</div>

<div class="container">

<c:if test="${empty requestScope.shoppingCart }">
	No Items!
	<div><a href="/customer/listProduct">Go To Shopping</a></div>
</c:if>
<script type="text/javascript">
	if ("${alertMessage}"!=""){
		alert("${alertMessage}");
	}
</script> 
  <div class="container">  
	<c:if test="${!empty requestScope.shoppingCart }">
		<h3>Your Shopping Cart</h3>
		<h6>Records Of Products are <label id="recordAmount">     ${numberofproduct}</label></h6>
		
		<table border="0" id="tbl">
			<tr>
				<th>Product Name</th>
				<th>Unit Price</th>
				<th>Quantity</th>
				<th>Sub Total</th>
				<th>Operation</th>
			</tr>
			<c:forEach items="${requestScope.shoppingCart }" var="shoppingCart">
				<tr>
					<td>${shoppingCart.product.name}</td>
					<td id="unit" pattern="#.00">${shoppingCart.product.unitPrice}</td>	
					<td><input id="${shoppingCart.id}" onchange="changeValue(this)" type = "number"  min = 1  max =${shoppingCart.product.unitsInStock} value = ${shoppingCart.quantity} /></td>
					<td id="subTotal" pattern="#.00">${shoppingCart.totalPrice}</td>

					<td><a href="/removeShoppingCart/${shoppingCart.id}">Cancel	Item</a></td>
				</tr>
			</c:forEach>
			
			
			<tr >
				<th style="background-color:#fff;">Total</th>
				<th id = "total" pattern="#.00" style="background-color:#fff;font-size:22px;">$ ${totalPrice}</th>	
			</tr>
			<tr style="background-color:#fff;"><td></td></tr>
			<tr class="operation" style="background-color:#fff;">
			<td><a href="/customer/checkout" style="font-size:18px; font-weight:600;">Check Out</a>
			</td>
			<td></td>
			<td></td>
			<td><a href="/removeAllShoppingCart" >Cancel Shopping</a></td>
			<td><a href="/customer/listProduct" style="font-size:16px; font-weight:600;">Go back shopping</a>
			</tr>
			
			<tr><td></td></tr>
			<tr><td></td></tr>
			
		</table>
		You can also
		<a href="/customer/orderList" style="font-size:16px; font-weight:600;color:#ea2c58;">Check Order List</a>
	</c:if>
</div>
</div>
<br><br><br><br><br><br><br><br><br><br><br>
	<%@ include file="fragments/bottomfooter.jsp" %> 
	<script src="/js/jquery-2.1.1.js"></script>
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>








