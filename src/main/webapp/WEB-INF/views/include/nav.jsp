<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<ul>
<c:if test="${member == null}">
	<li>
		<a href="/member/signin">로그인</a>
	</li>
	<li>
		<a href="/member/signup">회원가입</a>
	</li>
</c:if>
<c:if test="${member != null}">
	<c:if test="${member.verify == 9}">
	<li>
		<a href="/admin/index">관리자화면</a>
	</li>
	</c:if>
	<li>
		${member.userName}님 환영합니다.
	</li>
	<li>
		<a href="/shops/cartList">장바구니</a>
	</li>
	<li>
		<a href="/shops/orderList">주문 내역</a>
	</li>
	
	<li>
		<a href="/shops/qnaBoard/qna">Q&A</a>
	</li>
	<li>
		<a href="/member/updateinfo">회원정보변경</a>
	</li>
	<li>
		<a href="/member/logout">로그아웃</a>
	</li>
</c:if>
</ul>