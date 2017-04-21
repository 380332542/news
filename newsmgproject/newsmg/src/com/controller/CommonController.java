package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/common/")
public class CommonController {
	
	
	@RequestMapping("top.do")
	public String top(){
		 return "top";
	}
	
	@RequestMapping("admintop.do")
	public String admintop(){
		 return "admintop";
	}
	
	@RequestMapping("lunbo.do")
	public String lunbo(){
		 return "lunbo";
	}
	
	@RequestMapping("bottom.do")
	public String bottom(){
		 return "bottom";
	}
	
	@RequestMapping("page.do")
	public String page(int currentPage,int totalPage,String url,Model model){
		System.out.println("xxxxxxxxxxxxxxxxxx"+currentPage);
		System.out.println("-----------------------"+totalPage);
		
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("url", url);
		return "page";
	}
	

}
