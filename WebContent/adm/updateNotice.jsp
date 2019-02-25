<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.henu.bean.Notice"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>update notice</title>
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
			<div class="col-md-5 column">
				<h2>基于Java的图书馆选座系统</h2>
			</div>
			<div class="col-md-7 column">
				<br>
				<h3>修改公告</h3>
			</div>
		</div>
		<a href="<%=path%>/adminMangeNotice" class="pull-right"><button
				type="button" class="btn btn-md btn-info">返回</button></a><br>
		<div class="row clearfix">
			<hr>
			<div class="col-md-2 column"></div>
			<div class="col-md-8 column">
			<%
					Notice notice = (Notice) request.getAttribute("notice");
				%>
				<form role="form" action="<%=path%>/adminUpdateNotice"
					method="post" enctype="multipart/form-data">
					<label for="exampleInputEmail1">ID:&nbsp;</label><input readonly="readonly" type="text" style="border:0px;" name="notice.notice_id"
					value="<%=notice.getNotice_id() %>" />
					<div class="form-group">
						<label for="exampleInputEmail1">编辑题目</label><input type="text" name="notice.notice_title"
							class="form-control" id="exampleInputEmail1"
							value="<%=notice.getNotice_title()%>" />
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">作&nbsp;&nbsp;者:</label><input type="text" name="notice.notice_author"
							class="form-control" id="exampleInputPassword1" value="<%=notice.getNotice_author() %>" />
					</div>
					<div class="form-group">
						<%if(notice.getNotice_file()!=null&&!"".equals(notice.getNotice_file())){ %>
						<label for="exampleInputFile">修改文件<br><%=notice.getNotice_file()%></label><input type="file"
							name="upload" />
						<%}else{ %>
						<label for="exampleInputFile">添加文件</label><input type="file"
							name="upload" />
						<%} %>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">编辑内容</label>
					</div>
					<!--ueditor-->
					<!-- 加载编辑器的容器 -->
					<script id="container" name="notice.notice_content" type="text/plain"><%=notice.getNotice_content()%></script>
					<a href="#modal-container-171431" role="button" data-toggle="modal"><button
						type="button" class="btn btn-default btn-block">修改公告</button>
					</a>
						<div class="modal fade" id="modal-container-171431" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
										<h4 class="modal-title" id="myModalLabel">修改公告</h4>
									</div>
									<div class="modal-body">确认修改公告吗？</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">取消</button>
										<button type="submit" class="btn btn-primary">确认</button>
									</div>
								</div>
							</div>
						</div>
				</form>
				<!-- 配置文件 -->
				<script type="text/javascript"
					src="<%=path%>/ueditor/ueditor.config.js"></script>
				<!-- 编辑器源码文件 -->
				<script type="text/javascript"
					src="<%=path%>/ueditor/ueditor.all.js"></script>
				<!-- 实例化编辑器 -->
				<script type="text/javascript">
				var ue = UE.getEditor('container',{   
					   enterTag : 'br'
				});
				</script>

			</div>
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
