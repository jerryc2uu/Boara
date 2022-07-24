<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>컬렉션 리스트</title>
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
<script type="text/javascript" src="/boa/js/c/collec.js"></script>
<script type="text/javascript" src="/boa/js/k/main.js"></script>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
.w3-bar,h1,button {font-family: "Montserrat", sans-serif}
.fa-anchor,.fa-coffee {font-size:200px}
</style>
</head>
<body>
   <!-- Navbar -->
   <div class="w3-top fix">
     <div id="nv" class="w3-bar w3-indigo w3-card w3-left-align w3-xlarge " >
       <a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white " id="main">Main</a>
       <a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white" id="collection">Collection</a>
<c:if test="${not empty SID}">      
       <a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white" id="mwrite">Write</a>
       <a class="w3-bar-item w3-button w3-hide-small w3-padding w3-hover-white" id="mcoll">New Collection</a>
</c:if>   
<c:if test="${empty SID}">
     <a class="w3-bar-item w3-button w3-hide-small w3-right w3-padding w3-hover-white " id="mlogin">Login</a>
     <a class="w3-bar-item w3-button w3-hide-small w3-right w3-padding w3-hover-white " id="mjoin">Join</a>
</c:if>
<c:if test="${not empty SID}">
     <a class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white"id="mlogout">Logout</a>   
     <a class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" id="msid">${SID}</a>   
     <a class="w3-bar-item w3-button w3-hide-small w3-right w3-hover-white" id="message">
     	<img  src="/boa/resources/img/k/message.png" style=" width:55px; height:35px;"  > 
     </a>   
</c:if>           
     </div>
   </div>
	<%-- Header --%>
	<header class="w3-container w3-indigo w3-center" style="padding:40px 16px; height: 200px;">
<c:if test="${empty CINFO}">
		<h1 class="pdt40 w3-xxxlarge dfn"><b>Boara</b></h1>
</c:if>
<c:if test="${not empty CINFO}">
		<h1 class="pdt40 w3-xxxlarge dfn"><b>${CID}'s Collection</b></h1>
</c:if>
	</header>
	<!-- 쪽지 모달 -->	
	<div id="id01" class="w3-padding w3-modal" >
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
	     
	<%-- First Grid --%>
	<div class="w3-row-padding w3-padding-64 w3-container">

<%--컬렉션 리스트 --%>
<c:if test="${not empty LIST}">
	<c:forEach var="data" items="${LIST}">

		<div class="w3-col w3-display-container w3-center">
			<div class="w3-border-bottom collbox w3-center w3-margin-bottom">
				<div class="thumbbox w3-border-right w3-col m2 cbox" id="${data.cno}">
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
				<div class="colldetail w3-margin-left w3-col m7 cbox" id="${data.cno}">
					<div class="w3-padding w3-left w3-col h100" id="${data.cno}">
			 			<h1 class="w3-left inline mgt30">${data.cname}</h1>
					</div>
			<c:if test="${not empty data.genre}">
				<c:forEach var="gnr" items="${data.genre}">
						<div class="genre w3-round w3-left">${gnr}</div>
				</c:forEach>
			</c:if>
			<c:if test="${not empty data.descr}">
				<c:if test="${fn:length(data.descr) > 15}">
					<h4 class="w3-left-align c-left pdt20">${fn:substring(data.descr, 0, 15)}...</h4>
				</c:if>
				<c:if test="${fn:length(data.descr) <= 15}">
					<h4 class="w3-left-align c-left pdt20">${data.descr}</h4>
				</c:if>
			</c:if>
				</div>
				<div class="w3-col m2" id="${data.cno}">
		<c:if test="${data.id eq SID}">
						<div class="noti w3-right ebtn w3-round ebtn">수정</div>
						<div class="noti w3-right dbtn w3-round dbtn">삭제</div>
		</c:if>
				</div>
			</div>
		</div>
	
	</c:forEach>
</c:if>
<c:if test="${empty LIST}">
	<div class="w3-center w3-content">
		<p>불러올 컬렉션이 없습니다.</p>
	</div>
</c:if>
	</div>
   
   
   <%-- 페이지 처리 --%>
   <div class="w3-center">
			<div class="w3-bar w3-border w3-round-medium w3-card w3-margin-top w3-margin-bottom">
	<c:if test="${PAGE.startPage eq 1}">
				<div class="w3-bar-item w3-light-grey">&laquo;</div>
	</c:if>
	<c:if test="${PAGE.startPage ne 1}">
				<div class="w3-bar-item w3-button w3-hover-blue cpbtn" id="${PAGE.startPage - 1}">&laquo;</div>
	</c:if>
	<c:forEach var="page" begin="${PAGE.startPage}" end="${PAGE.endPage}">
			<c:if test="${page eq PAGE.nowPage}">
				<div class="w3-bar-item w3-orange">${page}</div>
			</c:if>
			<c:if test="${page ne PAGE.nowPage}">
				<div class="w3-bar-item w3-button w3-hover-blue cpbtn" id="${page}">${page}</div>
			</c:if>
	</c:forEach>
			<c:if test="${PAGE.endPage eq PAGE.totalPage}">
				<div class="w3-bar-item w3-light-grey">&raquo;</div>
			</c:if>
			<c:if test="${PAGE.endPage ne PAGE.totalPage}">
				<div class="w3-bar-item w3-button w3-hover-blue cpbtn" id="${PAGE.endPage + 1}">&raquo;</div>
			</c:if>
			</div>
		</div>
   
	<%-- Footer --%>
	<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-border-top">
		<p>(주)보아라</p>
	</footer>
	
	<%-- 메세지창 --%>
	<c:if test="${not empty MSG}">
		<div id="modal" class="w3-modal" style="display: block;">
			<div class="w3-modal-content mxw650 w3-animate-top w3-card-4">
				<header class="boablue w3-container">
					<span onclick="document.getElementById('modal').style.display='none'"
						class="w3-button w3-display-topright">&times;</span>
						<h2>실행 결과</h2>
				</header>
				<div class="w3-container w3-center">
					<h4>${MSG}</h4>
				</div>
			</div>
		</div>
</c:if>
	
	<%-- 데이터 전송용 폼 --%>
	<form method="POST" name="frm" id="frm">
		<input type="hidden" name="nowPage" id="nowPage" value="${PAGE.nowPage}">
		<input type="hidden" name="cno" id="cno">
		<input type="hidden" name="id" id="id" value="${SID}">
		<input type="hidden" name="vw" id="vw" value="/boa/collection/collecList.boa">
<c:if test="${not empty CID}">
		<input type="hidden" name="cid" id="cid" value="${CID}">
</c:if>
	</form>

<script>
// Used to toggle the menu on small screens when clicking on the menu button
function myFunction() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}
</script>

</body>
</html>