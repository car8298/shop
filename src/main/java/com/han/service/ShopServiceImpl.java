package com.han.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.han.dao.ShopDAO;
import com.han.vo.CartListVO;
import com.han.vo.CartVO;
import com.han.vo.GoodsViewVO;
import com.han.vo.OrderDetailVO;
import com.han.vo.OrderVO;
import com.han.vo.ReplyListVO;
import com.han.vo.ReplyVO;

@Service
public class ShopServiceImpl implements ShopService {
	
	@Inject
	private ShopDAO dao;
	
	@Override
	public List<GoodsViewVO> list(int cateCode, int level) throws Exception {
		
		int cateCodeRef = 0;
		
		if(level == 1) {
			
			cateCodeRef = cateCode;
			return dao.list(cateCode, cateCodeRef);
		} else {
		
			return dao.list(cateCode);
		}
	}
	
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		
		return dao.goodsView(gdsNum);
	}

	@Override
	public void registReply(ReplyVO reply) throws Exception {
		
		dao.registReply(reply);
	}
	
	@Override
	public List<ReplyListVO> replyLIst(int gdsNum) throws Exception {
		
		return dao.replyList(gdsNum);
	}

	//댓글삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		
		dao.deleteReply(reply);
	}
	
	//아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception {
		return dao.idCheck(repNum);
	}
	//댓글 수정
	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		dao.modifyReply(reply);
	}
	
	//장바구니 추가
	@Override
	public void addCart(CartVO cart) throws Exception {
		dao.addCart(cart);
	}

	//장바구니 조회
	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		return dao.cartList(userId);
	}
	
	//장바구니에서 아이템삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		dao.deleteCart(cart);
	}
	
	//주문정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		dao.orderInfo(order);
	}
	
	//주문 상세 정보
	@Override
	public void orderInfo_Detail(OrderDetailVO orderDetail) throws Exception {
		dao.orderInfo_Details(orderDetail);
	}
	
	//장바구니 비우기
	public void cartAllDelete(String userId) throws Exception {
		dao.cartAllDelete(userId);
	}
	
	//주문목록
	//접속유저 주문목록
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return dao.orderList(order);
	}
}
