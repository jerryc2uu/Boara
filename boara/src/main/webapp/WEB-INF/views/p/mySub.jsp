<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 구독 리스트</title>
<link rel="stylesheet" type="text/css" href="/boa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/boa/css/user.css">
<script type="text/javascript" src="/boa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/boa/js/p/myInfo.js"></script>
</head>
<body>
	<div class="w3-content mxw700" style="margin-right: 550px;">
		<!-- 페이지 헤더 -->
		<header class="w3-col mgb20">
			<h1 class="w3-center mg0" style="width: 900px; margin-top: 30px; margin-bottom: 30px;">내가 구독한 컬렉션</h1>
		</header>
		<div class="w3-col w3-margin-top">
				
			<!-- 제품 리스트 -->
			<form method="POST" action="/www/cate/productDetail.blp" name="frm" id="frm">
				<input type="hidden" name="pno">
			</form>
			<div class="w3-col w3-margin-top" id="">
				<div class="w3-half w3-center pdAll5 product" id="">
					<div class="w3-col w3-card-4 pdAll10">
				      <img src="" style="width:100%">
				      <div class="w3-col" style="height: 92px;"><h3></h3></div>
				      <p>컬렉션 제목</p>
				      <p>작가</p>
					</div>
			    </div>
			</div>
		</div>
		
		<!-- 페이지 처리 시작 -->
		<div class="w3-center" style="margin-left: 170px;">
			<div class="w3-bar w3-border w3-round-medium w3-card w3-margin-top w3-margin-bottom">
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
</body>
</html>