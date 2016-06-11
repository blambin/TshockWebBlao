package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import entity.User;
import service.IUserService;

@Controller
public class UserController {

	
	//private ApiServlet apiServet;
	
	
//	@RequestMapping("/login")
//	public ModelAndView login(User user,HttpServletResponse res,HttpSession session,ModelAndView mo) throws IOException{
//		
//		apiServet = new ApiServlet();
//		String json =apiServet.v2TokenCreate(user);
//		JSONObject jsonObject = new JSONObject(json);
//		String tmp = jsonObject.getString("status");
//		if ("200".equals(tmp)) {
//			String msg = "登陆成功, token是:" +jsonObject.getString("token");
//			session.setAttribute("token", jsonObject.getString("token"));
//			mo.addObject("token", jsonObject.getString("token"));
//			mo.addObject("msg", msg);
//			
//			mo.setViewName("main");
//			return mo;
//		} else {
//			String msg = "登陆失败,请检查用户名密码.";
//			mo.addObject("msg", msg);	
//			mo.setViewName("login");
//			return mo;
//		}
//	}
	
	@Autowired
	private IUserService userService;
	
	@RequestMapping("/register")
	public ModelAndView register(User user,ModelAndView mv) {
		
		//如果没有重复名字，才能注册
		if (userService.queryUserNameCount(user) == 0) {
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
		
		User u = userService.login(user);
		//如果能查询出数据,说明成功登陆
				if (u!=null) {
					session.setAttribute("user", u);
					session.setMaxInactiveInterval(3600);
					return "main";
				} else {
					return "login";
				}
	}
}
