<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>shop</title>
	
	<script src="/resources/jquery/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="/resources/css/user/shop/default.css" />
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
	
	<style>
		div.qna { width:750px; }
		td.name { text-align:center; background-color:#EBF5FF; }
		td.contents { text-align:center; background-color:#EBF5FF; }
		td.content { padding-left:10px; }
	
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
	
	<aside id="aside">
		<div id="aside_box">
			<%@ include file="../../include/aside.jsp" %>
		</div>
	</aside>

	
	<section id="container">
		<div id="container_box">
			
			<section id="content">
				<form role="form" method="post">
					<input type="hidden" name="qnaNum" value="${qna.bno}" />
				</form>
				
				<div class="qna">
					<div class="qnaInfo">
					<table class='table table-bordered'>
						<tr>
							<td class="name">카테고리</td>
							<td>${qna.codeName}</td>
							<td class="name">작성자</td>
							<td>${qna.writer}
						</tr>
						<tr>
							<td class="name">제          목</td>
							<td>${qna.title}</td>
							<td class="name">작성일</td>
							<td><fmt:formatDate value="${qna.regDate}" pattern="yyyy-MM-dd"/></td>
						<tr>
						<td class="contents" colspan="4">내 용</td>
						</tr>
						<tr>
						<td class="content" colspan="4" rowspan="3">${qna.content}</td>
						</tr>
					</table>
					
					</div>
				</div>
			</section>
		</div>
	</section>

	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../../include/footer.jsp" %>
		</div>
	</footer>
</div>

</body>
</html>