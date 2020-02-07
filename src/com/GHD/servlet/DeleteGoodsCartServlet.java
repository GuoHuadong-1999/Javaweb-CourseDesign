package com.GHD.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GHD.dao.GoodsCartDao;
import com.GHD.dao.impl.GoodsCartDaoImpl;

public class DeleteGoodsCartServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setHeader("Content-type", "text/html; charset=utf-8");
		String goodsImgName = request.getParameter("goodsImgName");
		GoodsCartDao goodsCartDao = new GoodsCartDaoImpl();
		goodsCartDao.deleteGoodsCart(goodsImgName);
		response.sendRedirect("SwitchGoodsCartServlet");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
