<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>menu</title>
<link rel="stylesheet" href="<%=path%>/css/bootstrap.min.css" />
<script type="application/javascript"
	src="<%=path%>/js/jquery-3.3.1.min.js"></script>
<script type="application/javascript"
	src="<%=path%>/js/bootstrap.min.js"></script>
<style>
a {
	text-decoration: none;
	color: #333;
}

a:hover {
	text-decoration: none;
	color: crimson;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-11 column">
				<h1 class="text-center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;基于Java的图书馆选座系统</h1>
			</div>
			<div class="col-md-1 column">
				<br />
				<br /> <a href="<%=path%>/adm/index.jsp" class="pull-right"><button
						type="button" class="pull-right btn btn-md btn-info">退出</button></a>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-6 column" style="background-color: #9CF">
				<div class="page-header">
				<h1>
					<a href="<%=path%>/adminMangeStudent">
							用户管理&nbsp;&nbsp;<small class="glyphicon glyphicon-user"></small>	
					</a>
				</h1>
				</div>
			</div>
			<div class="col-md-6 column">
				<div class="page-header">
				<h1>
					<a href="<%=path%>/adminMangeSeat">
							座位管理&nbsp;&nbsp;<small>Subtext for header</small>
					</a>
				</h1>
				</div>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-6 column">
				<div class="page-header">
				<h1>
					<a href="<%=path%>/adminMangeCheckMessage">
							报修信息&nbsp;&nbsp;<small>Subtext for header</small>
					</a>
				</h1>
				</div>
			</div>
			<div class="col-md-6 column" style="background-color: #9CF;">
				<div class="page-header">
					<h1><a href="<%=path%>/adminMangeNotice">
						
							公告管理&nbsp;&nbsp;<small>Subtext for header</small>
						</a>
					</h1>
				</div>
			</div>
			<div class="col-md-6 column" style="background-color: #9CF;">
				<div class="page-header">
					<h1>
					<a href="<%=path%>/adm/setting.jsp">
						其他设置&nbsp;&nbsp;<small>Subtext for header</small>
					</a>
				</h1>
				</div>
			</div>
			<div class="col-md-6 column">
				<div class="page-header">
					<h1>
						占位符&nbsp;&nbsp;<small>Subtext for header</small>
					</h1>
				</div>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-12 column">
				<hr
					style="filter: alpha(opacity = 100, finishopacity = 0, style = 3)"
					width="80%" color="#6f5499" size="3" />
				<h2>Heading</h2>
				<p>Donec id elit non mi porta gravida at eget metus. Fusce
					dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada
					magna mollis euismod. Donec sed odio dui.</p>
				<p>
					<a class="btn" href="#">View details »</a>
				</p>
			</div>
		</div>
	</div>
</body>
</html>
