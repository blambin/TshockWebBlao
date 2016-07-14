<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tsweb"%>
<%@taglib prefix="imgTag" uri="/WEB-INF/img2base64.tld"%>
<tsweb:base></tsweb:base>
<script type="text/javascript" src="js/userandgroupmanager.js"></script>
<div class="panel panel-default panel-warning" id="activeuserpanel">
	<div class="panel-heading">
		<div class="panel-title">
			<a role="button" data-toggle="collapse" data-parent="activeuserpanel"
				aria-expanded="true" data-target="#onlineuserdiv">Inventory Viewer</a>
		</div>
	</div>
	<c:if test="${empty onlineUser.players }">
		<div class="panel-body">Nobody's online now...</div>
	</c:if>

	<div id="onlineuserdiv" class="collapse in">
		<ul class="nav nav-tabs  nav-pills">
			<c:forEach var="player" items="${onlineUser.players}">
				<li role="presentation"><a
					href="#${fn:replace(player.position,',','and')}"
					aria-controls="${player.nickname}" role="tab" data-toggle="tab">${player.nickname}</a></li>
			</c:forEach>

		</ul>
		<div class="tab-content">

			<c:forEach var="player" items="${onlineUser.players}">
				<div role="tabpanel" class="tab-pane"
					id="${fn:replace(player.position,',','and')}">

					<!-- BUFF栏循环 -->
					<div class="inner-content">
						<span class="label label-success">Buffs</span>
					</div>
					<div class="buffs-div inner-content">
						<c:forTokens var="buff" items="${player.buffs}" delims=", ">
							<img
								src="data:image/png;base64,<imgTag:imgTag imgAddress="images/buff/${buff}.png"></imgTag:imgTag>"
								alt="" class="img-rounded" />
						</c:forTokens>
					</div>

					<!-- 物品栏循环 -->
					<div class="inner-content">
						<span class="label label-success">Inventory</span>
					</div>
					<div class="items-div inner-content">

						<c:forTokens var="itemWithCount" items="${player.inventory}"
							delims=",">

							<div class="item-pic">
								<!-- 循环显示每个物品和他们自己胶囊 -->
								<img
									src="data:image/png;base64,<imgTag:imgTag imgAddress="images/item/${fn:substringBefore(fn:replace(fn:trim(itemWithCount),' ','_'),':')}.png"></imgTag:imgTag>"
									alt="" class="img-rounded ">

								<c:choose>
									<c:when
										test="${fn:contains((fn:substringAfter(fn:replace(fn:trim(itemWithCount),' ','_'),':')),':')}">
										<c:if
											test="${fn:substringAfter((fn:substringAfter(fn:replace(fn:trim(itemWithCount),' ','_'),':')),':') gt 1}">
											<span class="badge">${fn:substringAfter((fn:substringAfter(fn:replace(fn:trim(itemWithCount),' ','_'),':')),':')}</span>
										</c:if>
									</c:when>
									<c:otherwise>
										<c:if
											test="${fn:trim((fn:substringAfter(fn:replace(fn:trim(itemWithCount),' ','_'),':'))) gt 1}">
											<span class="badge">${fn:substringAfter(fn:replace(fn:trim(itemWithCount),' ','_'),':')}</span>
										</c:if>
									</c:otherwise>
								</c:choose>
							</div>

						</c:forTokens>
					</div>
					<!-- 装备栏循环 -->
					<div class="inner-content">
						<span class="label label-success">Armors</span>
					</div>
					<div class="items-div inner-content">
						<c:forTokens var="armorWithPrefix" items="${player.armor}"
							delims=", ">
							<img
								src="data:image/png;base64,<imgTag:imgTag imgAddress="images/item/${fn:substringBefore(armorWithPrefix,':')}.png"></imgTag:imgTag>"
								alt="" class="img-rounded" />


						</c:forTokens>
					</div>
					<!-- 染料栏循环 -->
					<div class="inner-content">
						<span class="label label-success">Dye</span>
					</div>
					<div class="items-div inner-content">

						<c:forTokens var="dye" items="${player.dyes}" delims=",">

							<div class="item-pic">
								<!-- 循环显示每个物品 -->
								<img
									src="data:image/png;base64,<imgTag:imgTag imgAddress="images/item/${fn:replace(fn:trim(dye),' ','_')}.png"></imgTag:imgTag>"
									alt="" class="img-rounded" />

							</div>
						</c:forTokens>
					</div>
					<button class="btn btn-danger inner-content">踢掉</button>
					<button class="btn btn-danger inner-content">BAN掉</button>
					<button class="btn btn-danger inner-content">杀死</button>
					<button class="btn btn-warning inner-content">禁言并发送全服广播</button>
					<button class="btn btn-warning inner-content">解除禁言</button>
				</div>
			</c:forEach>
			<!-- 			<div role="tabpanel" class="tab-pane active" id="home">home</div> -->
		</div>
	</div>
