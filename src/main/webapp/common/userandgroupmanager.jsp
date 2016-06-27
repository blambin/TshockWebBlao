<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="tsweb"%>
<%@taglib prefix="imgTag" uri="/WEB-INF/img2base64.tld" %>
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
		    <c:forEach var="player"  items="${onlineUser.players}">
		        <li role="presentation"><a href="#${fn:replace(player.position,',','and')}" aria-controls="${player.nickname}" role="tab" data-toggle="tab">${player.nickname}</a></li>
		    </c:forEach>
			
		</ul>
		<div class="tab-content">
		    
		    <c:forEach var="player"  items="${onlineUser.players}">
		        <div role="tabpanel" class="tab-pane" id="${fn:replace(player.position,',','and')}">
		            
		            <!-- BUFF栏循环 -->
		            <div class="inner-content">
		                <span class="label label-success">Buffs</span>
		            </div>
		            <div class="buffs-div inner-content">
		                <c:forTokens var="buff" items="${player.buffs}" delims=", " >
		                    <img src="data:image/png;base64,<imgTag:imgTag imgAddress="images/buff/${buff}.png"></imgTag:imgTag>" alt="" class="img-rounded" />
		                </c:forTokens>
		            </div>
		            
		            <!-- 物品栏循环 -->
		            <div class="inner-content">
		                <span class="label label-success">背包栏</span>
		            </div>
		            <div class="items-div inner-content">
		               
		               <c:forTokens var="itemWithCount" items="${player.inventory}" delims="," >
		                    
		                    <div class="item-pic" >
		                        <!-- 循环显示每个物品和他们自己胶囊 -->
		                        <img src="data:image/png;base64,<imgTag:imgTag imgAddress="images/item/${fn:substringBefore(fn:replace(fn:trim(itemWithCount),' ','_'),':')}.png"></imgTag:imgTag>" alt="" class="img-rounded ">
		                        <c:if test="${(fn:substringAfter(fn:replace(fn:trim(itemWithCount),' ','_'),':')) > 1}">
		                            <span class="badge">${fn:substringAfter(fn:replace(fn:trim(itemWithCount),' ','_'),':')}</span>		                        
		                        </c:if>
		                    </div>
		                </c:forTokens>
		            </div>
		            <!-- 装备栏循环 -->
		            <div class="inner-content">
		                <span class="label label-success">装备栏</span>
		            </div>
		            <div class="items-div inner-content">
		                <c:forTokens var="armorWithPrefix" items="${player.armor}" delims=", " >
		                    <img src="data:image/png;base64,<imgTag:imgTag imgAddress="images/item/${fn:substringBefore(armorWithPrefix,':')}.png"></imgTag:imgTag>" alt="" class="img-rounded" />
		                    
		                    
		                </c:forTokens>
		            </div>
		            <!-- 染料栏循环 -->
		            <div class="inner-content">
		                <span class="label label-success">染料栏</span>
		            </div>
		            <div class="items-div inner-content">
		               
		               <c:forTokens var="dye" items="${player.dyes}" delims="," >
		                    
		                    <div class="item-pic" >
		                        <!-- 循环显示每个物品 -->
		                        <img src="data:image/png;base64,<imgTag:imgTag imgAddress="images/item/${fn:replace(fn:trim(dye),' ','_')}.png"></imgTag:imgTag>" alt="" class="img-rounded" />
		                        
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
		<div class="panel-body">所有注册玩家</div>
		<table class="table table-hover table-condensed table-striped "
			id="userdatatable">
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

