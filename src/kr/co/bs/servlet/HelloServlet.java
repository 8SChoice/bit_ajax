package kr.co.bs.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{
	//servlet 생명주기 : init(1회실행) service(실행될때마다 실행. 제일 중요) destroy(서버 종료or재실행)
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//System.out.println("service().....");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println("<h1>안녕하세요Ajax!!!</h1>");
		out.close();
	}
}
