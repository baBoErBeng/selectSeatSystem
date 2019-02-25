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
		<title>report</title>
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
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="row clearfix">
						<h4 style="display: inline;" class="col-sm-6 col-sm-offset-5">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;座位报修
						</h4>
						<a href="<%=path%>/studentStatus" style="color:#28A4C9;text-decoration:none;" class="col-sm-1 col-sm-offset-11 btn btn-default "><em
							 class="glyphicon glyphicon-arrow-left"></em>&nbsp;返回</a>
					</div>
					<%
						Seat mySeat = (Seat)session.getAttribute("mySeat");
					%>
					<form role="form" action="<%=path%>/studentReportSeat" method="post">
						<div class="form-group">
							<label for="exampleInputEmail1">座位ID</label><input readonly="readonly" type="text" class="form-control" id="exampleInputEmail1" value="<%=mySeat==null?"未预约":mySeat.getSeat_id()%>" />
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">教室号</label><input readonly="readonly" type="text" class="form-control" id="exampleInputPassword1"  value="<%=mySeat==null?"未预约":mySeat.getSeat_classNum()%>"/>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">座位号</label><input readonly="readonly" type="text" class="form-control" id="exampleInputPassword1" value="<%=mySeat==null?"未预约":mySeat.getSeat_num()%>" />
						</div>
						<button type="submit" class="btn btn-default btn-block">提交</button>
					</form>
					<div class="modal fade" id="modal-container-535060" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">
										提交报修信息
									</h4>
								</div>
								<div class="modal-body">
									确认提交报修信息吗？
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
									 <a href="../stu/menu.html"><button type="button" class="btn btn-primary">确认</button></a>
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
