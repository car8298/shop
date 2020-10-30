package com.han.service;

import java.util.List;

import com.han.vo.CartListVO;
import com.han.vo.CartVO;
import com.han.vo.GoodsViewVO;
import com.han.vo.OrderDetailVO;
import com.han.vo.OrderVO;
import com.han.vo.ReplyListVO;
import com.han.vo.ReplyVO;

public interface ShopService {
	
	//카테고리별 상품리스트
	public List<GoodsViewVO> list(int cateCode, int level) throws Exception;
	
	//상품조회
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	//댓글작성
	public void registReply(ReplyVO reply) throws Exception;
	
	//댓글조회
	public List<ReplyListVO> replyLIst(int gdsNum) throws Exception;
	
	//댓글삭제
	public void deleteReply(ReplyVO reply) throws Exception;
	
	//아이디 체크
	public String idCheck(int repNum) throws Exception;
	
	//댓글수정
	public void modifyReply(ReplyVO reply) throws Exception;
	
	//장바구니 추가
	public void addCart(CartVO cart) throws Exception;
	
	//장바구니 조회
	public List<CartListVO> cartList(String userId) throws Exception;
	
	//장바구니에서 아이템 삭제
	public void deleteCart(CartVO cart) throws Exception;
	
	//주문정보
	public void orderInfo(OrderVO order) throws Exception;
	
	//주문 상세 정보
	public void orderInfo_Detail(OrderDetailVO orderDetail) throws Exception;
	
	//장바구니 비우기
	public void cartAllDelete(String userId) throws Exception;
	
	//접속유저 주문목록
	public List<OrderVO> orderList(OrderVO order) throws Exception;
}
