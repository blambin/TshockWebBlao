
$(function() {
	
	/***
	 * 加载日志条目
	 */
	function loadlogs(count) {
		
		$.get("home/getLog.action",{count:count},function(data) {
			if (data.status == "200") {
				toastr.success('日志载入成功.~');
				$("#logsbox ul").empty();
				for ( var log in data.log) {
					
					
					var logbody = data.log[log];
					
					if (logbody.indexOf("Utils: INFO") !=-1) {
						$("#logsbox ul").append('<li class="list-group-item list-group-item-success">'+log+'.  '+data.log[log]+'</li>');
					}else if (logbody.indexOf("TShock: INFO") !=-1) {
						$("#logsbox ul").append('<li class="list-group-item list-group-item-warning">'+log+'.  '+data.log[log]+'</li>');
					}else{
						$("#logsbox ul").append('<li class="list-group-item">'+log+'.  '+data.log[log]+'</li>');
					}
				};
				
				$(".filepath ul li").html(data.file);
			}else {
				toastr.error("加载错误");
				toastr.error(data.status +"  " + data.msg);
				$("#logsbox ul").append('<span class="label label-warning chat-content">显示功能需要Tshock安装 ExtraRestAdmin插件 .是否没有安装?<a href="https://github.com/Zaicon/ExtraRestAdmin">下载地址 </a></span>');
			};
		});
	};
	
	/***
	 * 日记数量下拉菜单事件
	 */
	$(".countdropdownmenu").children("li").each(function() {
		$(this).click(function() {
			
			var count = $(this).find("a").html();
			//alert(count);
			loadlogs(count);
		});
	});
	
	/***
	 * 数量输入文本框事件
	 */
	$("#countinput").focusout(function() {
		var count = $("#countinput").val();
		loadlogs(count);
	});
});

