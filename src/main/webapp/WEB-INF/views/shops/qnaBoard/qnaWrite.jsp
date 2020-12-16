
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
	<script src="/resources/ckeditor/ckeditor.js"></script>
	
	
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

	section#container { padding:20px 0; }
	section#container::after { content:""; display:block; clear:both; }
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	.inputArea { margin:10px 0; }
	
	
	
	header#header div#header_box { text-align:center; padding:30px 0; }
	header#header div#header_box h1 { font-size:50px; }
	header#header div#header_box h1 a { color:#000; }
	
	nav#nav div#nav_box { font-size:14px; padding:10px; text-align:right; }
	nav#nav div#nav_box li { display:inline-block; margin:0 10px; }
	nav#nav div#nav_box li a { color:#333; }
	
	section#container { }
	h2#qnasubject { margin-bottom:30px; font-size:24px;  }
	
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
	
	<aside id="aside">
		<div id="aside_box">
			<%@ include file="../../include/aside.jsp" %>
		</div>
	</aside>

	
	<section id="container">
		<div id="container_box">
			<h2 id="qnasubject">Q&A 등록</h2>
			
			<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
			
			<div class="inputArea">
				<label>분류</label>
				
				<select class="category" id="category">
					<c:forEach items="${category}" var="code">
						<option> <c:out value="${code.codeName}" /></option>
					</c:forEach>
				</select>
			</div>
			<input type="hidden" id="codeName" name="codeName"/>
			
			<script>
				$("#category").change(function(){
					var seleted_value = $("#category option:selected").val();
					$("#codeName").val(seleted_value);
				});
			</script>
			
			<div class="inputArea">
				<label for="title">제목</label> 
				<input type="text" id="title" name="title" /> 
				<label for="pw">비밀번호</label>
				<input type="password" id="pw" name="pw" maxlength="4" placeholder="숫자 4자리"/>			
			</div>
			

			<div class="inputArea">
				<label for="content">내용</label>
				<textarea rows="7" cols="75" id="content" name="content"></textarea>
				
				<script>
					var ckeditor_config = {
							resize_enable : false,
							enterMode : CKEDITOR.ENTER_BR,
							shiftEnterMode : CKEDITOR.ENTER_P,
							filebrowserUploadUrl : "/shops/qna/ckUpload"
					};
					
					CKEDITOR.replace("content", ckeditor_config);
				</script>
			</div>
			
			<div class="inputArea">
				<button type="submit" id="register_Btn">등록</button>
			</div>
				
			</form>
			ㅇ		
		
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