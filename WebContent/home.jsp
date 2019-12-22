<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="cn.menu.db.entity.Dish"%>
<%@ page import="cn.menu.db.action.Dishes"%>
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>eCommerce template By Adobe Dreamweaver CC</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/eCommerceStyle.css" rel="stylesheet" type="text/css">
<!--The following script tag downloads a font from the Adobe Edge Web Fonts server for use within the web page. We recommend that you do not modify it.-->
<script>
	var __adobewebfontsappname__ = "dreamweaver"
</script>
<script
	src="http://use.edgefonts.net/montserrat:n4:default;source-sans-pro:n2:default.js"
	type="text/javascript"></script>
</head>

<body>
	<div id="mainWrapper">
		<header> <!-- This is the header content. It contains Logo and links -->
		<div id="logo">
			<img src="logo.png" width="70" height="70" alt="" />
			<!-- Company Logo text -->
		</div>
		<div id="headerLinks">
			<a href="#" title="Login/Register">【用户1】</a>
			<a href="#" title="Cart">【提交】</a>
		</div>
		</header>
		<section id="offer"> <!-- The offer section displays a banner text for promotions -->
		<h2 style="height: auto; color: hsla(0, 0%, 37%, 1.00);">选购菜品</h2>
		</section>
		<div id="content">
			<section class="sidebar"> <!-- This adds a sidebar with 1 searchbox,2 menusets, each with 4 links -->
			<input type="text" id="search" value="search">
			<div id="menubar">
				<nav class="menu">
				<h2>
					<!-- Title for menuset 1 -->
					推荐菜
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
				<h2>已选</h2>
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
			<% 
				ArrayList<Dish> all = Dishes.findAll();
				int i = 0;
				Dish d = null;
				while (i < all.size()) {
			%>
			<div class="productRow">
				<!-- Each product row contains info of 3 elements -->
				<%
					if (i >= all.size()) break;
					d = all.get(i);
				%>
				<article class="productInfo"> <!-- Each individual product description -->
					<div>
						<img alt="sample" src=<%=d.getDPicPath() %>>
					</div>
					<p class="price"><%=d.getDPrice() %></p>
					<p class="productContent"><%=d.getDName() %></p>
					<input type="button" name="button" value="Buy" class="buyButton">
				</article>
				<%
					i++;
					if (i >= all.size()) break;
					d = all.get(i);
				%>
				<article class="productInfo"> <!-- Each individual product description -->
					<div>
						<img alt="sample" src=<%=d.getDPicPath() %>>
					</div>
					<p class="price"><%=d.getDPrice() %></p>
					<p class="productContent"><%=d.getDName() %></p>
					<input type="button" name="button" value="Buy" class="buyButton">
				</article>
				<%
					i++;
					if (i >= all.size()) break;
					d = all.get(i);
				%>
				<article class="productInfo"> <!-- Each individual product description -->
					<div>
						<img alt="sample" src=<%=d.getDPicPath() %>>
					</div>
					<p class="price"><%=d.getDPrice() %></p>
					<p class="productContent"><%=d.getDName() %></p>
					<input type="button" name="button" value="Buy" class="buyButton">
				</article>
				<%
					i++;
				%>
			</div>
			<% } %>
			</section>
		</div>
		<footer> <!-- This is the footer with default 3 divs -->
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
