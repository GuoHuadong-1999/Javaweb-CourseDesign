package com.GHD.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GHD.bean.Goods;
import com.GHD.bean.User;
import com.GHD.dao.GoodsDao;
import com.GHD.dao.UserDao;
import com.GHD.dao.impl.GoodsDaoImpl;
import com.GHD.dao.impl.UserDaoImpl;

public class SwitchGoodsDetailServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setHeader("Content-type", "text/html; charset=utf-8");
		String id = request.getParameter("id");
		GoodsDao goodsDao = new GoodsDaoImpl();
		Goods goods = goodsDao.selectGoodsDetail(id);
		request.getSession().setAttribute("goods", goods);
		response.sendRedirect("goods/goodsDetail.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
