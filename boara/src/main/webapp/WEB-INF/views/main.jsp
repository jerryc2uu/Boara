	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>메인페이지</title>
<meta charset="UTF-8">
 <meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
    />
<link
  rel="stylesheet"
  href="https://unpkg.com/swiper@8/swiper-bundle.min.css"
/>
<link rel="stylesheet" type="text/css" href="/boa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/boa/css/user.css">
<link rel="stylesheet" type="text/css" href="/boa/css/k/soyeon.css">
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<script type="text/javascript" src="/boa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/boa/js/k/main.js"></script>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
.w3-bar,h1,button {font-family: "Montserrat", sans-serif}
.fa-anchor,.fa-coffee {font-size:200px}
img{
	width: 230px;
	height: 270px;
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
  	  <h1 class="pdt10 w3-xxxlarge dfn"><b>Boara</b></h1>
	</header>
	<!-- Middle  -->

	<!-- Swiper -->
	    <div class="swiper mySwiper mt80">
	      <div class="swiper-wrapper">
	        <div class="swiper-slide">
	        	<div class="swiperbox">
		        	<img src="/boa/resources/img/jennie.jpg">
				</div>
	       	</div>
	        <div class="swiper-slide">
	        	<div class="swiperbox">
		        	<img src="/boa/resources/img/noimage.jpg">
				</div>
	       	</div>
	       <div class="swiper-slide">
	        	<div class="swiperbox">
		        	<img src="/boa/resources/img/noimage.jpg">
				</div>
	       	</div>
	        <div class="swiper-slide">
	        	<div class="swiperbox">
		        	<img src="/boa/resources/img/noimage.jpg">
				</div>
	       	</div>
	        <div class="swiper-slide">
	        	<div class="swiperbox">
		        	<img src="/boa/resources/img/noimage.jpg">
				</div>
	       	</div>
	      </div>
	      <div class="swiper-button-next"></div>
	      <div class="swiper-button-prev"></div>
	      <div class="swiper-pagination"></div>
	    </div>


   <!-- Bottom  -->
   <div class="w3-row-padding w3-padding-64 w3-container" style="margin: 50px auto;">		
      <div class="w3-col w3-display-container" style="margin: 0 auto;">
        	
         <!-- 컬렉션 리스트 보이는 곳 -->
         <div class="w3-col" style = "margin-left: 200px; margin-bottom: 20px;">
            <h3 class="w3-padding ft25" style="float: left;"> <a class='w3-text-red'>HOT!</a> 게시글</h3>
         </div>
         <div class=" w3-center w3-col">
			<div class="inblock w3-center mgl10" >
				<div class="pic">
					<img src="/boa/resources/img/jennie.jpg">
				</div>
				<div class="w3-center w3-xlarge">
				(1st 게시글제목)
				</div>
			</div>
			<div class="inblock w3-center mgl10 " >
				<div class="pic">
					<img  src="/boa/resources/img/noimage.jpg">
				</div>
				<div class="w3-center w3-xlarge">
				(2nd 게시글제목)
				</div>
			</div>
			<div class="inblock w3-center mgl10" >
				<div class="pic">
					<img src="/boa/resources/img/noimage.jpg">
				</div>
				<div class="w3-center w3-xlarge">
				(3rd 게시글제목)
				</div>
			</div>
			<div class="inblock w3-center mgl10" >
				<div class="pic">
					<img src="/boa/resources/img/noimage.jpg">
				</div>
				<div class="w3-center w3-xlarge">
				(4th 게시글제목)
				</div>
			</div>
			<div class="inblock w3-center mgl10" >
				<div class="pic">
					<img src="/boa/resources/img/noimage.jpg">
				</div>
				<div class="w3-center w3-xlarge">
				(5th 게시글제목)
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
		<input type="hidden" id="id" name="id" value="${SID}">
	</form>
   
   
   <!-- Footer -->
   <footer class="w3-container w3-padding-64 w3-center w3-opacity">
   		<p class="w3-large">(주)보아라</p>
   </footer>
   
    <!-- Swiper 초기화 -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1, 	// 보여줄 갯수
        spaceBetween: 30, 	// 슬라이드 간격
        loop: true,			// 슬라이드 반복
        pagination: {		// 쪽수 매기기
          el: ".swiper-pagination",
          clickable: true 	// 버튼 클릭 여부
        },
        navigation: { 		// 버튼 css
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev"
        }
      });
    </script>
</body>
</html>