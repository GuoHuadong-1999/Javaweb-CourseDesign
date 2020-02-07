package com.GHD.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.GHD.bean.Goods;
import com.GHD.bean.GoodsCart;
import com.GHD.dao.GoodsCartDao;
import com.GHD.util.JDBCUtil;

public class GoodsCartDaoImpl implements GoodsCartDao {

	public void insertGoodsCart(String consumeUser, String publishUser, String goodsName, String goodsCount) {
		try {
			QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
			queryRunner.update("insert into goodsCart values(null,?,?,?,?)",consumeUser,publishUser,goodsName,goodsCount);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<GoodsCart> selectGoodsCart(String user) {
		QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
		List<GoodsCart> list = null;
		try {
			list = queryRunner.query("select * from goodsCart where consumeUser = ?",new BeanListHandler<GoodsCart>(GoodsCart.class),user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void deleteGoodsCart(String goodsImgName) {
		try {
			QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDatasource());
			queryRunner.update("delete from goodsCart where goodsName = ?",goodsImgName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
