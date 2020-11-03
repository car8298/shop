package com.han.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.han.vo.CategoryVO;
import com.han.vo.GoodsVO;
import com.han.vo.GoodsViewVO;
import com.han.vo.OrderListVO;
import com.han.vo.OrderVO;
import com.han.vo.ReplyListVO;

@Repository
public class adminDAOImpl implements adminDAO {
	
	@Inject
	private SqlSession sql;
	
	// 매퍼
	private static String namespace = "com.han.mappers.adminMapper";
	
	// 카테고리
	@Override
	public List<CategoryVO> category() throws Exception{
		return sql.selectList(namespace + ".category");
	}
	
	// 상품등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		sql.insert(namespace + ".register", vo);
	}
	
	// 상품목록
	@Override
	public List<GoodsViewVO> goodslist() throws Exception {
		return sql.selectList(namespace + ".goodslist");
	}
	
	// 상품조회
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return sql.selectOne(namespace + ".goodsView", gdsNum);
	}
	
	// 상품수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		sql.update(namespace + ".goodsModify", vo);
	}

	// 상품삭제
	@Override
	public void goodsDelete(int gdsNum) throws Exception{
		sql.delete(namespace + ".goodsDelete", gdsNum);
	}
	
	//주문 목록
	@Override
	public List<OrderVO> orderList() throws Exception{
		return sql.selectList(namespace + ".orderList");
	}
	
	//특정 주문 목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderView", order);
	}
	
	//배송상태 변경
	@Override
	public void delivery(OrderVO order) throws Exception{
		sql.update(namespace + ".delivery", order);
	}
	
	//배송완료 시 재고 감소
	@Override
	public void changeStock(GoodsVO goods) throws Exception{
		sql.update(namespace + ".ChangeStock", goods);
	}
	
	//모든 댓글 조회
	@Override
	public List<ReplyListVO> allReply() throws Exception{
		return sql.selectList(namespace + ".allReply");
	}
	
	//댓글 삭제
	@Override
	public void deleteReply(int repNum) throws Exception{
		sql.delete(namespace + ".deleteReply", repNum);
	}
}
