<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
		<script src="/resources/jquery/jquery-3.4.1.min.js"></script>
	
	<title>shop</title>
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
	aside { float:left; width:180px; }
	div#aside { float:left; margin-top:20px; }
	div#container_box { float:right; width:700px;  }
	section#container::after { content:""; display:block; clear:both; }
	footer#footer { background:#eee; padding:20px; }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; }
	
	
	header#header div#header_box { text-align:center; padding:30px 0; }
	header#header div#header_box h1 { font-size:50px; }
	header#header div#header_box h1 a { color:#000; } 
	
 	nav#nav div#nav_box { font-size:14px; padding:10px; text-align:right; }
 	nav#nav div#nav_box li { display:inline-block; margin:0 10px; } 
 	nav#nav div#nav_box li a { color:#333; } 
	
 	section#container { } 
	
/*  	aside#aside h3 { font-size:92px; margin_bottom:20px; text-align:center; }  */
/*  	aside#aside li { font-size:16px; text-align:center; }  */
/*  	aside#aside li a { color:#000; display:block; padding:10px 0; }  */
/*  	aside#aside li a:hover { text-decoration:none; background:#eee; }  */
	
/*  	aside#aside li { position:relative; }  */
/*  	aside#aside li:hover { background:#eee; }  */
/*  	aside#aside li > ul.low { display:none; position:absolute; top:0; left:180px; }  */
/*  	aside#aside li:hover > ul.low { display:block; }  */
/*  	aside#aside li:hover > ul.low li a { background:#fff; border:1px solid #eee; }  */
/*  	aside#aside li:hover > ul.low li a:hover { background:#eee; }  */
/*  	aside#aside li > ul.low li { width:180px; }  */
	
 	footer#footer { margin-top:100px; border-radius:50px 50px 0 0; } 
 	footer#footer div#footer_box { padding:0 20px; } 

</style>

<style>
/* 	section#content ul li { display:inline-block; margin:10px; } */
/* 	section#content div.goodsThumb img { width:200px; height:200px; } */
/* 	section#content div.goodsName { padding:10px; 0; text-align:center; } */
/* 	section#content div.goodsName a { color:#000; } */

</style>

<style>

/* 	#container_box table { width:700px; } */
/* 	#container_box table th { font-size:20px; font-weight:bold; */
/* 	       text-align:center; padding:10px; border-bottom:2px solid #666; } */
/* 	#container_box table tr:hover { background:#eee; } */
/* 	#container_box table td { padding:10px; text-align:center; } */
/* 	#container_box table img { width:150px; height:auto; } */

	div#container_box ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
	div#container_box .orderlist span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }

	.orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
	.orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; }
	
	.orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
	.orderView li::after { content:""; display:block; clear:both; }
	
	.thumb { float:left; width:200px; }
	.thumb img { width:200px; height:200px; }
	.gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
	.gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
	
	.deliveryChange { text-align:right; }
	.delivery_ing_btn,
	.delivery_end_btn { font-size:16px; background:#fff; border:1px solid #999; margin-left:10px; }
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
		<aside>
			<div id="aside">
				<%@ include file="../include/aside.jsp" %>
			</div>
		</aside>
		<div id="container_box">
			
			<div class="orderInfo">
				<c:forEach items="${orderView}" var="orderView" varStatus="status">
				
					<c:if test="${status.first}">
						<p><span>주문자</span>${orderView.userId}</p>
						<p><span>수령인</span>${orderView.orderRec}</p>
						<p><span>주소</span>(${orderView.userAddr1}) ${orderView.userAddr2} ${orderView.userAddr3}</p>
						<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</p>
						<p><span>상태</span>${orderView.delivery}</p>
						<p><span>택배사</span>
						
						<input type="hidden" id="orderId" name="orderId" value="${orderView.orderId}" />
						<c:choose>
							<c:when test="${orderView.carrier != '00'}">${orderView.carrName}</c:when>
							<c:when test="${orderView.carrier == '00'}">
								<select id="carriers" class="carriers">
									<c:forEach items="${carrierList}" var="carriers">
										<option><c:out value="${carriers.carrName}" /></option>
									</c:forEach>
								</select>
							</c:when>
						</c:choose>
						<p><span>송장번호</span>
						<c:choose>
							<c:when test="${orderView.deliveryCode != '000000000'}">${orderView.deliveryCode}</c:when>
							<c:when test="${orderView.deliveryCode == '000000000'}">
								<input type="text" id="deliveryCode" placeholder="송장번호를 입력하세요!" />
							</c:when>
						</c:choose>
						<button type="button" id="deliveryRegi" name="deliveryRegi" onclick="fn_deliveryRegi();">배송정보 등록</button>
						<script>
							function fn_deliveryRegi() {
								$.ajax({
					   				type : "post",
					   				data : {"deliveryCode" : $("#deliveryCode").val(),
					   						"carriers" : $("#carriers").val(),	
					   						"orderId" : $("#orderId").val()},
					   				url : "deliveryRegi.do",
					   				dataType : "json"
					   			});
								
								if ("${result == 'result'}"){
									alert('asdf');
									location.reload();
								}
							};
						</script>
						
						
						<div class="deliveryChange">
							<form role="form" method="post" class="deliveryForm">
							
								<input type="hidden" name="orderId" value="${orderView.orderId}" />
								<input type="hidden" name="delivery" class="delivery" value="" />
								
								<button type="button" class="delivery_ing_btn">배송 중</button>
								<button type="button" class="delivery_end_btn">배송 완료</button>
								
								<script>

									$(".delivery_ing_btn").click(function(){
										$(".delivery").val("배송 중");
										run();
									});
									
									$(".delivery_end_btn").click(function(){
										$(".delivery").val("배송 완료");
										run();
									});
									
									function run(){
										$(".deliveryForm").submit();
									}
									
								</script>		
							</form>				
						</div>
					</c:if>
				</c:forEach>
			</div>
			
			<ul class="orderView">
				<c:forEach items="${orderView}" var="orderView">
				<li>
					<div class="thumb">
						<img src="${orderView.gdsThumbImg}" />
					</div>
					<div class="gdsInfo">
						<p>
							<span>상품명</span>${orderView.gdsName}<br />
							<span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice}" /> 원<br />
							<span>구입 수량</span>${orderView.cartStock} 개<br />
							<span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice * orderView.cartStock}" /> 원
						</p>
					</div>
				</li>
				</c:forEach>
			</ul>
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