package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import entity.User;

@Controller
public class UserController {

	private ApiServlet apiServet;
	
	
	@RequestMapping("/login")
	public ModelAndView login(User user,HttpServletResponse res,HttpSession session,ModelAndView mo) throws IOException{
		
		apiServet = new ApiServlet();
		String json =apiServet.v2TokenCreate(user);
		JSONObject jsonObject = new JSONObject(json);
		String tmp = jsonObject.getString("status");
		if ("200".equals(tmp)) {
			
			String msg = "登陆成功, token是:" +jsonObject.getString("token");
			session.setAttribute("token", jsonObject.getString("token"));
			mo.addObject("token", jsonObject.getString("token"));
			mo.addObject("msg", msg);
			
			mo.setViewName("main");
			return mo;
		} else {
			String msg = "登陆失败,请检查用户名密码.";
			mo.addObject("msg", msg);	
			mo.setViewName("login");
			return mo;
		}
	}
	
	
	
	public String register() {
		return null;
	}
	
}
