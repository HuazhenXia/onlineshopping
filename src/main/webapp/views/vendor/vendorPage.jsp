<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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
<title>Vendor Home</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="view-body">
		<%@ include file="sidebar.jsp"%>
		<div class="view-product background-color">
			<div class="padding-big background-color">
				<div class="account-info clearfix">
					<div class="text-box-main min-width-300 fl">
						<dl>
							<dt class="padding-big-left lists-border-list clearfix">
								<div class="title fl padding-big-top padding-big-bottom">
									<p>Hi, ${username}</p>
									<p class="margin-small-top clearfix">
										<span class="fl"><em class="text-blue-deep">Verification</em></span>
										<!-- <a class="button bg-blue-deep icon icon-button-blue fl margin-left" href="#">Å</a> -->
										<a
											class="button bg-green-deep icon icon-button-green fl margin-left"
											href="#">Verified</a>
									</p>
								</div>
								<!-- <span class="fr icon-head"> 
									<img src="/views/pictures/headimage.jpg"/>
								</span> -->
							</dt>
							<dd class="padding-big clearfix">
								<p class="w50 fl">
									<i class="fl icon icon-email"></i> <span class="fl margin-left">MailBox:
										Verified</span>
								</p>
							</dd>
							<dd class="padding-big clearfix">
								<p style="font-size: 18px; color: #008fbf;">Income:</p>
								<p class="margin-small-top clearfix">
									<span class="fl"><em class="h3 text-red-deep">${vendor.income}
									</em></span>
							</dd>
						</dl>
					</div>
				</div>
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