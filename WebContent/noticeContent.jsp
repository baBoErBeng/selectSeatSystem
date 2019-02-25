<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.henu.bean.Notice"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta/>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>notice content</title>
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
				<h2>基于Java的图书馆选座系统</h2>
				<h3 class="text-center">公告正文</h3>
				<%String refer = (String)request.getAttribute("refer"); %>
				<a href="<%=path+refer%>" class="pull-right"><button
						type="button" class="btn btn-default ">返回</button></a>
			</div>
		</div>
		<hr />
		<div class="row clearfix">
			<div class="col-md-2 column"></div>
			<div class="col-md-8 column">
				<%
					Notice notice = (Notice) request.getAttribute("notice");
				%>
				<h4 class="text-center">
					《<%=notice.getNotice_title()%>》
				</h4>
				<h4>作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;者:&nbsp;&nbsp;<span
					class="label label-default"> <%=notice.getNotice_author()%></span></h4><br>
				<h4>发布时间:&nbsp;&nbsp;<span class="label label-default"><%=notice.getNotice_time()%></span></h4>
				<%if(notice.getNotice_file().length()>0) {%>
				<label><%=notice.getNotice_file() %></label><br>
				<a href="<%=path%>/adminDownload?notice.notice_id=<%=notice.getNotice_id()%>">点此下载附件</a>
				<br><%} %>
				<br>
				<div><%=notice.getNotice_content()%><div>
					</div>
					<div class="col-md-2 column"></div>
				</div>
				<div class="row clearfix">
					<hr>
					<div class="col-md-12 column">
						<h2>Heading</h2>
						<p>Donec id elit non mi porta gravida at eget metus. Fusce
							dapibus, tellus ac cursus commodo, tortor mauris condimentum
							nibh, ut fermentum massa justo sit amet risus. Etiam porta sem
							malesuada magna mollis euismod. Donec sed odio dui.</p>
						<p>
							<a class="btn" href="#">View details »</a>
						</p>
					</div>
				</div>
			</div>
	</div>
	</div>
</body>
</html>