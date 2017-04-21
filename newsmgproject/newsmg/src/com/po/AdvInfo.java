package com.po;

import java.io.Serializable;

public class AdvInfo extends PageInfo implements Serializable {
	
	
	private int id;
	private String advname;
	private String advurl;
	private  int advmoney;
	private  int time;
	private  int sort;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAdvname() {
		return advname;
	}
	public void setAdvname(String advname) {
		this.advname = advname;
	}
	public String getAdvurl() {
		return advurl;
	}
	public void setAdvurl(String advurl) {
		this.advurl = advurl;
	}
	public int getAdvmoney() {
		return advmoney;
	}
	public void setAdvmoney(int advmoney) {
		this.advmoney = advmoney;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	@Override
	public String toString() {
		return "AdvInfo [id=" + id + ", advname=" + advname + ", advurl="
				+ advurl + ", advmoney=" + advmoney + ", time=" + time
				+ ", sort=" + sort + "]";
	}
	
	
	
	
	

}
