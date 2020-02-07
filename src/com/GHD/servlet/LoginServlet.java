package com.GHD.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GHD.dao.UserDao;
import com.GHD.dao.impl.UserDaoImpl;

public class LoginServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setHeader("Content-type", "text/html; charset=utf-8");
		String user = req.getParameter("user");
		String password = req.getParameter("password");
		UserDao userDao = new UserDaoImpl();
		boolean flag = userDao.login(user, password);
		resp.getWriter().print(flag);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
