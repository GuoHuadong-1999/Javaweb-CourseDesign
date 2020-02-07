package com.GHD.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GHD.dao.GoodsCartDao;
import com.GHD.dao.GoodsDao;
import com.GHD.dao.IndexGoodsDao;
import com.GHD.dao.impl.GoodsCartDaoImpl;
import com.GHD.dao.impl.GoodsDaoImpl;
import com.GHD.dao.impl.IndexGoodsDaoImpl;

public class DeleteGoodsServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setHeader("Content-type", "text/html; charset=utf-8");
		String goodsImgName = request.getParameter("goodsImgName");
		System.out.println(goodsImgName);
		GoodsDao goodsDao = new GoodsDaoImpl();
		goodsDao.deleteGoods(goodsImgName);
		GoodsCartDao goodsCartDao = new GoodsCartDaoImpl();
		goodsCartDao.deleteGoodsCart(goodsImgName);
		String goodsId = request.getParameter("goodsId");
		IndexGoodsDao indexGoodsDao = new IndexGoodsDaoImpl();
		indexGoodsDao.deleteIndexGoods(goodsId);
		response.sendRedirect("ManageGoodsServlet");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
