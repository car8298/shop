<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>shop</title>
	<link rel="stylesheet" href="/resources/css/user/member/default.css" />
	<script src="/resources/jquery/jquery-3.4.1.min.js"></script>
	
	
	<style>
		label#userId_label { margin-left:42px; text-align:right; }
		label#userId { margin-left:10px; text-align:right; }
		label#userName { margin-left:42px; text-align:right; }
		label#userPhon { margin-left:42px; text-align:right; }
		
		button#update_btn { margin-top:20px; margin-left:192px; }
	
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
			<%@ include file="../include/aside.jsp" %>
	</aside>
	
	<section id="container">
		<div id="container_box">
			<section id="content">
				 <form role="form" id="info" method="post" autocomplete="off">
				  <div class="input_area">
				   <label for="userId_label" id="userId_label">아  이  디 : </label>
				   <label for="userId" id="userId">${userId}</label>
				  </div>
				  
				  <div class="input_area">
				   <label for="userPass">현재 비밀번호 :</label>
				   <input type="password" id="currentPass" name="currentPass" required="required" />
				  </div>
				  <div class="input_area">
				   <label for="userPass">변경 비밀번호 :</label>
				   <input type="password" id="newPass" name="newPass" class="pw" required="required" />      
				  </div>
				  
				  <div class="input_area">
				   <label for="userPass">비밀번호 확인 :</label>
				   <input type="password" id="newPassCf" name="newPassCf" class="pw" required="required" />      
				  </div>
				  <div>
					<span id="alert-success" style="display:none;"> 비밀번호가 일치합니다. </span>
					<span id="alert-danger" style="display:none; color: #d92742; font-weight:bold;">비밀번호가 일치하지 않습니다.</span>
				  	<span id="alert-forbid" style="display:none; color: #d92742; font-weight:bold;">현재 비밀번호와 같습니다. 다른 비밀번호를 사용하세요.</span>
				  </div>
				  
				  <script>
				   $('.pw').focusout(function(){
					var pass0 = $('#currentPass').val();
				  	var pass1 = $('#newPass').val();
				  	var pass2 = $('#newPassCf').val();
				  
				  	if (pass1 !='' && pass2 ==''){
				  		null;
				  	} else if (pass1 != "" || pass2 != "") {
				  		if (pass1 == pass2) {
				  			if (pass0 != pass1) {
				  			$("#alert-success").css('display', 'inline-block');
			                $("#alert-danger").css('display', 'none');
			                $("#update_btn").css('cursor', 'allowed');
							document.getElementById("update_btn").disabled = false;
				  			}
				  			else if (pass0 == pass1){
				  				$("#alert-success").css('display', 'none');
				                $("#alert-danger").css('display', 'none');
				                $("#alert-forbid").css('display', 'inline-block');
								document.getElementById("update_btn").disabled = true;
				  			}

				  		} else {
			                alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
				  			$("#alert-success").css('display', 'none');
			                $("#alert-danger").css('display', 'inline-block');
							document.getElementById("update_btn").disabled = true;
				  		}
				  	}
				   });
				  </script>
				  
				  <div class="input_area">
				   <label for="userName" id="userName">닉  네  임 : </label>
				   <input type="text" id="userName" name="userName" value=${name} required="required" />      
				  </div>
				  
				  <div class="input_area">
				   <label for="userPhon" id="userPhon">연  락  처 : </label>
				   <input type="text" id="userPhon" name="userPhon" value=${phon} required="required" />      
				  </div>
				  
				  <button type="submit" id="update_btn" name="update_btn">회원정보 변경</button>
				  
				 </form>   
				</section>
		</div>
	</section>

	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>		
	</footer>

</div>
</body>
</html>