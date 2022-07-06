<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>내가 작성한 게시글 리스트</title>
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
			var sbno = $(this).parent().attr('id');
			window.top.location.href = '/boa/board/boardDetail.boa?bno=' + sbno;
		});
		
		$('.hotBoard').click(function(){
			var sbno = $(this).parent().attr('id');
	        var sid = $('#id').val();
	        
			if(confirm("HOT 게시글로 등록하시겠습니까? 5000 포인트가 차감됩니다.")){
				
	         $.ajax({
	            url: '/boa/board/hotBoardProc.boa',
	            type: 'post',
	            dataType: 'json',
	            data: {
	               bno: sbno,
	               id: sid
	            },
	            success: function(data) {
	               if(data.result == 'OK') {
	                  $('#frm').submit();
	               }   
	            },
	            error: function(){
	               alert('### 통신오류 ###');
	            }
	         });

			}
		});
	});
</script>
<body class="w3-ligth-grey">
	<!-- 데이터 전송용 폼태그 -->
	<form method="POST" action="/boa/member/myboard.boa" id="frm" name="frm">
		<input type="hidden" name="nowPage" id="nowPage" value="${PAGE.nowPage}">
		<input type="hidden" name="id" id="id" value="${SID}">
	</form>
	
	<div class="w3-content mxw700" style="margin-right: 550px;">
		<!-- 페이지 헤더 -->
		<header class="w3-col mgb20">
			<h1 class="w3-center mg0" style="width: 900px; margin-top: 30px; margin-bottom: 30px;">내가 작성한 게시글</h1>
		</header>
		
		<div class="w3-col w3-white w3-card-4 w3-round-large pd15" style="width: 900px;">
			<div class="w3-col w3-light-grey w3-center w3-border">
				<div class="w3-col m1 w3-border-right">글번호</div>
				<div class="w3-col m3 w3-border-right">컬렉션</div>				
				<div class="w3-col m4 w3-border-right">글제목</div>
				<div class="w3-col m2 w3-border-right">작성일</div>
				<div class="w3-col m1 w3-border-right">조회수</div>
				<div class="w3-col m1">HOT</div>
			</div>
<c:forEach var="data" items="${LIST}">
			<div class="w3-col w3-white w3-center w3-border" id="${data.bno}">
				<div class="w3-col m1 w3-border-right brdList">${data.bno}</div>
				<div class="w3-col m3 w3-border-right brdList">${data.cname}</div>				
				<div class="w3-col m4 w3-border-right brdList">${data.title}</div>
				<div class="w3-col m2 w3-border-right brdList">${data.sdate}</div>
				<div class="w3-col m1 w3-border-right brdList">${data.click}</div>
	<c:if test="${data.hno ne 0}">
				<div class="w3-col m1 brdList"></div>
	</c:if>
	<c:if test="${data.hno eq 0}">
				<div class="w3-col w3-button m1 w3-indigo w3-hover-orange hotBoard" style="padding: 0px;">등록</div>
	</c:if>
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