<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.henu.bean.Seat" %>
<%@page import="com.henu.bean.Student" %>
<%	String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>status</title>
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
					</h3><br>
					<%
						Student student = (Student)session.getAttribute("student");
						Seat mySeat = (Seat)session.getAttribute("mySeat");
					%>
					<span class="pull-right"><%="当前用户: "+student.getStu_name() %></span><br>
					<ul class="nav nav-tabs">
						<li>
							<a href="<%=path%>/studentMenu">首页</a>
						</li>
						<li class="active">
							<a href="<%=path%>/studentStatus">我的状态</a>
						</li>
						<li>
							<a href="<%=path%>/stu/data.jsp">个人信息</a>
						</li>
						<li class="pull-right">
							<a href="<%=path%>/stu/index.jsp">退出</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-12 column">
					<h3>我的状态&nbsp;&nbsp;<span class="label label-default"><%=mySeat==null?"未预约":mySeat.getSeat_status()%></span></h3>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								座位信息
							</h3>
						</div>
						<div class="panel-body">
							<table class="table">
								<thead>
									<tr>
										<th>
											id
										</th>
										<th>
											教室号
										</th>
										<th>
											座位号
										</th>
										<th>
											状态
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<%=mySeat==null?"未预约":mySeat.getSeat_id()%>
										</td>
										<td>
											<%=mySeat==null?"未预约":mySeat.getSeat_classNum()%>
										</td>
										<td>
											<%=mySeat==null?"未预约":mySeat.getSeat_num()%>
										</td>
										<td>
											<%=mySeat==null?"未预约":mySeat.getSeat_status()%>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="panel-footer">
							<h4>座位情况&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="label label-default"><%=mySeat==null?"未预约":mySeat.getSeat_condiction()%></span></h4>
						</div>
					</div>
					<div class="btn-group btn-group-lg">
					<%
						if(student.getSeat_id()==null||"".equals(student.getSeat_id())){
					%>
							<a class="btn btn-default"  href="<%=path%>/studentMenu" data-toggle="modal">
							<em class="glyphicon glyphicon-hand-up"></em>&nbsp;&nbsp;去预约</a>
					<% 
						}else{
							if("unbooked".equals(mySeat.getSeat_status())){
					%>
						<a class="btn btn-default" href="<%=path%>/studentCancelBookedSeat" data-toggle="modal">
							<em class="glyphicon glyphicon-remove-circle"></em>&nbsp;&nbsp;取消预约</a>
						<a class="btn btn-default" href="#modal-container-938746" data-toggle="modal">
							<em class="glyphicon glyphicon-ok-circle"></em>&nbsp;&nbsp;确认入座</a>
						<a class="btn btn-default" href="<%=path%>/stu/report.jsp" data-toggle="modal">
							<em class="glyphicon glyphicon-wrench"></em>&nbsp;&nbsp;座位报修</a>
						<%}else{ %>
						<a class="btn btn-default" href="<%=path%>/studentLeaveSeat" data-toggle="modal">
							<em class="glyphicon glyphicon-off"></em>&nbsp;&nbsp;离开座位</a>
						<a class="btn btn-default" href="<%=path%>/stu/report.jsp" data-toggle="modal">
							<em class="glyphicon glyphicon-wrench"></em>&nbsp;&nbsp;座位报修</a>
					<%} }%>
					</div>
					<div class="modal fade" id="modal-container-938745" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">
										取消预约
									</h4>
								</div>
								<div class="modal-body">
									确认取消预约吗？
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">取消</button> <a href="../stu/menu.html"><button type="button" class="btn btn-primary">确认</button></a>
								</div>
							</div>
						</div>
					</div>
					<div class="modal fade" id="modal-container-938746" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">
										输入验证码
									</h4>
								</div>
								<form role="form" method="post" action="<%=path%>/studentUsedSeat">
								<div class="modal-body">
									<input type="text" class="form-control" id="stuNum" name="validate"/>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">取消</button> <a href="<%=path%>/studentUsedSeat"><button type="submit" class="btn btn-primary">确认</button></a>
								</div>
								</form>
							</div>
						</div>
					</div>
					<div class="modal fade" id="modal-container-938747" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">
										离开座位
									</h4>
								</div>
								<div class="modal-body">
									确认离开座位？
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">取消</button> <a href="../stu/menu.html"><button type="button" class="btn btn-primary">确认</button></a>
								</div>
							</div>
						</div>
					</div>
					<div class="modal fade" id="modal-container-938748" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">
										座位报修
									</h4>
								</div>
								<div class="modal-body">
									确认座位损坏需要报修？
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">取消</button> <a href="../stu/report.html"><button type="button" class="btn btn-primary">确认</button></a>
								</div>
							</div>
						</div>
					</div>
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
