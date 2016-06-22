<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TshockWebBlao 登陆/注册</title>
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
				$("#status").html("<span>正常<span>");
				$("#port").html(
						"<span style='background-color:yellow'>" + jsonObj.port
								+ "<span>");
				$("#playercount").html(
						"<span>" + jsonObj.playercount + "<span>");

				//如果服务器有人
				if (jsonObj.playercount > 0) {
					$(".serverlist").append(
							"<span>谁在服务器上:</span><span>" + jsonObj.players
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
				$("#togglediv span").html("切换到登陆界面");
			} else {
				$("#register").addClass("displaynone");
				$("#login").removeClass("displaynone");
				$("#togglediv span").html("切换到注册界面");
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
												"<span style='color:red'>两次密码输入不一致，请重新输入.</span>");
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
		<div class="center-block" ><span>服务器游戏管理员登陆</span></div>
		<hr />

		<div class="form-signin">
			<div id="togglediv"
				class="btn btn-lg btn-primary btn-block center-block">
				<span>切换到注册界面</span>
			</div>
		</div>
		<div class="maindiv displaynone " id="login">
			<div class="hr"></div>
			<form action="login.action" method="post" class="form-signin">

				<h2 class="form-signin-heading">请登陆</h2>
				<div>

					<label class="sr-only">帐号:</label> <input class="form-control"
						type="text" name="userName" placeholder="请输入你的帐号"> <br />
					<label class="sr-only">密码:</label> <input class="form-control"
						type="password" name="password" placeholder="请输入你的密码"> <br />
					<div class="fld ">
						<span style="color: red;">${msg}</span>
					</div>
				</div>
				<input type="submit"
					class="btn btn-default form-control btn-lg btn-primary btn-block"
					value="管理登陆">
			</form>
		</div>
		<div class="displaynone" id="register">
			<form action="register.action" method="post" class="form-signin">
				<h2 class="form-signin-heading">请注册</h2>
				<div>

					<label class="sr-only">昵称:</label> <input class="form-control"
						type="text" name="displayName" placeholder="请输入你的昵称"> <br />

					<label class="sr-only">帐号:</label> <input class="form-control"
						type="text" name="userName" placeholder="请输入你的帐号"> <br />
					<div class="hr">

						<label class="sr-only">密码:</label> <input class="form-control"
							type="password" name="password" id="regpwd1"
							placeholder="请输入你的密码"> <br /> <label class="sr-only">重复密码:</label>
						<input class="form-control" type="password" id="regpwd2"
							placeholder="重复密码"> <br />
					</div>
					<input type="submit"
						class="btn btn-default btn-lg btn-primary btn-block" value="注册">
				</div>
			</form>
		</div>
	</div>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>