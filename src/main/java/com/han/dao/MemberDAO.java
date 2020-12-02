package com.han.dao;

import com.han.vo.MemberVO;

public interface MemberDAO {
	
	//회원가입
	public void signup(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO signin(MemberVO vo) throws Exception;
	
	//비밀번호 찾기
	public MemberVO findpass(MemberVO vo) throws Exception;
	
	//비밀번호 찾기(비밀번호 업데이트)
	public void updatePass(MemberVO vo) throws Exception;
	
	//회원정보 변경
	public void updateInfo(MemberVO vo) throws Exception;
	
	//아이디 중복체크
	public int idCheck(MemberVO vo) throws Exception;
}
