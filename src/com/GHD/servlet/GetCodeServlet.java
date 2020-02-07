package com.GHD.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GHD.util.GenerateCode;
import com.GHD.util.SendEmailUtil;

public class GetCodeServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setHeader("Content-type", "text/html; charset=utf-8");
		String to = req.getParameter("mailbox");
		String code = GenerateCode.getCode();
		try {
			SendEmailUtil.sendEmail(to, code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		req.getSession().setAttribute(to, code);
		resp.getWriter().write("验证码已经成功发送到了您的邮箱");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
