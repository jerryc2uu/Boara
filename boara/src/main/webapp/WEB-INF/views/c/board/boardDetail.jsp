<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>${POST.title}</title>
<meta charset="UTF-8">
<meta name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
/>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" type="text/css" href="/boa/css/c/ez.css">
<link rel="stylesheet" type="text/css" href="/boa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/boa/css/user.css">
<link rel="stylesheet" type="text/css" href="/boa/css/k/soyeon.css">
<script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
<script type="text/javascript" src="/boa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/boa/js/c/board.js"></script>
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
	        
	<%-- Header --%>
	<header class="w3-container w3-indigo w3-center" style="padding:40px 16px; height: 200px;">
		<h1 class="pdt40 w3-xxxlarge dfn"><b>Boara</b></h1>
	</header>
   
	<%-- First Grid --%>
	<div class="w3-center">
		<div class="w3-row-padding w3-padding-64 w3-container w700 inline">
			<div class="w3-border-bottom">
				<div>
					<h6 class="gray left">[${POST.bno}]</h6>
				</div>
				<div class="w3-col">
					<div class="w3-col m1">
	<c:if test="${POST.isshow eq 'A'}">
						<div class="noti w3-round w3-left mgt20 mgl10">공지</div>
	</c:if>
	<c:if test="${POST.forwho eq 'A'}">
						<div class="adult w3-round w3-left mgt20 mgl10">성인</div>
	</c:if>
					</div>
					<div class="w3-col m10 w3-margin-left">
						<h1 class="w3-left left inline mgt10 chgline">${POST.title}</h1>
					</div>
				</div>
	<c:if test="${not empty POST.sgenre}">
				<div class="left">
		<c:forEach var="genr" items="${POST.genre}">
					<div class="genre w3-round">${genr}</div>
		</c:forEach>
				</div>
	</c:if>
				<h4 class="gray left pdl10">${POST.id}<c:if test="${POST.price ne 0}"> ${POST.price}P</c:if></h4>
		
				<h6 class="gray right">${POST.sdate} 조회수 : ${POST.click}</h6>
			</div>
			<p class="left chgline pdb5" class="w3-border-bottom">${POST.body}</p>
<c:if test="${POST.price ne 0}">
	<c:if test="${POST.bought eq 'NO'}">
			<div class="w3-col w3-border-bottom" style="padding-bottom: 10px;">
				<div class="w3-col w3-light-gray w3-round w3-padding">
					<h6 class="w3-left-align">미리보기 분량은 300자입니다.
					<br>${POST.price}P로 해당 게시글을 전체 열람하실 수 있습니다.</h6>
					<div class="genre w3-round w3-right align" id="buyPost">${POST.price}P</div>
				</div>
			</div>
	</c:if>
</c:if>

			<div class="left mgt10">
				<div class="inline mgt10">
			<%-- 좋아요, 찜 기능 구현해야됨!!!! --%>
<c:if test="${not empty SID}">
	<c:if test="${POST.id ne SID}">
		<c:if test="${POST.price eq 0}">
					<img src="/boa/img/c/
			<c:if test="${POST.nowStat eq 'L'}">
					liked
			</c:if>
			<c:if test="${POST.nowStat ne 'L'}">
					unlike
			</c:if>
					.jpg" class="like" id="<c:if test="${POST.nowStat ne 'L'}">un</c:if>like">
		</c:if>
		<c:if test="${POST.price ne 0}">
			<c:if test="${POST.bought eq 'YES'}">
					<img src="/boa/img/c/
				<c:if test="${POST.nowStat eq 'L'}">
					liked
				</c:if>
				<c:if test="${POST.nowStat ne 'L'}">
					unlike
				</c:if>
		.jpg" class="like" id="<c:if test="${POST.nowStat ne 'L'}">un</c:if>like">
			</c:if>
			<c:if test="${POST.bought ne 'YES'}">
					<div class="w3-round-large genre jjim
				<c:if test="${POST.nowStat eq 'J'}">
					w3-indigo
				</c:if>
					" id="<c:if test="${POST.nowStat eq 'J'}">jjimed</c:if><c:if test="${POST.nowStat ne 'J'}">jjimyet</c:if>">+ 찜</div>
			</c:if>
		</c:if>
	</c:if>
</c:if>
					<div class="genre w3-round" id="reshow">댓글 보기</div>
					<div class="genre w3-round" id="upcoll">컬렉션으로</div>
				</div>
<c:if test="${POST.id eq SID && not empty SID}">
				<div style="text-align:right">
					<div class="genre w3-round" id="ebtn">수정</div>
					<div class="genre w3-round" id="dbtn">삭제</div>
				</div>
</c:if>
			</div>
		</div>
	</div>
	
	<%-- 파라미터용 모달창 --%>
<c:if test="${not empty param.msg}">
	<div class="w3-center w3-modal" style="display: block;" id="paramModal">
		<div class="w3-modal-content mxw650 w3-animate-top w3-card-4">
			<header class="boablue w3-container">
				<span onclick="document.getElementById('paramModal').style.display='none'"
					class="w3-button w3-display-topright">&times;</span>
					<h2>INFO</h2>
			</header>
			<div class="w3-container w3-center">
				<h4>${param.msg}</h4>
			</div>
		</div>
	</div>
</c:if>

	<%-- 일반 모달창 --%>
	<div id="modal" class="w3-center w3-modal" style="display: none;">
		<div class="w3-modal-content mxw650 w3-animate-top w3-card-4">
			<header class="boablue w3-container">
				<span onclick="document.getElementById('modal').style.display='none'"
					class="w3-button w3-display-topright">&times;</span>
					<h2>INFO</h2>
			</header>
			<div class="w3-container w3-center">
				<h4 id="mdcontext"></h4>
				<div class="genre w3-round w3-margin-bottom w3-right" id="buy" style="display: none;">구매</div>
				<div class="genre w3-round w3-margin-bottom w3-right" id="cancel" style="display: none;">취소</div>
			</div>
		</div>
	</div>
		
		
	
	<%-- Footer --%>
	<footer class="w3-container w3-padding-64 w3-center w3-opacity w3-border-top">
		<p>(주)보아라</p>
	</footer>
	
	<%-- 데이터 전송용 폼 --%>
	<form method="POST" name="frm" id="frm">
<c:if test="${POST.price ne 0}">
		<input type="hidden" name="gnp" id="gnp" value="${POST.price}">
</c:if>
<c:if test="${not empty param.nowPage}">
		<input type="hidden" name="nowPage" id="nowPage" value="${param.nowPage}">
</c:if>
<c:if test="${empty param.nowPage}">
		<input type="hidden" name="nowPage" id="nowPage" value="1">
</c:if>
		<input type="hidden" name="bno" id="bno" value="${POST.bno}">
		<input type="hidden" name="cno" id="cno" value="${POST.cno}">
<c:if test="${not empty SID}">
		<input type="hidden" name="id" id="id" value="${SID}">
</c:if>
		<input type="hidden" name="wid" id="wid" value="${POST.id}">
		<input type="hidden" name="vw" value="/boa/board/boardDetail.boa">
	</form>

</body>
</html>