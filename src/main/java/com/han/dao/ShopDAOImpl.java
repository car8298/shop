package com.han.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.han.vo.CartListVO;
import com.han.vo.CartVO;
import com.han.vo.GoodsViewVO;
import com.han.vo.OrderDetailVO;
import com.han.vo.OrderVO;
import com.han.vo.ReplyListVO;
import com.han.vo.ReplyVO;

@Repository
public class ShopDAOImpl implements ShopDAO{
	
	@Inject
	private SqlSession sql;
	
	//매퍼
	private static String namespace = "com.han.mappers.shopMapper";
	
	@Override
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception{
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("cateCode", cateCode);
		map.put("cateCodeRef", cateCodeRef);
		
		return sql.selectList(namespace + ".list_1", map);
	}
	
	@Override
	public List<GoodsViewVO> list(int cateCode) throws Exception{
		return sql.selectList(namespace + ".list_2", cateCode);
	}

	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception{
		return sql.selectOne(namespace + ".goodsView", gdsNum);
	}
	
	@Override
	public void registReply(ReplyVO reply) throws Exception{
		sql.insert(namespace + ".registReply", reply);
	}
	
	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception{
		return sql.selectList(namespace + ".replyList", gdsNum);
	}

	// 댓글삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception{
		sql.delete(namespace + ".deleteReply", reply);
	}
	
	// 아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception{
		return sql.selectOne(namespace + ".replyUserIdCheck", repNum);
	}
	
	// 댓글 수정
	@Override
	public void modifyReply(ReplyVO reply) throws Exception{
		sql.update(namespace + ".modifyReply", reply);
	}
	
	// 장바구니 추가
	@Override
	public void addCart(CartVO cart) throws Exception{
		sql.insert(namespace + ".addCart", cart);
	}
	
	
	// 장바구니 조회
	@Override
	public List<CartListVO> cartList(String userId) throws Exception{
		return sql.selectList(namespace + ".cartList", userId);
	}

	// 장바구니에서 아이템 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception{
		sql.delete(namespace + ".deleteCart", cart);
	}

	// 주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception{
		sql.insert(namespace + ".orderInfo", order);
	}
	
	// 주문 상세 정보
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		sql.insert(namespace + ".orderInfo_Details", orderDetail);
	}
	
	// 장바구니 비우기
	@Override
	public void cartAllDelete(String userId) throws Exception {
		sql.delete(namespace + ".cartAllDelete", userId);
	}
	
	// 접속 유저 주문목록
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderList", order);
	}
}
