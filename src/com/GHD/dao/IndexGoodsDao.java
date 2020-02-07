package com.GHD.dao;

import java.util.List;

import com.GHD.bean.IndexGoods;

public interface IndexGoodsDao {
	public void insertIndexGoods(String goodsId);
	public List<IndexGoods> selectIndexGoods();
	public void deleteIndexGoods(String goodsId);
}
