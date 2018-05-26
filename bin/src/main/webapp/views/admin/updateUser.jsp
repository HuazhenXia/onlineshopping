<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form:form modelAttribute="customer" action="/updateUserForAdmin/${customer.id}" method="post">
		
		<table>
			<tr>
				<td><form:label path="fName">fName:</form:label></td>
				<td><form:input path="fName" value="${customer.fName }"/></td>
				<td><form:errors path="fName" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="lName">lName:</form:label></td>
				<td><form:input path="lName" value="${customer.lName }"/></td>
				<td><form:errors path="lName" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="phone">phone:</form:label></td>
				<td><form:input path="phone" value="${customer.phone }"/></td>
				<td><form:errors path="phone" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="email">email:</form:label></td>
				<td><form:input path="email" value="${customer.email }"/></td>
				<td><form:errors path="email" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="dob">dob:</form:label></td>
				<td><form:input path="dob" value="${customer.dob }"/></td>
				<td><form:errors path="dob" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="identificationNumber">identificationNumber:</form:label></td>
				<td><form:input path="identificationNumber" value="${customer.identificationNumber }"/></td>
				<td><form:errors path="identificationNumber" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="address.street">street:</form:label></td>
				<td><form:input path="address.street" value="${customer.address.street }"/></td>
				<td><form:errors path="address.street" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="address.city">city:</form:label></td>
				<td><form:input path="address.city" value="${customer.address.city }"/></td>
				<td><form:errors path="address.city" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="address.state">state:</form:label></td>
				<td><form:input path="address.state" value="${customer.address.state }"/></td>
				<td><form:errors path="address.state" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="address.zip">zip:</form:label></td>
				<td><form:input path="address.zip" value="${customer.address.zip }"/></td>
				<td><form:errors path="address.zip" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="address.country">country:</form:label></td>
				<td><form:input path="address.country" value="${customer.address.country }"/></td>
				<td><form:errors path="address.country" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="user.username">username:</form:label></td>
				<td><form:input path="user.username" value="${customer.user.username }"/></td>
				<td><form:errors path="user.username" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="user.password">password:</form:label></td>
				<td><form:input path="user.password" value="${customer.user.password }"/></td>
				<td><form:errors path="user.password" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="user.hasRole">hasRole:</form:label></td>
				<td><form:select path="user.hasRole" items="${role}" /></td>
				<td><form:errors path="user.hasRole" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="user.enabled">enabled:</form:label></td>
				<td><form:checkbox path="user.enabled" value="${customer.user.enabled }"/></td>
				<td><form:errors path="user.enabled" cssClass="error" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="updateUser" /></td>
			</tr>
		</table>
	</form:form>
</body>
</html>