package com.bj.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bj.manager.IndexManager;
import com.bj.model.GoodsType;
import com.bj.model.Shoes;
import com.bj.model.User;
import com.bj.service.IndexService;
import com.bj.util.Page;

@Service
public class IndexServiceImpl implements IndexService{

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private IndexManager indexManager;
	
	public Page queryTableImgList(Page page,Map<String, Object> parames){
		log.info("获取列表开始");
		
		int totalCount = indexManager.queryTableImgCount(parames);
		page.setTotalCount(totalCount);
		List<Shoes> shoesList = indexManager.queryTableImgList(page.getStart(),page.getLimit(),parames);
		page.setRow(shoesList);
		return page;
	}
	public List<GoodsType> queryGoodsTypeAll() {
		
		return indexManager.queryGoodsTypeAll();
	}
	public User getUserById(User user) {
		return indexManager.getUserById(user);
	}

}
