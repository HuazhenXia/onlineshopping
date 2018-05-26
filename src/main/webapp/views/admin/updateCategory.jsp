<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/x-icon" href="/images/icon.ico">
	<link rel="stylesheet" type="text/css" href="/css/identify_vendor.css" />
	<link rel="stylesheet" type="text/css" href="/css/layout_vendor.css" />
	<link rel="stylesheet" type="text/css" href="/css/account_vendor.css" />
	<link rel="stylesheet" type="text/css" href="/css/style_vendor.css" />
	<link rel="stylesheet" type="text/css" href="/css/control_vendor.css" />
	<link rel="stylesheet" type="text/css" href="/css/addUser.css" />
	<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="/js/layer.js"></script>
	<script type="text/javascript" src="/js/haidao.offcial.general.js"></script>
	<script type="text/javascript" src="/js/select.js"></script>
	<script type="text/javascript" src="/js/haidao.validate.js"></script>
	<title>Update Category</title>
</head>
<body>

<%@ include file="header.jsp"%>
	<div class="view-body">
		<%@ include file="sidebar.jsp"%>	
		<div class="view-product">
			<table style="margin-left: 40px;margin-top:24px;">
<form:form modelAttribute="category" action="/admin/manageCategory/updateCategory/${category.id }" method="post">	
      <tr><td><b>Name</b></td></tr>
      <tr>
        <td><form:input path="name" placeholder="name" style="width:600px;" value="${category.name }"/></td>
        <td><form:errors path="name" cssClass="error"/></td>
      </tr>
      <tr><td><b>Description</b></td></tr>
      <tr>
        <td><form:textarea path="description" placeholder="description" value="${category.description }"/></td>
        <td><form:errors path="description" cssClass="error"/></td>
      </tr>
      
      
      <tr>
        <td colspan="2"><input type="submit" value="updateCategory" /></td>
      </tr>
    </form:form>
    </table>
		</div>
	</div>

</body>
</html>