package com.GHD.bean;

public class GoodsCart {
	private String consumeUser = null;
	private String publishUser = null;
	private String goodsName = null;
	private String goodsCount = null;
	public String getConsumeUser() {
		return consumeUser;
	}
	public void setConsumeUser(String consumeUser) {
		this.consumeUser = consumeUser;
	}
	public String getPublishUser() {
		return publishUser;
	}
	public void setPublishUser(String publishUser) {
		this.publishUser = publishUser;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsCount() {
		return goodsCount;
	}
	public void setGoodsCount(String goodsCount) {
		this.goodsCount = goodsCount;
	}
	@Override
	public String toString() {
		return "GoodsCart [consumeUser=" + consumeUser + ", publishUser=" + publishUser + ", goodsName=" + goodsName
				+ ", goodsCount=" + goodsCount + "]";
	} 
	
}
