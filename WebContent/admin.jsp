<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cn.menu.db.action.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>主页</title>
<meta name="description"
	content="主页">


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
				<a href="index.html" class="logo">
					<img alt="Logo" src="assets/images/logo.png" />
					<span>Admin</span>
				</a>
			</div>

			<nav class="navbar-custom">

				<ul class="list-inline float-right mb-0">

					
					<li class="list-inline-item dropdown notif">
						<a class="nav-link dropdown-toggle nav-user"
							data-toggle="dropdown" href="#" role="button"
							aria-haspopup="false" aria-expanded="false">
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
							<a href="index.jsp" class="active">
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

		<div class="content-page">

			<!-- Start content -->
			<div class="content">

				<div class="container-fluid">

					<div class="row">
						<div class="col-xl-12">
							<div class="breadcrumb-holder">
								<h1 class="main-title float-left">简要信息</h1>
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
						<div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
							<div class="card-box noradius noborder bg-default">
								<i class="fa fa-file-text-o float-right text-white"></i>
								<h6 class="text-white text-uppercase m-b-20">订单量</h6>
								<h1 class="m-b-20 text-white counter"><%=OrderForms.getCount() %></h1>
								<span class="text-white">&nbsp;</span>
							</div>
						</div>

<!-- 						<div class="col-xs-12 col-md-6 col-lg-6 col-xl-3"> -->
<!-- 							<div class="card-box noradius noborder bg-warning"> -->
<!-- 								<i class="fa fa-bar-chart float-right text-white"></i> -->
<!-- 								<h6 class="text-white text-uppercase m-b-20">出餐次数</h6> -->
<!-- 								<h1 class="m-b-20 text-white counter">250</h1> -->
<!-- 								<span class="text-white">Bounce rate: 25%</span> -->
<!-- 							</div> -->
<!-- 						</div> -->

						<div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
							<div class="card-box noradius noborder bg-info">
								<i class="fa fa-user-o float-right text-white"></i>
								<h6 class="text-white text-uppercase m-b-20">用户数</h6>
								<h1 class="m-b-20 text-white counter"><%=Users.getCount(true) %></h1>
								<span class="text-white">&nbsp;</span>
							</div>
						</div>

<!-- 						<div class="col-xs-12 col-md-6 col-lg-6 col-xl-3"> -->
<!-- 							<div class="card-box noradius noborder bg-danger"> -->
<!-- 								<i class="fa fa-bell-o float-right text-white"></i> -->
<!-- 								<h6 class="text-white text-uppercase m-b-20">Alerts</h6> -->
<!-- 								<h1 class="m-b-20 text-white counter">58</h1> -->
<!-- 								<span class="text-white">5 New Alerts</span> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
					<!-- end row -->

				</div>
				<!-- END content-page -->
			</div>
			<!-- END main -->
		</div>
		<footer class="footer">
			<span class="text-right">
				<a target="_blank" href="#">简介</a>
			</span>
			<span class="float-right"> </span>
		</footer>
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
				delay: 10,
				time: 600
			});
		} );		
	</script>

<script>
	var ctx1 = document.getElementById("lineChart").getContext('2d');
	var lineChart = new Chart(ctx1, {
		type: 'bar',
		data: {
			labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
			datasets: [{
					label: 'Dataset 1',
					backgroundColor: '#3EB9DC',
					data: [10, 14, 6, 7, 13, 9, 13, 16, 11, 8, 12, 9] 
				}, {
					label: 'Dataset 2',
					backgroundColor: '#EBEFF3',
					data: [12, 14, 6, 7, 13, 6, 13, 16, 10, 8, 11, 12]
				}]
				
		},
		options: {
						tooltips: {
							mode: 'index',
							intersect: false
						},
						responsive: true,
						scales: {
							xAxes: [{
								stacked: true,
							}],
							yAxes: [{
								stacked: true
							}]
						}
					}
	});


	var ctx2 = document.getElementById("pieChart").getContext('2d');
	var pieChart = new Chart(ctx2, {
		type: 'pie',
		data: {
				datasets: [{
					data: [12, 19, 3, 5, 2, 3],
					backgroundColor: [
						'rgba(255,99,132,1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)'
					],
					label: 'Dataset 1'
				}],
				labels: [
					"Red",
					"Orange",
					"Yellow",
					"Green",
					"Blue"
				]
			},
			options: {
				responsive: true
			}
	 
	});

	var ctx3 = document.getElementById("doughnutChart").getContext('2d');
	var doughnutChart = new Chart(ctx3, {
		type: 'doughnut',
		data: {
				datasets: [{
					data: [12, 19, 3, 5, 2, 3],
					backgroundColor: [
						'rgba(255,99,132,1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)'
					],
					label: 'Dataset 1'
				}],
				labels: [
					"Red",
					"Orange",
					"Yellow",
					"Green",
					"Blue"
				]
			},
			options: {
				responsive: true
			}
	 
	});
</script>
<!-- END Java Script for this page -->
</body>
</html>