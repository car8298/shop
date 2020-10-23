package com.han.service;

import java.util.List;

import com.han.vo.CategoryVO;
import com.han.vo.GoodsVO;
import com.han.vo.GoodsViewVO;

public interface AdminService {
	
	public List<CategoryVO> category() throws Exception;
	
	public void register(GoodsVO vo) throws Exception;
	
	public List<GoodsVO> goodslist() throws Exception;
	
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	public void goodsModify(GoodsVO vo) throws Exception;
	
	public void goodsDelete(int gdsNum) throws Exception;
}
