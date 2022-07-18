<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />
<link rel="stylesheet" type="text/css" href="/boa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/boa/css/user.css">
<link rel="stylesheet" type="text/css" href="/boa/css/k/soyeon.css">
<script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
<script type="text/javascript" src="/boa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/boa/js/k/main.js"></script>
<script type="text/javascript" src="/boa/js/k/search.js"></script>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
.w3-bar,h1,button {font-family: "Montserrat", sans-serif}
.fa-anchor,.fa-coffee {font-size:200px}
img{
	width: 225px;
	height: 265px;

}
 #img_container{
    display: flex;
    width: 230px;
    height: 270px;
	margin-left: 130px;
 
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
     <a class="w3-bar-item w3-button w3-hide-small w3-hover-white" id="message">
     	<img  src="/boa/resources/img/k/message.png" style=" width:55px; height:35px;"  > 
     </a>   
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

	<div id="id01" class="w3-padding mgtb30 w3-modal" >
		<div class="w3-modal-content  w3-card-4 w3-right" style="width: 700px; ">
	      <header class="w3-container w3-indigo"> 
	        <span id="exit" class="w3-button w3-display-topright">&times;</span>
		    <div class="w3-col ft14 h50">
		        <div id="rebtn" class=" w3-button jjbtn">받은쪽지함</div>
		        <div id="sebtn" class=" w3-button jjbtn">보낸쪽지함</div>
		        <div id="newbtn" class="w3-button jjbtn">쪽지보내기</div>
	        </div>
	      </header>
	      <!-- 받은 쪽지함 -->
	      <div id="receme" class="w3-container mgtb30">
	        <div class="w3-col mess rec">
	        	<div class="s1 mgt16 w3-col">No.</div>
	        	<div class="s2 mgt16 w3-col">발신인</div>
		        <div class="s7 mgt16 w3-col">제목</div>
		        <div class="s2 mgt16 w3-col">수신일</div>
	        </div>
	        <div id="ajaxre">
	        </div>
	      </div>
	      
	      <!-- 보낸 쪽지함 -->
	      <div id="sendme" class="w3-container mgtb30">
	        <div class="w3-col mess">
	        	<div class="s1 mgt16 w3-col ">No.</div>
	        	<div class="s2 mgt16 w3-col">수신인</div>
		        <div class="s7 mgt16 w3-col">제목</div>
		        <div class="s2 mgt16 w3-col">발송일</div>
	        </div>
	         <div id="ajaxse">
	        </div>
	      </div>
	      
	      <!-- 쪽지보내기-->
	      <div id="newme" >
		      <form method="POST" action="" name="frm1" id="frm1" class=" w3-col mgtb30">
			      <div class="w3-col mgtb10 ">
			      	<label for="sendid" class="w3-col s3 w3-center" >[ 보내는사람 ]</label>
			      	<input class="w3-col w3-select w3-border s8 w3-center ck" readOnly="true" id="mid" name="mid" value="${SID}">
			      </div>
			      <div class="w3-col mgtb10 ">
			      	<label for="recvid" class="w3-col s3 w3-center" >[ 받는사람 ]</label>
			      	<select class="w3-col w3-select w3-border s8 w3-center ck" id="recvid" name="recvid">
					</select>			     
			      </div>
			      <div class="w3-col mgtb10">
			      	<label for="title" class="w3-col s3 w3-center">[ 제목 ]</label>
			      	<input type="text" id="title" name="title" class="w3-col ft13 w3-input w3-border s8 ck ch" 
			      	placeholder="20글자 미만">
			      </div>
			      <div class="w3-col mgtb10">
				      	<label for="body" class="w3-col s3 w3-center">[ 내용 ]</label>
				      	<div class="w3-col s8">
					    	<textarea id="body" name="body" rows="10" class="w3-col ft13 ck" style="resize: none;"	></textarea>
							<div class="w3-col w3-margin-top">
								<div class="w3-half w3-text-white w3-indigo w3-xarge w3-button" id="rbtn">reset</div> 
								<div class="w3-half w3-text-white w3-indigo w3-xarge w3-button" id="send">send</div> 
							</div>
			     		</div>
	    		  </div>
			   </form>
		   </div>
		   
		   <!-- 쪽지 상세보기 -->
		    <div id="detame" class="w3-col mgtb30">
		    	<input id="mgn" type="hidden" >
		    	<div class="w3-col  ">
			      	<div class="w3-col s3 w3-center mg5" >[ 받는사람 ]</div>
			      	<p class="w3-col s8 w3-center dets" id="re" ></p>
			    </div>
			    
		    	<div class="w3-col  ">
			      	<div class="w3-col s3 w3-center mg5" >[ 보낸사람 ]</div>
			      	<p class="w3-col s8 w3-center dets" id="se" ></p>
			    </div>
			    
		    	<div class="w3-col  ">
			      	<div class="w3-col s3 w3-center mg5" >[ 제목 ]</div>
			      	<p class="w3-col s8 w3-center dets" id="ti" ></p>
			    </div>
		    	
		    	<div class="w3-col  ">
			      	<div class="w3-col s3 w3-center mg5" >[ 내용 ]</div>
			     	<div class="w3-col s8 w3-center dets"  style="height:150px;" id="bo" ></div>
			    </div>
			    
			   
			 	<div class="w3-col  ">
			      	<div class="w3-col s3 w3-center mg5" >[ 수신일 ]</div>
			      	<p class="w3-col s8 w3-center dets" id="da" ></p>
			    </div>
			 	
			 	<div class="w3-col repl ">
			      	<div class="w3-col s3 w3-center mg5 " >[ 수신확인 ]</div>
			      	<p class="w3-col s8 w3-center dets" id="rea" ></p>
			    </div>
	
		
				
		
			</div>
			   
		</div>
	</div>	


