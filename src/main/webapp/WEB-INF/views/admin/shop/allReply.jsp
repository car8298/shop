<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>shop</title>
	<script src="/resources/jquery/jquery-3.4.1.min.js"></script>
	
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
	
 	section#container { } 
	
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
	
 	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px; }

</style>

<style>
	section#content ul li { display:inline-block; margin:10px; }
	section#content div.goodsThumb img { width:200px; height:200px; }
	section#content div.goodsName { padding:10px; 0; text-align:center; }
	section#content div.goodsName a { color:#000; }

</style>

<style>
	/*
	#container_box table { width:900px; }
	#container_box table th { font-size:20px; font-weight:bold;
	       text-align:center; padding:10px; border-bottom:2px solid #666; }
	#container_box table tr:hover { background:#eee; }
	#container_box table td { padding:10px; text-align:center; }
	#container_box table img { width:150px; height:auto; }
	*/

	#container_box ul li { margin-bottom:20px; border:10px solid #eee; }
	.replyInfo { background:#eee; padding:10px; font-size:18px; }
	.replyInfo span { font-size:20px; font-weight:bold; margin-right:20px; }
	.replyContent { padding:10px; }
	
	.replyControll { text-align:right; padding:10px; }
	.replyControll button { border:2px solid #999; background:#fff; }
</style>

</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>
	
	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../include/nav.jsp" %>
		</div>
	</nav>
	
	
	
	
	<section id="container">
		<div id="container_box">
		<ul>
			<c:forEach items="${reply}" var="reply">
			<li>
				<div class="replyInfo">
					<p>
						<span>작성자</span>${reply.userName} (${reply.userId})
					</p>
					
					<p>
						<span>상품</span> ${reply.gdsName} <a href="/shops/view?n=${reply.gdsNum}"> 바로가기 </a>
					</p>
				</div>
				
				<div class="replyContent">
					${reply.repCon}
				</div>
				
				<div class="replyControll">
					<form role="form" method="post">
						
						<input type="hidden" name="repNum" value="${reply.repNum}" />
						<button type="submit" class="delete_${reply.repNum}_btn">삭제</button>
					
					</form>
				</div>
			</li>
			</c:forEach>
		</ul>
		</div>
		<aside id="aside">
		<div id="aside_box">
			<%@ include file="../include/aside.jsp" %>
		</div>
	</aside>
		
		
	</section>
	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>		
	</footer>

</div>
</body>
</html>