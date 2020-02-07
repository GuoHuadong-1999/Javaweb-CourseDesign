package com.GHD.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.GHD.bean.Goods;
import com.GHD.dao.GoodsDao;
import com.GHD.util.JDBCUtil;

public class GoodsDaoImpl implements GoodsDao {

	public void insertGoods(String goodsName, String goodsPrice, String goodsClass, String goodsImgName,
			String publishAddress, String goodsDescribe,String user) {
		try {
			QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
			queryRunner.update("insert into goods values(null,?,?,?,?,?,?,?)",goodsName,goodsClass,goodsPrice,goodsDescribe,goodsImgName,publishAddress,user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public List<Goods> selectGoods(String information) {
		QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
		List<Goods> list = null;
		try {
			list = queryRunner.query("select * from goods where user like ? or goodsName like ? or goodsClass like ?",new BeanListHandler<Goods>(Goods.class),"%"+information+"%","%"+information+"%","%"+information+"%");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public Goods selectGoodsDetail(String id) {
		QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
		Goods goods = null;
		try {
			goods = queryRunner.query("select * from goods where id=?",new BeanHandler<Goods>(Goods.class),id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return goods;
	}
	@Override
	public Goods selectRelateGoods(String goodsImgName) {
		QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
		Goods goods = null;
		try {
			goods = queryRunner.query("select * from goods where goodsImgName=?",new BeanHandler<Goods>(Goods.class),goodsImgName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return goods;
	}
	@Override
	public List<Goods> selectAllGoods() {
		QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
		List<Goods> list = null;
		try {
			list = queryRunner.query("select * from goods",new BeanListHandler<Goods>(Goods.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public void deleteGoods(String goodsImgName) {
		try {
			QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
			queryRunner.update("delete from goods where goodsImgName = ?",goodsImgName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
