package com.GHD.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GHD.dao.AuthorityDao;
import com.GHD.dao.UserDao;
import com.GHD.dao.impl.AuthorityDaoImpl;
import com.GHD.dao.impl.UserDaoImpl;

public class RegisterServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Ω¯»ÎRegisterServlet¡À");
		req.setCharacterEncoding("utf-8");
		resp.setHeader("Content-type", "text/html; charset=utf-8");
		String user = req.getParameter("user");
		String password = req.getParameter("password");
		String mailbox = (String) req.getSession().getAttribute("mailbox");
		UserDao userDao = new UserDaoImpl();
		userDao.register(user,password,mailbox);
		AuthorityDao authorityDao = new AuthorityDaoImpl();
		authorityDao.insertAuthority(user);
		resp.sendRedirect("goods/register03.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
