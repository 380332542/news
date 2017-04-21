package com.mapper;

import java.util.List;
import com.po.AdvInfo2;



public interface AdvInfo2Mapper {
	public List<AdvInfo2> getAllAdv2();
	public List<AdvInfo2> getSortAdv2();
	public List<AdvInfo2> deleteAllAdv2();
	public int addAdv2(AdvInfo2 adv2);

}
