package com.mapper;

import java.util.List;

import com.po.NewsInfo;

public interface NewsInfoMapper {
	
	public List<NewsInfo> getAllNews();
	public List<NewsInfo> getNewsByPage(NewsInfo info);
	public int getTotal();
	public NewsInfo getNewsDetail(int newsid);
	public int getNewsClickNum(int newsid);
	public int updateNewsClickNum(int newsid,int clicknum);
	public List<NewsInfo> getNewsByTitleFullText(NewsInfo info);
	

}
