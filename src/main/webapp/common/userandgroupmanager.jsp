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
				aria-expanded="true" data-target="#onlineuserdiv">在线玩家查背包</a>
		</div>
	</div>
	<c:if test="${empty onlineUser.players }">
		<div class="panel-body">没有任何在线玩家....</div>
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
						<span class="label label-success">背包栏</span>
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
						<span class="label label-success">装备栏</span>
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
						<span class="label label-success">染料栏</span>
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
				</div>
			</c:forEach>
			<!-- 			<div role="tabpanel" class="tab-pane active" id="home">home</div> -->
		</div>
	</div>
</div>



<div class="panel panel-default panel-warning" id="userpanel">
	<div class="panel-heading">
		<div class="panel-title">
			<a role="button" data-toggle="collapse" data-parent="userpanel"
				aria-expanded="true" data-target="#usertable">玩家管理面板</a>
		</div>
	</div>

	<div id="usertable" class="collapse in">
		<div class="panel-body">
			<div class="form-group form-inline">
				<label>所有注册玩家</label> <input id="searchtext" type="text"
					class="form-control" placeholder="输入玩家名字搜索" />
				<button id="searchbutton" class="btn btn-default">搜索</button>
				<button class="btn btn-default" data-toggle="modal"
					data-target="#adduserModal">添加新用户</button>
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
								<h4 class="modal-title" id="adduserModalLabel">添加用户</h4>
							</div>
							<div class="modal-body">
								<div>
									<form id="adduserform" class="form-inline">
										<div class="form-group">
											<label for="createuserinputusername" class="  control-label">用户名</label>
											<div class="">
												<input type="text" name="user" class="form-control"
													id="createuserinputusername" placeholder="请输入用户名">
											</div>
										</div>
										<div class="form-group">
											<label for="createuserinputpassword" class=" control-label">密码</label>
											<div class="">
												<input type="text" name="password" class="form-control"
													id="createuserinputpassword" placeholder="请输入密码">
											</div>
										</div>
										<div class="form-group">
											<label for="createuserinputgroup" class="  control-label">所在的组</label>
											<div class="">
												<input type="text" name="group" class="form-control"
													id="createuserinputgroup" placeholder="请输入组名">
											</div>
										</div>

									</form>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button id="adduserformsubmitbutton" type="button"
									class="btn btn-primary">添加</button>
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
				<th>用户名</th>
				<th>用户组</th>
				<th>修改</th>
				<th>删除</th>
			</tr>
			<c:forEach var="user" items="${user.users}">
				<tr class="info">
					<td>${user.id}</td>
					<td>${user.name}</td>
					<td>${user.group}</td>
					<td><button class="btn btn-default modifyuser"
							userid="${user.name}" usergroup="${user.group}"
							data-toggle="modal" data-target="#modifyuserModal">修改</button></td>
					<td><button class="btn btn-default deleteuser"
							data-toggle="modal" data-target=".deleteuser-confirm-modal"
							userid="${user.name}">删除</button></td>
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
						<h4 class="modal-title" id="modifyserModalLabel">修改用户</h4>
					</div>
					<div class="modal-body">
						<div>
							<form id="modifyuserform" class="form-inline">
								<div class="form-group">
									<label for="modifyuserinputusername" class="  control-label">用户名</label>
									<div class="">
										<input type="text" readonly="readonly" name="user"
											class="form-control" id="modifyuserinputusername"
											placeholder="用户名不能改">
									</div>
								</div>
								<br />
								<div class="form-group">
									<label for="modifyuserinputpassword" class=" control-label">密码</label>
									<div class="">
										<input type="text" name="password" class="form-control"
											id="modifyuserinputpassword" placeholder="请输入密码,不修改则留空">
									</div>
								</div>
								<br />
								<div class="form-group">
									<label for="modifyuserinputgroup" class="  control-label">所在的组</label>
									<div class="">
										<input type="text" name="group" class="form-control"
											id="modifyuserinputgroup" placeholder="请输入组名">
									</div>
								</div>
								<br />
							</form>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button id="modifyuserformsubmitbutton" type="button"
							class="btn btn-primary">修改</button>
					</div>
				</div>
			</div>
		</div>


		<!-- 确认删除模组 -->
		<div class="modal fade deleteuser-confirm-modal" tabindex="-1"
			role="dialog" aria-labelledby="deleteuser-confirm-modal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-body">你确定要删除用户吗，删除了不可以恢复.</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button"
							class="btn btn-primary deleteusermodalbutton">删除</button>
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
				aria-expanded="true" data-target="#grouptable">组管理面板</a>
		</div>
	</div>

	<div id="grouptable" class="collapse in">
		<div class="panel-body">
			<div class="form-group form-inline">
				<label>所有组</label>
				<button class="btn btn-default" data-toggle="modal" data-target=".add-group-modal" id="openAddGroupModal" >添加新组</button>
			</div>
		</div>
		<table class="table table-hover table-condensed table-striped "
			id="groupdatatable">
			<tr>
				<th>组名</th>
				<th>父用户组</th>
				<th>组聊天颜色</th>
				<th>组详情和修改</th>
				<th>删除</th>
			</tr>
			<c:forEach var="group" items="${teamList.groups}">
				<tr class="info">
					<td>${group.name}</td>
					<td>${group.parent}</td>
					<td><div
							style="border: 1px; border-color: gray; background-color: rgb(${group.chatcolor});height: 15px;width: 15px;"></div></td>

					<td><button class="btn btn-default modifygroup"
							data-toggle="modal" data-target=".modify-group-modal"
							group-name="${group.name}">详细和修改</button></td>
					<td><button class="btn btn-default deletegroup" data-toggle="modal" data-target=".deletgroup-confirm-modal"
					
							group-name="${group.name}">删除</button></td>
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
				<h4 class="modal-title">修改组</h4>
			</div>
			<div class="modal-body">
				<form id="modifygroupform" class="form-inline">
					<div class="form-group">
						<label for="modifygroupinputusername" class="  control-label">组名</label>
						<div class="">
							<input type="text" readonly="readonly" name="group"
								class="form-control" id="modifygroupinputusername"
								placeholder="组名不能改">
						</div>
					</div>
					<br />
					<div class="form-group">
						<label for="modifygroupinputgroupparentname"
							class=" control-label">父组名</label>
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
						<label for="modifygroupinputcolor" class="control-label">组聊天颜色</label>
						<div class="">
							<input type="color" style="width: 100px;" name="chatcolor"
								class="form-control" id="modifygroupinputcolor"
								placeholder="组聊天颜色">

						</div>
					</div>
					<br />
					<div class="form-group">
						<label for="modifygrouppermissions" class="control-label">添加或删除权限(如果想删除权限,则在要删除的前面加个"!"号)</label>
						<div class="">
							<textarea name="permissions" class="form-control"
								id="modifygrouppermissions" placeholder="添加或删除权限"></textarea>
						</div>
					</div>
					<br />
					<div class="form-group">
						<label for="modifygroupinputdirectpermissions"
							class="control-label">直接权限</label>
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
							class="control-label">排除权限</label>
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
							class="control-label">最终权限</label>
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
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="modifygroupformsave">保存</button>
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
				<h4 class="modal-title">添加组</h4>
			</div>
			<div class="modal-body">
				<form id="addgroupform" class="form-inline">
					<div class="form-group">
						<label for="addgroupinputusername" class="  control-label">组名</label>
						<div class="">
							<input type="text" name="group"
								class="form-control" id="addgroupinputusername"
								placeholder="填写组名">
						</div>
					</div>
					<br />
					<div class="form-group">
						<label for="addgroupinputgroupparentname"
							class=" control-label">父组名</label>
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
						<label for="addgroupinputcolor" class="control-label">组聊天颜色</label>
						<div class="">
							<input type="color" style="width: 100px;" name="chatcolor"
								class="form-control" id="addgroupinputcolor"
								placeholder="组聊天颜色" value="#FFFFFF" >

						</div>
					</div>
					<br />
					<div class="form-group">
						<label for="addgrouppermissions" class="control-label">添加权限</label>
						<div class="">
							<textarea name="permissions" class="form-control"
								id="addgrouppermissions" placeholder="添加或删除权限"></textarea>
						</div>
					</div>
					<br />
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="addgroupformsave">保存</button>
			</div>
		</div>
	</div>
</div>
<!-- 确认删除模组 -->
		<div class="modal fade deletgroup-confirm-modal" tabindex="-1"
			role="dialog" aria-labelledby="deletegroup-confirm-modal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-body">你确定要删除组吗，删除了不可以恢复.</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button"
							class="btn btn-primary deletegroupmodalbutton">删除</button>
					</div>
				</div>
			</div>
		</div>



