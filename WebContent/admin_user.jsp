<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cn.menu.db.action.*"%>
<%@ page import="cn.menu.db.entity.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="cn">
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
								<small>Hello, admin</small>
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
							<a class="active" href="#">
								<i class="fa fa-address-book-o bigfonts bigfonts"></i>
								<span> 用户管理 </span>
								<span class="menu-arrow"></span>
							</a>
							<ul class="list-unstyled">
								<li class="active">
									<a href="admin_user.jsp">管理员用户管理</a>
								</li>
								<li>
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
								<h1 class="main-title float-left">管理员用户管理</h1>
								<ol class="breadcrumb float-right">
									<li class="breadcrumb-item active">主页</li>
								</ol>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!-- end row -->
					<!-- end row -->

					<div class="row"></div>
					<!-- end row -->
					
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
						<div class="card mb-3">
							<div class="card-header">
								<h3>
									<i class="fa fa-table"></i>
									管理员信息
								</h3>

							</div>

							<div class="card-body">

								<table class="table table-hover">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">用户名</th>
											<th scope="col">性别</th>

										</tr>
									</thead>
									<tbody>
									<%
										List<User> all = Users.findAllByRole(false);
										int i = 0;
										User u = null;
										while (i < all.size()) {
											u = all.get(i);
									%>
										<tr>
											<th scope="row"><%=i+1 %></th>
											<td><%=u.getUName() %></td>
											<td><%=(u.isUSex() == true)? "男": "女" %></td>
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
				<!-- END container-fluid -->

			</div>
			<!-- END content -->

		</div>
		<!-- END content-page -->

		<footer class="footer"> <span class="text-right">
			餐厅管理系统 </span> </footer>
	</div>
	<!-- END main -->

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

	<!-- END Java Script for this page -->

</body>
</html>