</div>
<!-- 被禁了的玩家管理 -->
<div class="panel panel-default panel-warning" id="banneduserpanel">
	<div class="panel-heading">
		<div class="panel-title">
			<a role="button" data-toggle="collapse" data-parent="banneduserpanel"
				aria-expanded="true" data-target="#bannedusertable">被禁了的玩家管理</a>
		</div>
	</div>
	<div id="bannedusertable" class="collapse in">
		<div class="panel-body">
		   <button id="refreshbanneduserbutton" class="btn btn-default">刷新列表</button>
		</div>
		<table class="table table-hover table-condensed table-striped "
			id="banneduserdatatable">
			<tr>
				<th>玩家名</th>
				<th>IP</th>
				<th>原因</th>
				<th>解除封禁</th>
			</tr>
		</table>
	</div>
</div>

<!-- 玩家管理面板 -->
<div class="panel panel-default panel-warning" id="userpanel">
	<div class="panel-heading">
		<div class="panel-title">
			<a role="button" data-toggle="collapse" data-parent="userpanel"
				aria-expanded="true" data-target="#usertable">Players Control Panel</a>
		</div>
	</div>

	<div id="usertable" class="collapse in">
		<div class="panel-body">
			<div class="form-group form-inline">
				<label>All registered player</label> <input id="searchtext" type="text"
					class="form-control" placeholder="Enter the name of player to search" />
				<button id="searchbutton" class="btn btn-default">Search</button>
				<button class="btn btn-default" data-toggle="modal"
					data-target="#adduserModal">Add a new player</button>
				<!-- 添加用户Modal -->
				<div class="modal fade" id="adduserModal" tabindex="-1"
					role="dialog" aria-labelledby="adduserModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="adduserModalLabel">Add a new player</h4>
							</div>
							<div class="modal-body">
								<div>
									<form id="adduserform" class="form-inline">
										<div class="form-group">
											<label for="createuserinputusername" class="  control-label">Player name</label>
											<div class="">
												<input type="text" name="user" class="form-control"
													id="createuserinputusername" placeholder="Enter the name of player">
											</div>
										</div>
										<div class="form-group">
											<label for="createuserinputpassword" class=" control-label">Password</label>
											<div class="">
												<input type="text" name="password" class="form-control"
													id="createuserinputpassword" placeholder="Enter the password">
											</div>
										</div>
										<div class="form-group">
											<label for="createuserinputgroup" class="  control-label">Group</label>
											<div class="">
												<input type="text" name="group" class="form-control"
													id="createuserinputgroup" placeholder="Enter the group">
											</div>
										</div>

									</form>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button id="adduserformsubmitbutton" type="button"
									class="btn btn-primary">Add</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<table class="table table-hover table-condensed table-striped "
			id="userdatatable">
			<tr>
				<th>id</th>
				<th>Player Name</th>
				<th>Group</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<c:forEach var="user" items="${user.users}">
				<tr class="info">
					<td>${user.id}</td>
					<td>${user.name}</td>
					<td>${user.group}</td>
					<td><button class="btn btn-default modifyuser"
							userid="${user.name}" usergroup="${user.group}"
							data-toggle="modal" data-target="#modifyuserModal">Edit</button></td>
					<td><button class="btn btn-default deleteuser"
							data-toggle="modal" data-target=".deleteuser-confirm-modal"
							userid="${user.name}">Delete</button></td>
				</tr>
			</c:forEach>

		</table>

		<!-- 修改用户Modal -->
		<div class="modal fade" id="modifyuserModal" tabindex="-1"
			role="dialog" aria-labelledby="modifyuserModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="modifyserModalLabel">Edit player</h4>
					</div>
					<div class="modal-body">
						<div>
							<form id="modifyuserform" class="form-inline">
								<div class="form-group">
									<label for="modifyuserinputusername" class="  control-label">Player name</label>
									<div class="">
										<input type="text" readonly="readonly" name="user"
											class="form-control" id="modifyuserinputusername"
											placeholder="Unchangeable">
									</div>
								</div>
								<br />
								<div class="form-group">
									<label for="modifyuserinputpassword" class=" control-label">Password</label>
									<div class="">
										<input type="text" name="password" class="form-control"
											id="modifyuserinputpassword" placeholder="New password, leave empty for no change">
									</div>
								</div>
								<br />
								<div class="form-group">
									<label for="modifyuserinputgroup" class="  control-label">Group</label>
									<div class="">
										<input type="text" name="group" class="form-control"
											id="modifyuserinputgroup" placeholder="Group name">
									</div>
								</div>
								<br />
							</form>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button id="modifyuserformsubmitbutton" type="button"
							class="btn btn-primary">Edit</button>
					</div>
				</div>
			</div>
		</div>


		<!-- 确认删除模组 -->
		<div class="modal fade deleteuser-confirm-modal" tabindex="-1"
			role="dialog" aria-labelledby="deleteuser-confirm-modal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-body">Are you sure to DELETE the player? NOTICE: This action can not be undone</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button"
							class="btn btn-primary deleteusermodalbutton">Delete</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div>
		<nav style="text-align: center;" id="usermanagernav">
			<ul class="pagination" pagetotal="${user.pageinfo.pagetotal}">
				<li><a aria-label="Previous" id="previous"
					pageindex="${user.pageinfo.index}"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<li><a>${user.pageinfo.index - 2}</a></li>
				<li><a>${user.pageinfo.index -1}</a></li>
				<li><a>${user.pageinfo.index}</a></li>
				<li><a>${user.pageinfo.index + 1}</a></li>
				<li><a>${user.pageinfo.index + 2}</a></li>
				<li><a aria-label="Next" id="next"
					pageindex="${user.pageinfo.index}"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>
