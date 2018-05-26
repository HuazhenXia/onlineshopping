<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Online Shopping</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="icon" type="image/x-icon" href="/images/icon.ico">
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet">
<link href="/css/linearicons.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/responsive.css" rel="stylesheet">
<link href="/css/signin.css" rel="stylesheet">

</head>
<body>
	<div class="header">
		<div class="top-header">
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-xs-7">
				<ul class="list-inline social-icon">
					<li><i class=" fa fa-facebook"></i></li>
					<li><i class=" fa fa-google-plus"></i></li>
					<li><i class=" fa fa-linkedin"></i></li>
					<li><i class=" fa fa-twitter"></i></li>
					<li><i class=" fa fa-skype"></i></li>
				</ul>
			</div>
			<div class="col-md-6 col-xs-5">
				<ul class="list-inline security">
				<li title="Login"><i class=" lnr lnr-lock"></i><span
						class="hidden-xs"><a href="/profile">${username}</a></span>
				</li>
				
					<li title="Register"><i class=" lnr lnr-pencil"></i><span
						class="hidden-xs"><a href="/logout">Log out</a></span>
				</li>
					<li title="Login"><i class=" lnr lnr-lock"></i><span
						class="hidden-xs"><a href="/login">Login</a></span></li>
					<li title="Register"><i class=" lnr lnr-pencil"></i><span
						class="hidden-xs"><a href="/login">Register</a></span></li>
				</ul>
			</div>
		</div>
	</div>
</div>
		<%@ include file="fragments/middleheader.jsp"%>
		<%@ include file="fragments/bottomheader.jsp"%>
	</div>

	<div class="container" style="margin-top: 100px;">
		<div class="logo text-center" style="margin: 20px;">
			<img src="/images/logo.png" width="200" height="200">
		</div>
		<h1></h1>
		<form action="/login" method="post"
			style="margin: 10px auto; text-align: center">
			<div>
				<label> USERNAME: &nbsp;&nbsp;<input type="text"
					name="username" />
				</label>
			</div>
			<div>
				<label> PASSWORD: &nbsp;&nbsp;<input type="password"
					name="password" />
				</label>
			</div>
			<div style="margin-bottom: 5px;">
				<input type="submit" value="LOG IN" class="submit" />
			</div>

			New member? Sign up here: <a href="register">Customer</a>&nbsp;&nbsp;
			<a href="vendorRegister">Vendor</a>

		</form>
	</div>
	<br>
	<br>
	<%@ include file="fragments/bottomfooter.jsp"%>
	
</body>
</html>