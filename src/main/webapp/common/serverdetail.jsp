<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tsweb"%>

	<form class="form-horizontal" action="server/updateserver.action" method="post" >
	    <input type="hidden" name="id" value="${sessionScope.currentServer.id}" >
	    
	    <div class="form-group">
			<label class="col-sm-2 control-label">Server URL</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="serverUrl" name="serverUrl" value="${sessionScope.currentServer.serverUrl}"
					placeholder="Server URL">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Server Name</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="serverName" name="serverName" value="${sessionScope.currentServer.serverName}"
					placeholder="Server Name">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Admin Username</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="serverAdminUserName" name="serverAdminUserName" value="${sessionScope.currentServer.serverAdminUserName}"
					placeholder="Admin Username">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Admin Password</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="serverAdminPassword" name="serverAdminPassword" value="${sessionScope.currentServer.serverAdminPassword}"
					placeholder="Admin Password">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Server Password</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="serverPassword" name="serverPassword" value="${sessionScope.currentServer.serverPassword}"
					placeholder="Server Password - leave empty for no password">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Server Port</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="serverPort" name="serverPort" value="${sessionScope.currentServer.serverPort}"
					placeholder="Server Port - default 7777">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">RestApi Port</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="serverRestAPIPort" name="serverRestAPIPort" value="${sessionScope.currentServer.serverRestAPIPort}"
					placeholder="RestApiPort - default 7878">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button id="modifyserverbutton" type="submit" class="btn btn-default btn-primary" >Edit</button>
				<button id="deleteserverbutton" type="button" class="btn btn-default btn-primary" value="${sessionScope.currentServer.id}" >Delete</button>
				
			</div>
		</div>
	</form>