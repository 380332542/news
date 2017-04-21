package com.po;

import java.io.Serializable;

public class AdvInfo2 extends PageInfo implements Serializable {
	
	
	private int id;
	private String advname;
	private String advurl;
	private  int advmoney;
	private  int width;
	private  int height;
	private  int position;
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
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	@Override
	public String toString() {
		return "AdvInfo2 [id=" + id + ", advname=" + advname + ", advurl="
				+ advurl + ", advmoney=" + advmoney + ", width=" + width
				+ ", height=" + height + ", position=" + position + "]";
	}
	
	

}
