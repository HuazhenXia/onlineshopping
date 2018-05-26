<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Products List</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet">
	<link href="/css/linearicons.css" rel="stylesheet">
	<link href="/css/style.css" rel="stylesheet">
	<link href="/css/responsive.css" rel="stylesheet">
	<link href="/css/products.css" rel="stylesheet">
	<link rel="icon" type="image/x-icon" href="/images/icon.ico">
</head>
<body>
	<div class="header">
		<%@ include file="fragments/topheader.jsp" %>
		<%@ include file="fragments/middleheader.jsp" %>
		<%@ include file="fragments/bottomheader.jsp" %>
	</div>
	
	
	
	<div class="container" style="margin-top:80px;">
		     <form modelAttribute="pname"  method="get" action="/customer/listProduct/search">
    		<table>
                <tbody>
                <tr>
                    <td>
                        <input type="text"  name="pname" value = "${pname}" style="height:32px;width:280px;"/>
                    </td>
                    <td width="85" align="right"><input type="submit" value="Search" 
                    style="height:32px;width:100px;background-color:#ea2c58;color:#fff;border:0px;" /></td>
                </tr>
                </tbody>
            </table>
            </form><br>
            <div class="category">
            	<span style="font-weight:600;font-size:18px;">Category:</span>
            	<a href="/customer/productDetail/clothing">&nbsp;&nbsp;<i class="glyphicon glyphicon-tag"></i>&nbsp;Clothing&nbsp;</a>
            	<a href="/customer/productDetail/shoes">&nbsp;&nbsp;<i class="glyphicon glyphicon-tag"></i>&nbsp;Shoes&nbsp;</a>
            	<a href="/customer/productDetail/watches">&nbsp;&nbsp;<i class="glyphicon glyphicon-tag"></i>&nbsp;Watches&nbsp;</a>
            	<a href="/customer/productDetail/handbag">&nbsp;&nbsp;<i class="glyphicon glyphicon-tag"></i>&nbsp;Handbag</a>
            </div>
            
<br/>
	<br/>
	<c:if test="${empty requestScope.products }">
	No products!
	</c:if>
	<c:if test="${!empty requestScope.products }">
		
					

	</c:if>
	
	</div>

<div class="feature-box">	
	<div class="container">
		<div class="row">
			<c:forEach items="${requestScope.products }" var="product">
				<div class="col-md-3 col-sm-6 col-xs-12">
							<div class="single-grid">
								<div class="grid-img">
									
									<img class="img-resposive" src="${product.imageURL}" alt="women">
                                    <strong>Hot</strong>
									<div class="grid-overlay">
									
									<a href="/customer/productDetail/${product.id }">
										
									</a>
										<ul>
											<li><i class="lnr lnr-cart"></i></li>
										</ul>
									</div>
								</div>	
								<h3><a href="/customer/productDetail/${product.id }">${product.name}</a><span>$ ${product.unitPrice}</span></h3>
								<p>${product.category.name} ${product.description}
								
								
								</p>
						</div>
				</div>		
			</c:forEach>
		
		</div>
	
	</div>
	
</div>				
	
<br><br><br><br><br><br><br><br><br><br><br>	
<script src="/js/jquery-2.1.1.js"></script>
	<script src="/js/bootstrap.min.js"></script>	
	

 <%@ include file="fragments/bottomfooter.jsp" %> 
</body>
</html>