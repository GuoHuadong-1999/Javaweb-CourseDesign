package com.GHD.dao;

import java.util.List;

import com.GHD.bean.Goods;

public interface GoodsDao {
	public void insertGoods(String goodsName,String goodsPrice,String goodsClass,String goodsImgName,
			String publishAddress,String goodsDescribe,String user);
	public List<Goods> selectGoods(String information);
	public Goods selectGoodsDetail(String id);
	public Goods selectRelateGoods(String goodsImgName);
	public List<Goods> selectAllGoods();
	public void deleteGoods(String goodsImgName);
}
