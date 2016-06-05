<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TshockWebBlao 登陆</title>
<style type="text/css">
.fld {
	width: 200px;
	height: 40px;
	text-align: center;
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

span{
    float: left;
}
</style>
<script type="text/javascript" src="js/jquery-1.12.1.js"></script>
<script type="text/javascript">
	$(function() {
		$.get("status.action", function(status) {
			var jsonObj = $.parseJSON(status);

			if (jsonObj.status == '200') {
				$("#status").html("<span>正常<span>");
				$("#port").html("<span style='background-color:yellow'>"+jsonObj.port+"<span>");
				$("#playercount").html("<span>"+jsonObj.playercount+"<span>");
				
				//如果服务器有人
				if (jsonObj.playercount > 0) {
					$(".serverlist").append("<span>谁在服务器上:</span><span>"+jsonObj.players+"</span><br/>");
				}
			}
		});
	});
</script>
</head>
<body>

	<div align="right"
		style="height: 200px; background-color: beige; margin: 80px 140px; padding: 35px 50px;">
		<center>服务器游戏管理员登陆</center>
		<hr />
		<div class="maindiv">
			<div class="hr"></div>
			<form action="login.action">
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
				<div class="reg">
					<input type="button" value="游戏注册"
						onclick="javascript:window.location.href = 'register.jsp'">
				</div>
			</form>
		</div>
		<div class="serverlist" style="float: left;">
			<span>服务器状态:</span><span id="status"></span><br/>
			<span>服务器端口号:</span><span id="port"></span><br/>
			<span>服务器人数:</span><span id="playercount"></span><br/>
		</div>
	</div>

</body>
</html>