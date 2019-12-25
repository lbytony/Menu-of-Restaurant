<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cn.menu.db.action.*"%>
<%@ page import="cn.menu.db.entity.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>用户管理</title>
<meta name="description"
	content="Free Bootstrap 4 Admin Theme | Pike Admin">


<!-- Favicon -->
<link rel="shortcut icon" href="assets/images/favicon.ico">

<!-- Bootstrap CSS -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />

<!-- Font Awesome CSS -->
<link href="assets/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />

<!-- Custom CSS -->
<link href="assets/css/style.css" rel="stylesheet" type="text/css" />

<!-- BEGIN CSS for this page -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
<!-- END CSS for this page -->
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="layui/css/layui.css" media="all">
</head>

<body class="adminbody">

	<div id="main">

		<!-- top bar navigation -->
		<div class="headerbar">

			<!-- LOGO -->
			<div class="headerbar-left">
				<a href="admin.jsp" class="logo">
					<img alt="Logo" src="assets/images/logo.png" />
					<span>Admin</span>
				</a>
			</div>
			<nav class="navbar-custom">
			<ul class="list-inline float-right mb-0">
				<li class="list-inline-item dropdown notif">
					<a class="nav-link dropdown-toggle nav-user" data-toggle="dropdown"
						href="#" role="button" aria-haspopup="false" aria-expanded="false">
						<img src="assets/images/avatars/admin.png" alt="Profile image"
							class="avatar-rounded">
					</a>
					<div class="dropdown-menu dropdown-menu-right profile-dropdown ">
						<!-- item-->
						<div class="dropdown-item noti-title">
							<h5 class="text-overflow">
								<small>
									Hello,
									<%=request.getParameter("username") %></small>
							</h5>
						</div>
						<!-- item-->
						<a href="login.jsp" class="dropdown-item notify-item">
							<i class="fa fa-power-off"></i>
							<span>Logout</span>
						</a>
					</div>
				</li>
			</ul>

			<ul class="list-inline menu-left mb-0">
				<li class="float-left">
					<button class="button-menu-mobile open-left">
						<i class="fa fa-fw fa-bars"></i>
					</button>
				</li>
			</ul>
			</nav>
		</div>
		<!-- End Navigation -->

		<!-- Left Sidebar -->
		<div class="left main-sidebar">
			<div class="sidebar-inner leftscroll">
				<div id="sidebar-menu">
					<ul>
						<li class="submenu">
							<a href="index.jsp">
								<i class="fa fa-fw fa-bars"></i>
								<span> 主页 </span>
							</a>
						</li>
						<li class="submenu">
							<a class="active" href="#">
								<i class="fa fa-address-book-o bigfonts bigfonts"></i>
								<span> 用户管理 </span>
								<span class="menu-arrow"></span>
							</a>
							<ul class="list-unstyled">
								<li>
									<a href="admin_user.jsp">管理员用户管理</a>
								</li>
								<li class="active">
									<a href="user.jsp">注册用户管理</a>
								</li>
							</ul>
						</li>
						<li class="submenu">
							<a href="dishes.jsp">
								<i class="fa fa-eercast bigfonts"></i>
								<span> 菜品管理 </span>
							</a>
						</li>
						<li class="submenu">
							<a href="order.jsp">
								<i class="fa fa-sticky-note-o bigfonts"></i>
								<span> 订单管理 </span>
							</a>
						</li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- End Sidebar -->

		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-xl-12">
							<div class="breadcrumb-holder">
								<h1 class="main-title float-left">注册用户管理</h1>
								<ol class="breadcrumb float-right">&nbsp;</ol>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!-- end row -->

					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
							<div class="card mb-3">
								<div class="card-header">
									<h3>
										<i class="fa fa-user-o bigfonts"></i>
										用户管理
									</h3>
								</div>
								<div class="card-body">
									<table class="table table-hover">
										<thead>
											<tr>
												<th scope="col">ID</th>
												<th scope="col">用户名</th>
												<th scope="col">注册时间</th>
												<th scope="col">性别</th>
												<th scope="col">删除</th>
												<th scope="col">修改</th>
											</tr>
										</thead>
										<tbody>
											<%
												List<User> all = Users.findAllByRole(true);
												int i = 0;
												User u = null;
												while (i < all.size()) {
													u = all.get(i);
											%>
											<tr>
												<th scope="row"><%=u.getUID()%></th>
												<td><%=u.getUName()%></td>
												<td><%=u.getURegDate()%></td>
												<td><%=(u.isUSex() == true)? "男": "女" %></td>
												<td>
													<div class="site-demo-button" id="layerDemo"
														style="margin-bottom: 0;">
														<button class="layui-btn">删除</button>
													</div>
												</td>
												<td>
													<div class="site-demo-button" id="layerDemo"
														style="margin-bottom: 0;">
														<button data-method="setTop" class="layui-btn">修改</button>
													</div>
												</td>
											</tr>
											<%
												i++;
												}
											%>

										</tbody>
									</table>

								</div>

							</div>
							<!-- end card-->
						</div>
					</div>
					<!-- end row -->


				</div>
				<!-- END container-fluid -->

			</div>
			<!-- END content -->

		</div>
		<!-- END content-page -->

		<footer class="footer"> <span class="text-right">
			餐厅管理系统 </span> </footer>

	</div>
	<div class="layui-layer-move" style="cursor: move; display: none;"></div>
	<!-- END main -->

	<script src="assets/js/modernizr.min.js" type="text/javascript"></script>
	<script src="assets/js/jquery.min.js" type="text/javascript"></script>
	<script src="assets/js/moment.min.js" type="text/javascript"></script>

	<script src="assets/js/popper.min.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

	<script src="assets/js/detect.js" type="text/javascript"></script>
	<script src="assets/js/fastclick.js" type="text/javascript"></script>
	<script src="assets/js/jquery.blockUI.js" type="text/javascript"></script>
	<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>

	<!-- App js -->
	<script src="assets/js/pikeadmin.js" type="text/javascript"></script>

	<!-- BEGIN Java Script for this page -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"
		type="text/javascript"></script>
	<script
		src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"
		type="text/javascript"></script>
	<script
		src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"
		type="text/javascript"></script>

	<!-- Counter-Up-->
	<script src="assets/plugins/waypoints/lib/jquery.waypoints.min.js"
		type="text/javascript"></script>
	<script src="assets/plugins/counterup/jquery.counterup.min.js"
		type="text/javascript"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			// data-tables
			$('#example1').DataTable();

			// counter-up
			$('.counter').counterUp({
				delay : 10,
				time : 600
			});
		});
	</script>

	<!-- END Java Script for this page -->
	<script src="layui/layui.js" charset="utf-8" type="text/javascript"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script type="text/javascript">
		layui.use('layer', function() { //独立版的layer无需执行这一句
			var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

			//触发事件
			var active = {
				setTop : function() {
					var that = this;
					//多窗口模式，层叠置顶
					layer.open({
						type : 2 //此处以iframe举例
						,
						title : '当你选择该窗体时，即会在最顶端',
						area : [ '500px', '260px' ],
						shade : 0,
						maxmin : true,
						offset : [ //为了演示，随机坐标
						400, ],
						content : 'userpop.html',
						btn : [ '下一个', '全部关闭' ] //只是为了演示
						,
						yes : function() {
							$(that).click();
						},
						btn2 : function() {
							layer.closeAll();
						},
						zIndex : layer.zIndex //重点1
						,
						success : function(layero) {
							layer.setTop(layero); //重点2
						}
					});
				}

				,
				offset : function(othis) {
					var type = othis.data('type'), text = othis.text();

					layer.open({
						type : 1,
						offset : type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
						,
						id : 'layerDemo' + type //防止重复弹出
						,
						content : '<div style="padding: 20px 100px;">' + text
								+ '</div>',
						btn : '关闭全部',
						btnAlign : 'c' //按钮居中
						,
						shade : 0 //不显示遮罩
						,
						yes : function() {
							layer.closeAll();
						}
					});
				}
			};

			$('#layerDemo .layui-btn').on('click', function() {
				var othis = $(this), method = othis.data('method');
				active[method] ? active[method].call(this, othis) : '';
			});

		});
	</script>
</body>
</html>