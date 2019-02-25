<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.henu.bean.Seat"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>mange seat</title>
<link rel="stylesheet" href="<%=path%>/css/bootstrap.min.css" />
<script type="application/javascript"
	src="<%=path%>/js/jquery-3.3.1.min.js"></script>
<script type="application/javascript"
	src="<%=path%>/js/bootstrap.min.js"></script>
<style>
a:hover {
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column text-center">
				<br>
				<br>
				<br>
				<h1>基于Java的图书馆选座系统</h1>
			</div>
		</div>
		<hr style="filter: alpha(opacity = 100, finishopacity = 0, style = 3)"
			width="80%" color="#6f5499" size="3" />
		<div class="row clearfix">
			<div class="col-md-2 column">
				<br>
				<br>
				<ul class="nav nav-stacked nav-pills" id="leftMenu">
					<li><a href="<%=path%>/adminMangeStudent">学生管理</a></li>
					<li class="active"><a href="<%=path%>/adminMangeSeat">座位管理</a>
					<br></li>
					<li><a href="<%=path%>/adminMangeCheckMessage">报修信息</a><br></li>
					<li><a href="<%=path%>/adminMangeNotice">公告管理</a><br></li>
					<li><a href="<%=path%>/adm/setting.jsp">其他设置</a><br></li>
				</ul>
			</div>
			<div class="col-md-10 column">
				<nav class="navbar navbar-default navbar-fixed-top navbar-inverse"
					role="navigation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span><span
								class="icon-bar"></span><span class="icon-bar"></span><span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">搜索座位</a>
					</div>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<form class="navbar-form navbar-left" role="search"
							action="<%=path%>/adminSearchSeat" method="post">
							<div class="form-group">
							 <select class="form-control selectpicker" name="selectType">
								<option value="seat_id" selected="selected">按座位ID搜索</option>
								<option value="seat_num" >按座位号搜索</option>
								<option value="seat_classNum" >按教室号搜索</option>
								<option value="stu_id" >按学生ID搜索</option>
							</select>
						</div>
							<div class="form-group">
								<input type="text" name="parm" class="form-control" />
							</div>
							<button type="submit" class="btn btn-default">搜索</button>
						</form>
						<ul class="nav navbar-nav navbar-right">
							<li><a>当前管理员:</a></li>
							<li><a>${sessionScope.admin.adm_num}</a></li>
							<li><a href="<%=path%>/adm/index.jsp" class="pull-right"><button
										type="button" class="btn btn-md btn-info">退出</button></a></li>
						</ul>
					</div>
				</nav>
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>座位号</th>
							<th>教室号</th>
							<th>座位预约状态</th>
							<th>座位情况</th>
							<th>用户ID</th>
							<th>&nbsp;&nbsp;&nbsp;操作</th>
						</tr>
					</thead>
					<tbody>
						<%
							int i = 0;
							ArrayList<String> color = new ArrayList<String>() {
								{
									add("");
									add("success");
									add("error");
									add("warning");
									add("info");
								}
							};
							@SuppressWarnings("unchecked")
							List<Seat> seats = (List<Seat>) session.getAttribute("seats");
							if (seats != null) {
								for (Seat seat : seats) {
									if (i == color.size()) {
										i = 0;
									}
						%>
						<tr class="<%=color.get(i)%>">
							<td><%=seat.getSeat_id()%></td>
							<td><%=seat.getSeat_num()%></td>
							<td><%=seat.getSeat_classNum()%></td>
							<td><%=seat.getSeat_status()%></td>
							<td><%=seat.getSeat_condiction()%></td>
							<td><%=seat.getStu_id()%></td>
							<td><a role="button" class="btn"
								href="<%=path%>/adminToUpdateSeat?seat_id=<%=seat.getSeat_id()%>">
									<em class="glyphicon glyphicon-edit"></em>&nbsp;修改信息
							</a></td>
							<td><a role="button" class="btn" data-toggle="modal"
								href="<%=path%>/adminDeleteSeat?seat_id=<%=seat.getSeat_id()%>">
									<em class="glyphicon glyphicon-trash"></em>&nbsp;删除信息
							</a></td>
							<%
								i++;
									}
								} else {
							%>
							<td>无数据</td>
							<%
								}
							%>
						</tr>
					</tbody>
				</table>
				<ul class="pagination">
					<li><a href="#">Prev</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">Next</a></li>
				</ul>
			</div>
			<a href="<%=path%>/adm/addSeat.jsp">
				<button type="button" class="btn btn-default btn-block">添加座位</button>
			</a>
		</div>
		<div class="row clearfix">
			<hr
				style="filter: alpha(opacity = 100, finishopacity = 0, style = 3)"
				width="80%" color="#6f5499" size="3" />
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
