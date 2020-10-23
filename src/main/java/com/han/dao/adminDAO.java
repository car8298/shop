package com.han.dao;

import java.util.List;

import com.han.vo.CategoryVO;
import com.han.vo.GoodsVO;
import com.han.vo.GoodsViewVO;

public interface adminDAO {
	
	//카테고리
	public List<CategoryVO> category() throws Exception;
	
	//상품등록
	public void register(GoodsVO vo) throws Exception;
	
	//상품목록
	public List<GoodsVO> goodslist() throws Exception;
	
	//상품조회
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	//상품수정
	public void goodsModify(GoodsVO vo) throws Exception;
	
	//상품삭제
	public void goodsDelete(int gdsNum) throws Exception;
}
