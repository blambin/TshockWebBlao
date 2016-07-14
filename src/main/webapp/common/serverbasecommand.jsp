<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tsweb"%>
<script type="text/javascript" src="js/serverbasecommand.js"></script>
<div class="panel panel-default" id="commandpanel">
	<div class="panel-heading">
		<h3 class="panel-title">
			<a role="button" data-toggle="collapse" data-parent="commandpanel"
				aria-expanded="true" data-target="#commandbody">Command Line</a>
		</h3>
	</div>

	<div class="panel-body collapse in" id="commandbody">

		<div>

			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#command"
					aria-controls="command" role="tab" data-toggle="tab">Command</a></li>
				<li role="presentation"><a href="#chat" aria-controls="chat"
					role="tab" data-toggle="tab">Chat</a></li>
				<!-- 				<li role="presentation"><a href="#messages" -->
				<!-- 					aria-controls="messages" role="tab" data-toggle="tab">Messages</a></li> -->
				<!-- 				<li role="presentation"><a href="#settings" -->
				<!-- 					aria-controls="settings" role="tab" data-toggle="tab">Settings</a></li> -->
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="command">
					<div class="panel-body ">
						<div id="chatboxmsg" class="pre-scrollable inner-content"></div>
						<div class="input-group">
							<span class="input-group-addon" id="sizing-addon3">#</span> <input
								id="chatboxmsginputbox" type="text" class="form-control"
								placeholder="Enter the command here. Remember to start with slash."> <span
								class="input-group-btn">
								<button class="btn btn-default" type="button"
									id="chatboxmsgbutton">Send!</button>
								<button class="btn btn-default" type="button"
									id="chatboxmsgbuttonclear">Clean Screen</button>
							</span>
						</div>
					</div>
				</div>
				<div role="tabpanel" class="tab-pane" id="chat">
					<div class="panel-body ">
						<div id="chatchatboxmsg" class="pre-scrollable inner-content">
							<span class="label label-warning chat-content">Chat function requires ExtraRestAdmin plugin in TShock.<a
								href="https://github.com/Zaicon/ExtraRestAdmin">Download link</a>
							</span>
						</div>
						
					</div>
				</div>
				<!-- 				<div role="tabpanel" class="tab-pane" id="messages">...</div> -->
				<!-- 				<div role="tabpanel" class="tab-pane" id="settings">...</div> -->
			</div>

		</div>
	</div>
</div>

<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-title">Send Broadcast</h3>
	</div>
	<div class="" style="display: block">
		<div class="input-group">
			<input type="text" id="broadcast" name="msg" class="form-control"
				placeholder="Enter broadcast message..."> <span class="input-group-btn">
				<button id="broadcastsendbtn" class="btn btn-default" type="button">Send!</button>
			</span>
		</div>
	</div>
</div>
<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-title">Server Info</h3>
	</div>

	<div class="panel-body">
		<p>Detail</p>
	</div>
	<table class="table">
		<tr>
			<th>Status:</th>
			<td id="serverstatus" errorcode="${tokenstatus.status}"
				errormsg="${tokenstatus.msg}">${status.status}</td>
			<th>Version:</th>
			<td>${status.serverversion}</td>
		</tr>
		<tr>
			<th>Max Players:</th>
			<td>${status.maxplayers}</td>
			<th>Port:</th>
			<td>${status.port}</td>
		</tr>
		<tr>
			<th>World Name:</th>
			<td>${status.world}</td>
			<th>Online time:</th>
			<td>${status.uptime}</td>
		</tr>
		<tr>
			<th>Has Password:</th>
			<td>${status.serverpassword}</td>
			<th>Current Online Player Count:</th>
			<td>${status.playercount}</td>
		</tr>
	</table>

	<table class="table">
		<tr>
			<th>Current Online Players:</th>
			<c:forEach var="player" items="${status.players}">
				<tr>
					<td><span style="color: green;">${player.nickname}</span></td>
					<td style="color: blue;">(Group:${player.group })</td>
				</tr>
			</c:forEach>
		</tr>
	</table>


	<div class="panel-heading">Other</div>
	<table class="table">
		<tr>
			<th>Disable Dungeon Guardian:</th>
			<td>${status.rules.DisableDungeonGuardian}</td>
			<th>Enable Whitelist:</th>
			<td>${status.rules.EnableWhitelist}</td>
		</tr>
		<tr>
			<th>Hardcore Only?:</th>
			<td>${status.rules.HardcoreOnly}</td>
			<th>Spawn Protection:</th>
			<td>${status.rules.SpawnProtection}</td>
		</tr>
		<tr>
			<th>Spawn Protection Radius:</th>
			<td>${status.rules.SpawnProtectionRadius} Block(s)</td>
			<th>Server Side Inventory:</th>
			<td>${status.rules.ServerSideInventory}</td>
		</tr>
	</table>
</div>





















