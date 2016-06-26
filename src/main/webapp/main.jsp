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
			$.ajax({
				url:"home/broadcast.action",
				data:"msg="+$('#broadcast').val(),
				success:function(data) {
					alert(data.status + " 发送成功~");
					$('#broadcast').val("");
				},
				error:function (XMLHttpRequest, textStatus) {
					alert(textStatus+" , 发送失败." +"我也不知道为什么出错了..");
					$('#broadcast').val("");
				}
			    
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
		$("#deleteserverbutton").click(function(){
			var id = $(this).val();
			if (confirm("你确定要删除这个服务器么?")) {
				$.get("server/deleteserver.action",{id:$(this).val()},function(){
					alert("删除服务器成功");
					//隐藏删除了的服务器按钮
					$("#"+id).hide();
					//禁止点击"修改和删除"已经被删除了的服务器
					$("#modifyserverbutton").attr("disabled","disabled");
					$("#deleteserverbutton").attr("disabled","disabled");
				});
			}
		});		
	});
	
	
	//没有设置当前服务器时隐藏右边菜单栏目
	$(function(){
		
		if ($("#currentServerp").attr("currentServer") != "true") {
			//alert($("#currentServerp").attr("currentServer"));
			$("#2levernav").addClass("hidden");
		}
	});
	
	//***
	//*命令行按钮发送信息事件
	
	$(function(){
		$("#chatboxmsgbutton").click(function(){
			var inputValue = $("#chatboxmsginputbox").val();
			$("#chatboxmsg").append('<pre class="bg-success blockquote-reverse">'+inputValue+'</pre>');
			
			$.get("home/rawcmd.action",{cmd:inputValue},function(data){
				$("#chatboxmsg").append('<pre class="bg-info">'+data.response+'</pre>');
				//滚到最底
				$("#chatboxmsg").scrollTop(100000);
			});
			//滚到最底
			$("#chatboxmsg").scrollTop(100000);
			//清空输入框
			$("#chatboxmsginputbox").val("");
		});
	});
	
	//保存服务器之前先简单验证信息是否正确  ，，没有写好
	$(function(){
		$("#saveform").submit(function(){
			//alert($("#saveform").html());
			$.ajax({
				url:"server/validserverinfo",
				data:$("#saveform").serializeArray(),
				success:function(data){
					if (data.status == "200") {
						return true;
					}else if (data.status == "403") {
						alert("你输入的数据有错误,请检查: " + data.error);
						return false;
					}else{
						alert("你未知错误，请你去找管理员吧~ " + data.status);
						return false;
					}					
				}
			});
		});
	});
	//服务器状态检测，并弹出框
	$(function(){
		
		var errorcode = $("#serverstatus").attr("errorcode");
		
		//如果有错误而且获取到这个元素，则输出错误
		if (errorcode != 200 && errorcode != undefined && errorcode != "") {
			alert("错误信息: " + $("#serverstatus").attr("errormsg"));
		};
		
		//如果验证服务器地址,端口,帐号密码都成功的话
		if (errorcode == 200 && errorcode != undefined && errorcode != "") {
			alert("登陆成功了喵~: " + $("#serverstatus").attr("errormsg"));
		};
	});
	
	//键盘事件
	$(window).keydown(function(event){
		//命令行发送按钮的键盘事件,焦点在文本框里 并且 按了回车
		if ($("#chatboxmsginputbox").is($(":focus")) && event.keyCode == 13) {
			//alert("被抓到了");
			$("#chatboxmsgbutton").click();
		};
		// 广播发送按钮的键盘事件,焦点在文本框里 并且 按了回车
		if ($("#broadcast").is($(":focus")) && event.keyCode == 13) {
			
			$("#broadcastsendbtn").click();
		};
	});
	
	//命令行清屏功能
	$(function() {
		$("#chatboxmsgbuttonclear").click(function(){
			//alert("aa");
			$("#chatboxmsg").empty();
		});
	});
	//用户管理的分页功能 
	$(function(){
		
		//分页总方法
		function paginationmethod() {
			
			//去头去尾,操作的中间按钮
			var pageBuntton = $("#usermanagernav").children().children().not(":first").not(":last");
			//操作上一页码和下一页按钮
			var previousandnextbutton = $("#usermanagernav").find("ul li:first,ul li:last");
			
            previousandnextbutton.each(function() {
				
            	var maxPage = parseInt($("#usermanagernav").children().attr("pagetotal"));
				var pagenumber = parseInt($(this).find("a").attr("pageindex"));
				var buttontype = $(this).find("a").attr("id");
				if (buttontype == "previous") {
					//避免页码越界
					if ((pagenumber - 1)< 1) {
						$(this).addClass("disabled");
					}else {
						$(this).click(function() {
							getUserData((pagenumber - 1));
						});
					}
					
				}else {
					//避免页码越界
					if (pagenumber >= maxPage) {
						$(this).addClass("disabled");
					}else {
						$(this).click(function() {
							getUserData((pagenumber + 1));
						});
					}
				}
			});
			
			pageBuntton.each(function() {
				
				var pagenumber = $(this).find("a").html();
				var maxPage = parseInt($("#usermanagernav").children().attr("pagetotal"));
				
				//找出所有符合条件的给添加点击事件, 不符合条件的隐藏起来
				if (pagenumber > 0 && pagenumber < (maxPage+1)) {
					$(this).bind("click",function(){
						getUserData(pagenumber);
					});
				}else {
					$(this).remove();
				}
			});
			
			
			
		};
		
		//分页请求数据
		function getUserData(pagenumber) {
			$.get("home/showuserlist.action",{index:pagenumber},function(data){
				
				// 替换数据
				$("#userdatatable").empty();
				$("#userdatatable").append("<tr><th>ID</th><th>用户名</th><th>用户组</th></tr>");
				//console.log(data.users[0].id);
				$.each(data.users,function(i,user){
					$("#userdatatable").append('<tr><th>'+user.id+'</th><td>'+user.name+'</td><td>'+user.group+'</td></tr>');	
				});
					
				//修改分页按钮文本
				$("#usermanagernav").children().empty();
				$("#usermanagernav").children().append('<li><a aria-label="Previous" id="previous" pageindex="'+data.pageinfo.index+'" > <span aria-hidden="true">&laquo;</span></a></li>');
				$("#usermanagernav").children().append('<li><a>'+(data.pageinfo.index - 2) +'</a></li>');
				$("#usermanagernav").children().append('<li><a>'+(data.pageinfo.index - 1) +'</a></li>');
				$("#usermanagernav").children().append('<li  class="active" ><a>'+data.pageinfo.index+'</a></li>');
				$("#usermanagernav").children().append('<li><a>'+(data.pageinfo.index + 1) +'</a></li>');
				$("#usermanagernav").children().append('<li><a>'+(data.pageinfo.index + 2)+'</a></li>');
				$("#usermanagernav").children().append('<li><a  aria-label="Next" id="next"  pageindex="'+data.pageinfo.index+'" > <span aria-hidden="true">&raquo;</span> </a></li>');
				
				paginationmethod();
			});
		}
		
		//初次加载一次分页方法
		paginationmethod();
		
		
	});
	
	//在线用户标签页点击功能 
	$(function() {
		var Tab = $("#onlineuserdiv ul");
		Tab.find('li a').click(function (e) {
			  e.preventDefault()
			  $(this).tab('show')
			})
	})
	
	
