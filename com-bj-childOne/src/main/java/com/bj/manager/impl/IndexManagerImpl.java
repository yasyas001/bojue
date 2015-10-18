package com.bj.manager.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bj.manager.IndexManager;
import com.bj.model.GoodsType;
import com.bj.model.Shoes;
import com.bj.model.User;
import com.chunbo.common.mybatis.dao.BaseDao;

@Repository
public class IndexManagerImpl implements IndexManager {
	
	@Autowired
	private BaseDao baseDao;

	public int queryTableImgCount(Map<String, Object> parames){
		return baseDao.queryForObject("indexManager.queryTableImgCount", parames);
	}

	public List<Shoes> queryTableImgList(int start, int limit, Map<String, Object> parames){
		return baseDao.queryForPage("indexManager.queryTableImgList", parames, start, limit);
	}

	public List<GoodsType> queryGoodsTypeAll() {
		return baseDao.queryForList("indexManager.queryGoodsTypeAll", null);
	}

	public User getUserById(User user) {
		return baseDao.queryForObject("indexManager.getUserById",user);
	}

}
