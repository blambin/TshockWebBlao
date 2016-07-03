<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tsweb"%>

<form id="saveform" class="form-horizontal"
	action="server/saveserver.action" method="post">

	<div class="form-group">
		<label class="col-sm-2 control-label">服务器地址</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="serverUrl"
				name="serverUrl" placeholder="服务器地址 可以是域名或ip 如:tr.xxx.com ">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">服务器名字</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="serverName"
				name="serverName" placeholder="服务器名字  随便写一个，为了让你自己更好的识别而已">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">管理员用户名</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="serverAdminUserName"
				name="serverAdminUserName"
				placeholder="管理员用户名  -可以用来登陆游戏的管理员帐号 需要有 RestAPI 的权限">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">管理员密码</label>
		<div class="col-sm-10">
			<input type="password" class="form-control" id="serverAdminPassword"
				name="serverAdminPassword" placeholder="管理员密码  上面帐号的密码">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">服务器密码</label>
		<div class="col-sm-10">
			<input type="password" class="form-control" id="serverPassword"
				name="serverPassword" placeholder="服务器密码-进游戏服务器需要用到的密码-没有密码可以留空">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">服务器端口</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="serverPort"
				name="serverPort" value="7777" placeholder="服务器端口-默认为 7777">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">RestApi端口</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="serverRestAPIPort"
				name="serverRestAPIPort" value="7878"
				placeholder="RestApi端口-默认为 7878">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-default">添加</button>
		</div>
	</div>
</form>
<div class="panel panel-default col-sm-offset-2  col-lg-10">
	<div class="panel-heading">
		<h3 class="panel-title">填入信息简要说明 </h3>
	</div>
	<div class="panel-body">
		<div class="">

			<p>简要说明:</p>
			<p>首先请在Tshock 文件夹 config.json 配置文件内找到 "RestApiEnabled": false
				，请将false 更改为True。</p>
			<p>服务器地址: 你服务器的IP地址 例 tr.wmljb,com 或 127.0.0.1</p>
			<p>服务器名字: 随意填写</p>
			<p>管理员用户名:你服务器里拥有RestApi权限的账户（RestApi权限SuperAdmin账户默认拥有此权限，其他账户请看下面详细说明）</p>
			<p>管理员密码： 上面填写账户的对应密码</p>
			<p>服务器密码： 进入服务器时需要的密码 Tshock配置文件内可开启此密码 Tshock默认关闭 ,关闭时此项留空</p>
			<p>服务器端口: 进入服务器时的端口号 更改为自己具体服务器端口填写 例：7777</p>
			<h4 style="color:orange;">RestApi端口:</h4>

			<p>Tshock配置文件内设置的RestApi端口号 Thsock默认为7878</p>
			<h4 style="color:orange;">服务器密码详细说明：</h4>
			<p>Tshock文件夹config.json 配置文件内 "ServerPassword": "1234"选项对应 默认此项为空</p>

			<h4 style="color:orange;">RestApi端口详细说明：</h4>
			<p>RestApi端口可在Tshock文件夹config.json 配置文件 "RestApiPort": 7878, 项修改
				默认为7878</p>

			<h4 style="color:orange;">RestAPI 权限详细说明：</h4>
			<p>账户需拥有RestApi 权限 才能使用本网页管理端</p>
			<p>RestApi所有权限 可添加 tshock.rest.*
				权限节点到账户相应的组内(此权限慎用，拥有此权限就在网页端拥有了超管)</p>

			分类节点如下： tshock.rest.bans.view = 拥有XXX功能 tshock.rest.bans.manage = <br />
			tshock.rest.groups.view tshock.rest.groups.manage <br />
			tshock.rest.users.view tshock.rest.users.manage <br />
			tshock.rest.users.info tshock.rest.useapi tshock.rest.manage <br />
			tshock.rest.maintenance tshock.rest.cfg tshock.rest.kick =
			拥有此权限用户组可在网页端执行/kick命令 <br /> tshock.rest.ban = 拥有此选项用户组可在网页端执行/ban命令
			<br /> tshock.rest.mute tshock.rest.kill = 拥有此选项用户组可在网页端执行/kill命令 <br />
			tshock.rest.causeevents = tshock.rest.butcher tshock.rest.command <br />
			tshock.rest.viewips 例:将ban人权限给newadmin组的管理员 命令为:"/group addperm <br />
			newadmin tshock.rest.ban" newadmin组的管理员在本网页端就拥有了ban人权限了 <br /> <br />
			<p>
				Copyleft <img alt="版责" src="images/copyleft.png" height="20px"
					width="20px"> <a class="active" href="http://blambin.org">程式作者
					:blambin</a>&nbsp;&nbsp; <a class="active"
					href="https://www.tshockcn.com/">提供文本 :欲情</a>
			</p>
		</div>
	</div>
</div>