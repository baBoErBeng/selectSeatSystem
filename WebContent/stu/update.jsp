<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.henu.bean.Student" %>
<%	String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>update</title>
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
					</h3>
					<%
						Student student = (Student)session.getAttribute("student");
					%>
				</div>
			</div>
			<div class="row clearfix"><br>
				<div class="col-md-12 column">
				<form role="form" action="<%=path%>/studentUpdate" method="post">
					<table class="table table-striped table-responsive">
						<thead>
							<tr>
								<th>
									<p>ID</p>
								</th>
								<th>
									<input name="student.stu_id" readonly="readonly" style="border-style:none;" type="text" value="<%=student.getStu_id()%>">
									<a href="<%=path%>/stu/data.jsp" style="color:#28A4C9;text-decoration:none;" class="pull-right btn btn-default "><em class="glyphicon glyphicon-arrow-left"></em>&nbsp;返回</a>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<p>姓名</p>
								</td>
								<td>
									<input name="student.stu_name" class="form-control" type="text" value="<%=student.getStu_name()%>">
								</td>
							</tr>
							<tr class="success">
								<td>
									<p>学号</p>
								</td>
								<td>
									<input name="student.stu_num" class="form-control" type="text" value="<%=student.getStu_num()%>">
								</td>
							</tr>
							<tr class="error">
								<td>
									<p>密码</p>
								</td>
								<td>
									<input name="student.stu_password" class="form-control" type="text" value="<%=student.getStu_password()%>">
								</td>
							</tr>
							<tr class="warning">
								<td>
									<p>性别</p>
								</td>
								<td>
									<input name="student.stu_gender" class="form-control" type="text" value="<%=student.getStu_gender()%>">
								</td>
							</tr>
							<tr class="info">
								<td>
									<p>手机号</p>
								</td>
								<td>
									<input name="student.stu_phone" class="form-control" type="text" value="<%=student.getStu_phone()%>">
								</td>
							</tr>
						</tbody>
					</table> 
					<button type="submit" class="btn btn-default btn-block" data-toggle="modal">修改资料</button>
					</form>
					<div class="modal fade" id="modal-container-75810" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">
										确认修改个人资料吗？
									</h4>
								</div>
								<div class="modal-body">
									请仔细对比后再次确认是否修改个人资料
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">取消</button> <a href="../stu/data.html"><button
										 type="button" class="btn btn-primary">确认</button></a>
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
