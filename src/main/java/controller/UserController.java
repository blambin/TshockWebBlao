package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import common.MD5Util;
import entity.User;
import service.IServerService;
import service.IUserService;

@Controller
public class UserController {

	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IServerService serverService;
	
	@RequestMapping("/register")
	public ModelAndView register(User user,ModelAndView mv) {
		
		//如果没有重复名字，才能注册
		if (userService.queryUserNameCount(user) == 0) {
			
			user.setPassword(MD5Util.Md5(user.getPassword()));
			userService.register(user);
			mv.addObject("msg", "注册成功!");
		}else {
			mv.addObject("msg", "用户名已经存在!!");
		}
		mv.setViewName("login");
		return mv;
	}
	
	@RequestMapping("/login")
	public String login(User user,HttpSession session){
		
		user.setPassword(MD5Util.Md5(user.getPassword()));
		User u = userService.login(user);
		//如果能查询出数据,说明成功登陆
				if (u!=null) {
					session.setAttribute("user", u);
					session.setMaxInactiveInterval(3600);
					
					//登陆成功并展示用户服务器
					session.setAttribute("servers", serverService.queryServerByUser(u)); 
					
					return "main";
				} else {
					return "login";
				}
	}
}