</script>

<title>后台页面</title>
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
				<a class="navbar-brand" href="#">欢迎你,
					${sessionScope.user.displayName}</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="home/content.action?contentid=1">添加服务器<span
							class="sr-only">添加服务器</span></a></li>
				</ul>

				<div id="2levernav" class="">
					<ul class="nav navbar-nav">
						<li><a href="home/content.action?contentid=3">服务器基本信息和命令行<span
								class="sr-only">服务器基本信息和命令行</span></a></li>

					</ul>
					<ul class="nav navbar-nav">
						<li><a href="home/content.action?contentid=4">玩家和组<span
								class="sr-only">玩家和组</span></a></li>

					</ul>

					<p class="navbar-text" id="currentServerp"
						currentServer="${ not empty sessionScope.currentServer}">
						<c:choose>
							<c:when test="${ not empty sessionScope.currentServer}">
				                                                当前选择服务器:<span
									style="color: green;">${sessionScope.currentServer.serverName}</span>
							</c:when>
							<c:otherwise>
				                                                当前没有选择任何服务器。
				         </c:otherwise>
						</c:choose>
					</p>
				</div>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="">
			<div class="col-md-2 col-xs-4">
				<ul class="nav nav-tabs nav-stacked nav-pills"
					id="leftserverlistmenu">
					<li role="presentation" class="active" id="addserver"><a
						href="home/content.action?contentid=1">添加服务器</a></li>
					<c:if test="${not empty sessionScope.servers}">
						<c:forEach var="server" items="${sessionScope.servers}">
							<li role="presentation" id="${server.id}" ><a
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