<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tsweb"%>
<tsweb:base></tsweb:base>
<!DOCTYPE html ">
<html>
<body>
	<form id="saveform" class="form-horizontal" action="server/saveserver.action" method="post" >
	    
	    <div class="form-group">
			<label class="col-sm-2 control-label">服务器地址</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="serverUrl" name="serverUrl"
					placeholder="服务器地址 可以是域名或ip 如:tr.xxx.com ">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">服务器名字</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="serverName" name="serverName"
					placeholder="服务器名字  随便写一个，为了让你自己更好的识别而已">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">管理员用户名</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="serverAdminUserName" name="serverAdminUserName"
					placeholder="管理员用户名  -可以用来登陆游戏的管理员帐号 需要有 RestAPI 的权限">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">管理员密码</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="serverAdminPassword" name="serverAdminPassword"
					placeholder="管理员密码  上面帐号的密码">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">服务器密码</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="serverPassword" name="serverPassword"
					placeholder="服务器密码-进游戏服务器需要用到的密码-没有密码可以留空">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">服务器端口</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="serverPort" name="serverPort" value="7777"
					placeholder="服务器端口-默认为 7777">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">RestApi端口</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="serverRestAPIPort" name="serverRestAPIPort" value="7878"
					placeholder="RestApi端口-默认为 7878">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">添加</button>
			</div>
		</div>
	</form>
</body>
</html>