<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/x-icon" href="/images/icon.ico">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/identify_vendor.css" />
<link rel="stylesheet" type="text/css" href="/css/layout_vendor.css" />
<link rel="stylesheet" type="text/css" href="/css/account_vendor.css" />
<link rel="stylesheet" type="text/css" href="/css/style_vendor.css" />
<link rel="stylesheet" type="text/css" href="/css/control_vendor.css" />
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/layer.js"></script>
<script type="text/javascript" src="/js/haidao.offcial.general.js"></script>
<script type="text/javascript" src="/js/select.js"></script>
<script type="text/javascript" src="/js/haidao.validate.js"></script>
<title>Vendor Produtlist</title>
</head>
<body>

	<!--header included here  -->
	<%@ include file="header.jsp"%>
	<div class="view-body">
		<%@ include file="sidebar.jsp"%>
		
		<div class="view-product">
			<div class="info-center">
				<div class="manage-head">
					<h6 class="padding-left manage-head-con">PRODUCT MANAGEMENT</h6>
				</div>

				<div class="add clearfix">
					<div class="form-group">
						<form:form action="/vendor/product/search" method="get"
							class="add clearfix">
							<input type="text" name="name" placeholder="Product Name"
								class="form-control" style="width: 240px; display: inline-block" />
							<input type="submit" value="Search" class="btn btn-default"
								style="background-color: #2a94de; color: #fff; margin-top: -4px;">
						</form:form>
					</div>

					<form:form action="/vendor/product/add" method="get"
						class="add clearfix" style="text-align:right;">
						<input type="submit" value="Add New Product"
							style="background-color: #2a94de; color: #fff"
							class="btn btn-default">
					</form:form>
				</div>
				<br /> <br />
				<div class="form-group"
					style="margin-left: 40px; margin-right: 40px;">
					<table class="table">
						<thead>
							<tr>
								<th>Image</th>
								<th>Name</th>
								<th>Description</th>
								<th>UnitPrice</th>
								<th>UnitsInStock</th>
								<th>Brand</th>
								<th>Category</th>
								<th>Update Product</th>
								<th>Remove Product</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="product" items="${products}">
								<tr>
									<td><img src="${product.imageURL}" height="100" width="100" /></td>
									<td><c:out value="${product.name}" /></td>
									<td><c:out value="${product.description}" /></td>
									<td><c:out value="${product.unitPrice}" /></td>
									<td><c:out value="${product.unitsInStock}" /></td>
									<td><c:out value="${product.brand}" /></td>
									<td><c:out value="${product.category.name}" /></td>
									<td><form:form action="/vendor/product/update"
											method="get">
											<input type="hidden" name="productId" value="${product.id }" />
											<input type="submit" value="Edit" class="btn btn-default" />
										</form:form></td>
									<td><form:form action="/vendor/product/remove"
											method="post">
											<input type="hidden" name="productId" value="${product.id }" />
											<input type="submit" value="Remove" class="btn btn-default" />
										</form:form></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>

			<div class="manage-head">
				<h6 class="padding-left manage-head-con">PRODUCT WAREHOUSE</h6>
			</div>
			<div class="form-group" style="margin: 20px 40px 40px 40px;">
				<table class="table">
					<thead>
						<tr>
							<th>Image</th>
							<th>Name</th>
							<th>Description</th>
							<th>UnitPrice</th>
							<th>UnitsInStock</th>
							<th>Brand</th>
							<th>Category</th>
							<th>Update Product</th>
							<th>Active Product</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${products_disabled}">
							<tr>
								<td><img
									src="${product.imageURL}"
									height="100" width="100" /></td>
								<td><c:out value="${product.name}" /></td>
								<td><c:out value="${product.description}" /></td>
								<td><c:out value="${product.unitPrice}" /></td>
								<td><c:out value="${product.unitsInStock}" /></td>
								<td><c:out value="${product.brand}" /></td>
								<td><c:out value="${product.category.name}" /></td>
								<td><form:form action="/vendor/product/update" method="get">
										<input type="hidden" name="productId" value="${product.id }" />
										<input type="submit" value="Edit" class="btn btn-default" />
									</form:form></td>
								<td><form:form action="/vendor/product/active"
										method="post">
										<input type="hidden" name="productId" value="${product.id }" />
										<input type="submit" value="Active" class="btn btn-default" />
									</form:form></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
		$(".sidebar-title").live('click', function() {
			if ($(this).parent(".sidebar-nav").hasClass("sidebar-nav-fold")) {
				$(this).next().slideDown(200);
				$(this).parent(".sidebar-nav").removeClass("sidebar-nav-fold");
			} else {
				$(this).next().slideUp(200);
				$(this).parent(".sidebar-nav").addClass("sidebar-nav-fold");
			}
		});
	</script>
</body>
</html>