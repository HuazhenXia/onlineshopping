<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="Css/identify.css" />
	<link rel="stylesheet" type="text/css" href="Css/layout.css" />
	<link rel="stylesheet" type="text/css" href="Css/account.css" />
	<link rel="stylesheet" type="text/css" href="Css/style.css" />
	<link rel="stylesheet" type="text/css" href="Css/control_index.css" />
	<script type="text/javascript" src="Js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="Js/layer/layer.js"></script>
	<script type="text/javascript" src="Js/haidao.offcial.general.js"></script>
	<script type="text/javascript" src="Js/select.js"></script>
	<script type="text/javascript" src="Js/haidao.validate.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h2>Product List</h2>
		<div class="form-group">
					
			<form:form action="/vendor/product/search" method="get">
				<input type="text" name="name" />
				<input type="submit" class="btn btn-default">
			</form:form>
			<form:form action="/vendor/product/add" method="get">
				<input type="submit" value="Add New Product" class="btn btn-default">
			</form:form>
			<table class="table">
				<thead>
					<tr>
						<th>Image</th>
						<th>Name</th>
						<th>Description</th>
						<th>UnitPrice</th>
						<th>UnitsInStock</th>
						<th>Conditioned</th>
						<th>Update Product</th>
						<th>Remove Product</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${products}">
						<tr>
							<td><c:out value="${product.image}" /></td>
							<td><c:out value="${product.name}" /></td>
							<td><c:out value="${product.description}" /></td>
							<td><c:out value="${product.unitPrice}" /></td>
							<td><c:out value="${product.unitsInStock}" /></td>
							<td><c:out value="${product.conditioned}" /></td>
							<td><form:form action="/vendor/product/update" method="get">
									<input type="hidden" name="productId" value="${product.id }" />
									<input type="submit" value="Edit" />
								</form:form></td>
							<td><form:form action="/vendor/product/remove" method="post">
									<input type="hidden" name="productId" value="${product.id }" />
									<input type="submit" value="Remove" />
								</form:form></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>