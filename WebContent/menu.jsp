<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="cn.menu.db.entity.*"%>
<%@ page import="cn.menu.db.action.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>菜单</title>
<meta name="description" content="菜单">
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

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

<!-- Counter-Up-->
<script src="assets/plugins/waypoints/lib/jquery.waypoints.min.js"></script>
<script src="assets/plugins/counterup/jquery.counterup.min.js"></script>

</head>

<body class="adminbody">

	<div id="main">

		<!-- top bar navigation -->
		<div class="headerbar">

			<!-- LOGO -->
			<div class="headerbar-left">
				<div class="logo">
					<img alt="Logo" src="assets/images/logo.png" />
					<span>订餐系统&nbsp;</span>
				</div>
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
									<%=request.getParameter("username")%>
								</small>
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
							<a class="active">
								<i class="fa fa-eercast bigfonts"></i>
								<span> 菜单 </span>
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
								<h1 class="main-title float-left">荤菜</h1>
								<ol class="breadcrumb float-right">&nbsp;
								</ol>
								<div class="clearfix">&nbsp;</div>
							</div>
						</div>
					</div>
					<!-- end row -->

					<div class="row" overflow-x:scroll>
						<%
							int uid = Integer.parseInt(request.getParameter("id"));
							int oid = 0;
							Boolean flag = Boolean.parseBoolean(request.getParameter("flag"));
							if (flag == true) {
								request.getSession().setAttribute("flag", false);
								oid = OrderForms.newOne(uid);
							} else {
								oid = OrderForms.getByUID(uid);
							}
							List<Dish> all = Dishes.findAllByKind(true);
							int i = 0;
							Dish d = null;
							while (i < all.size()) {
								d = all.get(i);
						%>
						<div class="col-xs-2 col-sm-2 col-md-2 col-xl-2 col-lg-2">
							<div class="card mb-3">
								<div class="card-header">
									<h3 style="text-align: center"><%=d.getdName()%></h3>
								</div>

								<div class="card-body">
									<img class="img-fluid" data-toggle="magnify"
										src="<%=d.getdPicPath()%>" alt="Sample Image">
									<div class="magnify-large"
										style="background: url(&quot;<%=d.getdPicPath()%>&quot;) -816px -37px no-repeat; display: none; left: 187.863px; top: -49.9198px;"></div>
								</div>

								<button type="button" id="mybtn" class="btn btn-primary"
									onclick="window.add(<%=d.getdID()%>, <%=oid%>)">
									<script>
										window.add = function(a, b) {
											window.location.href="addToOrder.jsp?did=" + a + "&oid=" + b;
										};
									</script>
									<span class="btn-label">
										<i class="fa fa-check"></i>
									</span>
									￥<%=d.getdPrice()%>
								</button>
							</div>
						</div>
						<%
							i++;
							}
						%>
						<!-- end card-->
					</div>
					<div class="row">
						<div class="col-xl-12">
							<div class="breadcrumb-holder">
								<h1 class="main-title float-left">素菜&nbsp;</h1>
								<ol class="breadcrumb float-right">&nbsp;
								</ol>
								<div class="clearfix">&nbsp;</div>
							</div>
						</div>
					</div>
					<div class="row">
						<%
							all = Dishes.findAllByKind(false);
							i = 0;
							while (i < all.size()) {
								d = all.get(i);
						%>
						<div class="col-xs-2 col-sm-2 col-md-2 col-xl-2 col-lg-2">
							<div class="card mb-3">
								<div class="card-header">
									<h3><%=d.getdName()%></h3>
								</div>
								<div class="card-body">
									<img class="img-fluid" data-toggle="magnify"
										src="<%=d.getdPicPath()%>"
										alt="Sample Image<%=d.getdPicPath()%>">
									<div class="magnify-large"
										style="background: url(&quot;<%=d.getdPicPath()%>&quot;) -816px -37px no-repeat; display: none; left: 187.863px; top: -49.9198px;"></div>

								</div>
								<button type="button" id="mybtn" class="btn btn-primary"
									onclick="window.add(<%=d.getdID()%>, <%=oid%>)">
									<script>
										window.add = function(a, b) {
											var str = window.location.href;
											window.location.href="addToOrder.jsp?did=" + a + "&oid=" + b + "&link=" + str;
										};
									</script>
									<span class="btn-label">
										<i class="fa fa-check"></i>
									</span>
									￥<%=d.getdPrice()%>
								</button>
							</div>
						</div>
						<%
							i++;
							}
						%>
						<!-- end card-->
					</div>
				</div>
				<div class="row">
					<div class="card-body">
						<table class="table  table-striped">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">菜品名称</th>
									<th scope="col">单价</th>
									<th scope="col">数量</th>
									<th scope="col">删除</th>

								</tr>
							</thead>
							<tbody>
								<%
									List<OrderDetail> allOD = OrderDetails.findAll(oid);
									i = 0;
									OrderDetail od = null;
									while (i < allOD.size()) {
										od = allOD.get(i);
								%>
								<tr>
									<th scope="row"><%=od.getODID()%></th>
									<td><%=od.getDName()%></td>
									<td><%=od.getDPrice()%></td>
									<td><%=od.getDCount()%></td>
									<td>
										<button type="button" class="btn btn-light" onclick="window.delete(<%=od.getDID() %>)">-1</button>
										<script type="text/javascript">
											window.delete = function(a) {
												var str = window.location.href;
												self.location.href="deleteOneDishSecond.jsp?did=" + a + "&link=" + str;
											};
										</script>
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
				<!-- end row -->


			</div>
			<!-- END container-fluid -->

		</div>
		<!-- END content -->

	</div>
	<!-- END content-page -->

	<footer class="footer"> <span class="text-right">
		<a target="_blank" href="#"></a>


	</span> </footer>

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

	<script>
		$(document).ready(function() {
			// counter-up
			$('.counter').counterUp({
				delay : 10,
				time : 600
			});
		});
	</script>
	<!-- END Java Script for this page -->

</body>
</html>