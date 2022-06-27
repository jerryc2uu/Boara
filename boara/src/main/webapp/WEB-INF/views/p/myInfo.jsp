<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>마이페이지 메인</title>
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
	<form method="POST" action="" id="frm" name="frm">
		<input type="hidden" name="id" id="id" value="${SID}">
		<input type="hidden" name="sumpoint" id="sumpoint" disabled>
	</form>

<!-- #############################여기서부터 아래 표시한 곳까지 모든 페이지에서 동일. -->
<!-- <script type="text/javascript" src="/boara/resources/js/main.js"></script> 모든 페이지에 복붙해주세요. -->
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
<!-- #################여기까진 모든 페이지에서 동일. 복붙해주세요 -->  


   	<div style="margin-left: 100px; margin-right: 100px;">
	   	<div class="w3-container w3-padding w3-margin w3-border-indigo w3-card-4" style="padding:128px 16px">
			<h1>${SID} 님 마이페이지 입니다.</h1>
		</div>
	   	<div class="w3-container w3-padding w3-margin w3-border-indigo w3-card-4" style="padding:128px 16px">
				<div class="w3-col w3-display-container w3-border w3-margin" style="width: 250px; height: 250px;">
	<c:if test="${not empty DATA.savename}">
					<img src="/boa/upload/${DATA.savename}" class="avtimg250 w3-display-middle">
	</c:if>
	<c:if test="${empty DATA.savename}">
					<img src="/boa/img/noimage.jpg" class="avtimg250 w3-display-middle">
	</c:if>
				</div>
				<div class="w3-rest w3-text-grey" style="margin-top: 50px;">
					<div class="w3-col "> 
					<h4><span class="w3-col m2">아이디 : </span><span class="w3-rest" id="id"><strong>${SID}</strong></span></h4>
					</div>
					<div class="w3-col  "> 
					<h4><span class="w3-col m2">가입일 :</span><span class="w3-rest" id="sdate">${DATA.sdate}</span></h4>
					</div>
					<div class="w3-col "> 
					<h4><span class="w3-col m2">작성글 </span><span class="w3-col m3" id="bcnt">게시글  :  <strong> ${DATA.bcnt}개</strong><a></a></span><span class="w3-col m3" id="rcnt">댓글  :  <a> <strong>${DATA.rcnt} 개</strong></a></span>
						</h4>
					</div>
					<div class="w3-col"> 
					<h4><span class="w3-col m2">포인트 : </span><span class="w3-col m3 w3-margin-right" style="text-align:right;" id="point"><strong id="spoint">${DATA.sumpoint}</strong></span></h4><div class="w3-rest w3-button w3-indigo w3-hover-blue" id="plusPoint">충전</div>
					</div>
				</div>  
			</div> 
	   
	    
	   <!-- 사이드 바 -->
	   
	   <div class="w3-container w3-padding w3-margin w3-border-indigo w3-card-4" style="padding:128px 16px">
		   <nav class="navBox w3-left navBox">
	   			<div class="navBox-div w3-border">
	   				<dl>
						<dt>회원관련</dt>
							 <dd>회원정보 수정</dd>
							 <dd>회원 탈퇴</dd>
							 <dd>좋아요 목록</dd>
							 <dd>찜 목록</dd>
							 <dd>구매글 리스트</dd>
						<dt>포인트</dt>
							<dd>포인트 이용 내역</dd>
					</dl>
	   			</div>
	  	 </nav>
	  	 <!-- 보여질 기능들 -->
			<div class="w3-rest w3-text-grey w3-margin-left">
			
			<!-- 버튼마다 다른 기능들-->
	         <div id="area" style="position: relative; width: 100%; padding-bottom: 56.25%;">
	            <iframe id="addPoint" src="/boa/member/addPoint.boa" style="display: none; position: absolute; width: 100%; height: 100%;" frameBorder="0"></iframe>
	            <iframe id="myLike" src="/boa/member/mylike.boa" style="display: none; position: absolute; width: 100%; height: 100%;" frameBorder="0"></iframe>
	            <iframe id="myJJim" src="/boa/member/myjjim.boa" style="display: none; position: absolute; width: 100%; height: 100%;" frameBorder="0"></iframe>
	            <iframe id="myBuy" src="/boa/member/mybuy.boa" style="display: none; position: absolute; width: 100%; height: 100%;" frameBorder="0"></iframe>
	            <iframe id="myPoint" src="/boa/member/mypoint.boa" style="display: none; position: absolute; width: 100%; height: 100%;" frameBorder="0"></iframe>
	            <iframe id="myBoard" src="/boa/member/myboard.boa" style="display: none; position: absolute; width: 100%; height: 100%;" frameBorder="0"></iframe>
	            <iframe id="myReboard" src="/boa/member/myreboard.boa" style="display: none; position: absolute; width: 100%; height: 100%;" frameBorder="0"></iframe>
	         </div>
			</div>
	   </div>
   </div>
   
   <footer class="w3-container w3-margin-top w3-padding-64 w3-center w3-opacity w3-border-top">
		<p>(주)보아라</p>
	</footer>

</body>
</html>