<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Product Detail</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/font-awesome.min.css" rel="stylesheet">
	<link href="/css/linearicons.css" rel="stylesheet">
	<link href="/css/style.css" rel="stylesheet">
	<link href="/css/responsive.css" rel="stylesheet">
	
	<link rel="icon" type="image/x-icon" href="/images/icon.ico">
</head>
<body>

	<div class="header">
		<%@ include file="fragments/topheader.jsp" %>
		<%@ include file="fragments/middleheader.jsp" %>
		<%@ include file="fragments/bottomheader.jsp" %>
	</div>
<section class="single-product" style="margin-top:60px;">
            <div class="container">	
                <div class="row">	
                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <div class="single-product-img">
                            <img class="img-responsive" src="${product.imageURL}" alt="">
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="single-product-detail">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-default active"> <i class="fa fa-circle"></i> in Stock</button>
                                <button type="button" class="btn btn-default">${product.unitsInStock} - in Stock</button>
                            </div>
                            <h3>${product.name} &amp; ${product.category.name}</h3>
                            <ul class="list-inline">
                                <li></li>
                            </ul>
                            <p>${product.description}Lorem ipsum dolor ${product.category.description}sit amet, mauris ac suscipit porta. Vel sed tempore, leo dictum nec turpis nibh curabitur, ultricies nibh quam neque mauris tortor sit. Vel urna quis, neque cursus id sollicitudin ipsum, euismod a libero mi. Tellus accumsan purus diam molestias suspendisse non, tellus pede cursus inceptos leo turpis nec.</p>
                            <br><br>
                            <div class="price">${product.unitPrice}</div>
                            <div class="order-tag">Tellus accumsan purus diam molestias</div>
                            <div class="add-cart"><a class="btn btn-default" href="/addShoppingCart/${product.id }"><i class="lnr lnr-cart"></i>Add to Cart</a></div>
                        </div>    
                    </div>    
                </div>    
            </div> 
		</section>
		<br><br><br><br><br><br><br><br>

	<%@ include file="fragments/middlefooter.jsp" %> 
	<%@ include file="fragments/bottomfooter.jsp" %> 
	<script src="/js/jquery-2.1.1.js"></script>
	<script src="/js/bootstrap.min.js"></script>   
</body>
</html>