package com.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mapper.UserInfoMapper;
import com.po.UserInfo;
import com.util.MD5;

@Controller
@RequestMapping("/userinfo/")
public class UserInfoController {
    
	
	@Resource(name="userInfoMapper")
	private UserInfoMapper userInfoMapper;
	
	
	@RequestMapping("logincookie.do")
	public String logincooke(String username,String pwd,Model model,ModelAndView modelAndView)
	{
		UserInfo user=new UserInfo();
		user.setUserName(username);
		user.setPwd(pwd);
		
		UserInfo u = userInfoMapper.getUserByNameAndPwd(user);
	
		
		 if(u!=null)	
		{
		    
			//将用户数据写入cookie
						
			
			//int totalRow=userInfoMapper.getCount();
			
			//user.setCurrentPage(1);
			//user.setTotalRow(totalRow);
			
			//List<UserInfo> list = userInfoMapper.getUserByPage(user);
			//model.addAttribute("alluser", list);
			//model.addAttribute("currentPage",user.getCurrentPage());
			//model.addAttribute("totalPage", user.getTotalPage());
			//model.addAttribute("url", "userinfo/page.do");
			if(username=="zj"){
				return "redirect:/advinfo/advmanage.do";
			}
			
			else{
			
			return "redirect:/newsinfo/newslist.do";
			}
		}
		else
		{
			model.addAttribute("msg", "用户名或密码错误");
			return "login";
		}
		
		
	}
	
	
	
	
	@RequestMapping("login.do")
	public String login(String username,String password,Model model,HttpServletResponse response){
		
		UserInfo user=new UserInfo();
		user.setUserName(username);
		password=MD5.MD5Code(password);
		
		user.setPwd(password);
		UserInfo u = userInfoMapper.getUserByNameAndPwd(user);
		if(u!=null)	
		{
		    
			//将用户数据写入cookie
			Cookie cookie1 = new Cookie("username",username);
			Cookie cookie2 = new Cookie("pwd",password);
			cookie1.setMaxAge(60*60*24*7);
			cookie2.setMaxAge(60*60*24*7);
			
			
			cookie1.setDomain("localhost");
			cookie2.setDomain("localhost");
			cookie1.setPath("/newsmg");
			cookie2.setPath("/newsmg");
			response.addCookie(cookie1);
			response.addCookie(cookie2);
			
			
			
			
			/*int totalRow=userInfoMapper.getCount();
			
			user.setCurrentPage(1);
			user.setTotalRow(totalRow);
			
			List<UserInfo> list = userInfoMapper.getUserByPage(user);
			model.addAttribute("alluser", list);
			model.addAttribute("currentPage",user.getCurrentPage());
			model.addAttribute("totalPage", user.getTotalPage());
			model.addAttribute("url", "userinfo/page.do");*/
			if(username.equals("zj")){
				return "redirect:/advinfo/advmanage.do";
			}
			else{
			return "redirect:/newsinfo/newslist.do";
			}
		}
		else
		{
			model.addAttribute("msg", "用户名或密码错误");
			return "login";
		}
	}
	
	
	@RequestMapping("register.do")
	public String register(String username,String password,String email,String phone)
	{
		
		UserInfo user=new UserInfo();
		user.setUserName(username);
		
		password=MD5.MD5Code(password);
		
		user.setPwd(password);
		user.setEmail(email);
		user.setPhone(phone);
		
		userInfoMapper.addUser(user);
		
		return "login";
	}
	
	
	@RequestMapping("page.do")
	public String page(UserInfo user,Model model)
	{
		
		int totalRow=userInfoMapper.getCount();
		
		user.setTotalRow(totalRow);
		
		List<UserInfo> list = userInfoMapper.getUserByPage(user);
		model.addAttribute("alluser", list);
		model.addAttribute("currentPage",user.getCurrentPage());
		model.addAttribute("totalPage", user.getTotalPage());
		model.addAttribute("url", "userinfo/page.do");
		return "index2";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request,HttpServletResponse response)
	{
		
		Cookie[] cookies = request.getCookies();
		
		for(int i=0;i<cookies.length;i++)
		{
			
			System.out.println("------------------------------"+cookies[i].getName()+":"+cookies[i].getValue());
			
			
			cookies[i].setValue(null);
			
			response.addCookie(cookies[i]);
		}
		
		return "login";
	}
	
	
}
