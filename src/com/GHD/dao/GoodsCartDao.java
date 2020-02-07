package com.GHD.dao;

import java.util.List;

import com.GHD.bean.GoodsCart;

public interface GoodsCartDao {
	public void insertGoodsCart(String consumeUser,String publishUser,String goodsName,String goodsCount);
	public List<GoodsCart> selectGoodsCart(String user);
	public void deleteGoodsCart(String goodsImgName);
}
