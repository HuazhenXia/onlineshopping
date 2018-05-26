<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="icon" type="image/x-icon" href="/images/icon.ico">
	<link rel="stylesheet" type="text/css" href="/css/identify_vendor.css" />
	<link rel="stylesheet" type="text/css" href="/css/layout_vendor.css" />
	<link rel="stylesheet" type="text/css" href="/css/account_vendor.css" />
	<link rel="stylesheet" type="text/css" href="/css/style_vendor.css" />
	<link rel="stylesheet" type="text/css" href="/css/control_vendor.css" />
	<link rel="stylesheet" type="text/css" href="/css/listCategory.css" />
	<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="/js/layer.js"></script>
	<script type="text/javascript" src="/js/haidao.offcial.general.js"></script>
	<script type="text/javascript" src="/js/select.js"></script>
	<script type="text/javascript" src="/js/haidao.validate.js"></script>
	<title>List Category</title>
</head>
<body>
<%@ include file="header.jsp"%>
	<div class="view-body">
		<%@ include file="sidebar.jsp"%>
		<div class="view-product">
			
	<c:if test="${empty requestScope.categorys }">
	No Categories!
</c:if>
	<c:if test="${!empty requestScope.categorys }">
	
		<table border="0">
		<tr	style="	background-color:#fff;">
		<th colspan="4" ><h2>Category Table</h2></th></tr>
			<tr class="head">
				<th>Id</th>
				<th>Name</th>
				<th style="width:300px;">Description</th>
				<th>Operation</th>
			</tr>
			<c:forEach items="${requestScope.categorys }" var="category">
				<tr>
					<td>${category.id}</td>
					<td>${category.name}</td>
					<td>${category.description}</td>
					<td><a href="/admin/manageCategory/deleteCategory/${category.id }">Delete</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="/admin/manageCategory/updateCategory/${category.id }">Update</a>
					
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
		</div>
</div>

</body>
</html>