
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>shop</title>
	<link rel="stylesheet" href="/resources/css/user/member/default.css" />
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
	
	div#input_id { margin-left:350px; }
	button#signin_btn { margin-left:260px; }
	
	input#userId { margin-left:5px; }
	input#userPass { margin-bottom:50px; }
		
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
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>
	
	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../include/nav.jsp" %>
		</div>
	</nav>
	
	<aside id="aside">
		<div id="aside_box">
			<%@ include file="../include/aside.jsp" %>
		</div>
	</aside>

	
	<section id="container">
		 <form role="form" method="post" autocomplete="off">
		 
		 	<div id="input_id">
			  <div id="id" class="input_area">
			   <label for="userId">아 이 디</label>
			   <input type="email" id="userId" name="userId" required="required" />      
			  </div>
			  
			  <br>
			  
			  <div class="input_area">
			   <label for="userPass">패스워드</label>
			   <input type="password" id="userPass" name="userPass" required="required" />      
			  </div>
			</div>
	  
	  <button type="submit" id="signin_btn" name="signin_btn">로그인</button>
	  <button type="button" id="findpass_Btn" name="findpass_btn">비밀번호찾기</button>

	  <script>
	  		$("#findpass_Btn").click(function(){
	  			location.href = "/member/findpass";
	  		});
	  </script>

		<c:choose>
		 <c:when test="${msg == false}">
	    	<p style="color:#f00;">로그인에 실패했습니다.</p>
		 </c:when>
		 
		 <c:when test="${txt == false}">
	   		<script> alert("아이디로 입력한 이메일로 임시 비밀번호가 전송되었습니다. 로그인 후 비밀번호를 변경해주시기 바랍니다."); </script>
	  	 </c:when>
	  	</c:choose>
	  
	 </form>  
	</section>

	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>		
	</footer>

</div>
</body>
</html>