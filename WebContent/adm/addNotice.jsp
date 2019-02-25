<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>add notice</title>
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
				<h3>新增公告</h3>
			</div>
		</div>
		<a href="<%=path%>/adminMangeNotice" class="pull-right"><button
				type="button" class="btn btn-md btn-info">返回</button></a><br>
		<div class="row clearfix">
			<hr>
			<div class="col-md-2 column"></div>
			<div class="col-md-8 column">
				<form role="form" action="<%=path%>/adminAddNotice"
					method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="exampleInputEmail1">编辑题目</label><input
							name="notice.notice_title" type="text" class="form-control"
							id="exampleInputEmail1" />
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">发布人</label><input
							name="notice.notice_author" type="text" class="form-control"
							id="exampleInputPassword1" />
					</div>
					<div class="form-group">
						<label for="exampleInputFile">添加文件</label><input
							name="upload" type="file" id="exampleInputFile" />
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">编辑内容</label>
					</div>
					<!--ueditor-->
					<!-- 加载编辑器的容器 -->
					<script id="container" name="notice.notice_content" type="text/plain">
							<p>在此处添加内容</p>
					</script>
					<button type="submit" class="btn btn-default btn-block">发布公告</button>
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
