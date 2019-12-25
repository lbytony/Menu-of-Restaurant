<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cn.menu.db.action.*"%>
<%@ page import="cn.menu.db.entity.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pike Admin - Free Bootstrap 4 Admin Template</title>
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
									<%=request.getParameter("username")%></small>
							</h5>
						</div>


						<!-- item-->
						<a href="#" class="dropdown-item notify-item">
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
							<a href="admin.jsp">
								<i class="fa fa-fw fa-bars"></i>
								<span> 主页 </span>
							</a>
						</li>
						<li class="submenu">
							<a href="#">
								<i class="fa fa-address-book-o bigfonts bigfonts"></i>
								<span> 用户管理 </span>
								<span class="menu-arrow"></span>
							</a>
							<ul class="list-unstyled">
								<li>
									<a href="admin_user.jsp">管理员用户管理</a>
								</li>
								<li>
									<a href="user.jsp">注册用户管理</a>
								</li>
							</ul>
						</li>
						<li class="submenu">
							<a class="active" href="dishes.jsp">
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
								<h1 class="main-title float-left">菜品信息管理&nbsp;</h1>
								<ol class="breadcrumb float-right">
									<li class="breadcrumb-item"></li>
									<li class="breadcrumb-item active"></li>
								</ol>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!-- end row -->

					<div class="row">
						<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 col-xl-4">
							<div class="card mb-3">
								<div class="card-header">
									<i class="fa fa-table">各类菜品比例</i>
									
								</div>

								<div class="card-body">
									<iframe class="chartjs-hidden-iframe" tabindex="-1"
										style="display: block; overflow: hidden; border: 0px; margin: 0px; top: 0px; left: 0px; bottom: 0px; right: 0px; height: 100%; width: 100%; position: absolute; pointer-events: none; z-index: -1;"></iframe>
									<canvas id="doughnutChart" width="430" height="430"
										style="display: block; height: 390px; width: 390px;"></canvas>
								</div>
							</div>
							<!-- end card-->
						</div>
						<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 col-xl-8">
							<div class="card mb-3">
								<div class="card-header">
									<h3>
										<i class="fa fa-user-o bigfonts"></i>
										菜品信息管理
									</h3>
									
								</div>
								<div class="card-body">

									<table class="table table-hover">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">菜品名称</th>
												<th scope="col">菜品种类</th>
												<th scope="col">菜品价格</th>
												<th scope="col">删除</th>
												<th scope="col">修改</th>
											</tr>
										</thead>
										<tbody>
										<%
										List<Dish> all = Dishes.findAll();
										int i = 0;
										Dish d = null;
										while (i < all.size()) {
											d = all.get(i);
										%>
											<tr>
												<th scope="row"><%=i+1 %></th>
												<td><%=d.getdName()%></td>
												<td><%=(d.isdKind() == true)? "荤菜": "素菜"%></td>
												<td><%=d.getdPrice() %></td>
												<td>
													<button class="layui-btn" onclick="window.delete(<%=d.getdID() %>)">删除</button>
													<script type="text/javascript">
														window.delete = function(a) {
															self.location.href="deleteOneDish.jsp?did=" + a;
														};
													</script>
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
					<div class="row">
						<div class="col-xl-12">
							<div class="breadcrumb-holder">
								<h1 class="main-title float-left">菜品信息预览&nbsp;</h1>
								<ol class="breadcrumb float-right">
								</ol>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<div class="row">
						<%
						all = Dishes.findAll();
						i = 0;
						d = null;
						while (i < all.size()) {
							d = all.get(i);
						%>
						<div class="col-xs-2 col-sm-2 col-md-2 col-xl-2 col-lg-2">
							<div class="card mb-3">
								<div class="card-header">
									<h3><%=d.getdName() %></h3>
								</div>
								<div class="card-body">
									<img class="img-fluid" data-toggle="magnify"
										src="<%=d.getdPicPath() %>" alt="Sample Image">
									<div class="magnify-large"
										style="background: url(&quot;<%=d.getdPicPath() %>&quot;) -816px -37px no-repeat; display: none; left: 187.863px; top: -49.9198px;"></div>

								</div>

								<a role="button" href="" class="btn btn-primary">
									<span class="btn-label">
										<i class="fa fa-check"></i>
									</span>
									￥<%=d.getdPrice() %>
								</a>
							</div>
						</div>
						<%
							i++;
						}
						%>
						<!-- end row -->

					</div>
					<!-- END content-page -->
				</div>
			</div>
			<!-- END main -->
		</div>
	</div>
	<script src="assets/js/modernizr.min.js"></script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/moment.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/detect.js"></script>
	<script src="assets/js/fastclick.js"></script>
	<script src="assets/js/jquery.blockUI.js"></script>
	<script src="assets/js/jquery.nicescroll.js"></script>

	<!-- App js -->
	<script src="assets/js/pikeadmin.js"></script>

	<!-- BEGIN Java Script for this page -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

	<!-- Counter-Up-->
	<script src="assets/plugins/waypoints/lib/jquery.waypoints.min.js"></script>
	<script src="assets/plugins/counterup/jquery.counterup.min.js"></script>
	<script>
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
	<script>
		// doughnutChart
		var ctx4 = document.getElementById("doughnutChart").getContext('2d');
		var doughnutChart = new Chart(ctx4, {
			type : 'doughnut',
			data : {
				datasets : [ {
					data : [<%=Dishes.getCount(true) %>, <%=Dishes.getCount(false) %>, ],
					backgroundColor : [ 'rgba(255,99,132,1)',
							'rgba(54, 162, 235, 1)', ],
					label : 'Dataset 1'
				} ],
				labels : [ "荤菜", "素菜", ]
			},
			options : {
				responsive : true
			}

		});
	</script>
	<!-- END Java Script for this page -->
	<!-- 示例-970 -->
	<script src="layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
		layui.use('layer', function() { //独立版的layer无需执行这一句
			var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

			//触发事件
			var active = {
				setTop : function() {
					var that = this;
					//多窗口模式，层叠置顶
					layer.open({
						type : 2,
						title : '当你选择该窗体时，即会在最顶端',
						area : [ '350px', '370px' ],
						shade : 0,
						maxmin : true,
						offset: [200, 400],
						content : 'dishpop.jsp',
						btn : [ '下一项', '全部关闭' ],
						yes : function() {
							$(that).click();
						},
						btn2 : function() {
							layer.closeAll();
						},
						zIndex : layer.zIndex,
						success : function(layero) {
							layer.setTop(layero); //重点2
						}
					});
				},
				offset : function(othis) {
					var type = othis.data('type'), text = othis.text();
					layer.open({
						type : 1,
						offset : type,
						id : 'layerDemo' + type,
						content : '<div style="padding: 20px 100px;">' + text
								+ '</div>',
						btn : '关闭全部',
						btnAlign : 'c',
						shade : 0,
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