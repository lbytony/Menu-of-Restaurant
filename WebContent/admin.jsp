<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>eCommerce template By Adobe Dreamweaver CC</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/eCommerceStyle.css" rel="stylesheet" type="text/css">
	<style type="text/css">
	.adminpicture {
		width: 20%;
		float: left;
	}
	
	.adminDetail {
		width: 39%;
		margin-left: 156px;
		background-color: hsla(94, 46%, 80%, 1.00);
		height: 46px;
		margin-top: 23px;
		border-radius: 21px;
	}
	
	.adminCtrl {
		float: right;
		margin-right: 11px;
		width: 43%;
		margin-top: -51px;
		border-radius: 0px;
	}
	
	#resttext {
		font-family: Cambria, "Hoefler Text", "Liberation Serif", Times,
			"Times New Roman", serif;
		font-size: 12px;
		margin-top: -6px;
		color: hsla(0, 0%, 41%, 1.00);
	}
	
	#plus {
		width: 0px;
		margin-top: 28px;
		margin-right: -1px;
	}
	</style>
	<!--The following script tag downloads a font from the Adobe Edge Web Fonts server for use within the web page. We recommend that you do not modify it.-->
	<script>var __adobewebfontsappname__="dreamweaver"</script>
	<script
		src="http://use.edgefonts.net/montserrat:n4:default;source-sans-pro:n2:default.js"
		type="text/javascript"></script>
</head>

<body>
	<div id="mainWrapper">
		<header>
			<!-- This is the header content. It contains Logo and links -->
			<div id="logo">
				<img src="sourse/logo.png" width="70" height="70" alt="" />
				<!-- Company Logo text -->
			</div>
			<div id="headerLinks">
				<a href="#" title="Login/Register">【管理员1】</a><a href="#"
					title="Cart">【提交】</a>
			</div>
		</header>
		<section id="offer">
			<!-- The offer section displays a banner text for promotions -->
			<h2 style="height: auto; color: hsla(0, 0%, 37%, 1.00);">订单与库存管理</h2>
		</section>
		<div id="content">
			<section class="sidebar">
				<!-- This adds a sidebar with 1 searchbox,2 menusets, each with 4 links -->
				<input type="text" id="search" value="search">
				<div id="menubar">
					<nav class="menu">
						<h2>
							<!-- Title for menuset 1 -->
							未完成订单&nbsp;
						</h2>
						<hr>
						<ul>
							<!-- List of links under menuset 1 -->
							<li><a href="#" title="Link">Link 1</a></li>
							<li><a href="#" title="Link">Link 2</a></li>
							<li><a href="#" title="Link">Link 3</a></li>
							<li class="notimp">
								<!-- notimp class is applied to remove this link from the tablet and phone views -->
								<a href="#" title="Link">Link 4</a>
							</li>
						</ul>
					</nav>
					<nav class="menu">
						<h2>已完成订单&nbsp;</h2>
						<!-- Title for menuset 2 -->
						<hr>
						<ul>
							<!--List of links under menuset 2 -->
							<li><a href="#" title="Link">Link 1</a></li>
							<li><a href="#" title="Link">Link 2</a></li>
							<li><a href="#" title="Link">Link 3</a></li>
							<li class="notimp">
								<!-- notimp class is applied to remove this link from the tablet and phone views -->
								<a href="#" title="Link">Link 4</a>
							</li>
						</ul>
					</nav>
				</div>
			</section>
			<section class="mainContent">
				<div class="productRow">
					<div class="adminpicture">
						<img src="/west/beef.jpg" width="100" alt="" />
					</div>
					<div class="adminDetail">
						<p>该菜品的详细信息</p>
						<p>&nbsp;</p>
					</div>
					<div class="adminCtrl">
						<div class="adminCtrl" id="resttext">
							<p>&nbsp;当前菜品剩余</p>
						</div>
						<div class="adminCtrl" id="plus">
							<table width="20%" border="0">
								<tbody>
									<tr>
										<td><img src="/icon/+.png" width="50" alt="" /></td>
										<td><img src="/icon/-.png" width="50" alt="" /></td>
									</tr>
								</tbody>
							</table>
						</div>

						<p>&nbsp;</p>
					</div>
				</div>
			</section>
		</div>
		<footer>
			<!-- This is the footer with default 3 divs -->
			<div>
				<p>北京市朝阳区平乐园100号&nbsp;</p>
			</div>
			<div>
				<p>组员：&nbsp;</p>
			</div>
			<div class="footerlinks">
				<p>
					<a href="#" title="Link">Link 1 </a>
				</p>

			</div>
		</footer>
	</div>
</body>
</html>
