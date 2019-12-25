<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>订单管理</title>
<meta name="description"
	content="">

<!-- Favicon -->
<link rel="shortcut icon" href="assets/images/ico.ico">

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
								<small>Hello, <%=request.getParameter("username") %></small>
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
							<a class="active" href="order.jsp">
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
								<h1 class="main-title float-left">订单管理&nbsp;</h1>
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
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
							<div class="card mb-3">
								<div class="card-header">
									<h3>
										<i class="fa fa-table"></i>
										订单信息
									</h3>
									近期生成的订单信息
								</div>

								<div class="card-body">

									<table class="table table-hover">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">下单时间</th>
												<th scope="col">付款时间</th>
												<th scope="col">总价</th>
												<th scope="col">订单状态</th>
												<th scope="col">删除订单</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">1</th>
												<td>Mark</td>
												<td>Otto</td>
												<td>@mdo</td>
												<td>@mdo</td>
												<td>
													<a role="button" href="#" class="btn btn-danger">
														<span class="btn-label">
															<i class="fa fa-times"></i>
														</span>
														删除
													</a>
												</td>
											</tr>

										</tbody>
									</table>

								</div>
							</div>
							<!-- end card-->
						</div>
					</div>
					<!-- end row -->
				</div>
			</div>
			<!-- END content-page -->

			<footer class="footer"> <span class="text-right">
				<a target="_blank" href="#">订单详细信息</a>
			</span> <span class="float-right"> </span> </footer>
		</div>
		<!-- END main -->
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

	<!-- END Java Script for this page -->

</body>
</html>