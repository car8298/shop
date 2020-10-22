package com.han.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.han.dao.adminDAO;
import com.han.vo.CategoryVO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Inject
	private adminDAO dao;
	
	//카테고리
	@Override
	public List<CategoryVO> category() throws Exception{
		return dao.category();
	}
}
