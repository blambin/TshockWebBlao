 
	//用户管理的分页功能 
	$(function(){
		
		//分页总方法
		function paginationmethod() {
			
			//去头去尾,操作的中间按钮
			var pageBuntton = $("#usermanagernav").children().children().not(":first").not(":last");
			//操作上一页码和下一页按钮
			var previousandnextbutton = $("#usermanagernav").find("ul li:first,ul li:last");
			
            previousandnextbutton.each(function() {
				
            	var maxPage = parseInt($("#usermanagernav").children().attr("pagetotal"));
				var pagenumber = parseInt($(this).find("a").attr("pageindex"));
				var buttontype = $(this).find("a").attr("id");
				if (buttontype == "previous") {
					//避免页码越界
					if ((pagenumber - 1)< 1) {
						$(this).addClass("disabled");
					}else {
						$(this).click(function() {
							
							var key = $("#searchtext").val();
							getUserData((pagenumber - 1),key);
						});
					}
					
				}else {
					//避免页码越界
					if (pagenumber >= maxPage) {
						$(this).addClass("disabled");
					}else {
						$(this).click(function() {
							var key = $("#searchtext").val();
							getUserData((pagenumber + 1),key);
						});
					}
				}
			});
			
			pageBuntton.each(function() {
				
				var pagenumber = $(this).find("a").html(); 
				var maxPage = parseInt($("#usermanagernav").children().attr("pagetotal"));
				
				//找出所有符合条件的给添加点击事件, 不符合条件的隐藏起来
				if (pagenumber > 0 && pagenumber < (maxPage+1)) {
					$(this).bind("click",function(){
						
						var key = $("#searchtext").val();
						getUserData(pagenumber,key);
					});
				}else {
					$(this).remove();
				}
			});
			
			
			
		};
		
		//分页请求数据
		function getUserData(pagenumber,key) {
			
			NProgress.configure({ minimum: 0.1 });
			NProgress.start(); //进度条开始
			$.get("home/showuserlist.action",{index:pagenumber,key:key},function(data){
				
				// 替换数据
				$("#userdatatable").empty();
				$("#userdatatable").append("<tr><th>ID</th><th>用户名</th><th>用户组</th><th>修改</th><th>删除</th></tr>");
				//console.log(data.users[0].id);
				$.each(data.users,function(i,user){
					$("#userdatatable").append('<tr><th>'+user.id+'</th><td>'+user.name+'</td><td>'+user.group+'</td><td><button class="btn btn-default modifyuser"  userid="'+user.name+'" usergroup="'+user.group+'"  data-toggle="modal" data-target="#modifyuserModal" >修改</button></td><td><button class="btn btn-default deleteuser" data-toggle="modal" data-target=".deleteuser-confirm-modal" userid="'+user.name+'"  >删除</button></td></tr>');	
				});
					
				//修改分页按钮文本
				$("#usermanagernav").children().empty();
				$("#usermanagernav").children().append('<li><a aria-label="Previous" id="previous" pageindex="'+data.pageinfo.index+'" > <span aria-hidden="true">&laquo;</span></a></li>');
				$("#usermanagernav").children().append('<li><a>'+(data.pageinfo.index - 2) +'</a></li>');
				$("#usermanagernav").children().append('<li><a>'+(data.pageinfo.index - 1) +'</a></li>');
				$("#usermanagernav").children().append('<li  class="active" ><a>'+data.pageinfo.index+'</a></li>');
				$("#usermanagernav").children().append('<li><a>'+(data.pageinfo.index + 1) +'</a></li>');
				$("#usermanagernav").children().append('<li><a>'+(data.pageinfo.index + 2)+'</a></li>');
				$("#usermanagernav").children().append('<li><a  aria-label="Next" id="next"  pageindex="'+data.pageinfo.index+'" > <span aria-hidden="true">&raquo;</span> </a></li>');
				
				//获取完数据加载分页
				paginationmethod();
				
				NProgress.done(); //进度条结束
				
				//获取完数据后设定删除/修改按钮的点击方法
				setEventForDeleteButton();
				setEventForModifyButton();
			});
		}
		
		//初次加载一次分页方法
		paginationmethod();
		//初次加载一次设定删除/修改按钮的点击方法
		setEventForDeleteButton();
		setEventForModifyButton();
		
        //搜索按钮的点击事件
		
		$("#searchbutton").click(function() {
			var key = $("#searchtext").val();
			getUserData(1,key);
		});
		
		//搜索按钮键盘事件
		$(window).keydown(function(event){
			
			
			//命令行发送按钮的键盘事件,焦点在文本框里 并且 按了回车
			if ($("#searchtext").is($(":focus")) && event.keyCode == 13) {
				//alert("被抓到了");
				$("#searchbutton").click();
				
			};
		});
		
		/***
		 * //删除按钮和设定的模组框里的值
		 */
		function setEventForDeleteButton() {
			
			$(".deleteuser").each(function() {
				
				$(this).click(function() {
					$(".deleteusermodalbutton").attr("userid",$(this).attr("userid"));
				});
				
			});
			
			//删除之前的绑定事件再添加新的事件
			$(".deleteusermodalbutton").unbind("click").click(function() {
				
				$.get("home/deleteuser.action",{user:$(this).attr("userid")},function(data){
					if (data.status == "200") {
						toastr.success('删除成功');
						$(".deleteuser-confirm-modal").modal('toggle');
					}else {
						toastr.warning('删除失败 .错误原因:' + data.msg);
						$(".deleteuser-confirm-modal").modal('toggle');
					}
				});
			});
		};
		
		/***
		 * //修改按钮和设定的模组框里的值
		 */
		function setEventForModifyButton() {
			$(".modifyuser").each(function() {
				$(this).click(function() {
					$("#modifyuserinputusername").val($(this).attr("userid"));
					$("#modifyuserinputgroup").val($(this).attr("usergroup"));
					
				})
			});
			
			$("#modifyuserformsubmitbutton").unbind("click").click(function() {
				$.get("home/updateuser.action",$("#modifyuserform").serializeArray(),function(data) {
					//alert(data);
					if (data.status == "200") {
						toastr.success('修改成功');
						$("#modifyuserModal").modal('toggle');
						
						console.log(data.groupresponse);
						console.log(data.passwordresponse);
						if (data.groupresponse !=undefined) {
							toastr.success(data.groupresponse);
						}
						if (data.passwordresponse !=undefined) {
							toastr.success(data.passwordresponse);
						}
					}else {
						toastr.warning('修改失败,请检查你的输入 .错误原因:' + data.msg);
					}
				});
			})
			
		};
	});
	
	//在线用户标签页点击功能 
	$(function() {
		var Tab = $("#onlineuserdiv ul");
		Tab.find('li a').click(function (e) {
			  e.preventDefault()
			  $(this).tab('show')
			});
	});
	
	//提交添加用户的表单
	$(function() {
		
		$("#adduserformsubmitbutton").click(function() {
			
			//alert($("#adduserform").serialize());
			$.get("home/createuser.action",$("#adduserform").serializeArray(),function(data) {
				//alert(data);
				if (data.status == "200") {
					toastr.success('添加成功');
					$("#adduserModal").modal('toggle');
				}else {
					toastr.warning('添加失败,请检查你的输入 .错误原因:' + data.msg);
				}
			});
		});
	});
	
	
	$(function(){
		
		
	});