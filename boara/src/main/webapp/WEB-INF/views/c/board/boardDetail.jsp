<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>${POST.title}</title>
<meta charset="UTF-8">
<meta name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
/>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" type="text/css" href="/boa/css/c/ez.css">
<link rel="stylesheet" type="text/css" href="/boa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/boa/css/user.css">
<link rel="stylesheet" type="text/css" href="/boa/css/k/soyeon.css">
<script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
<script type="text/javascript" src="/boa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/boa/js/c/board.js"></script>
<script type="text/javascript" src="/boa/js/k/main.js"></script>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
.w3-bar,h1,button {font-family: "Montserrat", sans-serif}
.fa-anchor,.fa-coffee {font-size:200px}
</style>
</head>
<body>
	<%-- Navbar --%>
	<div class="w3-top fix">
		<div class="w3-bar w3-indigo w3-card w3-left-align w3-xlarge">
			<a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white " id="main">Main</a>
			<a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white" id="collection">Collection</a>
<c:if test="${not empty SID}">
			<a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white" id="mwrite">Write</a>
			<a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white" id="mcoll">New Collection</a>
</c:if>
			<div style="float: right; padding-right:30px;"> 
<c:if test="${empty SID}">
				<a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white " id="mjoin">Join</a>
				<a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white " id="mlogin">Login</a>
</c:if>
<c:if test="${not empty SID}">
				<a class="w3-bar-item w3-button w3-hide-small w3-hover-white" id="message">
				<img  src="/boa/resources/img/k/message.png" style=" width:55px; height:35px;">
				</a>
				<a class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" id="msid">${SID}</a>
				<a class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"id="mlogout">Logout</a>
</c:if>
			</div>
		</div>
	</div>
   
	<%-- Header --%>
	<header class="w3-container w3-indigo w3-center" style="padding:40px 16px; height: 200px;">
		<h1 class="pdt40 w3-xxxlarge dfn"><b>Boara</b></h1>
	</header>
   
	<%-- First Grid --%>
	<div class="w3-center">
		<div class="w3-row-padding w3-padding-64 w3-container w700 inline">
			<div class="w3-border-bottom">
				<div>
					<h6 class="gray left">[${POST.bno}]</h6>
				</div>
				<div class="w3-col">
					<div class="w3-col m1">
	<c:if test="${POST.isshow eq 'A'}">
						<div class="noti w3-round w3-left mgt20 mgl10">공지</div>
	</c:if>
	<c:if test="${POST.forwho eq 'A'}">
						<div class="adult w3-round w3-left mgt20 mgl10">성인</div>
	</c:if>
					</div>
					<div class="w3-col m10 w3-margin-left">
						<h1 class="w3-left left inline mgt10 chgline">${POST.title}</h1>
					</div>
				</div>
	<c:if test="${not empty POST.sgenre}">
				<div class="left">
		<c:forEach var="genr" items="${POST.genre}">
					<div class="genre w3-round">${genr}</div>
		</c:forEach>
				</div>
	</c:if>
				<h4 class="gray left pdl10">${POST.id}<c:if test="${POST.price ne 0}"> ${POST.price}P</c:if></h4>
		
				<h6 class="gray right">${POST.sdate} 조회수 : ${POST.click}</h6>
			</div>
			<p class="left chgline pdb5" class="w3-border-bottom">${POST.body}</p>
<c:if test="${POST.price ne 0}">
	<c:if test="${POST.bought eq 'NO'}">
			<div class="w3-col w3-border-bottom" style="padding-bottom: 10px;">
				<div class="w3-col w3-light-gray w3-round w3-padding">
					<h6 class="w3-left-align">미리보기 분량은 300자입니다.
					<br>${POST.price}P로 해당 게시글을 전체 열람하실 수 있습니다.</h6>
					<div class="genre w3-round w3-right align" id="buyPost">${POST.price}P</div>
				</div>
			</div>
	</c:if>
