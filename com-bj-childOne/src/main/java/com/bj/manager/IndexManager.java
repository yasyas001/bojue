package com.bj.manager;

import java.util.List;
import java.util.Map;

import com.bj.model.GoodsType;
import com.bj.model.Shoes;
import com.bj.model.User;

public interface IndexManager {

	public int queryTableImgCount(Map<String, Object> parames);

	public List<Shoes> queryTableImgList(int start, int limit, Map<String, Object> parames);

	public List<GoodsType> queryGoodsTypeAll();

	public User getUserById(User user);

}
