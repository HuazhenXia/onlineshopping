<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	<link rel="icon" type="image/x-icon" href="/images/icon.ico">
</head>
<body>
	<div class="header">
		<%@ include file="../fragments/topheader.jsp" %>
		<%@ include file="../fragments/middleheader.jsp" %>
		<%@ include file="../fragments/bottomheader.jsp" %>
	</div>

<div class="container box" >
	<div class="name"><span class="glyphicon glyphicon-user"></span>&nbsp; ${customer.fName } ${customer.lName }</div>
	<div class="phone">&nbsp;&nbsp;<span class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${customer.phone } </div>
	<div class="email">&nbsp;&nbsp;<span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${customer.email } </div>		
	<div class="address">&nbsp;&nbsp;<span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${customer.address } </div>			
<br><br>
			
	
	<div class="name"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp; Billing Information</div>
	<div style="align:center">
	 
		<table border="0">
			<tr>
				<th>Product Name</th>
				<th>Unit Price</th>
				<th>Quantity</th>
				<th>Sub Total</th>
			</tr>
			 
			<c:forEach items="${orderDetails}" var="orderDetails">
			<tr>
				<td>${orderDetails.product.name}</td>
				<td>${orderDetails.unitCost }</td>
				<td>${orderDetails.quantity }</td>
				<td>${orderDetails.subTotal }</td>
			</tr>
			</c:forEach>
			<tr class="totel">
					<th></th>
					<th></th>
					<th>Total(include tax 7%)</th>
					<th>$ <fmt:formatNumber value="${totalPrice}" pattern="#0.00" /></th>
			</tr>
		</table>
		<br><br>
		<a href="/customer/orderList" style="font-size:20px;font-weight:400;"> Go Back Order List	</a>
	</div>
</div>

</body>
</html>