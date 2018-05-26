<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h2>Product Edit</h2>
		<form:form modelAttribute="product" method="post" enctype="multipart/form-data">
			<form:hidden path="id" />
			<form:hidden path="enable" />
			<div class="form-group">
				<label>Image: </label>
				<form:input type="file" path="image" class="form-control" />
			</div>
			
			<div class="form-group">
				<label>Name: <form:errors path="name" cssClass="alert-danger" /></label>
				<form:input path="name" class="form-control" />
			</div>
			<div class="form-group">
				<label>Description: <form:errors path="description" cssClass="alert-danger" /></label>
					<form:textarea path="description" class="form-control" rows="5" cols="30" />
			</div>
			<div class="form-group">
				<label>Unit Price: <form:errors path="unitPrice" cssClass="alert-danger" /></label> 
				<form:input path="unitPrice" class="form-control" />
			</div>
			<div class="form-group">
				<label>Unit InStock: <form:errors path="unitsInStock" cssClass="alert-danger" /></label> 
				<form:input path="unitsInStock" class="form-control" />
			</div>
			<div class="form-group">
				<label>Conditioned: <form:errors path="conditioned" cssClass="alert-danger" /></label> 
				<form:input path="conditioned" class="form-control" />
			</div>
		
			<input type="submit" class="btn btn-default">
		</form:form>
	</div>
</body>
</html>