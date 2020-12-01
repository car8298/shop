package com.han.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.han.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession sql;
	
	// 매퍼
	private static String namespace = "com.han.mappers.memberMapper";
	
	// 회원가입
	@Override
	public void signup(MemberVO vo) throws Exception {
		sql.insert(namespace + ".signup", vo);
	}
	
	// 로그인
	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		return sql.selectOne(namespace + ".signin", vo);
	}
	
	
	// 비밀번호 찾기
	@Override
	public MemberVO findpass(MemberVO vo) throws Exception {
		return sql.selectOne(namespace + ".signin", vo);
	}
	
	//비밀번호 찾기(비밀번호 업데이트)
	@Override
	public void updatePass(MemberVO vo) throws Exception {
		sql.update(namespace + ".updatepass", vo);
	}
	
	//회원정보 변경
	@Override
	public void updateInfo(MemberVO vo) throws Exception {
		sql.update(namespace + ".updateInfo", vo);
	}

}
