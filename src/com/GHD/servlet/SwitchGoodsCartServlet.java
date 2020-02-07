package com.GHD.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GHD.bean.Goods;
import com.GHD.bean.GoodsCart;
import com.GHD.dao.GoodsCartDao;
import com.GHD.dao.GoodsDao;
import com.GHD.dao.impl.GoodsCartDaoImpl;
import com.GHD.dao.impl.GoodsDaoImpl;

public class SwitchGoodsCartServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setHeader("Content-type", "text/html; charset=utf-8");
		String user = (String) request.getSession().getAttribute("user");
		GoodsCartDao goodsCartDao = new GoodsCartDaoImpl();
		GoodsDao goodsDao = new GoodsDaoImpl();
		List<GoodsCart> goodsCartList = goodsCartDao.selectGoodsCart(user);
		List<Goods> relateGoodsList = new ArrayList<Goods>();
//		request.getSession().setAttribute("goodsCartList", list);
		for(int i = 0 ; i < goodsCartList.size() ; i++) {
			  System.out.println(goodsCartList.get(i));
			  Goods goods = goodsDao.selectRelateGoods(goodsCartList.get(i).getGoodsName());
			  relateGoodsList.add(goods);
			}
		request.getSession().setAttribute("relateGoodsList", relateGoodsList);
		request.getSession().setAttribute("relateGoodsListSize", relateGoodsList.size());
		response.sendRedirect("goods/goodsCart.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
