package com.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mapper.UserInfoMapper;
import com.po.UserInfo;

@Controller
public class CheckNameController {
	
	@Resource(name="userInfoMapper")
	private UserInfoMapper userInfoMapper;
	
	@RequestMapping("checkName.do")
	public @ResponseBody String check(String name)
	{
		UserInfo usertemp=new UserInfo();
		usertemp.setUserName(name);
		
		UserInfo user=userInfoMapper.getUserByName(usertemp);
		if(user!=null)
		{
			return "error";
		}
		
		else
		{
			return "ok";
		}

	}

}
