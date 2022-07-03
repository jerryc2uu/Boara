<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>새 컬렉션 작성</title>
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
<script type="text/javascript" src="/boa/js/c/collec.js"></script>
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
				<a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white " id="lbtn">Login</a>
				<a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white " id="jbtn">Login</a>
</c:if>
<c:if test="${not empty SID}">
				<a class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" id="msid">${SID}</a>
				<a class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"id="obtn">Logout</a>
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
				action="/boa/collection/collecWriteProc.boa">
				<div class="w3-col w3-margin-bottom w3-margin-top">
					<label for="cname" class="w3-col m3 w3-padding right">컬렉션 이름 : </label>
					<input type="text" class="w3-input w3-col m7" id="cname" name="cname">
				</div>
				<div class="w3-col w3-margin-bottom">
					<label for="genr" class="w3-col m3 w3-padding right genrcolumn">장르(선택, 최대 5개) : </label>
<c:forEach var="genr" items="${GLIST}">
					<label class="w3-col m3 left mgt10"><input type="checkbox" id="genr" name="genr" value="${genr.gno}"> ${genr.gname}</label>
</c:forEach>
				</div>
				<div class="w3-col w3-margin-bottom">
					<label for="descr" class="w3-col m3 w3-padding right">컬렉션 설명(선택) : </label>
					<input type="text" class="w3-input w3-col m7" id="descr" name="descr">
				</div>
				<div class="w3-col w3-margin-bottom">
					<label for="thumb" class="w3-col m3 w3-padding right" >썸네일(선택) : </label>
					<input type="file" class="w3-input w3-col m7" id="thumb" name="thumb">
				</div>
				<div class="w3-col w3-margin-bottom">
					<label class="w3-col m3 w3-padding right">썸네일 미리보기 : </label>
					<div class="w3-col m7 w3-center">
						<div class="thbox">
							<img class="thumb" id="preview" src="/boa/img/noimage.jpg">
						</div>
					</div>
				</div>
				
				<%-- 데이터 전송용 --%>
				<input type="hidden" name="sgenre" id="sgenre">
				<input type="hidden" name="id" id="id" value="${SID}">
			</form>
		</div>
		
		<%-- 생성 버튼 --%>
		<div style="text-align:right">
			<div class="genre w3-round w3-margin-top" id="wpbtn">컬렉션 생성</div>
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
					<div class="genre w3-round w3-margin-bottom w3-right" id="skipThumb" style="display: none;">썸네일 유지</div>
					<div class="genre w3-round w3-margin-bottom w3-right" id="continue" style="display: none;">썸네일 선택</div>
				</div>
			</div>
		</div>
		
		
	</div>
   
</body>
</html>