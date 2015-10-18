package com.bj.service;

import java.util.List;
import java.util.Map;

import com.bj.model.GoodsType;
import com.bj.model.User;
import com.bj.util.Page;

public interface IndexService {

	public Page queryTableImgList(Page page,Map<String, Object> parames);

	public List<GoodsType> queryGoodsTypeAll();

	public User getUserById(User user);

}
