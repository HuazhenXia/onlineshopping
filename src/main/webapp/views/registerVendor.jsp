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

	<form:form modelAttribute="vendor" action="/register/vendor" method="post">

		<table>
			<tr>
				<td><form:label path="fName">First Name:</form:label></td>
				<td><form:input path="fName" /></td>
				<td><form:errors path="fName" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="lName">Last Name:</form:label></td>
				<td><form:input path="lName" /></td>
				<td><form:errors path="lName" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="phone">Phone:</form:label></td>
				<td><form:input path="phone" /></td>
				<td><form:errors path="phone" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="email">Email:</form:label></td>
				<td><form:input path="email" /></td>
				<td><form:errors path="email" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="dob">DOB:</form:label></td>
				<td><form:input path="dob" /></td>
				<td><form:errors path="dob" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="accountNumber">AccountNumber:</form:label></td>
				<td><form:input path="accountNumber" /></td>
				<td><form:errors path="accountNumber" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="income">Income:</form:label></td>
				<td><form:input path="income" /></td>
				<td><form:errors path="income" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="address.street">Street:</form:label></td>
				<td><form:input path="address.street" /></td>
				<td><form:errors path="address.street" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="address.city">City:</form:label></td>
				<td><form:input path="address.city" /></td>
				<td><form:errors path="address.city" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="address.state">State:</form:label></td>
				<td><form:input path="address.state" /></td>
				<td><form:errors path="address.state" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="address.zip">Zip:</form:label></td>
				<td><form:input path="address.zip" /></td>
				<td><form:errors path="address.zip" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="address.country">Country:</form:label></td>
				<td><form:input path="address.country" /></td>
				<td><form:errors path="address.country" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="user.username">Username:</form:label></td>
				<td><form:input path="user.username" /></td>
				<td><form:errors path="user.username" cssClass="error" /></td>
			</tr>
			<tr>
				<td><form:label path="user.password">Password:</form:label></td>
				<td><form:input path="user.password" /></td>
				<td><form:errors path="user.password" cssClass="error" /></td>
			</tr>
			<!-- <tr>
				<td><form:label path="user.hasRole">HasRole:</form:label></td>
				<td><form:select path="user.hasRole" items="${role}" /></td> 
				<td><form:select path="user.hasRole">
						<form:option value="ROLE_USER" label="ROLE_USER"/>
						<form:option value="ROLE_USER" label="ROLE_VENDOR"/>
					</form:select>
				</td>
				<td><form:errors path="user.hasRole" cssClass="error" /></td>
			</tr> -->
			<tr>
				<td><form:label path="user.enabled">Enabled:</form:label></td>
				<td><form:checkbox path="user.enabled" /></td>
				<td><form:errors path="user.enabled" cssClass="error" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="addVendor" /></td>
			</tr>
		</table>
	</form:form>
</body>
</html>