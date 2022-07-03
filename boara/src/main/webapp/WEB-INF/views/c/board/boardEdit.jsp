<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>컬렉션 수정</title>
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
				<a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white " id="lbtn">Login</a>
				<a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white " id="jbtn">Join</a>
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
			
			<%-- 데이터 비교용 --%>
			<input type="hidden" id="ttitle" value="${BINFO.title}">
			<input type="hidden" id="tisshow"  value="${BINFO.isshow}">
			<input type="hidden" id="tforwho" value="${BINFO.forwho}">
			<input type="hidden" id="tprice" value="${BINFO.price}">
			<input type="hidden" id="tgenre" value="${BINFO.sgenre}">
			<input type="hidden" id="tbody" value="${BINFO.body}">
			<input type="hidden" id="tfno" value="${BINFO.fno}">
			
			<form method="POST" name="frm" id="frm" class="w3-center" encType="multipart/form-data"
				action="/boa/board/boardEditProc.boa">
				<div class="w3-col w3-margin-bottom w3-margin-top">
					<label for="title" class="w3-col m3 w3-padding" style="text-align:right">게시글 이름 : </label>
					<input type="text" class="w3-input w3-col m7" id="title" name="title" value="${BINFO.title}">
				</div>
				<div class="w3-col w3-margin-bottom w3-margin-top">
					<label for="title" class="w3-col m3 w3-padding" style="text-align:right">공지글 여부 : </label>
<c:if test="${BINFO.isshow eq 'A'}">
					<label class="w3-col m3 left mgt10"><input type="radio" name="isshow" value="A" checked>공지</label>
					<label class="w3-col m3 left mgt10"><input type="radio" name="isshow" value="Y">공지글 아님</label>
</c:if>
<c:if test="${BINFO.isshow eq 'Y'}">
					<label class="w3-col m3 left mgt10"><input type="radio" name="isshow" value="A">공지</label>
					<label class="w3-col m3 left mgt10"><input type="radio" name="isshow" value="Y" checked>공지글 아님</label>
</c:if>
				</div>
				<div class="w3-col w3-margin-bottom w3-margin-top">
					<label for="forwho" class="w3-col m3 w3-padding" style="text-align:right">이용가 설정 : </label>
<c:if test="${BINFO.forwho eq 'A'}">
					<label class="w3-col m3 left mgt10"><input type="radio" name="forwho" value="A" checked>성인</label>
					<label class="w3-col m3 left mgt10"><input type="radio" name="forwho" value="C">전체 이용가</label>
</c:if>
<c:if test="${BINFO.forwho eq 'C'}">
					<label class="w3-col m3 left mgt10"><input type="radio" name="forwho" value="A">성인</label>
					<label class="w3-col m3 left mgt10"><input type="radio" name="forwho" value="C" checked>전체 이용가</label>
</c:if>
				</div>
				<div class="w3-col w3-margin-bottom w3-margin-top">
					<label for="price" class="w3-col m3 w3-padding" style="text-align:right">가격 : </label>
					<input type="text" class="w3-input w3-col m7" id="price" name="price" value="${BINFO.price}">
				</div>
				<h6 class="w3-text-indigo w3-left-align inline">유료글 설정시 미리보기 분은 300글자 입니다.</h6>
				<div class="w3-col w3-margin-bottom">
					<label for="genr" class="w3-col m3 w3-padding" style="text-align:right; height: 227.5px;">장르(선택, 최대 5개) : </label>
<c:if test="${BINFO.sgenre ne 'empty'}">
	<c:forEach var="genr" items="${GLIST}">
						<label class="w3-col m3 left mgt10"><input type="checkbox" id="genr" name="genr" value="${genr.gno}"
		<c:forEach var="ckdgnr" items="${BINFO.gnos}">
			<c:if test="${genr.gno eq ckdgnr}">
							checked
			</c:if>
		</c:forEach>
							> ${genr.gname}</label>
	</c:forEach>
</c:if>
<c:if test="${BINFO.sgenre eq 'empty'}">
	<c:forEach var="genr" items="${GLIST}">
						<label class="w3-col m3 left mgt10"><input type="checkbox" id="genr" name="genr" value="${genr.gno}"> ${genr.gname}</label>
	</c:forEach>
</c:if>
	
				</div>
				<div class="w3-col w3-margin-bottom">
					<label for="descr" class="w3-col m3 w3-padding right">내용 : </label>
					<textarea class="w3-col m7 w3-input w3-padding w3-border w3-margin-bottom norsize" 
						id="body" name="body" rows="20">${BINFO.body}</textarea>
				</div>
				<div class="w3-col w3-margin-bottom">
					<label for="thumb" class="w3-col m3 w3-padding right">썸네일 변경 : </label>
					<input type="file" class="w3-input w3-col m7" id="newthumb" name="thumb">
				</div>
				<div class="w3-col w3-margin-bottom">
					<label class="w3-col m3 w3-padding right">새 썸네일 미리보기 : </label>
					<div class="w3-col m7 w3-center">
						<div class="thbox">
							<img class="thumb" id="preview" src="/boa/img/noimage.jpg">
						</div>
					</div>
				</div>
<c:if test="${not empty HISTORY}">
				<div class="w3-col w3-margin-bottom">
					<label class="w3-col m3 w3-padding right">썸네일 히스토리중 선택 : </label>
					<div class="w3-col m7 w3-center w3-border w3-white w3-padding">
	<c:forEach var="img" items="${HISTORY}">
						<%-- 이미지 하나 --%>
						<div class="w3-left w3-margin-right">
							<div class="thbox">
								<img class="thumb" src="/boa/upload/${img.savename}">
							</div>
							<div class="w3-col w3-center">
								<input type="radio" id="sthumb" name="fno" value="${img.fno}">
							</div>
						</div>
	</c:forEach>
							
					</div>
				</div>
</c:if>
				<%-- 데이터 전송용 태그 --%>
				<input type="hidden" id="cno" name="cno" value="${BINFO.cno}">
				<input type="hidden" id="bno" name="bno" value="${BINFO.bno}">
				<input type="hidden" name="id" value="${SID}">
				<input type="hidden" name="sgenre" id="genre">
				<input type="hidden" name="vw" value="/boa/board/boardEdit.boa">
			</form>
		</div>
		
		<%-- 수정 버튼 --%>
		<div style="text-align:right">
			<div class="genre w3-round w3-margin-top" id="epbtn">수정</div>
		</div>
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
 
</body>
</html>