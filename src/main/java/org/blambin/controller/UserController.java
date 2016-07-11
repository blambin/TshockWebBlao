package org.blambin.controller;

import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.blambin.common.MD5Util;
import org.blambin.common.configbeans.ConfigInfo;
import org.blambin.entity.User;
import org.blambin.service.IServerService;
import org.blambin.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IServerService serverService;
	
	@Autowired
	private ConfigInfo config;
	
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
	public String login(User user,HttpSession session,HttpServletRequest request,HttpServletResponse response){
		
		user.setPassword(MD5Util.Md5(user.getPassword()));
		User u = userService.login(user);
		
		
		
		
		//如果能查询出数据,说明成功登陆
				if (u!=null) {
					session.setAttribute("user", u);
					session.setMaxInactiveInterval(3600);
					
					
					//设置token
					u.setUserCookieString(MD5Util.Md5(u.getUserName()+"userCookieString"));
					u.setUserToken(MD5Util.Md5(UUID.randomUUID()+config.getWebTokenSalt()));
					
					userService.updateUser(u);
					
					//设置"user"这个cookie
					Cookie usernameCookie = new Cookie("user",u.getUserCookieString());
					usernameCookie.setPath("/");
					usernameCookie.setMaxAge(60*60*24*30);
					response.addCookie(usernameCookie);
					
					//设置"webtoken"这个cookie
					
					Cookie webTokenCookie = new Cookie("token", u.getUserToken());
					webTokenCookie.setPath("/");
					webTokenCookie.setMaxAge(60*60*24*30);
					response.addCookie(webTokenCookie);
					
					
					
					
					//登陆成功并展示用户服务器
					session.setAttribute("servers", serverService.queryServerByUser(u)); 
					
					return "main";
				} else {
					
					request.setAttribute("loginmsg", "用户名或密码错误了喵~");
					return "login";
				}
	}

	
	/***
	 * 检查 Cookie的值
	 * @author blambin
	 * @since 2016年7月7日
	 * @category TODO:
	 * @throws 
	 * @param session
	 * @param request
	 * @param response
	 * @return
	 * String
	 */
	@RequestMapping("checkCookie")
	public String checkCookie(HttpSession session,HttpServletRequest request,HttpServletResponse response){
		
		String user = (String) request.getAttribute("user");
		String webToken = (String) request.getAttribute("webtoken");
		
		User u = new User();
		u.setUserCookieString(user);
		u.setUserToken(webToken);
		
		User returnUser = userService.checkToken(u);
		if (returnUser != null) {
			
			request.getSession().setAttribute("user", returnUser);
			//登陆成功并展示用户服务器
			session.setAttribute("servers", serverService.queryServerByUser(returnUser)); 
			return "main";
		}
		return "login";
		
	}
}
