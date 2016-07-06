package org.blambin.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.blambin.entity.User;


public class loginFilter implements Filter {


	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse respone, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest hreq = (HttpServletRequest) request;
		HttpServletResponse hresp = (HttpServletResponse) respone;
		
		String requesturi = hreq.getRequestURI().toLowerCase();
		String contentpath = hreq.getContextPath();
		
		String uri = requesturi.substring(contentpath.length());
		List<String> subffix = new ArrayList<String>();
		subffix.add("jpg");
		subffix.add("js");
		subffix.add("png");
		subffix.add("gif");
		subffix.add("css");
		subffix.add("jpg");
		
		//最先让资源文件通过
		for (String string : subffix) {
			if (uri.endsWith("."+string)) {
				chain.doFilter(hreq, hresp);
				return;
			}
		}
		
		//判断是不是登陆页面 、是不是登陆了
		if ("/login.jsp".equals(uri) || "/login.action".equals(uri)) {
			chain.doFilter(hreq, hresp);
			return;
		}else if ("/register.action".equals(uri)){
			chain.doFilter(hreq, hresp);
			return;
		}else if ((hreq.getSession().getAttribute("user")) != null) {
			chain.doFilter(hreq, hresp);
			return;
		}else if ("checkCookie.action".equals(uri)) { //如果是检查cookie的，放行
			chain.doFilter(hreq, hresp);
			return;
		}else if (hreq.getCookies() != null) {
			
			
			
			//获取"user"这个cookie
			String user = null;
			//获取"usertoken"这个cookie
			String webToken = null;
			
			
			//判断Cookie
			Cookie[] cookies = hreq.getCookies();
			if (cookies != null) {
				for (Cookie cookieobject : cookies) {
					
					//如果有user字段则赋值
					if ("user".equals(cookieobject.getName())) {
						
						user = cookieobject.getValue();
						//延时
						//cookieobject.setMaxAge(60*60*24*30);
						//hresp.addCookie(cookieobject);
					}
					
					//如果有token字段则赋值
					if ("token".equals(cookieobject.getName())) {
						webToken = cookieobject.getValue();
					}
				}
				
				//再去数据库判断Cookie对不对
				if (user != null && webToken != null) {
					
//					 userService = new UserService();
//					 serverService = new ServerSevice();
					hreq.setAttribute("user", user);
					hreq.setAttribute("webtoken", webToken);
					hreq.getRequestDispatcher("/checkCookie.action").forward(hreq, hresp);
					//hresp.sendRedirect(contentpath+"/checkCookie.action");
				}
			}
			
		}else {
			hresp.sendRedirect(contentpath+"/login.jsp");
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
