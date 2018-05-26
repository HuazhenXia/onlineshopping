<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<link rel="stylesheet" type="text/css" href="/css/addCategory.css" />
	<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="/js/layer.js"></script>
	<script type="text/javascript" src="/js/haidao.offcial.general.js"></script>
	<script type="text/javascript" src="/js/select.js"></script>
	<script type="text/javascript" src="/js/haidao.validate.js"></script>
	<title>Add Category</title>
</head>
<body>
<%@ include file="header.jsp"%>
	<div class="view-body">
		<%@ include file="sidebar.jsp"%>
		<div class="view-product">
			<form:form modelAttribute="category" action="/admin/manageCategory/addCategory" method="post">	
    <table >
    	<tr>
    		<td colspan="2"><span><b>Welcome to Use !</b></span>
    	</tr>
    	<tr><td></td></tr>
      <tr>
        <td><form:label path="name">Name:</form:label></td>
        <td><form:input path="name" /></td>
        <td><form:errors path="name" cssClass="error"/></td>
      </tr>
      <tr>
        <td><form:label path="description">Description:</form:label></td>
        <td><form:input path="description" /></td>
        <td><form:errors path="description" cssClass="error"/></td>
      </tr>
      <tr><td></td></tr>

      <tr>
        <td colspan="2">
        	<input type="submit" value="Add Category" />&nbsp;&nbsp;&nbsp;&nbsp;
        	<input type="reset" value="Reset" />
        
        </td>
      </tr>
    </table>
    </form:form>
    <br/>
    <br/>
   <h3>${msg}</h3>
		
		</div>
	</div>


    
</body>
</html>