package com.GHD.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GHD.dao.IndexGoodsDao;
import com.GHD.dao.impl.IndexGoodsDaoImpl;

public class PublishGoodsToIndexServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setHeader("Content-type", "text/html; charset=utf-8");
		String[] listString = request.getParameterValues("list");
		String[] list = listString[0].split(",");
		IndexGoodsDao indexGoodsDao = new IndexGoodsDaoImpl();
		for(int i=0;i<list.length;i++) {
			System.out.println(list[i]);
			indexGoodsDao.insertIndexGoods(list[i]);
		}
		response.getWriter().print("商品已发布到了首页!");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
