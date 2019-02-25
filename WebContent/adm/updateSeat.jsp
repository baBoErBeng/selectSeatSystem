<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.henu.bean.Seat"%>
<%@page import="java.util.ArrayList"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>update seat</title>
<link rel="stylesheet" href="<%=path%>/css/bootstrap.min.css" />
<script type="application/javascript"
	src="<%=path%>/js/jquery-3.3.1.min.js"></script>
<script type="application/javascript"
	src="<%=path%>/js/bootstrap.min.js"></script>
<script type="application/javascript" src="<%=path%>/js/changeSeat.js"></script>
<style>
a:hover {
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-5 column">
				<h2>基于Java的图书馆选座系统</h2>
			</div>
			<div class="col-md-7 column">
				<br>
				<h3>修改座位信息</h3>
			</div>
		</div>
		<a href="<%=path%>/adminMangeSeat" class="pull-right"><button
				type="button" class="btn btn-md btn-info">返回</button></a><br>
		<div class="row clearfix">
			<hr>
			<div class="col-md-2 column"></div>
			<div class="col-md-8 column">
				<form role="form" action="<%=path%>/adminUpdateSeat"
					method="post">
					<div class="form-group">
						<label for="exampleInputPassword1">座位ID</label><input
							readonly="readonly" name="seat.seat_id" type="text"
							class="form-control" id="exampleInputPassword1"
							value="${requestScope.seat.seat_id}" />
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">座位号</label><input name="seat.seat_num"
							type="text" class="form-control" id="exampleInputEmail1"
							value="${requestScope.seat.seat_num}" />
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">教室号</label><input
							name="seat.seat_classNum" type="text" class="form-control"
							id="exampleInputPassword1"
							value="${requestScope.seat.seat_classNum}" />
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">验证码</label><input
							name="seat.validate" type="text" class="form-control"
							id="exampleInputPassword1"
							value="${requestScope.seat.validate}" />
					</div>
					<button type="submit" class="btn btn-default btn-block"
						onclick="return checkSeat()">修改信息</button>

				</form>
				<!-- <a href="#modal-container-252731" role="button" data-toggle="modal"><button type="button" class="btn btn-default btn-block">修改座位</button><a>
					-->
			</div>
			<div class="col-md-2 column"></div>
		</div>
		<div class="row clearfix">
			<div class="col-md-12 column">
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
