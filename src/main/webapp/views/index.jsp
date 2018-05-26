<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Home</title>
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
	
	<!-- home -->
		<section class="home"> 
            <div class="intro">
                <div class="container">
					<div class="row">
						<div class="col-md-12 col-xs-12">
							<h2>2018</h2>
							<h1>Collections</h1>
							<small>Best Style For Women, Stock Avilable</small>
							<div><a class="btn btn-default see-collection">See Collection</a></div>
						</div>
					</div>    
                </div>    
            </div>    
		</section>	
		
		
		
		
        <!-- feature box -->    
        <section class="feature-box">    
            <div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="f-s-b">
                            <div class="well well-sm">       
                                <h3><a href="/index/clothing">Women Clothes</a></h3>
                                <small>New Fashion Style 2018</small>
                            </div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="f-s-b">
                            <div class="well well-sm">
                                
                                <h3><a href="/index/shoes">Fashion Shoes</a></h3>
                                <small>New Fashion Style 2018</small>
                            </div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="f-s-b">
                            <div class="well well-sm">
                                
                                <h3> <a href="/index/watches">Classic Watches</a></h3>
                                <small>New Fashion Style 2018</small>
                            </div>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="f-s-b">
                            <div class="well well-sm">
                                
                                <h3><a href="/index/handbag">Handbags</a></h3>
                                <small>New Fashion Style 2018</small>
                            </div>
						</div>
					</div>
				</div>    
			</div>    
		</section>	              
             
     <br/>
     
<c:if test="${empty requestScope.products }">
	No products!
</c:if>

	
		<!-- Feature Product -->
		<section class="feature-product">
			<div class="grid-product">
				<div class="container">
					<div class="row">
						<div class="section-title col-md-offset-3 col-md-6 col-xs-12 text-center">
							<h2>Featured Products</h2>
							<small>Check Out The Best Offer To Stay Trend</small>
                            <div class="section-border"><span class="dash"></span></div>
						</div>
					</div>	
					<div class="row">
						<c:if test="${empty requestScope.products }">
	No products!
</c:if>
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
		</section>

			
				<section class="fashion-box">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12 p-0 text-center">
                        <div id="f-b" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="item active">
                                    <div class="fashion-content">
                                        <small>This Summer</small>
                                        <h2>Fashion Model.</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat 						 ut turpis.</p>
                                        <ul class="list-inline">
                                            <li><i class="lnr lnr-star"></i></li>
                                            <li><i class="lnr lnr-star"></i></li>
                                            <li><i class="lnr lnr-star"></i></li>
                                            <li><i class="lnr lnr-star"></i></li>
                                            <li><i class="lnr lnr-star"></i></li>
                                        </ul>
                                        <div><a class="btn btn-default">See Collection</a></div>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="fashion-content">
                                        <small>This Summer</small>
                                        <h2>Fashion Model.</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat 						 ut turpis.</p>
                                        <ul class="list-inline">
                                            <li><i class="lnr lnr-star"></i></li>
                                            <li><i class="lnr lnr-star"></i></li>
                                            <li><i class="lnr lnr-star"></i></li>
                                            <li><i class="lnr lnr-star"></i></li>
                                            <li><i class="lnr lnr-star"></i></li>
                                        </ul>
                                        <div><a class="btn btn-default">See Collection</a></div>
                                    </div>
                                </div>
                            </div>
                            <a class="left carousel-control" href="#f-b" role="button" data-slide="prev"><i class="lnr lnr-chevron-left"></i></a>
                            <a class="right carousel-control" href="#f-b" role="button" data-slide="next"><i class="lnr lnr-chevron-right"></i></a>
                        </div>
					</div>
					
			<!-- 		<div class="col-md-5 p-0">
						<div class="counter">
							<div class="counter-content">
							<small>Style For Men</small>
							<h2 class="save-offer">Save 50% Offer</h2>
							<div><a class="btn btn-default">Shop Now</a></div>
							</div>
						</div>
					</div> -->	

				</div>    
			</div> 
		</section>
		
		
	
	<%@ include file="fragments/topfooter.jsp" %> 
	<%@ include file="fragments/middlefooter.jsp" %> 
	<%@ include file="fragments/bottomfooter.jsp" %> 
	<script src="/js/jquery-2.1.1.js"></script>
	<script src="/js/bootstrap.min.js"></script>
</body>
</html>