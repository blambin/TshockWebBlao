<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tsweb"%>

<div class="panel panel-default panel-warning" id="userpanel">
	<div class="panel-heading">
		<div class="panel-title">
			<a role="button" data-toggle="collapse" data-parent="userpanel"
				aria-expanded="true" data-target="#usertable">玩家管理面板</a>
		</div>
	</div>

	<div id="usertable" class="collapse in">
		<div class="panel-body"> 所有注册玩家 </div>
		<table class="table table-hover table-condensed table-striped " id="userdatatable">
			<tr>
				<th>id</th>
				<th>用户名</th>
				<th>用户组</th>
			</tr>
			<tr class="info">
				<td>${user.users[0].id}</td>
				<td>${user.users[0].name}</td>
				<td>${user.users[0].group}</td>
			</tr>
			<tr>
				<td>${user.users[1].id}</td>
				<td>${user.users[1].name}</td>
				<td>${user.users[1].group}</td>
			</tr>
			<tr>
				<td>${user.users[2].id}</td>
				<td>${user.users[2].name}</td>
				<td>${user.users[2].group}</td>
			</tr>
			<tr>
				<td>${user.users[3].id}</td>
				<td>${user.users[3].name}</td>
				<td>${user.users[3].group}</td>
			</tr>
			<tr>
				<td>${user.users[4].id}</td>
				<td>${user.users[4].name}</td>
				<td>${user.users[4].group}</td>
			</tr>
			<tr>
				<td>${user.users[5].id}</td>
				<td>${user.users[5].name}</td>
				<td>${user.users[5].group}</td>
			</tr>
			<tr>
				<td>${user.users[6].id}</td>
				<td>${user.users[6].name}</td>
				<td>${user.users[6].group}</td>
			</tr>
			<tr>
				<td>${user.users[7].id}</td>
				<td>${user.users[7].name}</td>
				<td>${user.users[7].group}</td>
			</tr>
			<tr>
				<td>${user.users[8].id}</td>
				<td>${user.users[8].name}</td>
				<td>${user.users[8].group}</td>
			</tr>
			<tr>
				<td>${user.users[9].id}</td>
				<td>${user.users[9].name}</td>
				<td>${user.users[9].group}</td>
			</tr>
			<tr>
				<td>${user.users[10].id}</td>
				<td>${user.users[10].name}</td>
				<td>${user.users[10].group}</td>
			</tr>
			<tr>
				<td>${user.users[11].id}</td>
				<td>${user.users[11].name}</td>
				<td>${user.users[11].group}</td>
			</tr>
		</table>
		<div>
			<nav style="text-align: center;" id="usermanagernav">
				<ul class="pagination" pagetotal="${user.pageinfo.pagetotal}" >
					<li><a aria-label="Previous" id="previous" pageindex="${user.pageinfo.index}" > <span
							aria-hidden="true">&laquo;</span>
					</a></li>
					<li><a >${user.pageinfo.index - 2}</a></li>
					<li><a >${user.pageinfo.index -1}</a></li>
					<li><a >${user.pageinfo.index}</a></li>
					<li><a >${user.pageinfo.index + 1}</a></li>
					<li><a >${user.pageinfo.index + 2}</a></li>
					<li><a  aria-label="Next" id="next"  pageindex="${user.pageinfo.index}" > <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>

