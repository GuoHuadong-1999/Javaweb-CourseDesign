package com.GHD.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GHD.bean.User;
import com.GHD.dao.AuthorityDao;
import com.GHD.dao.UserDao;
import com.GHD.dao.impl.AuthorityDaoImpl;
import com.GHD.dao.impl.UserDaoImpl;

public class SwitchIndexServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setHeader("Content-type", "text/html; charset=utf-8");
		String user = req.getParameter("user");
		AuthorityDao authorityDao = new AuthorityDaoImpl();
		UserDao userDao = new UserDaoImpl();
		User userMessages = userDao.selectUserMessages(user);
		req.getSession().setAttribute("userMessages", userMessages);
		String authority = authorityDao.selectAuthority(user).getAuthority();
		req.getSession().setAttribute("authority", authority);
		req.getSession().setAttribute("user", user);
		req.getSession().setAttribute("status", "login");
		resp.sendRedirect("IndexGoodsServlet");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
