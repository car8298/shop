package com.han.dao;

import java.util.List;

import com.han.vo.CategoryVO;

public interface adminDAO {
	
	//카테고리
	public List<CategoryVO> category() throws Exception;
	
}
