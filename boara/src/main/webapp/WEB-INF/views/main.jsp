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
<link rel="stylesheet" type="text/css" href="/boa/css/k/soyeon.css">
<script type="text/javascript" src="/boa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/boa//js/k/main.js"></script>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
.w3-bar,h1,button {font-family: "Montserrat", sans-serif}
.fa-anchor,.fa-coffee {font-size:200px}
img {
   width: 160px; 
   height: 190px;
}
</style>
</head>
<body>
   <!-- Navbar -->
   <div class="w3-top">
     <div class="w3-bar w3-indigo w3-card w3-left-align w3-xlarge " >
       <a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white " id="main">Main</a>
       <a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white" id="collection">Collection</a>
<c:if test="${not empty SID}">      
       <a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white" id="mwrite">글작성</a>
       <a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white" id="mcoll">새 컬렉션</a>
</c:if>   
	<div style="float: right; padding-right:30px;">      
<c:if test="${empty SID}">
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
   <header class="w3-container w3-indigo w3-center" style="padding:40px 16px; height: 150px;">
     <h1 class="pdt10 w3-xxxlarge dfn">Boara</h1>

   </header>


	<!-- middle Grid -->










   <!-- Bottom Grid -->
   <div class="w3-row-padding w3-padding-64 w3-container" style="margin: 0 auto;">		
      <div class="w3-col w3-display-container" style="margin: 0 auto;">
        	
         <!-- 컬렉션 리스트 보이는 곳 -->
         <div style = "margin-left: 165px; margin-bottom: 60px;">
            <h3 class="w3-padding" style="float: left;">Today <a class='w3-text-red'>HOT!<a> 컬렉션</h3>
         </div>
         <div class="w3-center w3-col">
<div class="inblock w3-center mgl30" style="width: 160px; height: 200px;">
	<div class="pic">
		<img src="/boa/resources/img/noimage.jpg">
	</div>
	<div class="w3-center">
	첫번째 컬렉션
	</div>
</div>
<div class="inblock w3-center mgl30" style="width: 160px; height: 200px;">
	<div class="pic">
		<img src="/boa/resources/img/noimage.jpg">
	</div>
	<div class="w3-center">
	두번째 컬렉션
	</div>
</div>
<div class="inblock w3-center mgl30" style="width: 160px; height: 200px;">
	<div class="pic">
		<img src="/boa/resources/img/noimage.jpg">
	</div>
	<div class="w3-center">
	세번째 컬렉션
	</div>
</div>
<div class="inblock w3-center mgl30" style="width: 160px; height: 200px;">
	<div class="pic">
		<img src="/boa/resources/img/noimage.jpg">
	</div>
	<div class="w3-center">
	네번째 컬렉션
	</div>
</div>
<div class="inblock w3-center mgl30" style="width: 160px; height: 200px;">
	<div class="pic">
		<img src="/boa/resources/img/noimage.jpg">
	</div>
	<div class="w3-center">
	다섯번째 컬렉션
	</div>
</div>
<%--
<c:forEach var="data" items="${LIST}">
			<div class="inblock w3-center w3-border " id="${data.cno}" style="width: 150px; height: 160px; margin-left: 20px; padding-left: 20px;">
	         	<div class="picbox">
	               <img class="pic w3-card-4" src="/boara/resources/img/${data.savename}">
	         	</div>
               <div>${data.cname}</div>
	        </div>
</c:forEach> 
--%>


	  	 </div>
	  	 <!-- 컬렉션 리스트 보이는 곳 끝남 -->
			
      </div>
   </div>
   
   
   <!-- 데이터 전송용 form 태그 -->
	<form method="POST" action="" id="frm" name="frm">
		<input type="hidden" id="cno" name="cno">
	</form>
   
   
   <!-- Footer -->
   <footer class="w3-container w3-padding-64 w3-center w3-opacity">
   		<p>(주)보아라</p>
   </footer>
</body>
</html>