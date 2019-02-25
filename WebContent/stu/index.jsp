<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>index</title>
		<link rel="stylesheet" href="<%=path%>//css/bootstrap.min.css" />
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
				<div class="col-md-8 column">
					<div class="carousel slide" id="carousel-205549">
						<ol class="carousel-indicators">
							<li class="active" data-slide-to="0" data-target="#carousel-205549">
							</li>
							<li data-slide-to="1" data-target="#carousel-205549">
							</li>
							<li data-slide-to="2" data-target="#carousel-205549">
							</li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img alt="" src="<%=path%>/img/1.jpg" />
								<div class="carousel-caption">
									<h4>
										First Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget
										metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="<%=path%>/img/1.jpg" />
								<div class="carousel-caption">
									<h4>
										Second Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget
										metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
							<div class="item">
								<img alt="" src="<%=path%>/img/1.jpg" />
								<div class="carousel-caption">
									<h4>
										Third Thumbnail label
									</h4>
									<p>
										Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget
										metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
									</p>
								</div>
							</div>
						</div> <a class="left carousel-control" href="#carousel-205549" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
						<a class="right carousel-control" href="#carousel-205549" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
				</div>
				<div class="col-md-4 column">
					<form class="form-horizontal" role="form" action="<%=path%>/studentLogin" method="post" style="padding-top: 25%;">
						<div class="form-group">
							<h4 class="text-center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;用&nbsp;&nbsp;户&nbsp;&nbsp;端</h4>
							<label for="inputEmail3" class="col-sm-2 control-label">学号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="stuNum" name="student.stu_num" value='<%=request.getAttribute("stu_num")==null?"":request.getAttribute("stu_num")%>'/>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="stuPassword" name="student.stu_password"/>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label><input type="checkbox" />记住密码</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default btn-block">登录</button>
							</div>
						</div>
					</form>
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
