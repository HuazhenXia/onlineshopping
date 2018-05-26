<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<title>Vendor Management</title>
		<link rel="stylesheet" type="text/css" href="/css/identify.css" />
		<link rel="stylesheet" type="text/css" href="/css/layout.css" />
		<link rel="stylesheet" type="text/css" href="/css/account.css" />
		<link rel="stylesheet" type="text/css" href="/css/style.css" />
		<link rel="stylesheet" type="text/css" href="/css/control_index.css" />
		<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="/js/layer/layer.js"></script>
		<script type="text/javascript" src="/js/haidao.offcial.general.js"></script>
		<script type="text/javascript" src="/js/select.js"></script>
		<script type="text/javascript" src="/js/haidao.validate.js"></script>
	</head>
	<body>
		<div class="view-topbar">
			<div class="topbar-console">
				<div class="tobar-head fl">
					<a href="#" class="topbar-logo fl">
					<span><img src="Images/logo.png" width="20" height="20"/></span>
					</a>
					<a href="/vendor/" class="topbar-home-link topbar-btn text-center fl"><span>Management</span></a>
				</div>
			</div>
			<div class="topbar-info">
				<ul class="fr">
					<li class="fl topbar-info-item">
					<div class="dropdown">
						<a href="#" class="topbar-btn">
						<span class="fl text-normal">XXX</span>
						<span class="icon-arrow-down"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="login.html">LOG OUT</a></li>
						</ul>
					</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="view-body">
			<div class="view-sidebar">
				<div class="sidebar-content">
					<div class="sidebar-nav">
						<div class="sidebar-title">
							<a href="#">
								<span class="icon"><b class="fl icon-arrow-down"></b></span>
								<span class="text-normal">Vendor Center</span>
							</a>
						</div>
						<ul class="sidebar-trans">
							<li>
								<a href="/vendor/profile">
									<b class="sidebar-icon"><img src="Images/icon_cost.png" width="16" height="16" /></b>
									<span class="text-normal">User Information</span>
								</a>
							</li>
							
							<li>
								<a href="/vendor/products">
									<b class="sidebar-icon"><img src="Images/icon_order.png" width="16" height="16" /></b>
									<span class="text-normal">Product Management</span>
								</a>
							</li>

							<li>
								<a href="/reports/report2?format=pdf">
									<b class="sidebar-icon"><img src="Images/icon_gold.png" width="16" height="16" /></b>
									<span class="text-normal">Report</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="view-product background-color">
				<div class="padding-big background-color">
					<div class="account-info clearfix">
						<div class="text-box-main min-width-300 fl">
							<dl>
								<dt class="padding-big-left lists-border-list clearfix">
									<div class="title fl padding-big-top padding-big-bottom">
										<p>HI,XXX</p>
										<p class="margin-small-top clearfix">
											<span class="fl"><em class="text-blue-deep">Verification</em></span>
											<!--没有实名认证-->
											<!-- <a class="button bg-blue-deep icon icon-button-blue fl margin-left" href="#">立即实名认证</a> -->
											<!--通过实名认证-->
											<a class="button bg-green-deep icon icon-button-green fl margin-left" href="#">Verified</a>
										</p>
									</div>
									<span class="fr icon-head">
										<img src="http://user.haidao.la/avatar.php?uid=1504&type=virtual&size=middle" alt="head img">
									</span>
								</dt>
								<dd class="padding-big clearfix">
									<p class="w50 fl">
										<i class="fl icon icon-email"></i>

										<span class="fl margin-left">MailBox : Verified</span>
									</p>
								</dd>
							</dl>
						</div>
						<div class="text-box-main min-width-360 fl">
							<dl>
								<dt class="padding-big lists-border-list clearfix">
									<div class="fl w50 title">
										<p>Income</p>
										<p class="margin-small-top clearfix">
											<span class="fl"><em class="h3 text-red-deep">$ 0.00 </em></span>
											<a class="fl margin-left button btn-red text-white"  href="#">Detail</a>
										</p>
									</div>
									<div class="fl w50 padding-left title">
										<p>Sold Amount</p>
										<p class="margin-small-top clearfix">
											<span class="fl"><em class="h3 text-blue-deep">0 </em></span>
											<a class="fl margin-left button btn-red text-white" target="view_window" href="#">Detail</a>
										</p>
									</div>
								</dt>
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