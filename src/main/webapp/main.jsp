<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html  >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<style type="text/css">
.col-lg-6 {
	float: left;
}
</style>

<script type="text/javascript">
	$(function() {
		$("#broadcastsendbtn").click(function() {
			$.get("broadcast.action", {
				msg : $('#broadcast').val()
			}, function(data) {
				alert(data);
			});
		})
	});
	
	
	
	//左边栏服务器菜单点击事件
	$(function(){
		$("#leftserverlistmenu").children("li+not#addserver").each(function(){
			$(this).click().addClass("active").siblings().removeClass("active");
		});
	});
	
	//删除服务器按钮
	$(function(){
		$("#deleteserver").click(function(){
			alert($(this).val());
			if (confirm("你确定要删除这个服务器么?")) {
				$.get("server/deleteserver.action",{id:$(this).val()},function(){
					alert("删除服务器成功");
				});
			}
		});		
	});
</script>

<title>后台页面</title>
</head>
<body>

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">欢迎你,
					${sessionScope.user.displayName}</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">服务器<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li ><a href="#">服务器列表</a></li>
							<li role="separator" class="divider"></li>
							<li ><a href="#">添加服务器</a></li>
						</ul>
					</li>
				</ul>

				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">服务器命令<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">广播</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">Separated link</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Dropdown <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">Separated link</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
			<div class="">
				<div class="col-md-2 col-xs-4">
					<ul class="nav nav-tabs nav-stacked nav-pills" id="leftserverlistmenu">
					    <li role="presentation" class="active" id="addserver" ><a href="home/content.action?contentid=1">添加服务器</a></li>
						<c:if test="${not empty sessionScope.servers}">
						    <c:forEach var="server" items="${sessionScope.servers}">
						        <li role="presentation"><a href="server/queryServerByServerId.action?id=${server.id}">${server.serverName}</a></li>
						    </c:forEach>
						</c:if>
						
					</ul>
				</div>
				<div class="col-md-10 col-xs-8" id="bodycontent" >
					<jsp:include page="common/bodycontent.jsp">
					    <jsp:param value="${param.contentid}" name="content"/>
					</jsp:include>
				</div>
			</div>
		
	</div>






	<!-- 	<div class="container"> -->
	<!-- 		<div class="col-lg-6"> -->
	<!-- 			<div class="input-group"> -->

	<!-- 				<input type="text" id="broadcast" name="msg" class="form-control" -->
	<!-- 					placeholder="输入广播信息..."> <span class="input-group-btn"> -->
	<!-- 					<button id="broadcastsendbtn" class="btn btn-default" type="button">发送！</button> -->
	<!-- 				</span> -->

	<!-- 			</div> -->
	<!-- 			<!-- /input-group -->
	<!-- 		</div> -->
	<!-- 		<!-- /.col-lg-6 -->
	<%-- 		<div class="alert alert-success" role="alert" style="float: left;">${msg}</div> --%>
	<!-- 	</div> -->

</body>
</html>