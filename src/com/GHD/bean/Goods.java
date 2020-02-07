package com.GHD.bean;

public class Goods {
	private String id = null;
	private String goodsName = null;
	private String goodsPrice = null;
	private String goodsDescribe = null;
	private String publishAddress = null;
	private String goodsClass = null;
	private String goodsImgName = null;
	private String user = null;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(String goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public String getGoodsDescribe() {
		return goodsDescribe;
	}
	public void setGoodsDescribe(String goodsDescribe) {
		this.goodsDescribe = goodsDescribe;
	}
	public String getPublishAddress() {
		return publishAddress;
	}
	public void setPublishAddress(String publishAddress) {
		this.publishAddress = publishAddress;
	}
	public String getGoodsClass() {
		return goodsClass;
	}
	public void setGoodsClass(String goodsClass) {
		this.goodsClass = goodsClass;
	}
	public String getGoodsImgName() {
		return goodsImgName;
	}
	public void setGoodsImgName(String goodsImgName) {
		this.goodsImgName = goodsImgName;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Goods [id=" + id + ", goodsName=" + goodsName + ", goodsPrice=" + goodsPrice + ", goodsDescribe="
				+ goodsDescribe + ", publishAddress=" + publishAddress + ", goodsClass=" + goodsClass
				+ ", goodsImgName=" + goodsImgName + ", user=" + user + "]";
	}
}
