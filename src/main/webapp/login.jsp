<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TshockWebBlao 登陆</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style type="text/css">
/* .bodydiv { */
/* 	height: 300px;; */
/* 	background-color: beige; */
/* 	margin: 80px 140px; */
/* 	padding: 35px 50px; */
/* } */

/* .fld { */
/* 	width: 240px; */
/* 	height: 40px; */
/* 	text-align: right; */
/* 	line-height: 100%; */
/* } */

/* .maindiv { */
/* 	margin-right: 80px; */
/* 	margin-top: 20px; */
/* 	width: 180px; */
/* 	float: right; */
/* } */

/* .log { */
/* 	width: 80px; */
/* 	height: 40px; */
/* 	float: right; */
/* } */

/* .reg { */
/* 	width: 80px; */
/* 	height: 40px; */
/* 	float: left; */
/* } */

/* .hr { */
/* 	height: 5px; */
/* } */

/* .serverlist { */
/* 	margin-left: 50px; */
/* 	margin-top: 30px; */
/* 	position: absolute; */
/* } */

/* span { */
/* 	float: left; */
/* } */
#togglediv {
	height: 30px;
	width: 210px;
}

.displaynone {
	display: none;
}

.displayinline {
	display: inline;
}
</style>
<script type="text/javascript" src="js/jquery-1.12.1.js"></script>
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
		// 		$("#togglediv span").toggle(function() {
		// 			$("#register").addClass(".displayinline");
		// 			$("#login").addClass(".displaynone");
		// 		}, function () {
		// 			$("#register").addClass(".displaynone");
		// 			$("#login").addClass(".displayinline");
		// 		});

		//切换注册、登陆div
		$("#login").removeClass("displaynone");

		$("#togglediv").click(function() {
			if ($("#register").hasClass("displaynone")) {
				$("#login").addClass("displaynone");
				$("#register").removeClass("displaynone");
			} else {
				$("#register").addClass("displaynone");
				$("#login").removeClass("displaynone");
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
<body class="container">
		<center>服务器游戏管理员登陆</center>
		<hr />
		<div class="">
			<div id="togglediv" class="btn btn-default ">
				<span>注册/登陆</span>
			</div>
		</div>
		<div class="maindiv displaynone " id="login">

			<div class="hr"></div>
			<form action="login.action" method="post" class="form-inline">
				<div>
					<div class="form-group">
						<label class="sr-only">帐号:</label> <input class="form-control" type="text"
							name="userName"  placeholder="请输入你的帐号">
					</div><br />
					<div class="form-group">
						<label class="sr-only">密码:</label> <input class="form-control" type="password"
							name="password"  placeholder="请输入你的密码">
					</div><br />
					<div class="fld " >
						<span style="color: red;">${msg}</span>
					</div>
				</div>
				<input type="submit" class="btn btn-default form-control"
					value="管理登陆">
			</form>
		</div>
		<div class="displaynone" id="register">
			<form action="register.action" method="post" class="form-inline">
				<div>
					<div class="form-group">
						<label class="sr-only">昵称:</label> 
						<input class="form-control" type="text"
							name="displayName" placeholder="请输入你的昵称">
					</div><br />
					<div class="form-group">
						<label class="sr-only">帐号:</label> <input class="form-control" type="text"
							name="userName"  placeholder="请输入你的帐号">
					</div><br />
					<div class="hr">
					<div class="form-group">
						<label class="sr-only">密码:</label>
						 <input class="form-control" type="password"
							name="password" id="regpwd1"  placeholder="请输入你的密码" >
					</div><br />
					<div class="form-group">
						<label class="sr-only">重复密码:</label> <input class="form-control" type="password"
							id="regpwd2"  placeholder="重复密码">
					</div><br />
				</div>
				<input type="submit" class="btn btn-default " value="注册">
				</div>
			</form>
			</div>
</body>
</html>