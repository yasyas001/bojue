package com.bj.model;

import java.io.Serializable;
import java.util.List;

public class GoodsType implements Serializable{

	private static final long serialVersionUID = 1L;

	
	private int type;//分类
	private String typeName;//分类名称
	private List<GoodsType> nextClasss;
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public List<GoodsType> getNextClasss() {
		return nextClasss;
	}
	public void setNexClasss(List<GoodsType> nextClasss) {
		this.nextClasss = nextClasss;
	}
	
}
