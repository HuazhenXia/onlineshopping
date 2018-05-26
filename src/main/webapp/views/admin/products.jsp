<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:if test="${empty requestScope.products }">
	No products!
</c:if>
<c:if test="${!empty requestScope.products }">
	<table border="1"><tr>
			<th>Id</th>
			<th>Product Name</th>
			<th>Unit Price</th>
			<th>Description</th>
			<th>Units In Stock</th>
			<!-- <th>Discount</th>
			<th>Conditioned</th> -->
			<th>Category</th>
			<th>Category Description</th>
		</tr>
		<c:forEach items="${requestScope.products }" var="product">
		<tr>
			<td>${product.id} </td>			
			<td>${product.pName} </td>			
			<td>${product.unitPrice} </td>			
			<td>${product.description} </td>			
			<td>${product.unitsInStock} </td>			
			<%-- <td>${product.discount} </td>			
			<td>${product.conditioned} </td> --%>			
			<td>${product.category.name} </td>			
			<td>${product.category.description} </td>			
					
			<td><a href="/addToCart/${product.id }">Add To Cart</a></td>			
		</tr>
		</c:forEach>
	</table>
</c:if>
<a href="/user">Go home</a>
</body>
</html>