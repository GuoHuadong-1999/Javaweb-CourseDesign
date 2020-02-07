package com.GHD.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GHD.bean.Goods;
import com.GHD.dao.GoodsDao;
import com.GHD.dao.impl.GoodsDaoImpl;

public class SelectGoodsServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setHeader("Content-type", "text/html; charset=utf-8");
		String information = request.getParameter("search");
		System.out.println(information);
		GoodsDao goodsDao = new GoodsDaoImpl();
		List<Goods> list = goodsDao.selectGoods(information);
		request.getSession().setAttribute("size", list.size());
		request.getSession().setAttribute("goodsList", list);
		response.sendRedirect("goods/shopping.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
