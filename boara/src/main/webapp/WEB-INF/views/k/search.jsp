<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<link rel="stylesheet" type="text/css" href="/boa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/boa/css/user.css">
<link rel="stylesheet" type="text/css" href="/boa/css/k/soyeon.css">
<link rel="stylesheet" type="text/css" href="/boa/css/c/ez.css">
<script type="text/javascript" src="/boa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/boa/js/k/search.js"></script>
<script type="text/javascript" src="/boa/js/k/main.js"></script>
<style type="text/css">
	.main{
	max-width: 900px;
	}

</style>
</head>
<body>
   <!-- Navbar -->
   <div class="w3-top fix">
     <div class="w3-bar w3-indigo w3-card w3-left-align w3-xlarge " >
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
     <a class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" id="msid">${SID}</a>   
     <a class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"id="mlogout">Logout</a>   
</c:if>           
      </div>  
     </div>
   </div>
   <!-- Header -->
    <header class="w3-container w3-indigo w3-center" style="padding:40px 16px; height: 200px;">
  	  <h1 class="pdt40 w3-xxxlarge dfn"><b>Boara</b></h1>
	</header>
	
	 <!-- search bar -->
<form method="POST" action="" id="frm" name="frm">
   <input type="hidden" id="id" name="id" value="${SID}">
   <input type="hidden" id="nowPage" name="nowPage" value="${PAGE.nowPage}">
   <input type="hidden" id="bno" name="bno" >
   <input type="hidden" id="cno" name="cno" >
<c:if test="${not empty SEL}">   
   <input type="hidden" id="sel" name="sel" value="${SEL}">
</c:if>
      <div class="w3-content w3-center mgt20" >
         <select id="ssel" name="sel"  class="w3-col w3-quarter w3-select w3-center">
            <option value="no">*** 제목 검색 ***</option>
            <option value="col">컬렉션</option>
            <option value="bo">게시글</option>
         </select>
         <div class="w3-col w3-threequarter ">
            <input type="text" id="search" name="search" class="w3-input w3-col" style="width: 93%" value="${param.search}">
            <img id="sertitle2" class="w3-rest w3-col" style="width: 40px; height: 40px; "src="/boa/resources/img/k/search.png">
         </div>
      </div>
</form>
	
<!-- 컬렉션 검색 목록(이미지, 이름, 제목)  -->
	<c:if test="${not empty LIST}">
	<c:forEach var="data" items="${LIST}">
	<div class="w3-col w3-center mgt20">
		<div class="w3-col w3-display-container cloWh" id="${data.cno}">
			<div class="w3-border-bottom collbox w3-center w3-margin-bottom">
				<div class="thumbbox w3-border-right w3-col m2 cbox" ">
				<%-- 이미지 작업 --%>
					<div class="thbox">
		<c:if test="${empty data.savename}">
						<img class="thumb" src="/boa//img/noimage.jpg">
		</c:if>
		<c:if test="${not empty data.savename}">
						<img class="thumb" src="/boa/upload/${data.savename}">
		</c:if>
					</div>
					<h4 class="inline nomg">${data.id}</h4>
				</div>
				
				<div class="colldetail w3-margin-left w3-col m7 cbox" >
					<div class="w3-padding w3-left w3-col h100" >
			 			<h1 class="w3-left inline mgt30">${data.cname}</h1>
					</div>
		<c:if test="${data.descr != 'no'}">
			<c:if test="${fn:length(data.descr) > 15}">
					<h4 class="w3-left-align c-left pdt20">${fn:substring(data.descr, 0, 15)}...</h4>
			</c:if>
			<c:if test="${fn:length(data.descr) <= 15}">
					<h4 class="w3-left-align c-left pdt20">${data.descr}</h4>
			</c:if>
		</c:if>
				</div>
			</div>
		</div>
	</div>
	
	</c:forEach>
	</c:if>
	
	
	
	<!-- 게시물 검색 목록(이미지, 이름, 제목, 내용, 조회수)-->
	
<c:if test="${not empty BLIST}">
	<c:forEach var="data" items="${BLIST}">
		<%-- 게시글 하나 박스 --%>
		<div class="w3-col w3-center mgt20">
			<div class="w3-border-bottom  collbox w3-margin-bottom w3-center boWh" id="${data.bno}">
				<div class="thumbbox w3-border-right w3-col m2 pbox " >
				<%-- 이미지 작업 --%>
					<div class="thbox">
		<c:if test="${not empty data.savename}">
						<img class="thumb" src="/boa/upload/${data.savename}">
		</c:if>
		<c:if test="${empty data.savename}">
						<img class="thumb" src="/boa/resources/img/noimage.jpg">
		</c:if>
					</div>
		<c:if test="${data.price ne 0}">
					<h4 class="inline nomg">${data.price} p</h4>
		</c:if>
				</div>
				<div class="colldetail w3-margin-left w3-col m7 pbox" id="${data.bno}">
					<div class="w3-padding w3-left w3-col h100" id="${data.bno}">
	<c:if test="${data.isshow eq 'A'}">
						<div class="noti w3-round w3-left">공지</div>
	</c:if>
	<c:if test="${data.forwho eq 'A'}">
						<div class="adult w3-round w3-left">성인</div>
	</c:if>
	<c:if test="${fn:length(data.title) > 15}">
			 			<h1 class="w3-left inline">${fn:substring(data.title, 0, 15)}...</h1>
	</c:if>
	<c:if test="${fn:length(data.title) <= 15}">
			 			<h1 class="w3-left inline">${data.title}</h1>
	</c:if>
					</div>
		<c:if test="${fn:length(data.body) > 20 }">
					<h4 class="w3-left-align c-left pdt20">${fn:substring(data.body, 0, 20)}...</h4>
		</c:if>
		<c:if test="${fn:length(data.body) <= 20 }">
					<h4 class="w3-left-align c-left pdt20">${data.body}</h4>
		</c:if>
				</div>
					<div class="w3-col m2" id="${data.bno}">
						<h6 class="w3-col w3-right-align pdt20 w3-text-gray">조회수 : ${data.click}</h6>
					</div>
			</div>
		</div>
	</c:forEach>
</c:if>	
	

	<!-- 페이지 처리 시작 -->
		<div class="w3-center w3-col">
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
	<!-- 페이지 처리 끝 -->
	

	 <!-- 데이터 전송용 form 태그 -->
	<form method="POST" action="" id="frm" name="frm">
		<input type="hidden" id="id" name="id" value="${SID}">

	</form>

</body>
</html>