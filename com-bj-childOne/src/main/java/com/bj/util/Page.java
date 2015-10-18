package com.bj.util;

import java.util.List;

public class Page {
	private List<?> row;//分页的记录
	private int pagenum;//当前页码
	private int totalPage;//总页数
	private int limit = 16;//每页显示的条数
	private int start;//每页开始记录的索引
	private int totalCount;//总记录数
	
	
	private int starPage;//开始页码
	private int endPage;//结束页码
	
	private String url;//查询分页的URL地址，一般Servlet的url地址
	
	public Page(int pagenum,int totalCount){
		this.pagenum = pagenum;
		this.totalCount = totalCount;
		
		computePage();
	}

	private void computePage() {
		//计算每页开始记录的索引
		start = (pagenum-1)*limit;
		//计算总页数
		totalPage = totalCount%limit==0?totalCount/limit:(totalCount/limit+1);
		
		//计算开始和结束页码
		if(totalPage<=9){
			starPage = 1;
			endPage = totalPage;
		}else{
			starPage = pagenum-4;
			endPage = pagenum+4;
			if(starPage<=0){
				starPage = 1;
				endPage = starPage+8;
			}
			if(endPage>=totalPage){
				endPage = totalPage;
				starPage = totalPage-8;
			}
		}
	}
	
	public int getPagenum() {
		return pagenum;
	}
	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
		computePage();
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		computePage();
	}

	public int getStarPage() {
		return starPage;
	}

	public void setStarPage(int starPage) {
		this.starPage = starPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List<?> getRow() {
		return row;
	}

	public void setRow(List<?> row) {
		this.row = row;
	}
	
	
	
}
