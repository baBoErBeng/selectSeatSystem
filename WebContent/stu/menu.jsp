<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.henu.bean.Seat"%>
<%@page import="com.henu.bean.Student"%>
<%@page import="com.henu.bean.Notice"%>
<%	String path = request.getContextPath(); %>
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
</head>
<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<h3>基于Java的图书馆选座系统</h3><br>
				<%Student student = (Student)session.getAttribute("student");%>
				<span class="pull-right"><%="当前用户: "+student.getStu_name() %></span><br>
				<ul class="nav nav-tabs">
					<li class="active"><a href="<%=path%>/studentMenu">首页</a>
					</li>
					<li><a href="<%=path%>/studentStatus">我的状态</a></li>
					<li><a href="<%=path%>/stu/data.jsp">个人信息</a></li>
					<li class="pull-right"><a href="<%=path%>/stu/index.jsp">退出</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="row clearfix">
			<div class="col-md-8 column">
				<table class="table">
					<thead>
						<tr>
							<th><h3>id</h3></th>
							<th><h3>教室号</h3></th>
							<th><h3>座位号</h3></th>
							<th><h3>状态</h3></th>
							<th><h3>&nbsp;&nbsp;&nbsp;操作</h3></th>
						</tr>
					</thead>
					<tbody>
						<%
							int i = 0;
						 	ArrayList<String> color = new ArrayList<String>(){{add("");add("success");add("error");add("warning");add("info");}};
						 	@SuppressWarnings("unchecked")
						 	List<Seat> seats = (List<Seat>)session.getAttribute("seats");
							if(seats != null){
								for(Seat seat:seats){
									if(i==color.size()){
											i=0;
										}
						%>
						<tr class="<%=color.get(i)%>">
							<td><%=seat.getSeat_id()%></td>
							<td><%=seat.getSeat_classNum()%></td>
							<td><%=seat.getSeat_num()%></td>
							<td><%=seat.getSeat_condiction()%></td>
							<%if(student.getSeat_id()==null||"".equals(student.getSeat_id())) {%>
							<td><a id="modal-480601"
								href="<%=path%>/studentBookedSeat?seat_id=<%=seat.getSeat_id()%>"
								role="button" class="btn" data-toggle="modal"> 预约座位<span
									class="glyphicon glyphicon-hand-up"></span></a></td>
							<%}else{ %>
							<td><a style="color: red;" class="btn" data-toggle="modal">
									<span class="glyphicon glyphicon-remove-circle"></span>&nbsp;
									已有座位，不可预约
							</a></td>
							<%} i++;}}else{%>
							<td>暂无可选座位</td>
							<%} %>
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
				<%if(student.getSeat_id()==null||student.getSeat_id().equals("")) {%>
				<div style="border: 1px #000000 solid; width: 85px;">
					<a id="modal-480601" href="#modal-container-480601" role="button"
						class="btn" data-toggle="modal">自动预约</a>
				</div>
				<%} %>
				<div class="modal fade" id="modal-container-480601" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">确认预约座位吗</h4>
							</div>
							<div class="modal-body">确认预约后1小时内必须到达</div>
							<div class="modal-footer">
								<a href="#"><button type="button" class="btn btn-default"
										data-dismiss="modal">取消</button></a> <a href="<%=path%>/studentAutoBookedSeat"><button
											type="button" class="btn btn-primary">确认</button></a>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="col-md-4 column">
			<h3>图书馆公告</h3><br>
			<%	@SuppressWarnings("unchecked")
				List<Notice> notices = (List<Notice>) session.getAttribute("notices");
					if (notices != null) {
						int a = 0;
						for (Notice notice : notices) {
							a++;
							if(a==3||a<3){
			%><div class="text-center">
				<h4 style="white-space: nowrap;
                 overflow: hidden;
                 text-overflow: ellipsis;">《<%=notice.getNotice_title()%>》</h4>
				<p class="pull-right"><span>发布时间&nbsp;&nbsp;</span><%=notice.getNotice_time() %></p><br>
				<!--  <div class="text-justify">
				<%=notice.getNotice_content() %>
				</div>-->
				<p>
				<a class="btn" href="<%=path%>/studentReadNotice?notice_id=<%=notice.getNotice_id()%>">公告详情 »</a>
				</p></div>
			<%}else{%>
				<hr>
				<a class="btn" href="<%=path%>/stu/checkNotice.jsp">查看更多 »</a>
			<%break;}%>
			<%}}else{%>
				<h4>暂无公告</h4>
			<%}%>
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
