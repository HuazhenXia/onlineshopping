<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>My Profile</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="icon" type="image/x-icon" href="/images/icon.ico">
	

	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet">
	<link href="/css/linearicons.css" rel="stylesheet">
	<link href="/css/style.css" rel="stylesheet">
	<link href="/css/responsive.css" rel="stylesheet">
	
	<link href="/css/profile.css" rel="stylesheet">
</head>
<body>
	<div class="header">
		<%@ include file="fragments/topheader.jsp" %>
		<%@ include file="fragments/middleheader.jsp" %>
		<%@ include file="fragments/bottomheader.jsp" %>
	</div>
	
	<div class="container">
		<h1 class="title" style="margin-top:80px;">Personal Information Management</h1>
		<form:form modelAttribute="customer" action="profile" method="post">
			<c:if test="${customer.id != null }">
		<form:hidden path="id" />
			</c:if>
		<table>
			<tr>
				<td><form:label path="fName">First Name:</form:label></td>
				<td><form:input path="fName" value="${customer.fName }"/></td>
				<td><form:errors path="fName" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="lName">Last Name:</form:label></td>
				<td><form:input path="lName" value="${customer.lName }"/></td>
				<td><form:errors path="lName" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="phone">Phone:</form:label></td>
				<td><form:input path="phone" value="${customer.phone }"/></td>
				<td><form:errors path="phone" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="email">Email:</form:label></td>
				<td><form:input path="email" type= "email" value="${customer.email }"/></td>
				<td><form:errors path="email" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="dob">DOB:</form:label></td>
				<td><form:input path="dob" value="${customer.dob }" placeholder="Date of Birth" onfocus="(this.type='date')"/></td>
				<td><form:errors path="dob" cssClass="error" /></td>
			</tr>
			
			<tr>
				<td><form:label path="address.street">Street:</form:label></td>
				<td><form:input path="address.street" value="${customer.address.street }"/></td>
				<td><form:errors path="address.street" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="address.city">City:</form:label></td>
				<td><form:input path="address.city" value="${customer.address.city }"/></td>
				<td><form:errors path="address.city" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="address.state">State:</form:label></td>
				<td><form:input path="address.state" value="${customer.address.state }"/></td>
				<td><form:errors path="address.state" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="address.zip">Zip:</form:label></td>
				<td><form:input path="address.zip" value="${customer.address.zip }"/></td>
				<td><form:errors path="address.zip" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="address.country">Country:</form:label></td>
				<td><form:input path="address.country" value="${customer.address.country }"/></td>
				<td><form:errors path="address.country" cssClass="error" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="SAVE" class="submit"/></td>
			</tr>
		</table>
	</form:form>
	<br><br><br>
	You can also
		<a href="/customer/orderList" style="font-size:16px; font-weight:600;color:#ea2c58;">Check Order List</a>
		
	</div>

</body>
</html>