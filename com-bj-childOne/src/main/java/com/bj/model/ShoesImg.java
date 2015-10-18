package com.bj.model;

import java.io.Serializable;

public class ShoesImg implements Serializable{

	private static final long serialVersionUID = 1L;


	private int id;
	private int shoesId;//鞋子id
	private String imgUrl;//图片地址
	private int index;//图片序号
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getShoesId() {
		return shoesId;
	}
	public void setShoesId(int shoesId) {
		this.shoesId = shoesId;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	
}
