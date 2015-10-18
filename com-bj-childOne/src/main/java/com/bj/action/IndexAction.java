package com.bj.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.bj.model.GoodsType;
import com.bj.model.User;
import com.bj.service.IndexService;
import com.bj.util.Page;
import com.chunbo.common.action.ActionSupportExtent;

public class IndexAction extends ActionSupportExtent{

	private static final long serialVersionUID = 1L;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private IndexService indexService;
	
	public Page page = new Page(0, 0);
	public List<GoodsType> types = new ArrayList<GoodsType>();
	public String type;
	public String parentType;
	public User user;
	
	public String index() {
		log.info("进入首页");
		queryMap.clear();
		types = indexService.queryGoodsTypeAll();
		if( StringUtils.isBlank(parentType) || "null".equalsIgnoreCase(parentType)){
			queryMap.put("parentType", types.get(0).getType());
			parentType = types.get(0).getType()+"";
		}else{
			queryMap.put("parentType", parentType);
		}
		if(StringUtils.isNotBlank(type) && !"null".equalsIgnoreCase(type)){
			queryMap.put("type", type);
		}
		page = indexService.queryTableImgList(page,queryMap);
		page.setUrl("/cxxy/IndexAction/index.action");
		if(page.getPagenum()==0 && page.getRow()!=null && page.getRow().size()>0){
			page.setPagenum(1);
		}
		
		return "index";
	}
	
	public String login(){
		
		String nowDate = DateFormatUtils.format(new Date(), "yyyyMMdd");
		if(user == null){
			this.setJsonResult_Add("loginMsg", "-2");
		}else if(StringUtils.isBlank(user.getValid()) || !nowDate.equals(user.getValid())){
			this.setJsonResult_Add("loginMsg", "1");
		}else if(StringUtils.isBlank(user.getUserName())){
			this.setJsonResult_Add("loginMsg", "2");
		}else if(StringUtils.isBlank(user.getPassword())){
			this.setJsonResult_Add("loginMsg", "3");
		}else{
			user.setUserName(StringUtils.trim(user.getUserName()));
			user.setPassword(StringUtils.trim(user.getPassword()));
			user.setValid(StringUtils.trim(user.getValid()));
			user = indexService.getUserById(user);
			if(user!=null){
				this.setJsonResult_Add("loginMsg","0");
				this.setSessionUserName(user.getUserName());
			}else{
				this.setJsonResult_Add("loginMsg","-1");
			}
		}
		
		return JSONResult;
	}

	public User getUser() {
		return user;
	}



	public void setUser(User user) {
		this.user = user;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public String getParentType() {
		return parentType;
	}



	public void setParentType(String parentType) {
		this.parentType = parentType;
	}



	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}
}
