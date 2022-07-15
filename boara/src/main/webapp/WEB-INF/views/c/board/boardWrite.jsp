<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>게시글 작성</title>
<meta charset="UTF-8">
<meta name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
/>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" type="text/css" href="/boa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/boa/css/user.css">
<link rel="stylesheet" type="text/css" href="/boa/css/c/ez.css">
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
	<div class="w3-row-padding w3-padding-64 w3-container">
		<div class="w3-col w3-padding">
			<form method="POST" name="frm" id="frm" class="w3-center" encType="multipart/form-data"
				action="/boa/board/boardWriteProc.boa">
				<div class="w3-col w3-margin-bottom w3-margin-top">
					<label for="title" class="w3-col m3 w3-padding" style="text-align:right">게시글 이름 : </label>
					<input type="text" class="w3-input w3-col m7" id="title" name="title">
				</div>
				<div class="w3-col w3-margin-bottom w3-margin-top">
					<label for="isshow" class="w3-col m3 w3-padding" style="text-align:right">공개 범위 : </label>
					<label class="w3-col m2 left mgt10"><input type="radio" id="noti" name="isshow" value="A">공지</label>
					<label class="w3-col m2 left mgt10"><input type="radio" id="noti" name="isshow" value="Y" checked>일반</label>
					<label class="w3-col m2 left mgt10"><input type="radio" id="noti" name="isshow" value="L">비공개</label>
				</div>
				<div class="w3-col w3-margin-bottom w3-margin-top">
					<label for="forwho" class="w3-col m3 w3-padding" style="text-align:right">이용가 설정 : </label>
					<label class="w3-col m3 left mgt10"><input type="radio" id="noti" name="forwho" value="A">성인</label>
					<label class="w3-col m3 left mgt10"><input type="radio" id="noti" name="forwho" value="C" checked>전체 이용가</label>
				</div>
				<div class="w3-col w3-margin-bottom w3-margin-top">
					<label for="cno" class="w3-col m3 w3-padding" style="text-align:right">컬렉션 : </label>
					<input type="text" class="w3-input w3-col m7" id="cno" name="cno" list="clist">
					<datalist id="clist">
<c:if test="${not empty CLIST}">
	<c:forEach var="coll" items="${CLIST}">
						<option value="${coll.cno}">${coll.cname}</option>
	</c:forEach>
</c:if>
<c:if test="${empty CLIST}">
						<option>선택할 컬렉션이 없습니다.</option>
</c:if>
					</datalist>
				</div>
				<div class="w3-col w3-margin-bottom w3-margin-top">
					<label for="price" class="w3-col m3 w3-padding right">가격 : </label>
					<input type="text" class="w3-input w3-col m7" id="price" name="price">
				</div>
				<h6 class="w3-text-indigo w3-left-align inline">유료글 설정시 미리보기 분은 300글자 입니다.</h6>
				<div class="w3-col w3-margin-bottom">
					<label for="genr" class="w3-col m3 w3-padding right genrcolumn">장르(선택, 최대 5개) : </label>
<c:forEach var="genr" items="${GLIST}">
					<label class="w3-col m3 left mgt10"><input type="checkbox" id="genr" name="genr" value="${genr.gno}"> ${genr.gname}</label>
</c:forEach>
				</div>
				<div class="w3-col w3-margin-bottom">
					<label for="descr" class="w3-col m3 w3-padding right">내용 : </label>
					<textarea class="w3-col m7 w3-input w3-padding w3-border w3-margin-bottom norsize" 
						id="body" name="body" rows="20"></textarea>
				</div>
				<div class="w3-col w3-margin-bottom">
					<label for="thumb" class="w3-col m3 w3-padding right">썸네일(선택) : </label>
					<input type="file" class="w3-input w3-col m7" id="thumb" name="thumb">
				</div>
				<div class="w3-col w3-margin-bottom" id="previewbox">
					<label class="w3-col m3 w3-padding right">썸네일 미리보기 : </label>
					<div class="w3-col m7 w3-center">
						<div class="thbox">
							<img class="thumb" id="preview" src="/boa/img/noimage.jpg">
						</div>
					</div>
				</div>
				
				<%-- 데이터 전송용 --%>
				<input type="hidden" name="sgenre" id="genre">
				<input type="hidden" name="id" value="${SID}">
				<input type="hidden" name="vw" value="/boa/board/boardWrite.boa">
			</form>
		</div>
			
			<%-- 생성 버튼 --%>
		<div style="text-align:right">
			<div class="genre w3-round w3-margin-top" id="wpbtn">작성</div>
		</div>
		
		
		<%-- 모달창 --%>
		<div id="modal" class="w3-center w3-modal" style="display: none;">
			<div class="w3-modal-content mxw650 w3-animate-top w3-card-4">
				<header class="boablue w3-container">
					<span onclick="document.getElementById('modal').style.display='none'"
						class="w3-button w3-display-topright">&times;</span>
						<h2>주의</h2>
				</header>
				<div class="w3-container w3-center">
					<h4 id="mdcontext"></h4>
				</div>
			</div>
		</div>
	</div>
   
</body>
</html>