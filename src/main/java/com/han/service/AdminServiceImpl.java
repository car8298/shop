package com.han.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.han.dao.adminDAO;
import com.han.vo.CarrierVO;
import com.han.vo.CategoryVO;
import com.han.vo.GoodsVO;
import com.han.vo.GoodsViewVO;
import com.han.vo.MemberVO;
import com.han.vo.OrderListVO;
import com.han.vo.OrderVO;
import com.han.vo.ReplyListVO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Inject
	private adminDAO dao;
	
	//카테고리
	@Override
	public List<CategoryVO> category() throws Exception{
		return dao.category();
	}
	
	//상품등록
	@Override
	public void register(GoodsVO vo) throws Exception{
		dao.register(vo);
	}
	
	//상품목록
	@Override
	public List<GoodsViewVO> goodslist() throws Exception{
		System.out.println("서비스");
		return dao.goodslist();
	}
	
	//상품조회
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception{
		return dao.goodsView(gdsNum);
	}
	
	//상품수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception{
		dao.goodsModify(vo);
	}
	
	//상품삭제
	@Override
	public void goodsDelete(int gdsNum) throws Exception{
		dao.goodsDelete(gdsNum);
	}
	
	//주문 목록
	@Override
	public List<OrderVO> orderList() throws Exception{
		return dao.orderList();
	}
	
	//특정 주문 목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception{
		return dao.orderView(order);
		
	}
	
	//배송상태 변경
	@Override
	public void delivery(OrderVO order) throws Exception{
		dao.delivery(order);
	}

	//재고수량 변경
	@Override
	public void changeStock(GoodsVO goods) throws Exception{
		dao.changeStock(goods);
	}
	
	//모든 댓글 조회
	@Override
	public List<ReplyListVO> allReply() throws Exception{
		return dao.allReply();
	}
	
	//댓글 삭제
	@Override
	public void deleteReply(int repNum) throws Exception{
		dao.deleteReply(repNum);
	}
	
	//유저 목록
	@Override
	public List<MemberVO> userList() throws Exception{
		return dao.userList();
	}

	//택배사 목록
	@Override
	public List<CarrierVO> carrierList() throws Exception{
		return dao.carrierLIst();
	}
	
	//송장 및 택배사 등록
	@Override
	public void deliveryRegi(OrderVO order) throws Exception {
		dao.deliveryRegi(order);
	}
}
