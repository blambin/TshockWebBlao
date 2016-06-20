<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tsweb"%>
<tsweb:base></tsweb:base>
<!DOCTYPE html ">
<html>
<body>
	<form class="form-horizontal" action="server/updateserver.action" method="post" >
	    <input type="hidden" name="id" value="${sessionScope.currentServer.id}" >
	    
	    <div class="form-group">
			<label class="col-sm-2 control-label">服务器地址</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="serverUrl" name="serverUrl" value="${sessionScope.currentServer.serverUrl}"
					placeholder="服务器地址">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">服务器名字</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="serverName" name="serverName" value="${sessionScope.currentServer.serverName}"
					placeholder="服务器名字">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">管理员用户名</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="serverAdminUserName" name="serverAdminUserName" value="${sessionScope.currentServer.serverAdminUserName}"
					placeholder="管理员用户名">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">管理员密码</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="serverAdminPassword" name="serverAdminPassword" value="${sessionScope.currentServer.serverAdminPassword}"
					placeholder="管理员密码">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">服务器密码</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="serverPassword" name="serverPassword" value="${sessionScope.currentServer.serverPassword}"
					placeholder="服务器密码-没有密码可以留空">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">服务器端口</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="serverPort" name="serverPort" value="${sessionScope.currentServer.serverPort}"
					placeholder="服务器端口-默认为 7777">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">RestApi端口</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="serverRestAPIPort" name="serverRestAPIPort" value="${sessionScope.currentServer.serverRestAPIPort}"
					placeholder="RestApi端口-默认为 7878">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button id="modifyserverbutton" type="submit" class="btn btn-default btn-primary" >修改</button>
				<button id="deleteserverbutton" type="button" class="btn btn-default btn-primary" value="${sessionScope.currentServer.id}" >删除这个服务器</button>
				
			</div>
		</div>
	</form>
</body>
</html>