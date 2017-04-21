package com.po;

import java.io.Serializable;

public class NewsInfo extends PageInfo implements Serializable {
	private int id;
	private String newsTitle;
	private int classId;
	private String pubuser;
	private String pubtime;
	private  int clickNum;
	private String newsContent;
	private String pinyinma;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public String getPubuser() {
		return pubuser;
	}
	public void setPubuser(String pubuser) {
		this.pubuser = pubuser;
	}
	public String getPubtime() {
		return pubtime;
	}
	public void setPubtime(String pubtime) {
		this.pubtime = pubtime;
	}
	public int getClickNum() {
		return clickNum;
	}
	public void setClickNum(int clickNum) {
		this.clickNum = clickNum;
	}
	public String getNewsContent() {
		return newsContent;
	}
	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	
	
	
	
	
	
	public String getPinyinma() {
		return pinyinma;
	}
	public void setPinyinma(String pinyinma) {
		this.pinyinma = pinyinma;
	}
	@Override
	public String toString() {
		return "NewsInfo [id=" + id + ", newsTitle=" + newsTitle + ", classId="
				+ classId + ", pubuser=" + pubuser + ", pubtime=" + pubtime
				+ ", clickNum=" + clickNum + ", newsContent=" + newsContent
				+ "]";
	}

}
