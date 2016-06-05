<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TshockWebBlao 登陆</title>
<style type="text/css">
.bodydiv {
	height: 300px;;
	background-color: beige;
	margin: 80px 140px;
	padding: 35px 50px;
}

.fld {
	width: 240px;
	height: 40px;
	text-align: right;
	line-height: 100%;
}

.maindiv {
	margin-right: 80px;
	margin-top: 20px;
	width: 180px;
	float: right;
}

.log {
	width: 80px;
	height: 40px;
	float: right;
}

.reg {
	width: 80px;
	height: 40px;
	float: left;
}

.hr {
	height: 5px;
}

.serverlist {
	margin-left: 50px;
	margin-top: 30px;
	position: absolute;
}

span {
	float: left;
}

#togglediv {
	height: 30px;
	width: 210px;
	background-color: bisque;
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

		})

	});
</script>
</head>
<body>

	<div align="right" class="bodydiv">
		<center>服务器游戏管理员登陆</center>
		<hr />
		<div>
			<div id="togglediv">
				<span>注册/登陆</span>
			</div>

		</div>
		<div class="maindiv displaynone" id="login">

			<div class="hr"></div>
			<form action="login.action" method="post">
				<div>
					<div class="fld">
						帐号:<input type="text" name="username"><br />
					</div>
					<div class="hr"></div>
					<div class="fld">
						密码:<input type="password" name="password"><br />
					</div>
				</div>
				<div class="hr"></div>

				<div class="log">
					<input type="submit" value="管理登陆">
				</div>
				
			</form>
		</div>
		<div class="maindiv displaynone" id="register">
			<div class="hr"></div>
			<form action="register.action" method="post">
				<div>
					<div class="fld">
						帐号:<input type="text" name="username"><br />
					</div>
					<div class="hr"></div>
					<div class="fld">
						密码:<input type="password" name="password"><br />
					</div>
					<div class="fld">
						重复密码:<input type="password"><br />
					</div>
				</div>
				<div class="hr"></div>
				<div class="log">
					<input type="submit" value="注册">
				</div>
			</form>
		</div>
		<div class="serverlist" style="float: left;">
		    <span style="color: red; ">${msg}</span><br/>
			<span>服务器状态:</span><span id="status"></span><br />
			 <span>服务器端口号:</span><span	id="port"></span><br /> 
			 <span>服务器人数:</span><span id="playercount"></span><br />
			 <span></span>
		</div>
	</div>

</body>
</html>