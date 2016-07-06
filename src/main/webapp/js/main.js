

//左边栏服务器菜单点击事件
	$(function(){
		$("#leftserverlistmenu").children("li+not#addserver").each(function(){
			$(this).click().addClass("active").siblings().removeClass("active");
		});
	});
	
	//删除服务器按钮
	$(function(){
		$("#deleteserverbutton").click(function(){
			var id = $(this).val();
			if (confirm("你确定要删除这个服务器么?")) {
				$.get("server/deleteserver.action",{id:$(this).val()},function(){
					alert("删除服务器成功");
					//隐藏删除了的服务器按钮
					$("#"+id).hide();
					//禁止点击"修改和删除"已经被删除了的服务器
					$("#modifyserverbutton").attr("disabled","disabled");
					$("#deleteserverbutton").attr("disabled","disabled");
				});
			}
		});		
	});
	
	
	//没有设置当前服务器时隐藏右边菜单栏目
	$(function(){
		
		if ($("#currentServerp").attr("currentServer") != "true") {
			//alert($("#currentServerp").attr("currentServer"));
			$("#2levernav").addClass("hidden");
		}
	});
	
	
	//保存服务器之前先简单验证信息是否正确  ，，没有写好
	$(function(){
		$("#saveform").submit(function(){
			//alert($("#saveform").html());
			$.ajax({
				url:"server/validserverinfo",
				data:$("#saveform").serializeArray(),
				success:function(data){
					if (data.status == "200") {
						return true;
					}else if (data.status == "403") {
						alert("你输入的数据有错误,请检查: " + data.error);
						return false;
					}else{
						alert("你未知错误，请你去找管理员吧~ " + data.status);
						return false;
					}					
				}
			});
		});
	});
	//服务器状态检测，并弹出框
	$(function(){
		
		var errorcode = $("#serverstatus").attr("errorcode");
		
		//如果有错误而且获取到这个元素，则输出错误
		if (errorcode != 200 && errorcode != undefined && errorcode != "") {
			alert("错误信息: " + $("#serverstatus").attr("errormsg"));
		};
		
		//如果验证服务器地址,端口,帐号密码都成功的话
		if (errorcode == 200 && errorcode != undefined && errorcode != "") {
			alert("登陆成功了喵~: " + $("#serverstatus").attr("errormsg"));
		};
	});
	
	//加载完毕
	$(function() {
		NProgress.done();
	});
	
	
	//fetchChatMsg();
	function fetchChatMsg(){
		
		toastr.options.timeOut = 30000;
		$.get("home/chat.action",function(data) {
			if (data.status == "200") {
				for ( var onechat in data.mutiChat) {
					toastr.info(data.mutiChat[onechat].log + " "+data.mutiChat[onechat].time);
				};
			};
			//toastr.success("");
		});
	};
	
	var fetchmsgtimer = setInterval(fetchChatMsg,30000);
	
	
	