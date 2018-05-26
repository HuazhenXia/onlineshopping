<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Register</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet">
	<link href="/css/linearicons.css" rel="stylesheet">
	<link href="/css/style.css" rel="stylesheet">
	<link href="/css/responsive.css" rel="stylesheet">
	<link rel="icon" type="image/x-icon" href="/images/icon.ico">
	<link href="/css/register.css" rel="stylesheet">
</head>

<body>
	<div class="header">
		<%@ include file="fragments/topheader.jsp" %>
		<%@ include file="fragments/middleheader.jsp" %>
		<%@ include file="fragments/bottomheader.jsp" %>
	</div>

	<div class="container">
		<form:form modelAttribute="customer" action="/register" method="post">
			<table>
				<tr>
					<td></td>
				</tr>
				<tr class="title">
					<td>Personal Information</td>
				</tr>
				<tr>
					<td><form:input path="fName" placeholder="First Name"/></td>
					<td><form:errors path="fName" cssClass="error" /></td>
				</tr>
				<tr>
					<td><form:input path="lName" placeholder="Last Name"/></td>
					<td><form:errors path="lName" cssClass="error" /></td>
				</tr>		
				<tr>
					<td><form:input type="text" path="dob" placeholder="Date of Birth" onfocus="(this.type='date')"/></td>
					<td><form:errors path="dob" cssClass="error" /></td>
				</tr>
				<tr>
					<td></td>
				</tr>
				<tr class="title">
					<td>Contact Information</td>
				</tr>
				<tr>
					<td><form:input path="phone" placeholder="Phone"/></td>
					<td><form:errors path="phone" cssClass="error" /></td>
				</tr>
				<tr>
					<td><form:input path="email" placeholder="Email"/></td>
					<td><form:errors path="email" cssClass="error" /></td>
				</tr>
				<tr>
					<td></td>
				</tr>
				<tr class="title">
					<td>Address Information</td>
				</tr>
				<tr>
					<td><form:input path="address.street" placeholder="Street"/></td>
					<td><form:errors path="address.street" cssClass="error" /></td>
				</tr>
				<tr>
					<td><form:input path="address.city" placeholder="City"/></td>
					<td><form:errors path="address.city" cssClass="error" /></td>
				</tr>
				<tr>
					<td><form:input path="address.state" placeholder="State"/></td>
					<td><form:errors path="address.state" cssClass="error" /></td>
				</tr>
				<tr>
					<td><form:input path="address.zip" placeholder="Zip Code"/></td>
					<td><form:errors path="address.zip" cssClass="error" /></td>
				</tr>
				<tr>
					<td><form:input path="address.country" placeholder="Country"/></td>
					<td><form:errors path="address.country" cssClass="error" /></td>
				</tr>
				<tr>
					<td></td>
				</tr>
				<tr  class="title">
					<td>Login Information</td>
				</tr>
				<tr>
					<td><form:input path="user.username" placeholder="User Name"/></td>
					<td><form:errors path="user.username" cssClass="error" /></td>
				</tr>
				<tr>
					
					<td><form:input path="user.password" placeholder="Password"/></td>
					<td><form:errors path="user.password" cssClass="error" /></td>
				</tr>
				<!-- <tr>
					<td><form:select path="user.hasRole" items="${role}" /></td>
					<td><form:errors path="user.hasRole" cssClass="error" /></td>
				</tr> -->
				<tr>			
					<td><form:checkbox path="user.enabled"/></td>
					<td><form:errors path="user.enabled" cssClass="error" /></td>
				</tr>
				<tr>
					<td></td>
				</tr>
				<tr>
					<td ><input type="submit" class="submit" value="REGISTER" /></td>
				</tr>
			</table>
			
		</form:form>
		
	</div>

	<%@ include file="fragments/bottomfooter.jsp" %> 
	<script src="/js/jquery-2.1.1.js"></script>
	<script src="/js/bootstrap.min.js"></script>

</body>
</html>