package com.GHD.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GHD.bean.User;
import com.GHD.dao.UserDao;
import com.GHD.dao.impl.UserDaoImpl;

public class RenovatePasswordServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setHeader("Content-type", "text/html; charset=utf-8");
		String mailbox = request.getParameter("mailbox");
		UserDao userDao = new UserDaoImpl();
		User userMessages = userDao.selectUserMessagesByMailBox(mailbox);
		request.getSession().setAttribute("userMessages", userMessages);
		response.sendRedirect("goods/renovatePassword02.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
