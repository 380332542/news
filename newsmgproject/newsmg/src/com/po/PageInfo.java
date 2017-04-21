package com.po;

public class PageInfo {
	private int start;         //起始数
	private int pageSize=3;    //每页条数
	private int currentPage;   //当前页
	private int totalPage;     //总页数
	private int totalRow;     //总记录数
	
	
	
	
	
	
	public int getTotalPage() {
		
		
		return totalRow%pageSize==0?totalRow/pageSize:totalRow/pageSize+1;
	}
	
	public void setTotalPage(){
		
		this.totalPage=totalRow%pageSize==0?totalRow/pageSize:totalRow/pageSize+1;
	}
	
	

	public int getStart() {
		
		start=(currentPage-1)*pageSize;
		
		return start;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}

	public int getTotalRow() {
		return totalRow;
	}
	
	

}
