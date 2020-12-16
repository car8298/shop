package com.han.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.han.dao.ShopDAO;
import com.han.vo.CartListVO;
import com.han.vo.CartVO;
import com.han.vo.Criteria;
import com.han.vo.GoodsViewVO;
import com.han.vo.OrderDetailVO;
import com.han.vo.OrderListVO;
import com.han.vo.OrderVO;
import com.han.vo.QnACategoryVO;
import com.han.vo.QnaVO;
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
	@Override
	public void cartAllDelete(String userId) throws Exception {
		dao.cartAllDelete(userId);
	}
	
	//주문목록
	//접속유저 주문목록
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return dao.orderList(order);
	}
	
	//특정 주문 목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}
	
	//Qna 게시판 목록
	@Override
	public List<QnaVO> qnaList(Criteria cri) throws Exception {
		return dao.qnaList(cri);
	}
	
	//Qna 게시판 글 갯수
	public int qnaCount() throws Exception {
		return dao.qnaCount();
	}
	
	//Qna 카테고리 불러오기
	@Override
	public List<QnACategoryVO> qnaCategory() throws Exception {
		return dao.qnaCateList();
	}
	
	//Qna 글쓰기
	@Override
	public void qnaWrite(QnaVO qna) throws Exception {
		dao.qnaWrite(qna);
	}
	
	//Qna 글보기
	@Override
	public QnaVO qnaView(int bno) throws Exception {
		return dao.qnaView(bno);
	}

}
