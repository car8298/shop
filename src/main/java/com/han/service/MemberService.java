package com.han.service;

import javax.servlet.http.HttpSession;

import com.han.vo.MemberVO;

public interface MemberService {
	
	//회원가입
	public void signup(MemberVO vo) throws Exception;
	
	
	//로그인
	public MemberVO signin(MemberVO vo) throws Exception;
	
	//로그아웃
	public void logOut(HttpSession session) throws Exception;
	
}
