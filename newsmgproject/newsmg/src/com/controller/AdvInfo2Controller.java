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

import com.mapper.AdvInfo2Mapper;
import com.po.AdvInfo2;


@Controller
@RequestMapping("/advinfo2/")
public class AdvInfo2Controller {
	
	@Resource(name="advInfo2Mapper")
	private  AdvInfo2Mapper advInfo2Mapper;
	
	@RequestMapping("advmanage2.do")
	public String list(Model model) throws Exception
	{
	
		List<AdvInfo2> list= advInfo2Mapper.getAllAdv2();
		System.out.println(list);	
		model.addAttribute("alladv2", list);
		return "advmanage2";		
	}

	@RequestMapping("submit.do")
	public @ResponseBody String submit(HttpServletRequest request){
		
		String ds = request.getParameter("ds");

		List<AdvInfo2> list= advInfo2Mapper.deleteAllAdv2();
		//System.out.println("成功运行到这里");
		JSONArray json=JSONArray.fromObject(ds);

		JSONObject jsonOne;
		int size = json.size();
		System.out.println(size);
		
		AdvInfo2 b=new AdvInfo2();
		for (int i = 0; i < size; i++) {
			jsonOne = json.getJSONObject(i); 
			b.setId(Integer.parseInt( (String) jsonOne.get("id")));
			b.setAdvname((String) jsonOne.get("advname"));
			b.setAdvurl((String) jsonOne.get("advurl"));
			b.setAdvmoney(Integer.parseInt( (String) jsonOne.get("advmoney")));
			b.setWidth(Integer.parseInt( (String) jsonOne.get("width")));
			b.setHeight(Integer.parseInt( (String) jsonOne.get("height")));
			b.setPosition(Integer.parseInt( (String) jsonOne.get("position")));
			advInfo2Mapper.addAdv2(b);	 							
			} 

	return "1";
		
	}



}
