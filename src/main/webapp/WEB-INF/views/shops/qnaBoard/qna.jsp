
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>shop</title>
	<script src="/resources/jquery/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
	<script src="/resources/bootstrap/bootstrap.min.js"></script>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<style>

	body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
	a { color:#05f; text-decoration:none; }
	a:hover { text-decoration:underline; }
	
	h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
	ul, lo, li { margin:0; padding:0; list-style:none; }
	
	
	div#root { width:900px; margin:0 auto; }
	header#header {}
	nav#nav {}
	section#container { }
	section#content { float:right; width:700px; }
	aside#aside { float:left; width:180px; }
	section#container::after { content:""; display:block; clear:both; }
	footer#footer { background:#eee; padding:20px; }
	
	
	header#header div#header_box { text-align:center; padding:30px 0; }
	header#header div#header_box h1 { font-size:50px; }
	header#header div#header_box h1 a { color:#000; }
	
	nav#nav div#nav_box { font-size:14px; padding:10px; text-align:right; }
	nav#nav div#nav_box li { display:inline-block; margin:0 10px; }
	nav#nav div#nav_box li a { color:#333; }
	
	section#container { margin-top:30px; }
	h2 { text-align:left; }
	div#container_box { margin-top:30px; }
	th { text-align:center; }
	td { text-align:center; }
	ul.pageNation { list-style:none; float:center; padding:6px; text-align:center; font-size:15px; }
	button#write { margin-left:830px; margin-top:50px; }
	
	aside#aside h3 { font-size:22px; margin_bottom:20px; text-align:center; }
	aside#aside li { font-size:16px; text-align:center; }
	aside#aside li a { color:#000; display:block; padding:10px 0; }
	aside#aside li a:hover { text-decoration:none; background:#eee; }
	
	aside#aside li { position:relative; }
	aside#aside li:hover { background:#eee; }
	aside#aside li > ul.low { display:none; position:absolute; top:0; left:180px; }
	aside#aside li:hover > ul.low { display:block; }
	aside#aside li:hover > ul.low li a { background:#fff; border:1px solid #eee; }
	aside#aside li:hover > ul.low li a:hover { background:#eee; }
	aside#aside li > ul.low li { width:180px; }
	
	footer#footer { margin-top:200px; border-radius:50px 50px 0 0; }
	footer#footer div#footer_box { padding:0 20px; }

</style>

</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="../../include/header.jsp" %>
		</div>
	</header>
	
	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../../include/nav.jsp" %>
		</div>
	</nav>
	
	<section id="container">
		<h2>Q&A</h2>
		<div id="container_box">
			<table class="table table-hover">
				<thead>
				<tr>
					<th>유형</th>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>비밀글여부</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${qna}" var="qna">
				<tr>
					<td>${qna.type}</td>
					<td>${qna.bno}</td>
					<td><a href="qnaView?n=${qna.bno}">${qna.title}</a></td>
					<td>${qna.writer}</td>
					<td><fmt:formatDate value="${qna.regDate}" pattern="yyyy-MM-dd" /></td>
					<td>${qna.yn}</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<ul class="pageNation">
				<c:if test="${pageMaker.prev}">
					<li><a href="qna${pageMaker.makeQuery(pageMaker.startPage -1 )}">이전</a></li>
				</c:if>
				
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					<li><a href="qna${pageMaker.makeQuery(idx)}">${idx}</a></li>
				</c:forEach>
				
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="qna${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
				</c:if>
			</ul>
		</div>
		<div>
			<button class="button" id="write" onclick="location.href='qnaWrite'">글쓰기</button>
		</div>
	</section>
	<div></div>
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../../include/footer.jsp" %>
		</div>		
	</footer>

</div>
</body>
</html>