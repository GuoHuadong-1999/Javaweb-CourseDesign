package com.GHD.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GHD.bean.User;
import com.GHD.dao.UserDao;
import com.GHD.dao.impl.UserDaoImpl;
public class UserMessagesServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setHeader("Content-type", "text/html; charset=utf-8");
		UserDao userDao = new UserDaoImpl();
		String user = (String) request.getSession().getAttribute("user");
		User userMessages = userDao.selectUserMessages(user);
		request.getSession().setAttribute("userMessages", userMessages);
		response.sendRedirect("goods/userMessages.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
