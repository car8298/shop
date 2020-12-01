package com.han.dao;

import java.util.List;

import com.han.vo.CategoryVO;
import com.han.vo.GoodsVO;
import com.han.vo.GoodsViewVO;
import com.han.vo.MemberVO;
import com.han.vo.OrderListVO;
import com.han.vo.OrderVO;
import com.han.vo.ReplyListVO;

public interface adminDAO {
	
	//카테고리
	public List<CategoryVO> category() throws Exception;
	
	//상품등록
	public void register(GoodsVO vo) throws Exception;
	
	//상품목록
	public List<GoodsViewVO> goodslist() throws Exception;
	
	//상품조회
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	//상품수정
	public void goodsModify(GoodsVO vo) throws Exception;
	
	//상품삭제
	public void goodsDelete(int gdsNum) throws Exception;
	
	//주문 목록
	public List<OrderVO> orderList() throws Exception;
	
	//특정 주문 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
	
	//배송상태 변경
	public void delivery(OrderVO order) throws Exception;
	
	//배송완료 시 재고 감소
	public void changeStock(GoodsVO goods) throws Exception;
	
	//모든 댓글 조회
	public List<ReplyListVO> allReply() throws Exception;
	
	//댓글 삭제
	public void deleteReply(int repNum) throws Exception;
	
	//유저 목록
	public List<MemberVO> userList() throws Exception;
}