<!-- 메세지 성공 -->
	<div id="succ" class="w3-padding mgtb30 w3-modal">
		<div class="w3-modal-content  w3-card-4 " style="width: 400px; ">
	      <header class="w3-container w3-indigo"> 
	        <span id="exit1" class="w3-button w3-display-topright">&times;</span>
		   		<div class="w3-col w3-center ft18 h50 mgt10"> message</div>
		  </header>
		   		<div class="w3-col w3-white w3-center ft14 h50 pdt10 sufa"> 메세지가 성공적으로 전송되었습니다.</div>
		  </div>
	</div> 
	
		
	<!-- Swiper -->
	    <div class="swiper mySwiper mt80">
	      <div class="swiper-wrapper">
	<c:forEach var="list" items="${HLIST}" >
	        <div class="swiper-slide " id="${list.bno}">
	        	<div class="swiperbox ">
	      <c:if test="${list.savename == 'no'}">
		        	<img class="hot" src="/boa/resources/img/noimage.jpg" id="${list.bno}">
		  </c:if>	
		 <c:if test="${list.savename != 'no'}">
		  			<img class="hot" src="/boa/resources/upload/${list.savename}" id="${list.bno}">
		  </c:if>
		    		<div class="w3-center w3-text-grey w3-xlarge mgt20">
						${list.title}
					</div>
				</div>
	       	</div>
	 </c:forEach>
	      </div>
	      <div class="swiper-button-next"></div>
	      <div class="swiper-button-prev"></div>
	      <div class="swiper-pagination w3-padding" style="position: relative!important; "></div>
	    </div>
   
	<!-- search bar -->
   	<form method="POST" action="" id="frm" name="frm">
		<input type="hidden" id="id" name="id" value="${SID}">	
		<input type="hidden" id="bno" name="bno" >
		<input type="hidden" id="cno" name="cno" >
		
		<div class="w3-auto w3-center pdt40" >
			<select id="sel" name="sel" class="w3-col w3-quarter w3-select w3-center">
				<option disabled selected>*** 제목 검색 ***</option>
				<option value="col">컬렉션</option>
				<option value="bo">게시글</option>
				
			</select>
			<div class="w3-col w3-threequarter ">
				<input type="text" id="search" name="search" class="w3-input w3-col" style="width: 93%">
				<img id="sertitle" class="w3-rest w3-col" style="width: 40px; height: 40px; "src="/boa/resources/img/k/search.png">
			</div>
		</div>
	</form>
	
	
   <!-- Bottom  -->
   <div class="w3-row-padding w3-padding-64 w3-container" style="margin: 50px auto;">		
      <div class="w3-col w3-display-container" style="margin: 0 auto;">
        	
         <!-- 컬렉션 리스트 보이는 곳 -->
         <div class="w3-col" style = "margin-left: 130px; margin-bottom: 20px;">
            <h3 class="w3-padding ft22" style="float: left;">Weekly <a class='w3-text-red'>TOP!</a> 게시글</h3>
         </div>
         
         <div class=" w3-center w3-col" id="img_container">
 <c:forEach var="data" items="${LIST}" >      
			<div class="inblock w3-center mgl10" >
				<div class="pic w3-round-medium" >
					<img class="top" id="${data.bno}" src="/boa/resources/upload/${data.savename}">
				</div>
				<div class="w3-center w3-text-grey w3-large">
				${data.title}
				</div>
			</div>
</c:forEach>
	  	 </div>
	  	 <!-- 컬렉션 리스트 보이는 곳 끝 -->
			
      </div>
   </div>
   
	
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