</div>
</div>

<div class="panel panel-default panel-warning" id="grouppanel">
	<div class="panel-heading">
		<div class="panel-title">
			<a role="button" data-toggle="collapse" data-parent="grouppanel"
				aria-expanded="true" data-target="#grouptable">Group Control Panel</a>
		</div>
	</div>

	<div id="grouptable" class="collapse in">
		<div class="panel-body">
			<div class="form-group form-inline">
				<label>All groups</label>
				<button class="btn btn-default" data-toggle="modal" data-target=".add-group-modal" id="openAddGroupModal" >Add a new group</button>
			</div>
		</div>
		<table class="table table-hover table-condensed table-striped "
			id="groupdatatable">
			<tr>
				<th>Group name</th>
				<th>Parent group</th>
				<th>Chat color</th>
				<th>Details and Edit</th>
				<th>Delete</th>
			</tr>
			<c:forEach var="group" items="${teamList.groups}">
				<tr class="info">
					<td>${group.name}</td>
					<td>${group.parent}</td>
					<td><div
							style="border: 1px; border-color: gray; background-color: rgb(${group.chatcolor});height: 15px;width: 15px;"></div></td>

					<td><button class="btn btn-default modifygroup"
							data-toggle="modal" data-target=".modify-group-modal"
							group-name="${group.name}">Details and Edit</button></td>
					<td><button class="btn btn-default deletegroup" data-toggle="modal" data-target=".deletgroup-confirm-modal"
					
							group-name="${group.name}">Delete</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Large modal</button> -->

<!-- 修改组的模态框 -->
<div class="modal fade modify-group-modal" tabindex="-1" role="dialog"
	aria-labelledby="modify-group-modal-label">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Details and Edit</h4>
			</div>
			<div class="modal-body">
				<form id="modifygroupform" class="form-inline">
					<div class="form-group">
						<label for="modifygroupinputusername" class="  control-label">Group name</label>
						<div class="">
							<input type="text" readonly="readonly" name="group"
								class="form-control" id="modifygroupinputusername"
								placeholder="Unchangeable">
						</div>
					</div>
					<br />
					<div class="form-group">
						<label for="modifygroupinputgroupparentname"
							class=" control-label">Parent group</label>
						<div class="">
