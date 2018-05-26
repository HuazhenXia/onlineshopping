<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="icon" type="image/x-icon" href="/images/icon.ico">
	<link rel="stylesheet" type="text/css" href="/css/identify_vendor.css" />
	<link rel="stylesheet" type="text/css" href="/css/layout_vendor.css" />
	<link rel="stylesheet" type="text/css" href="/css/account_vendor.css" />
	<link rel="stylesheet" type="text/css" href="/css/style_vendor.css" />
	<link rel="stylesheet" type="text/css" href="/css/control_vendor.css" />
	<link rel="stylesheet" type="text/css" href="/css/listCategory.css" />
	<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="/js/layer.js"></script>
	<script type="text/javascript" src="/js/haidao.offcial.general.js"></script>
	<script type="text/javascript" src="/js/select.js"></script>
	<script type="text/javascript" src="/js/haidao.validate.js"></script>
	<title>List Vendor</title>
</head>
<body>

<%@ include file="header.jsp"%>
	<div class="view-body">
		<%@ include file="sidebar.jsp"%>
		<div class="view-product">
			<c:if test="${empty requestScope.vendors }">
	No Vendors!
</c:if>
<c:if test="${!empty requestScope.vendors }">
	<table border="1" style="margin:20px auto;">
	<tr	style="	background-color:#fff;">
		<th colspan="15" ><h2>Vendor Table</h2></th></tr>
	
	<tr>
			<th>Id</th>
			<th>FName</th>
			<th>lName</th>
			<th>Phone</th>
			<th>email</th>
			<th>Street</th>
			<th>City</th>
			<th>State</th>
			<th>Zip</th>
			<th>Username</th>
			<th>Role</th>
			<th>Enabled</th>
			
		</tr>
		<c:forEach items="${requestScope.vendors }" var="vendor">
		<tr>
			<td>${vendor.id} </td>			
			<td>${vendor.fName} </td>			
			<td>${vendor.lName} </td>			
			<td>${vendor.phone} </td>			
			<td>${vendor.email} </td>			
			<%-- <td>${customer.dob} </td>			
			<td>${customer.identificationNumber} </td> --%>			
			<td>${vendor.address.street} </td>			
			<td>${vendor.address.city} </td>			
			<td>${vendor.address.state} </td>			
			<td>${vendor.address.zip} </td>			
		<%-- 	<td>${customer.address.country} </td>	 --%>		
			<td>${vendor.user.username} </td>			
			<%-- <td>${customer.user.password} </td>	 --%>		
			<td>${vendor.user.hasRole} </td>			
			<td>${vendor.user.enabled} </td>			
			<td><a href="/delete/vendor/${vendor.id }">Delete</a></td>			
			<td><a href="/updateVendor/ByAdmin/${vendor.id }">Update</a></td>			
		</tr>
		</c:forEach>
	</table>
</c:if>
		</div>
	</div>



<a href="/admin">Go home</a>
</body>
</html>