</c:if>

			<div class="left mgt10">
				<div class="inline mgt10">
			<%-- 좋아요, 찜 기능 구현해야됨!!!! --%>
<c:if test="${not empty SID}">
	<c:if test="${POST.id ne SID}">
		<c:if test="${POST.price eq 0}">
					<img src="/boa/img/c/
			<c:if test="${POST.nowStat eq 'L'}">
					liked
			</c:if>
			<c:if test="${POST.nowStat ne 'L'}">
					unlike
			</c:if>
					.jpg" class="like" id="<c:if test="${POST.nowStat ne 'L'}">un</c:if>like">
		</c:if>
		<c:if test="${POST.price ne 0}">
			<c:if test="${POST.bought eq 'YES'}">
					<img src="/boa/img/c/
				<c:if test="${POST.nowStat eq 'L'}">
					liked
				</c:if>
				<c:if test="${POST.nowStat ne 'L'}">
					unlike
				</c:if>
		.jpg" class="like" id="<c:if test="${POST.nowStat ne 'L'}">un</c:if>like">
			</c:if>
			<c:if test="${POST.bought ne 'YES'}">
					<div class="w3-round-large genre jjim
				<c:if test="${POST.nowStat eq 'J'}">
					w3-indigo
				</c:if>
					" id="<c:if test="${POST.nowStat eq 'J'}">jjimed</c:if><c:if test="${POST.nowStat ne 'J'}">jjimyet</c:if>">+ 찜</div>
			</c:if>
		</c:if>
	</c:if>
</c:if>
					<div class="genre w3-round" id="reshow">댓글 보기</div>
					<div class="genre w3-round" id="upcoll">컬렉션으로</div>
				</div>
<c:if test="${POST.id eq SID}">
				<div style="text-align:right">
					<div class="genre w3-round" id="ebtn">수정</div>
					<div class="genre w3-round" id="dbtn">삭제</div>
				</div>
</c:if>
			</div>
		</div>
	</div>
	
	<%-- 파라미터용 모달창 --%>
<c:if test="${not empty param.msg}">
	<div class="w3-center w3-modal" style="display: block;" id="paramModal">
		<div class="w3-modal-content mxw650 w3-animate-top w3-card-4">
			<header class="boablue w3-container">
				<span onclick="document.getElementById('paramModal').style.display='none'"
					class="w3-button w3-display-topright">&times;</span>
					<h2>INFO</h2>
			</header>
			<div class="w3-container w3-center">
				<h4>${param.msg}</h4>
			</div>
		</div>
	</div>
</c:if>

	<%-- 일반 모달창 --%>
	<div id="modal" class="w3-center w3-modal" style="display: none;">
		<div class="w3-modal-content mxw650 w3-animate-top w3-card-4">
			<header class="boablue w3-container">
				<span onclick="document.getElementById('modal').style.display='none'"
					class="w3-button w3-display-topright">&times;</span>
					<h2>INFO</h2>
			</header>
			<div class="w3-container w3-center">
				<h4 id="mdcontext"></h4>
				<div class="genre w3-round w3-margin-bottom w3-right" id="buy" style="display: none;">구매</div>
				<div class="genre w3-round w3-margin-bottom w3-right" id="cancel" style="display: none;">취소</div>
			</div>
		</div>
	</div>
		
		
	
	<%-- Footer --%>
	<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-border-top">
		<p>(주)보아라</p>
	</footer>
	
	<%-- 데이터 전송용 폼 --%>
	<form method="POST" name="frm" id="frm">
<c:if test="${POST.price ne 0}">
		<input type="hidden" name="gnp" id="gnp" value="${POST.price}">
</c:if>
		<input type="hidden" name="nowPage" id="nowPage" value="${param.nowPage}">
		<input type="hidden" name="bno" id="bno" value="${POST.bno}">
		<input type="hidden" name="cno" id="cno" value="${POST.cno}">
		<input type="hidden" name="id" id="id" value="${SID}">
		<input type="hidden" name="vw" value="/boa/board/boardDetail.boa">
	</form>

</body>
</html>