<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.henu.bean.Student"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>mange student</title>
<link rel="stylesheet" href="<%=path%>/css/bootstrap.min.css" />
<script type="application/javascript"
	src="<%=path%>/js/jquery-3.3.1.min.js"></script>
<script type="application/javascript"
	src="<%=path%>/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {

		$("#selectLi li").click(function() {
			$("#selectType").attr("value", $(this).val());
		});

	});
</script>
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
				<br> <br> <br>
				<h1>基于Java的图书馆选座系统</h1>
			</div>
		</div>
		<hr style="filter: alpha(opacity = 100, finishopacity = 0, style = 3)"
			width="80%" color="#6f5499" size="3" />
		<div class="row clearfix">
			<div class="col-md-2 column">
				<br> <br>
				<ul class="nav nav-stacked nav-pills" id="leftMenu">
					<li class="active"><a href="<%=path%>/adminMangeStudent">学生管理</a>
						<br></li>
					<li><a href="<%=path%>/adminMangeSeat">座位管理</a><br></li>
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
						<a class="navbar-brand" href="#">搜索用户</a>
					</div>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<form class="navbar-form navbar-left" role="search"
							action="<%=path%>/adminSearchStudent" method="post">
							<div class="form-group">
								<select class="form-control selectpicker" name="selectType">
									<option value="stu_id" selected="selected">按学生ID搜索</option>
									<option value="stu_num">按学号搜索</option>
									<option value="stu_name">按姓名搜索</option>
									<option value="seat_id">按座位ID搜索</option>
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
							<th>学号</th>
							<th>姓名</th>
							<th>座位ID</th>
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
							List<Student> students = (List<Student>)session.getAttribute("students");
							if (students != null) {
								for (Student student : students) {
									if (i == color.size()) {
										i = 0;
									}
						%>
						<tr class="<%=color.get(i)%>">
							<td><%=student.getStu_id()%></td>
							<td><%=student.getStu_num()%></td>
							<td><%=student.getStu_name()%></td>
							<td><%=student.getSeat_id()%></td>
							<td><a role="button" class="btn"
								href="<%=path%>/adminToUpdateStudent?stu_id=<%=student.getStu_id()%>">
									<em class="glyphicon glyphicon-edit"></em>&nbsp;修改信息
							</a></td>
							<td><a role="button" class="btn" data-toggle="modal"
								href="<%=path%>/adminDeleteStudent?stu_id=<%=student.getStu_id()%>">
									<em class="glyphicon glyphicon-trash"></em>&nbsp;删除信息
							</a></td>
							<%
								i++;
									}
								} else {
							%>
							<td>暂无信息</td>
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
			<a href="<%=path%>/adm/addStu.jsp">
				<button type="button" class="btn btn-default btn-block">添加用户</button>
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
