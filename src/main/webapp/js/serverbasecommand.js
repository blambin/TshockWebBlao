

//发送广播
	$(function() {
		$("#broadcastsendbtn").click(function() {
			$.ajax({
				url:"home/broadcast.action",
				data:"msg="+$('#broadcast').val(),
				success:function(data) {
					alert(data.status + " 发送成功~");
					$('#broadcast').val("");
				},
				error:function (XMLHttpRequest, textStatus) {
					alert(textStatus+" , 发送失败." +"我也不知道为什么出错了..");
					$('#broadcast').val("");
				}
			    
			});
		})
	});
	
	
	//***
	//*命令行按钮发送信息事件
	
	$(function(){
		$("#chatboxmsgbutton").click(function(){
			var inputValue = $("#chatboxmsginputbox").val();
			$("#chatboxmsg").append('<pre class="bg-success blockquote-reverse">'+inputValue+'</pre>');
			
			$.get("home/rawcmd.action",{cmd:inputValue},function(data){
				$("#chatboxmsg").append('<pre class="bg-info">'+data.response+'</pre>');
				//滚到最底
				$("#chatboxmsg").scrollTop(100000);
			});
			//滚到最底
			$("#chatboxmsg").scrollTop(100000);
			//清空输入框
			$("#chatboxmsginputbox").val("");
		});
	});
	
	
	
	//键盘事件
	$(window).keydown(function(event){
		//命令行发送按钮的键盘事件,焦点在文本框里 并且 按了回车
		if ($("#chatboxmsginputbox").is($(":focus")) && event.keyCode == 13) {
			//alert("被抓到了");
			$("#chatboxmsgbutton").click();
		};
		// 广播发送按钮的键盘事件,焦点在文本框里 并且 按了回车
		if ($("#broadcast").is($(":focus")) && event.keyCode == 13) {
			
			$("#broadcastsendbtn").click();
		};
	});
	
	//命令行清屏功能
	$(function() {
		$("#chatboxmsgbuttonclear").click(function(){
			//alert("aa");
			$("#chatboxmsg").empty();
		});
	});