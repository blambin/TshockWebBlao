<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tsweb"%>
<script type="text/javascript" src="js/browerlogs.js"></script>

<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">浏览Tshock日志</h3>
	</div>
	<div class="panel-body">
		<div class="col-lg-4">
			<div class="input-group">
				<input type="text" class="form-control" aria-label="..."
					placeholder="请输入要获取的日志条数" id="countinput">
				<div class="input-group-btn">
					<button type="button" class="btn btn-default dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						条目数<span class="caret"></span>
					</button>
					<ul class="dropdown-menu dropdown-menu-right countdropdownmenu">
						<li><a>50</a></li>
						<li><a>100</a></li>
						<li><a>150</a></li>
						<li><a>250</a></li>
					</ul>
				</div>
			</div>
<!-- 			<button id="getlogbutton" class="btn btn-default">加载</button> -->
		</div>
		<div class="col-lg-8 filepath">
			<ul class="list-group">
				<li class="list-group-item list-group-item-info"></li>
			</ul>
		</div>
		
		<div class="col-lg-12" id="logsbox">
			<ul class="list-group">
				<li class="list-group-item">日记会显示在这里喵~</li>
			</ul>
		</div>
	</div>
</div>