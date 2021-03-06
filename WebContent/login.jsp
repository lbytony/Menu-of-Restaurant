<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<!-- Loading font -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,700"
	rel="stylesheet">

<!-- Custom Styles -->
<link rel="stylesheet" type="text/css" href="css/styles.css">
<title>食堂菜谱管理系统</title>
</head>
<body>
	<div class="container" id="login">
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<div class="login">
					<h3>食堂菜谱管理系统 - 用户登录</h3>
					<h5>By 李泊岩 姜文煊 孙明阳</h5>
					<form name="loginForm" action="loginvalidate.jsp" target="_blank"
						method="post" onsubmit="return loginValidate()">
						<div class="form-group">
							<input type="text" name="username" class="form-control"
								id="username" placeholder="请输入用户名" />
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="password"
								id="password" placeholder="请输入密码" />
						</div>
						<br />
						<input type="submit" class="btn btn-lg btn-block btn-success"
							value="登录" />
						<input type="button" class="btn btn-lg btn-block btn-success"
							onclick="toReg()" value="注册" />
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script language="javascript" type="text/javascript">
		function toReg() {
			window.location.href = "register.jsp";
		}
		function loginValidate() {
			var x = document.forms["loginForm"]["username"].value;
			if (x == null || x == '') {
		    	alert("请输入用户名");
		    	return false;
		  	}
			var y = document.forms["loginForm"]["password"].value;
			if (y == null || y == '') {
		    	alert("请输入密码");
		    	return false;
		  	}
			return true;
		}
	</script>
</html>