<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.henu.bean.Student" %>
<%	String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>data</title>
		<link rel="stylesheet" href="<%=path%>/css/bootstrap.min.css" />
		<script type="application/javascript" src="<%=path%>/js/jquery-3.3.1.min.js"></script>
		<script type="application/javascript" src="<%=path%>/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<h3>
						基于Java的图书馆选座系统
					</h3><br><br>
					<%
						Student student = (Student)session.getAttribute("student");
					%>
					<ul class="nav nav-tabs">
						<li>
							<a href="<%=path%>/studentMenu">首页</a>
						</li>
						<li>
							<a href="<%=path%>/studentStatus">我的状态</a>
						</li>
						<li class="active">
							<a href="<%=path%>/stu/data.jsp">个人信息</a>
						</li>
						<li class="pull-right">
							<a href="<%=path%>/stu/index.jsp">退出</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="row clearfix">
			<div class="col-md-2 column">
			</div>
				<div class="col-md-8 column">
					<h3 class="text-center"><span>ID&nbsp;&nbsp;</span><span class="label label-default">&nbsp;<%=student.getStu_id()%></span>
					</h3><br>
					<dl class="text-center">
						<dt>
							用户名
						</dt>
						<dd>
							<%=student.getStu_name()%><br>
						</dd>
						<dt>
							用户学号
						</dt>
						<dd>
							<%=student.getStu_num()%><br>
						</dd>
						<dt>
							密码
						</dt>
						<dd>
							<%=student.getStu_password()%><br>
						</dd>
						<dt>
							用户性别
						</dt>
						<dd>
							<%=student.getStu_gender()%><br>
						</dd>
						<dt>
							手机号
						</dt>
						<dd>
							<%=student.getStu_phone()%><br>
						</dd>
					</dl> 
					<a class="btn btn-block btn-default" style="display: inline-block;" href="<%=path%>/stu/update.jsp">修改个人信息</a>
				</div>
				<div class="col-md-2 column">
				</div>
				
			</div>
			<div class="row clearfix">
				<div class="col-md-12 column">
					<hr style="filter: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color="#6f5499" size="3" />
					<h2>
						Heading
					</h2>
					<p>
						Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris
						condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec
						sed odio dui.
					</p>
					<p>
						<a class="btn" href="#">View details »</a>
					</p>
				</div>
			</div>
		</div>
	</body>
</html>
