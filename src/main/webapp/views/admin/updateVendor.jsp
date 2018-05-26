<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/x-icon" href="/images/icon.ico">
	<link rel="stylesheet" type="text/css" href="/css/identify_vendor.css" />
	<link rel="stylesheet" type="text/css" href="/css/layout_vendor.css" />
	<link rel="stylesheet" type="text/css" href="/css/account_vendor.css" />
	<link rel="stylesheet" type="text/css" href="/css/style_vendor.css" />
	<link rel="stylesheet" type="text/css" href="/css/control_vendor.css" />
	<link rel="stylesheet" type="text/css" href="/css/addUser.css" />
	<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="/js/layer.js"></script>
	<script type="text/javascript" src="/js/haidao.offcial.general.js"></script>
	<script type="text/javascript" src="/js/select.js"></script>
	<script type="text/javascript" src="/js/haidao.validate.js"></script>
	<title>Update User</title>
</head>
<body>
<%@ include file="header.jsp"%>
	<div class="view-body">
		<%@ include file="sidebar.jsp"%>
	
		<div class="view-product">
			<form:form modelAttribute="vendor" action="/updateVendor/ByAdmin/${vendor.id}" method="post">
		
		<table>
			<tr>
				<td><form:label path="fName">fName:</form:label></td>
				<td><form:input path="fName" value="${vendor.fName }"/></td>
				<td><form:errors path="fName" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="lName">lName:</form:label></td>
				<td><form:input path="lName" value="${vendor.lName }"/></td>
				<td><form:errors path="lName" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="phone">Phone:</form:label></td>
				<td><form:input path="phone" value="${vendor.phone }"/></td>
				<td><form:errors path="phone" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="email">Email:</form:label></td>
				<td><form:input path="email" value="${vendor.email }"/></td>
				<td><form:errors path="email" cssClass="error" /></td>
			</tr>
			
			<tr>
				<td><form:label path="accountNumber">Account Number:</form:label></td>
				<td><form:input path="accountNumber" value="${vendor.accountNumber }"/></td>
				<td><form:errors path="accountNumber" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="address.street">Street:</form:label></td>
				<td><form:input path="address.street" value="${vendor.address.street }"/></td>
				<td><form:errors path="address.street" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="address.city">City:</form:label></td>
				<td><form:input path="address.city" value="${vendor.address.city }"/></td>
				<td><form:errors path="address.city" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="address.state">state:</form:label></td>
				<td><form:input path="address.state" value="${vendor.address.state }"/></td>
				<td><form:errors path="address.state" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="address.zip">Zip:</form:label></td>
				<td><form:input path="address.zip" value="${vendor.address.zip }"/></td>
				<td><form:errors path="address.zip" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="address.country">Country:</form:label></td>
				<td><form:input path="address.country" value="${vendor.address.country }"/></td>
				<td><form:errors path="address.country" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="user.username">Username:</form:label></td>
				<td><form:input path="user.username" value="${vendor.user.username }"/></td>
				<td><form:errors path="user.username" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="user.password">Password:</form:label></td>
				<td><form:input path="user.password" value="${vendor.user.password }"/></td>
				<td><form:errors path="user.password" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="user.hasRole">Role:</form:label></td>
				<td><form:select path="user.hasRole" items="${role}" /></td>
				<td><form:errors path="user.hasRole" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="user.enabled">Enabled:</form:label></td>
				<td><form:checkbox path="user.enabled" value="${vendor.user.enabled }"/></td>
				<td><form:errors path="user.enabled" cssClass="error" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Update" /></td>
			</tr>
		</table>
	</form:form>
		</div>

	</div>

	
</body>
</html>