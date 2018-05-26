<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Category</title>
<link rel="icon" type="image/x-icon" href="/images/icon.ico">
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


</head>
<body>
	
	<%@ include file="header.jsp"%>
	<div class="view-body">
		<%@ include file="sidebar.jsp"%>
		<div class="view-product">
			<a href="/admin/manageCategory/addCategory">Add Category</a>

			<a href="/admin/manageCategory/listCategory">List Category</a>
		</div>
	</div>
	
	
 
</body>
</html>