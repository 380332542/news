package com.po;

import java.util.List;

public class UserData {
	private int currentPage;
	private int totalPage;
	private List<UserInfo> userList;
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<UserInfo> getUserList() {
		return userList;
	}
	public void setUserList(List<UserInfo> userList) {
		this.userList = userList;
	}
	
	

}
