package com.mapper;

import java.util.List;

import com.po.AdvInfo;



public interface AdvInfoMapper {
	public List<AdvInfo> getAllAdv();
	public List<AdvInfo> getSortAdv();
	public List<AdvInfo> deleteAllAdv();
	public int addAdv(AdvInfo adv);

}
