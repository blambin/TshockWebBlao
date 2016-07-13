<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tsweb"%>
<tsweb:base></tsweb:base>
<!DOCTYPE html  >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/maincustom.css">
<script src='js/nprogress.js'></script>
<link rel='stylesheet' href='css/nprogress.css' />
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script src='js/toastr.min.js'></script>
<link rel='stylesheet' href='css/toastr.min.css' />

<style type="text/css">
.col-lg-6 {
	float: left;
}
</style>
<script type="text/javascript">
NProgress.start();
</script>

<title>Control Panel</title>
</head>
<body>

	<nav class="navbar navbar-default">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Welcome back,
					${sessionScope.user.displayName}</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="home/content.action?contentid=1">Add Server<span
							class="sr-only">Add Server</span></a></li>
				</ul>

				<div id="2levernav" class="">
					<ul class="nav navbar-nav">
						<li><a href="home/content.action?contentid=3">Command Line<span
								class="sr-only">Command Line</span></a></li>

					</ul>
					<ul class="nav navbar-nav">
						<li><a href="home/content.action?contentid=4">Players and Groups<span
								class="sr-only">Players and Groups</span></a></li>

					</ul>
					<ul class="nav navbar-nav">
						<li><a href="home/content.action?contentid=5">Log<span
								class="sr-only">Log</span></a></li>

					</ul>

					<p class="navbar-text" id="currentServerp"
						currentServer="${ not empty sessionScope.currentServer}">
						<c:choose>
							<c:when test="${ not empty sessionScope.currentServer}">
				                                                Current Server:<span class="label label-info">${sessionScope.currentServer.serverName}</span>
							</c:when>
							<c:otherwise>
				                                                Have not select a server yet.
				         </c:otherwise>
						</c:choose>
					</p>

				</div>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="home/content.action?contentid=6">About<span
							class="sr-only">About</span></a></li>

				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Personal Settings<span class="sr-only">Personal Settings</span></a>
						<ul class="dropdown-menu">
							<li><a>Basic Information</a></li>
							<li><a>Logout</a></li>
						</ul></li>

				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="">
			<div class="col-md-2 col-xs-4">
				<ul class="nav nav-tabs nav-stacked nav-pills"
					id="leftserverlistmenu">
					<li role="presentation" class="active" id="addserver"><a
						href="home/content.action?contentid=1">Add Server</a></li>
					<c:if test="${not empty sessionScope.servers}">
						<c:forEach var="server" items="${sessionScope.servers}">
							<li role="presentation" id="${server.id}"><a
								href="server/queryServerByServerId.action?id=${server.id}">${server.serverName}</a></li>
						</c:forEach>
					</c:if>

				</ul>
			</div>
			<div class="col-md-10 col-xs-8" id="bodycontent">
				<jsp:include page="common/bodycontent.jsp">
					<jsp:param value="${param.contentid}" name="content" />
				</jsp:include>
			</div>
		</div>
	</div>


</body>
</html>