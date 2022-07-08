<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>메인페이지</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/boa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/boa/css/user.css">
<script type="text/javascript" src="/boa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/boa/js/p/myInfo.js"></script>
<script type="text/javascript" src="/boa/js/k/main.js"></script>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
.w3-bar,h1,button {font-family: "Montserrat", sans-serif}
.fa-anchor,.fa-coffee {font-size:200px}
dt {
margin: 5px;
font-size : 20pt;
}
dd:hover{
	color:#000!important;background-color:#ccc!important;
	cursor: pointer;
}
dd {
margin: 5px;
font-size : 15pt;
font-weight: lighter ;
}
</style>
</head>
<body>
	<!-- 데이터 전송용 폼태그 -->
	<form method="POST" action="/boa/member/mypoint.boa" id="frm" name="frm">
		<input type="hidden" name="nowPage" id="nowPage" value="${PAGE.nowPage}">
		<input type="hidden" name="id" id="id" value="${SID}">
		<input type="hidden" name="pcode" id="pcode" value="101" disabled>
	</form>
  	
  	 <!-- 보여질 기능들 -->
		<div class="w3-rest w3-text-grey w3-margin-left">
			<div class="w3-content mxw650 w3-margin-top">
			<div class="w3-button w3-hover-blue w3-indigo btnbox parent" id="allList">전체내역</div>
			<div class="w3-button w3-hover-blue w3-indigo btnbox parent" id="addList">충전내역</div>
		<div class="w3-col w3-round-large w3-card-4 w3-margin-bottom w3-margin-top w3-padding w3-center">
			<div class="w3-col m2 w3-left">분류</div>
			<div class="w3-col m6 w3-center">내용</div>
			<div class="w3-col m3 w3-right">일자</div>
			<div class="w3-col m1 w3-right">금액</div>
		</div>
		<!-- 페이지 본문 -->
<c:forEach var="data" items="${LIST}">
		<div class="w3-col w3-round-large w3-card-4 w3-margin-bottom w3-margin-top w3-padding w3-center" style="line-height:70px;">
	<c:if test="${data.pcode lt 200 && data.pcode ne 101}">
			<div class="w3-col m2 w3-left"><div class="btnbox w3-dark-grey parent">적립</div></div>
	</c:if>
	<c:if test="${data.pcode ge 200}">
			<div class="w3-col m2 w3-left"><div class="btnbox w3-red parent">사용</div></div>
	</c:if>
	<c:if test="${data.pcode eq 101}">
			<div class="w3-col m2 w3-left"><div class="btnbox w3-green parent">충전</div></div>
	</c:if>
			<div class="w3-col m6 w3-center">${data.detail}</div>  
			<div class="w3-col m3 w3-right">${data.sdate}</div>
			<div class="w3-col m1 w3-right">${data.gnp}</div>
		</div>
</c:forEach>
		
		<!-- 페이지 처리 시작 -->
		<div class="w3-center">
			<div class="w3-bar w3-border w3-margin-top w3-margin-bottom">
	<c:if test="${PAGE.startPage eq 1}">
				<div class="w3-bar-item w3-light-grey">&laquo;</div>
	</c:if>
	<c:if test="${PAGE.startPage ne 1}">
				<div class="w3-bar-item w3-button w3-hover-blue pbtn" id="${PAGE.startPage - 1}">&laquo;</div>
	</c:if>
	<c:forEach var="page" begin="${PAGE.startPage}" end="${PAGE.endPage}">
			<c:if test="${page eq PAGE.nowPage}">
				<div class="w3-bar-item w3-orange">${page}</div>
			</c:if>
			<c:if test="${page ne PAGE.nowPage}">
				<div class="w3-bar-item w3-button w3-hover-blue pbtn" id="${page}">${page}</div>
			</c:if>
	</c:forEach>
			<c:if test="${PAGE.endPage eq PAGE.totalPage}">
				<div class="w3-bar-item w3-light-grey">&raquo;</div>
			</c:if>
			<c:if test="${PAGE.endPage ne PAGE.totalPage}">
				<div class="w3-bar-item w3-button w3-hover-blue pbtn" id="${PAGE.endPage + 1}">&raquo;</div>
			</c:if>
			</div>
		</div>
		<!-- 페이지 처리 태그 끝 -->
	</div>
		</div>
</body>
</html>