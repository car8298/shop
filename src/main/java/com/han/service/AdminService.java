package com.han.service;

import java.util.List;

import com.han.vo.CategoryVO;
import com.han.vo.GoodsVO;
import com.han.vo.GoodsViewVO;
import com.han.vo.OrderListVO;
import com.han.vo.OrderVO;
import com.han.vo.ReplyListVO;

public interface AdminService {
	
	public List<CategoryVO> category() throws Exception;
	
	public void register(GoodsVO vo) throws Exception;
	
	public List<GoodsViewVO> goodslist() throws Exception;
	
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	public void goodsModify(GoodsVO vo) throws Exception;
	
	public void goodsDelete(int gdsNum) throws Exception;
	
	public List<OrderVO> orderList() throws Exception;
	
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
	
	public void delivery(OrderVO order) throws Exception;
	
	public void changeStock(GoodsVO goods) throws Exception;
	
	public List<ReplyListVO> allReply() throws Exception;
	
	public void deleteReply(int repNum) throws Exception;
}
