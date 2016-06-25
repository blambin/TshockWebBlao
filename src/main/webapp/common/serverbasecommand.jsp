<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tsweb"%>

    <div class="panel panel-default" id="commandpanel">
		<div class="panel-heading">
			<h3 class="panel-title">
			<a role="button" data-toggle="collapse" data-parent="commandpanel" aria-expanded="true" 
				data-target="#commandbody">命令行</a>
			</h3>
		</div>

		<div class="panel-body collapse in" id="commandbody" >
			<div class="panel-body " >
			    <div id="chatboxmsg" class="pre-scrollable">
			        
			    </div>
				<div class="input-group">
				    <span class="input-group-addon" id="sizing-addon3">#</span>
					<input id="chatboxmsginputbox" type="text" class="form-control" placeholder="在这里输入命令..以/开始">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button" id="chatboxmsgbutton" >发送!</button>
						<button class="btn btn-default" type="button" id="chatboxmsgbuttonclear" >清屏</button>
					</span>
				</div>
			</div>
		</div>
	</div>
	
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title">发送广播</h3>
		</div>
		<div class="" style="display: block">
			<div class="input-group">
				<input type="text" id="broadcast" name="msg" class="form-control"
					placeholder="输入广播信息..."> <span class="input-group-btn">
					<button id="broadcastsendbtn" class="btn btn-default" type="button">发送！</button>
				</span>
			</div>
		</div>
	</div>
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title">服务器信息</h3>
		</div>

		<div class="panel-body">
			<p>下面是服务器详细信息</p>
		</div>
		<table class="table">
			<tr>
				<th>状态:</th>
				<td id="serverstatus" errorcode="${tokenstatus.status}" errormsg="${tokenstatus.msg}" >${status.status}</td>
				<th>版本:</th>
				<td>${status.serverversion}</td>
			</tr>
			<tr>
				<th>允许更大玩家数:</th>
				<td>${status.maxplayers}</td>
				<th>端口:</th>
				<td>${status.port}</td>
			</tr>
			<tr>
				<th>地图名称:</th>
				<td>${status.world}</td>
				<th>有效在线时间:</th>
				<td>${status.uptime}</td>
			</tr>
			<tr>
				<th>服务器有密码吗:</th>
				<td>${status.serverpassword}</td>
				<th>当前在线人数:</th>
				<td>${status.playercount}</td>
			</tr>
		</table>

		<table class="table">
			<tr>
				<th>在线玩家列表:</th>
				<c:forEach var="player" items="${status.players}">
				<tr>
					<td><span style="color: green;">${player.nickname}</span>
					</td>
					<td style="color: blue;">(组:${player.group })</td>
				</tr>
			</c:forEach>
			</tr>
		</table>


		<div class="panel-heading">杂项</div>
		<table class="table">
			<tr>
				<th>是否禁示了地牢守卫:</th>
				<td>${status.rules.DisableDungeonGuardian}</td>
				<th>是否开启了白名单:</th>
				<td>${status.rules.EnableWhitelist}</td>
			</tr>
			<tr>
				<th>强制中难?:</th>
				<td>${status.rules.HardcoreOnly}</td>
				<th>出生点保护:</th>
				<td>${status.rules.SpawnProtection}</td>
			</tr>
			<tr>
				<th>出生点保护范围:</th>
				<td>${status.rules.SpawnProtectionRadius}(格)</td>
				<th>强制开荒吗:</th>
				<td>${status.rules.ServerSideInventory}</td>
			</tr>
		</table>
	</div>