<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tsweb"%>

<form id="saveform" class="form-horizontal"
	action="server/saveserver.action" method="post">

	<div class="form-group">
		<label class="col-sm-2 control-label">Server URL</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="serverUrl"
				name="serverUrl" placeholder="Server URL, you can enter a domain name or a ip">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">Server Name</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="serverName"
				name="serverName" placeholder="Server Name, you can enter whatever you want: Just for display">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">Admin Username</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="serverAdminUserName"
				name="serverAdminUserName"
				placeholder="Admin Username - A Player account that has permissions of RestAPI.">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">Admin Password</label>
		<div class="col-sm-10">
			<input type="password" class="form-control" id="serverAdminPassword"
				name="serverAdminPassword" placeholder="Password for account above">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">Server Password</label>
		<div class="col-sm-10">
			<input type="password" class="form-control" id="serverPassword"
				name="serverPassword" placeholder="Server Password - Leave empty for no pasword">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">Server Port</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="serverPort"
				name="serverPort" value="7777" placeholder="Server Port - default 7777">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">RestApi Port</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="serverRestAPIPort"
				name="serverRestAPIPort" value="7878"
				placeholder="RestApi Port - default 7878">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-default">Add</button>
		</div>
	</div>
</form>
<div class="panel panel-default col-sm-offset-2  col-lg-10">
	<div class="panel-heading">
		<h3 class="panel-title">Guide</h3>
	</div>
	<div class="panel-body">
		<div class="">

			<p>Guide:</p>
			<p>1. Find the file "config.json" in TShock folder
			<p>2. Search in the file above for the string "RestApiEnabled": false, and change the "false" into "true" and save it.</p>
			<p>  After the step above, you should see "RestApiEnabled": true, in your file.</p>
			<p>3. Enter the information about your server.</p>
			<p>  Server URL: Enter the address you tell your player. It can be a domain name or a ip address.</p>
			<p>  Server Name: Whatever you like, just for display</p>
			<p>  Admin Username: A Player account with RestApi permission. You will find some details about the permission later in this guide.</p>
			<p>  Admin Password: The password of the account above.</p>
			<p>  Server Password: The password required when you enter the server. Leave empty if no password.</p>
			<p>  Server Port: Enter the port you tell players. Default value is 7777.</p>
			<h4 style="color:orange;">RestApi Port</h4>
			<p>Search in file in step 1 of Guide for the string "RestApiPort". The default value is 7878</p>
			<h4 style="color:orange;">Server Password</h4>
			<p>The password required to enter the server, can be found in the same file above and is called "ServerPassword"</p>
			<h4 style="color:orange;">RestAPI Permission</h4>
			<p>Only the account with RestAPI permission can use the Web Control Panel.</p>
			<p>For all RestApi permissions, use "tshock.rest.*"</p>
			<p>WARNING: DO NOT give this permission, unless you know this means the full control of the server</p>
			<p>Nodes List:<br>
			tshock.rest.bans.view<br>
			tshock.rest.bans.manage<br>
			tshock.rest.groups.view<br>
			tshock.rest.groups.manage<br>
			tshock.rest.users.view<br>
			tshock.rest.users.manage<br>
			tshock.rest.users.info<br>
			tshock.rest.useapi<br>
			tshock.rest.manage<br>
			tshock.rest.maintenance<br>
			tshock.rest.cfg tshock.rest.kick<br>
			tshock.rest.ban<br>
			tshock.rest.mute tshock.rest.kill<br>
			tshock.rest.causeevents<br>
			tshock.rest.butcher tshock.rest.command<br>
			tshock.rest.viewips<br></p>
			<p>	Example : Give REST ban permission to newadmin group<br>
			"/group addperm newadmin tshock.rest.ban"<br>
			Then the players in newadmin group can ban players via Web Control Panel<br></p>
			<p>
				Copyleft <img alt="版责" src="images/copyleft.png" height="20px" width="20px">
				<a class="active" href="http://blambin.org">Author: blambin</a>&nbsp;&nbsp;
				<a class="active" href="https://www.tshockcn.com/">Guide Author: 欲情</a>&nbsp;&nbsp;
				<a href="https://github.com/gyrodrill/">Translation: Gyrodrill(Koishi)</a>
			</p>
		</div>
	</div>
</div>