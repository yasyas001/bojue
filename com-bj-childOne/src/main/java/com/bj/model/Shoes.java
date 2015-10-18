package com.bj.model;

import java.io.Serializable;
import java.util.List;

public class Shoes implements Serializable{

	private static final long serialVersionUID = 1L;

	
	private Long id;
	private String shoesName;//图片名称
	private String shoesTilte;//图片描述
	private List<ShoesImg> imgUrls;//图片地址组
	private int type;//分类
	private String typeName;//分类名称
	private int parentType;//一级分类
	private String parentName;//一级分类
	
	
	public String getShoesName() {
		return shoesName;
	}
	public void setShoesName(String shoesName) {
		this.shoesName = shoesName;
	}
	public String getShoesTilte() {
		return shoesTilte;
	}
	public void setShoesTilte(String shoesTilte) {
		this.shoesTilte = shoesTilte;
	}
	public List<ShoesImg> getImgUrls() {
		return imgUrls;
	}
	public void setImgUrls(List<ShoesImg> imgUrls) {
		this.imgUrls = imgUrls;
	}
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
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public int getParentType() {
		return parentType;
	}
	public void setParentType(int parentType) {
		this.parentType = parentType;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	
	
}
