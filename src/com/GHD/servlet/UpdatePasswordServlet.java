package com.GHD.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GHD.bean.User;
import com.GHD.dao.UserDao;
import com.GHD.dao.impl.UserDaoImpl;

public class UpdatePasswordServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setHeader("Content-type", "text/html; charset=utf-8");
		String password = request.getParameter("password");
		String user = ((User) request.getSession().getAttribute("userMessages")).getUser();
		UserDao userDao = new UserDaoImpl();
		userDao.updatePassword(user, password);
		response.sendRedirect("goods/renovatePassword03.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