<!-- 							<input type="text" name="parent" class="form-control" -->
<!-- 								id="modifygroupinputgroupparentname" placeholder="父组名"> -->
							<select name="parent"  class="form-control"
								id="modifygroupinputgroupparentname">
							    <option value="" ></option>
							</select>
						</div>
					</div>
					<br />
					<div class="form-group">
						<label for="modifygroupinputcolor" class="control-label">Chat color</label>
						<div class="">
							<input type="color" style="width: 100px;" name="chatcolor"
								class="form-control" id="modifygroupinputcolor"
								placeholder="Chat color">

						</div>
					</div>
					<br />
					<div class="form-group">
						<label for="modifygrouppermissions" class="control-label">Add or delete permissions (Add a exclamation mark("!") before it for deletion)</label>
						<div class="">
							<textarea name="permissions" class="form-control"
								id="modifygrouppermissions" placeholder="Permission Edit"></textarea>
						</div>
					</div>
					<br />
					<div class="form-group">
						<label for="modifygroupinputdirectpermissions"
							class="control-label">Permission</label>
						<div class="">
							<div class=" panel panel-default "
								id="modifygroupinputdirectpermissions">
								<div class="panel-body inner-content"></div>
							</div>

						</div>
					</div>
					<br />
					<div class="form-group">
						<label for="modifygroupinputnegatedpermissions"
							class="control-label">Exclusion</label>
						<div class="">
							<div class=" panel panel-default "
								id="modifygroupinputnegatedpermissions">
								<div class="panel-body inner-content"></div>
							</div>
						</div>
					</div>
					<br />
					<div class="form-group">
						<label for="modifygroupinputtotalpermissions"
							class="control-label">Final Permission</label>
						<div class="">
							<div class=" panel panel-default "
								id="modifygroupinputtotalpermissions">
								<div class="panel-body inner-content"></div>
							</div>
						</div>
					</div>
					<br />
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">CLose</button>
				<button type="button" class="btn btn-primary" id="modifygroupformsave">Save</button>
			</div>
		</div>
	</div>
</div>

<!-- 添加组的模态框 -->
<div class="modal fade add-group-modal" tabindex="-1" role="dialog"
	aria-labelledby="add-group-modal-label">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Add a new group</h4>
			</div>
			<div class="modal-body">
				<form id="addgroupform" class="form-inline">
					<div class="form-group">
						<label for="addgroupinputusername" class="  control-label">Group name</label>
						<div class="">
							<input type="text" name="group"
								class="form-control" id="addgroupinputusername"
								placeholder="Group name">
						</div>
					</div>
					<br />
					<div class="form-group">
						<label for="addgroupinputgroupparentname"
							class=" control-label">Parent group</label>
						<div class="">
<!-- 							<input type="text" name="parent" class="form-control" -->
<!-- 								id="addgroupinputgroupparentname" placeholder="父组名"> -->
							<select name="parent"  class="form-control"
								id="addgroupinputgroupparentname">
							    <option value="" ></option>
							</select>
						</div>
					</div>
					<br />
					<div class="form-group">
						<label for="addgroupinputcolor" class="control-label">Chat color</label>
						<div class="">
							<input type="color" style="width: 100px;" name="chatcolor"
								class="form-control" id="addgroupinputcolor"
								placeholder="Chat color" value="#FFFFFF" >

						</div>
					</div>
					<br />
					<div class="form-group">
						<label for="addgrouppermissions" class="control-label">Edit Permission</label>
						<div class="">
							<textarea name="permissions" class="form-control"
								id="addgrouppermissions" placeholder="Edit Permission"></textarea>
						</div>
					</div>
					<br />
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" id="addgroupformsave">Save</button>
			</div>
		</div>
	</div>
</div>
<!-- 确认删除模组 -->
		<div class="modal fade deletgroup-confirm-modal" tabindex="-1"
			role="dialog" aria-labelledby="deletegroup-confirm-modal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-body">Are you sure to DELETE the group? NOTICE: This action can not be undone</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button"
							class="btn btn-primary deletegroupmodalbutton">Delete</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 确认解除封禁模态框 -->
		<div class="modal fade removebanned-confirm-modal" tabindex="-1"
			role="dialog" aria-labelledby="removebanned-confirm-modal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-body">你确定要解除封禁吗，</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button"
							class="btn btn-primary removebannedmodalbutton">删除</button>
					</div>
				</div>
			</div>
		</div>



