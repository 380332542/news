package com.mapper;

import java.util.List;

import com.po.UserInfo;

public interface UserInfoMapper {
	
	public List<UserInfo> getAllUser();
	public UserInfo getUserByNameAndPwd(UserInfo user);
	public UserInfo getUserByName(UserInfo user);
	public int addUser(UserInfo user);
	public List<UserInfo> getUserByPage(UserInfo user);
	public int getCount();

}
