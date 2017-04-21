package com.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mapper.UserInfoMapper;
import com.po.UserData;
import com.po.UserInfo;


@Controller
public class JsonController {
	
	@Resource(name="userInfoMapper")
	private UserInfoMapper userInfoMapper;
	
	
	@RequestMapping("userlistJson.do")
	public @ResponseBody List<UserInfo> userListJson(){
		
		List<UserInfo> list=userInfoMapper.getAllUser();
		
		
		return list;
	}
	
	@RequestMapping("userlistJsonPage.do")
	public @ResponseBody UserData userListPage(UserInfo user)
	{
        int totalRow=userInfoMapper.getCount();
		
		user.setTotalRow(totalRow);

		
		List<UserInfo> list = userInfoMapper.getUserByPage(user);
		
		UserData ud=new UserData();
		ud.setUserList(list);
		ud.setCurrentPage(user.getCurrentPage());
		ud.setTotalPage(user.getTotalPage());
			
		
		return ud;
		
		
	}

}
