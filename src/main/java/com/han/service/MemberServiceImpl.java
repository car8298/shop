package com.han.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.han.dao.MemberDAO;
import com.han.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	private MemberDAO dao;
	
	//회원가입
	@Override
	public void signup(MemberVO vo) throws Exception{
		dao.signup(vo);
	}
	
	//로그인
	@Override
	public MemberVO signin(MemberVO vo) throws Exception {
		return dao.signin(vo);
	}
	
	//로그아웃
	@Override
	public void logOut(HttpSession session) throws Exception {
		session.invalidate();
	}
	
	//비밀번호 찾기
	@Override
	public MemberVO findpass(MemberVO vo) throws Exception {
		return dao.findpass(vo);
	}
	
//	//비밀번호 찾기(업데이트)
	public void updatePass(MemberVO vo) throws Exception {
		dao.updatePass(vo);
	}
	
	//회원정보 업데이트
	public void updateInfo(MemberVO vo) throws Exception {
		dao.updateInfo(vo);
	}

}
