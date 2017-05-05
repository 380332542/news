package com.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mapper.AdvInfoMapper;
import com.po.AdvInfo;


@Controller
@RequestMapping("/advinfo/")
public class AdvInfoController {
	
	@Resource(name="advInfoMapper")
	private  AdvInfoMapper advInfoMapper;
	
	@RequestMapping("advmanage.do")
	public String list(Model model) throws Exception
	{
	
		List<AdvInfo> list= advInfoMapper.getAllAdv();
		System.out.println(list);	
		model.addAttribute("alladv", list);
		return "advmanage";		
	}

	@RequestMapping("submit.do")
	public @ResponseBody String submit(HttpServletRequest request){
		
		String ds = request.getParameter("ds");
		List<AdvInfo> list= advInfoMapper.deleteAllAdv();		
		JSONArray json=JSONArray.fromObject(ds);
		JSONObject jsonOne;
		int size = json.size();
		AdvInfo b=new AdvInfo();
		for (int i = 0; i < size; i++) {
			jsonOne = json.getJSONObject(i); 
			b.setId(Integer.parseInt( (String) jsonOne.get("id")));
			b.setAdvname((String) jsonOne.get("advname"));
			b.setAdvurl((String) jsonOne.get("advurl"));
			b.setAdvmoney(Integer.parseInt( (String) jsonOne.get("advmoney")));
			b.setTime(Integer.parseInt( (String) jsonOne.get("time")));
			b.setSort(Integer.parseInt( (String) jsonOne.get("sort")));
			advInfoMapper.addAdv(b);	 							
			} 
	return "1";		
	}
}
