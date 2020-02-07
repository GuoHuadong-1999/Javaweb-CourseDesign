package com.GHD.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.GHD.bean.Goods;
import com.GHD.bean.IndexGoods;
import com.GHD.dao.IndexGoodsDao;
import com.GHD.util.JDBCUtil;

public class IndexGoodsDaoImpl implements IndexGoodsDao {

	@Override
	public void insertIndexGoods(String goodsId) {
		try {
			QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
			queryRunner.update("insert into indexGoods values(null,?)",goodsId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<IndexGoods> selectIndexGoods() {
		QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
		List<IndexGoods> list = null;
		try {
			list = queryRunner.query("select * from indexGoods",new BeanListHandler<IndexGoods>(IndexGoods.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void deleteIndexGoods(String goodsId) {
		try {
			QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
			queryRunner.update("delete from indexGoods where goodsId = ?",goodsId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
