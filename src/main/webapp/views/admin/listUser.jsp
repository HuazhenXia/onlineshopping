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
	<title>List User</title>
</head>
<body>

<%@ include file="header.jsp"%>
	<div class="view-body">
		<%@ include file="sidebar.jsp"%>
		<div class="view-product">
			<c:if test="${empty requestScope.customers }">
	No customers!
</c:if>
<c:if test="${!empty requestScope.customers }">



	<table border="1" style="margin:20px auto;">
	<tbody>
	
	<tr	style="	background-color:#fff;">
		<th colspan="15" ><h2>User Table</h2></th></tr>
		<tr>
			<th>Id</th>
			<th>FName</th>
			<th>lName</th>
			<th>Phone</th>
			<th>Email</th>
			<!-- <th>dob</th>
			<th>identificationNumber</th> -->
			<th>Street</th>
			<th>City</th>
			<th>State</th>
			<th>Zip</th>
			<!-- <th>address.country</th> -->
			<th>Username</th>
		<!-- 	<th>user.password</th> -->
			<th>Role</th>
			<th>Enabled</th>
			<th colspan="2">Operation</th>
			
		</tr>
		<c:forEach items="${requestScope.customers }" var="customer">
		<tr>
			<td>${customer.id} </td>			
			<td>${customer.fName} </td>			
			<td>${customer.lName} </td>			
			<td>${customer.phone} </td>			
			<td>${customer.email} </td>			
				
					
			<td>${customer.address.street} </td>			
			<td>${customer.address.city} </td>			
			<td>${customer.address.state} </td>			
			<td>${customer.address.zip} </td>			
		<%-- 	<td>${customer.address.country} </td>	 --%>		
			<td>${customer.user.username} </td>			
			<%-- <td>${customer.user.password} </td>	 --%>		
			<td>${customer.user.hasRole} </td>			
			<td>${customer.user.enabled} </td>			
			<td><a href="/deleteUser/${customer.id }">Delete</a></td>			
			<td><a href="/updateUser/byAdmin/forcustomer/${customer.id }">Update</a></td>			
		</tr>
		</c:forEach>
		</tbody>
	</table>
</c:if>
		</div>
	</div>

<a href="/admin">Go home</a>
</body>
</html>