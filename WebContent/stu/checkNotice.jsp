<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.henu.bean.Notice"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>check notice</title>
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
				<br> <br> <br>
				<h2>基于Java的图书馆选座系统</h2>
				<a href="<%=path%>/studentMenu" class="pull-right"><button
						type="button" class="btn btn-default ">返回</button></a>
			</div>
		</div>
		<hr/>
		<div class="row clearfix">
			<div class="col-md-2 column">
			</div>
			<div class="col-md-10 column">
				<table class="table table-condensed table-responsive">
					<thead>
						<tr>
							<th>题目</th>
							<th>发布时间</th>
							<th>作者</th>
							<th>操作</th>
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
							List<Notice> notices =  (List<Notice>) session.getAttribute("notices");
							if (notices != null) {
								for (Notice notice : notices) {
									if (i == color.size()) {
										i = 0;
									}
						%>
						<tr class="<%=color.get(i)%>">
							<td><h5 style=" width:200px;white-space: nowrap; overflow: hidden;
                 				text-overflow: ellipsis;">《<%=notice.getNotice_title()%>》</h5>
							</td>
							<td><%=notice.getNotice_time()%></td>
							<td><%=notice.getNotice_author()%></td>
							<td><a role="button" class="btn"
								href="<%=path%>/studentReadNotice?notice_id=<%=notice.getNotice_id()%>">
									<em class="glyphicon glyphicon-file"></em>&nbsp;查看详情
							</a></td>
						</tr>
						<%
							i++;
								}
							} else {
						%>
						<tr>
							<td><h1>暂无公告</h1></td>
						</tr>
						<%
							}
						%>
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
