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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		}else if (hreq.getSession().getAttribute("user") != null) {
			chain.doFilter(hreq, hresp);
			return;
		}else {
			hresp.sendRedirect(contentpath+"/login.jsp");
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
