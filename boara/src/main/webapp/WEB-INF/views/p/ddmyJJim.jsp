<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>찜 리스트</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/boa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/boa/css/user.css">
<script type="text/javascript" src="/boa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/boa/js/k/main.js"></script>
<script type="text/javascript" src="/boa/js/p/myInfo.js"></script>
<style>
</style>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		//게시물 하나 클릭 시 해당 게시물 상세 페이지로 이동
		$('.brdList').click(function(){
			var sbno = $(this).attr('id');
//			alert(sbno);	05.29 최이지 주석처리
			window.top.location.href = '/boa/board/boardDetail.boa?bno=' + sbno;
			//$(top.document).attr('href',  '/boara/board/boardDetail.boa?bno=' + sbno)
		});
	});
</script>
<body class="w3-ligth-grey">
	<!-- 데이터 전송용 폼태그 -->
	<form method="POST" action="/boa/member/myjjim.boa" id="frm" name="frm">
		<input type="hidden" name="nowPage" id="nowPage" value="${PAGE.nowPage}">
		<input type="hidden" name="id" id="id" value="${SID}">
	</form>
	
	<div class="w3-content mxw700" style="margin-right: 380px;">
		<!-- 페이지 헤더 -->
		<header class="w3-col mgb20">
			<h1 class="w3-center mg0" style="width: 900px; margin-top: 30px; margin-bottom: 30px;">나의 찜 목록</h1>
		</header>
		<!-- 작품 보이는 곳 -->
		<div class="w3-row-padding w3-padding-16 w3-center" style="margin-left: 50px;">
		    <div class="w3-quarter">
		      <img src="/boa/resources/upload/cat.jpg" alt="Sandwich" style="width:100%; margin-right: 40px;">
		      <h3>글제목</h3>
		      <p>작성자</p>
		    </div>
		    <div class="w3-quarter">
		      <img src="/boa/resources/upload/cat.jpg" alt="Sandwich" style="width:100%; margin-right: 40px;">
		      <h3>글제목</h3>
		      <p>작성자</p>
		    </div>
		    <div class="w3-quarter">
		      <img src="/boa/resources/upload/cat.jpg" alt="Sandwich" style="width:100%; margin-right: 40px;">
		      <h3>글제목</h3>
		      <p>작성자</p>
		    </div>
		    <div class="w3-quarter">
		      <img src="/boa/resources/upload/cat.jpg" alt="Sandwich" style="width:100%; margin-right: 40px;">
		      <h3>글제목</h3>
		      <p>작성자</p>
		    </div>
	  	</div>
<c:forEach var="data" items="${LIST}">
			<div class="w3-col w3-white w3-center w3-border">
				<div class="w3-col m2">
					<div class="w3-col m5 w3-border-right">${data.bno}</div>
					<div class="w3-col m7 w3-border-right">${data.id}</div>
				</div>
				<div class="w3-col m3 w3-border-right">${data.cname}</div>
				<div class="w3-col m4 w3-border-right">${data.title}</div>
				<div class="w3-col m2 w3-border-right">${data.sdate}</div>
				<div class="w3-col m1 w3-border-right">${data.click}</div>
			</div>
</c:forEach>

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