<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Profile</title>
</head>
<body>
	<form:form modelAttribute="customer" action="editProfile" method="post">
		<c:if test="${customer.id != null }">
			<form:hidden path="id" />
		</c:if>
		<table border="1">
			<tr>
				<td><form:label path="fName">FirstName:</form:label></td>
				<td><form:input path="fName" value="${customer.fName }" /></td>
			</tr>
			<tr>
				<td><form:label path="lName">LastName:</form:label></td>
				<td><form:input path="lName" value="${customer.lName }" /></td>
			</tr>
			<tr>
				<td><form:label path="email">Email:</form:label></td>
				<td><form:input path="email" value="${customer.email }" /></td>
			</tr>
			<tr>
				<td><form:label path="phone">Phone:</form:label></td>
				<td><form:input path="phone" value="${customer.phone }" /></td>
			</tr>
			<tr>
				<td><form:label path="identificationNumber">Identification No:</form:label></td>
				<td><form:input path="identificationNumber"
						value="${customer.identificationNumber }" /></td>
			</tr>
			<tr>
				<td><form:label path="address.city">City:</form:label></td>
				<td><form:input path="address.city"
						value="${customer.address.city }" /></td>
			</tr>
			<tr>
				<td><form:label path="address.state">State:</form:label></td>
				<td><form:input path="address.state"
						value="${customer.address.state }" /></td>
			</tr>
			<tr>
				<td><form:label path="address.country">Country:</form:label></td>
				<td><form:input path="address.country"
						value="${customer.address.country }" /></td>
			</tr>
			<tr>
				<td><form:label path="address.zipcode">Zipcode:</form:label></td>
				<td><form:input path="address.zipcode"
						value="${customer.address.zipcode }" /></td>
			</tr>
			<tr>
				<td><form:label path="enable">Enable</form:label></td>
				<td><form:checkbox path="enable"
						value="${customer.user.enable }" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Update Profile" /></td>
			</tr>
		</table>
	</form:form>
</body>
</html>