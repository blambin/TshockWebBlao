<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TShockWebBlao Login/Register</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="css/signin.css" rel="stylesheet" type="text/css">
<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


<style type="text/css">
#togglediv {
}

.displaynone {
	display: none;
}

.displayinline {
	display: inline;
}
</style>
<script type="text/javascript" src="js/jquery_1_12_1.js"></script>
<script type="text/javascript">
	$(function() {
		$.get("status.action", function(status) {
			var jsonObj = $.parseJSON(status);

			if (jsonObj.status == '200') {
				$("#status").html("<span>Online<span>");
				$("#port").html(
						"<span style='background-color:yellow'>" + jsonObj.port
								+ "<span>");
				$("#playercount").html(
						"<span>" + jsonObj.playercount + "<span>");

				//如果服务器有人
				if (jsonObj.playercount > 0) {
					$(".serverlist").append(
							"<span>Online Players:</span><span>" + jsonObj.players
									+ "</span><br/>");
				}
			}
		});
		//切换注册、登陆div
		$("#login").removeClass("displaynone");

		$("#togglediv").click(function() {
			if ($("#register").hasClass("displaynone")) {
				$("#login").addClass("displaynone");
				$("#register").removeClass("displaynone");
				$("#togglediv span").html("Switch to Login");
			} else {
				$("#register").addClass("displaynone");
				$("#login").removeClass("displaynone");
				$("#togglediv span").html("Switch to Register");
			}
		});

		//提交之前简单验证密码
		$("#register form")
				.submit(
						function() {
							if ($("#regpwd1").val() != $("#regpwd2").val()) {
								$("#regpwd2")
										.parent()
										.append(
												"<span style='color:red'>Entered passwords were not the same.</span>");
								return false;
							} else {
								return true;
							}
						})
	});
</script>
</head>
<body>

	<div class="container">
		<div class="center-block" ><span>Server Admin Login</span></div>
		<hr />

		<div class="form-signin">
			<div id="togglediv"
				class="btn btn-lg btn-primary btn-block center-block">
				<span>Switch to Register</span>
			</div>
		</div>
		<div class="maindiv displaynone " id="login">
			<div class="hr"></div>
			<form action="login.action" method="post" class="form-signin">

				<h2 class="form-signin-heading">Please Login</h2>
				<div>

					<label class="sr-only">Username:</label> <input class="form-control"
						type="text" name="userName" placeholder="Enter your username"> <br />
					<label class="sr-only">Password:</label> <input class="form-control"
						type="password" name="password" placeholder="Enter your password"> <br />
					<div class="fld ">
						<span style="color: red;">${msg}${loginmsg}</span>
					</div>
				</div>
				<input type="submit"
					class="btn btn-default form-control btn-lg btn-primary btn-block"
					value="Login">
			</form>
		</div>
		<div class="displaynone" id="register">
			<form action="register.action" method="post" class="form-signin">
				<h2 class="form-signin-heading">Register</h2>
				<div>

					<label class="sr-only">Nickname:</label> <input class="form-control"
						type="text" name="displayName" placeholder="Enter your nickname"> <br />

					<label class="sr-only">Username:</label> <input class="form-control"
						type="text" name="userName" placeholder="Enter your username"> <br />
					<div class="hr">

						<label class="sr-only">Password:</label> <input class="form-control"
							type="password" name="password" id="regpwd1"
							placeholder="Enter your password"> <br /> <label class="sr-only">Repeat:</label>
						<input class="form-control" type="password" id="regpwd2"
							placeholder="Repeat your password"> <br />
					</div>
					<input type="submit"
						class="btn btn-default btn-lg btn-primary btn-block" value="Register">
				</div>
			</form>
		</div>
	</div>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>