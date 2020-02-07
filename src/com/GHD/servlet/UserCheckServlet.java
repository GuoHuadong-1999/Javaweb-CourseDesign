package com.GHD.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GHD.dao.UserDao;
import com.GHD.dao.impl.UserDaoImpl;

public class UserCheckServlet extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setHeader("Content-type", "text/html; charset=utf-8");
		System.out.println("Ω¯»ÎUserCheckServlet¡À");
		String user = req.getParameter("user");
		System.out.println(user);
		UserDao userDao = new UserDaoImpl();
		boolean flag = userDao.userCheck(user);
		System.out.println(flag);
		resp.getWriter().print(flag);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
