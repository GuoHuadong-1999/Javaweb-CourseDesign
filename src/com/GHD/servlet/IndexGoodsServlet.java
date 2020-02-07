package com.GHD.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GHD.bean.Goods;
import com.GHD.bean.IndexGoods;
import com.GHD.dao.GoodsDao;
import com.GHD.dao.IndexGoodsDao;
import com.GHD.dao.impl.GoodsDaoImpl;
import com.GHD.dao.impl.IndexGoodsDaoImpl;

public class IndexGoodsServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setHeader("Content-type", "text/html; charset=utf-8");
		IndexGoodsDao indexGoodsDao = new IndexGoodsDaoImpl();
		List<IndexGoods> list = indexGoodsDao.selectIndexGoods();
		GoodsDao goodsDao = new GoodsDaoImpl();
		List<Goods> indexGoodsList = new ArrayList<Goods>();
		Goods goods = null;
		for(int i=0;i<list.size();i++) {
			goods = goodsDao.selectGoodsDetail(list.get(i).getGoodsId());
			indexGoodsList.add(goods);
		}
		request.getSession().setAttribute("indexGoodsListSize",indexGoodsList.size());
		request.getSession().setAttribute("indexGoodsList",indexGoodsList);
		response.sendRedirect("goods/index.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
