package com.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;
import net.spy.memcached.AddrUtil;
import net.spy.memcached.MemcachedClient;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mapper.AdvInfo2Mapper;
import com.mapper.AdvInfoMapper;
import com.mapper.NewsInfoMapper;
import com.po.AdvInfo;
import com.po.AdvInfo2;
import com.po.NewsInfo;
import com.util.NewClick;
import com.util.PinyinTool;


@Controller
@RequestMapping("/newsinfo/")
public class NewsInfoController {
	
	@Resource(name="newsInfoMapper")
	private NewsInfoMapper newsInfoMapper;
	
	@Resource(name="advInfoMapper")
	private AdvInfoMapper advInfoMapper;
	
	@Resource(name="advInfo2Mapper")
	private AdvInfo2Mapper advInfo2Mapper;
	
	@RequestMapping("newslist.do")
	public String list(Model model) throws Exception
	{
		
		List<NewsInfo> list;
		MemcachedClient mc=new MemcachedClient(AddrUtil.getAddresses("127.0.0.1:11211"));
		
		
		NewsInfo news=new NewsInfo();
		news.setCurrentPage(1);
		news.setTotalRow(newsInfoMapper.getTotal());
		
		List<AdvInfo> list2=advInfoMapper.getSortAdv();
		List<AdvInfo2> list3=advInfo2Mapper.getSortAdv2();
		
		if(news.getCurrentPage()==1)
		{
			list=(List)mc.get("first_page");
			
			if(list==null)
			{
				list = newsInfoMapper.getNewsByPage(news);
				mc.set("first_page", 60*60*24, list);
			}
			
			
			
		}
		else
		{
			 list = newsInfoMapper.getNewsByPage(news);
		}
		
		
	   
		model.addAttribute("newslist", list);
		model.addAttribute("currentPage",1);
		model.addAttribute("totalPage",news.getTotalPage());
		model.addAttribute("adv", list2);
		model.addAttribute("adv2", list3);
		model.addAttribute("url", "newsinfo/page.do");
		System.out.println("list是："+list);
		System.out.println("list2是："+list2);
		System.out.println("list3是："+list3);
		
		return "newslist";
	}
	
	@RequestMapping("page.do")
	public String page(NewsInfo news,Model model) throws Exception
	{
		
		
		List<NewsInfo> list;
		MemcachedClient mc=new MemcachedClient(AddrUtil.getAddresses("127.0.0.1:11211"));
		
		news.setTotalRow(newsInfoMapper.getTotal());
		
		System.out.println("currentpage:"+news.getCurrentPage());;
		
		List<AdvInfo> list2=advInfoMapper.getSortAdv();
		
		if(news.getCurrentPage()==1)
		{
			list=(List)mc.get("first_page");
			
			if(list==null)
			{
				list = newsInfoMapper.getNewsByPage(news);
				mc.set("first_page", 60*60*24, list);
			}
		}
		else
		{
			 list = newsInfoMapper.getNewsByPage(news);
		}
		
		model.addAttribute("newslist", list);
		model.addAttribute("currentPage",news.getCurrentPage());
		model.addAttribute("totalPage",news.getTotalPage());
		model.addAttribute("adv", list2);
		model.addAttribute("url", "newsinfo/page.do");
		
		return "newslist";
	}
	
	@RequestMapping("detail.do")
	public String newsDetail(int newsid,Model model) throws Exception
	{
		
		
		MemcachedClient mc=new MemcachedClient(AddrUtil.getAddresses("127.0.0.1:11211"));
		
		
		
		NewsInfo news =(NewsInfo) mc.get("newDetail_"+newsid);
		
		//第一次到数据库读取，放入缓存
		//后面就直接从缓存中取
		if(news==null)
		{
			news=newsInfoMapper.getNewsDetail(newsid);
			mc.set("newDetail_"+newsid, 60*60*12, news);
			
		}
		
		//从redis缓存获取点击次数
		NewClick nc = new NewClick(newsInfoMapper);
		int clickNum=nc.getNewsClickNum(newsid);
		nc.close();
		
		model.addAttribute("news", news);
		model.addAttribute("clickNum",clickNum);
		return "newsdetail";
	}
	
	@RequestMapping("keywordsquery.do")
	public String keyWordsQuery(String keyword) throws Exception{
		
		PinyinTool tool = new PinyinTool();
		String pinyin = tool.toPinYin(keyword, " ", PinyinTool.Type.LOWERCASE);
		NewsInfo news =new NewsInfo();
		news.setPinyinma(pinyin);
		List<NewsInfo > list = newsInfoMapper.getNewsByTitleFullText(news);
		System.out.println(list);
		return "fulltext";
	}
	
	
	

}
