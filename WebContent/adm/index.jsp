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
<title>index</title>
<link rel="stylesheet" href="<%=path%>/css/bootstrap.min.css" />
<script type="application/javascript"
	src="<%=path%>/js/jquery-3.3.1.min.js"></script>
<script type="application/javascript"
	src="<%=path%>/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column text-center">
				<h2>基于Java的图书馆选座系统</h2>
			</div>
			<br />
			<h3 class="col-sm-offset-8">后台端</h3>
		</div>
		<div class="row clearfix">
			<div class="col-md-4 column"></div>
			<div class="col-md-4 column">
				<form role="form" action="<%=path%>/adminLogin" method="post">
					<div class="form-group">
						<label for="exampleInputEmail1">账号</label><input type="text"
							class="form-control" id="exampleInputEmail1" name="admin.adm_num"
							value='<%=request.getAttribute("adm_num") == null ? "" : request.getAttribute("adm_num")%>' />
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">密码</label><input
							type="password" class="form-control" id="exampleInputPassword1"
							name="admin.adm_password" />
					</div>
					<br> <br>
					<button type="submit" class="btn btn-default btn-block">登录</button>
				</form>
			</div>
		</div>
		<div class="row clearfix">
			<hr>
			<br>
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
