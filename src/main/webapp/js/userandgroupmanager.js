 
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
							getUserData((pagenumber - 1));
						});
					}
					
				}else {
					//避免页码越界
					if (pagenumber >= maxPage) {
						$(this).addClass("disabled");
					}else {
						$(this).click(function() {
							getUserData((pagenumber + 1));
						});
					}
				}
			});
			
			pageBuntton.each(function() {
				
				var pagenumber = $(this).find("a").html();
				var maxPage = parseInt($("#usermanagernav").children().attr("pagetotal"));
				var key = key;
				//找出所有符合条件的给添加点击事件, 不符合条件的隐藏起来
				if (pagenumber > 0 && pagenumber < (maxPage+1)) {
					$(this).bind("click",function(){
						getUserData(pagenumber,key);
					});
				}else {
					$(this).remove();
				}
			});
			
			
			
		};
		
		//分页请求数据
		function getUserData(pagenumber,key) {
			$.get("home/showuserlist.action",{index:pagenumber,key:key},function(data){
				
				// 替换数据
				$("#userdatatable").empty();
				$("#userdatatable").append("<tr><th>ID</th><th>用户名</th><th>用户组</th></tr>");
				//console.log(data.users[0].id);
				$.each(data.users,function(i,user){
					$("#userdatatable").append('<tr><th>'+user.id+'</th><td>'+user.name+'</td><td>'+user.group+'</td></tr>');	
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
				
				paginationmethod();
			});
		}
		
		//初次加载一次分页方法
		paginationmethod();
		
		
	});
	
	//在线用户标签页点击功能 
	$(function() {
		var Tab = $("#onlineuserdiv ul");
		Tab.find('li a').click(function (e) {
			  e.preventDefault()
			  $(this).tab('show')
			});
	});
	
	