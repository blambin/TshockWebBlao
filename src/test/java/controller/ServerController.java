package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//@Controller
//public class ServerController {
//
//	@RequestMapping("/broadcast")
//	public String broadcast(HttpSession session, String msg, HttpServletResponse res) throws IOException {
//		ApiServlet apiServet = new ApiServlet();
//		String json = apiServet.v2ServerBroadcast(session, msg);
//
//		res.setContentType("text/html;charset=UTF-8");
//		PrintWriter out = res.getWriter();
//		out.write(json);
//		out.flush();
//		out.close();
//		return null;
//	}

