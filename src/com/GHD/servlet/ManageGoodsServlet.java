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

public class ManageGoodsServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setHeader("Content-type", "text/html ;charset=utf-8");
		GoodsDao goodsDao = new GoodsDaoImpl();
		List<Goods> list = goodsDao.selectAllGoods();
		request.getSession().setAttribute("allGoods", list);
		request.getSession().setAttribute("allGoodsSize", list.size());
		response.sendRedirect("goods/manageGoods.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
