<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Vendor Management</title>
<link rel="icon" type="image/x-icon" href="/images/icon.ico">
<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/css/identify_vendor.css" />
<link rel="stylesheet" type="text/css" href="/css/layout_vendor.css" />
<link rel="stylesheet" type="text/css" href="/css/account_vendor.css" />
<link rel="stylesheet" type="text/css" href="/css/style_vendor.css" />
<link rel="stylesheet" type="text/css" href="/css/control_vendor.css" />
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/layer.js"></script>
<script type="text/javascript" src="/js/haidao.offcial.general.js"></script>
<script type="text/javascript" src="/js/select.js"></script>
<script type="text/javascript" src="/js/haidao.validate.js"></script>
<title>Product Update</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="view-body">
		<%@ include file="sidebar.jsp"%>
		<div class="view-product">
			<div class="info-center">
				<div class="manage-head">
					<h6 class="padding-left manage-head-con">PRODUCT UPDATE</h6>
				</div>
				<div class="form-group">
					<form:form modelAttribute="product" method="post"
						enctype="multipart/form-data" style="margin: 45px;">
						<form:hidden path="id" />
						<form:hidden path="enable" />
						<form:hidden path="imageURL" />
						<div class="form-group">
							<img id="picture" src="${product.imageURL}" height="200"
								width="200" />
							<form:input type="file" path="image" onchange="readURL(this);" />
						</div>

						<div class="form-group">
							<label>Name: <form:errors path="name"
									cssClass="alert-danger" /></label>
							<form:input path="name" class="form-control" />
						</div>
						<div class="form-group">
							<label>Description: <form:errors path="description"
									cssClass="alert-danger" /></label>
							<form:textarea path="description" class="form-control" rows="5"
								cols="30" />
						</div>
						<div class="form-group">
							<label>Unit Price: <form:errors path="unitPrice"
									cssClass="alert-danger" /></label>
							<form:input path="unitPrice" class="form-control" />
						</div>
						<div class="form-group">
							<label>Unit InStock: <form:errors path="unitsInStock"
									cssClass="alert-danger" /></label>
							<form:input path="unitsInStock" class="form-control" />
						</div>
						<div class="form-group">
							<label>Brand: <form:errors path="brand"
									cssClass="alert-danger" /></label>
							<form:input path="brand" class="form-control" />
						</div>
						<div class="form-group">
							<label>Category: <form:errors path="category"
									cssClass="alert-danger" /></label>
							<form:select path="category" class="form-control">
								<form:options items="${categories}" itemLabel="name" />
							</form:select>
						</div>

						<input type="submit" class="btn btn-default" value="Submit"
							style="margin: 10px; background-color: #2a94de; color: #fff;">
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<script>
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#picture').attr('src', e.target.result).width(200)
							.height(200);
				};

				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
</body>
</html>