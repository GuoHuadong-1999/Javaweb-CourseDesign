package com.GHD.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GHD.bean.Goods;
import com.GHD.dao.GoodsCartDao;
import com.GHD.dao.impl.GoodsCartDaoImpl;

public class InsertGoodsCartServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setHeader("Content-type", "text/html; charset=utf-8");
		Goods goods = (Goods) request.getSession().getAttribute("goods");
		String consumeUser = (String) request.getSession().getAttribute("user");
		String publishUser = goods.getUser();
		String goodsImgName = goods.getGoodsImgName();
		String goodsCount = "1";
		GoodsCartDao goodsCartDao = new GoodsCartDaoImpl();
		goodsCartDao.insertGoodsCart(consumeUser, publishUser, goodsImgName, goodsCount);
		response.getWriter().write("该商品已加入购物车！");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
