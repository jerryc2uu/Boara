<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>게시글 작성</title>
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
	<div class="w3-row-padding w3-padding-64 w3-container">
		<div class="w3-col w3-padding">
			<form method="POST" name="frm" id="frm" class="w3-center" encType="multipart/form-data"
				action="/boa/board/boardWriteProc.boa">
				<div class="w3-col w3-margin-bottom w3-margin-top">
					<label for="title" class="w3-col m3 w3-padding" style="text-align:right">게시글 이름 : </label>
					<input type="text" class="w3-input w3-col m7" id="title" name="title">
				</div>
				<div class="w3-col w3-margin-bottom w3-margin-top">
					<label for="isshow" class="w3-col m3 w3-padding" style="text-align:right">공개 범위 : </label>
					<label class="w3-col m2 left mgt10"><input type="radio" id="noti" name="isshow" value="A">공지</label>
					<label class="w3-col m2 left mgt10"><input type="radio" id="noti" name="isshow" value="Y" checked>일반</label>
					<label class="w3-col m2 left mgt10"><input type="radio" id="noti" name="isshow" value="L">비공개</label>
				</div>
				<div class="w3-col w3-margin-bottom w3-margin-top">
					<label for="forwho" class="w3-col m3 w3-padding" style="text-align:right">이용가 설정 : </label>
					<label class="w3-col m3 left mgt10"><input type="radio" id="noti" name="forwho" value="A">성인</label>
					<label class="w3-col m3 left mgt10"><input type="radio" id="noti" name="forwho" value="C" checked>전체 이용가</label>
				</div>
				<div class="w3-col w3-margin-bottom w3-margin-top">
					<label for="cno" class="w3-col m3 w3-padding" style="text-align:right">컬렉션 : </label>
					<input type="text" class="w3-input w3-col m7" id="cno" name="cno" list="clist">
					<datalist id="clist">
<c:if test="${not empty CLIST}">
	<c:forEach var="coll" items="${CLIST}">
						<option value="${coll.cno}">${coll.cname}</option>
	</c:forEach>
</c:if>
<c:if test="${empty CLIST}">
						<option>선택할 컬렉션이 없습니다.</option>
</c:if>
					</datalist>
				</div>
				<div class="w3-col w3-margin-bottom w3-margin-top">
					<label for="price" class="w3-col m3 w3-padding right">가격 : </label>
					<input type="text" class="w3-input w3-col m7" id="price" name="price">
				</div>
				<h6 class="w3-text-indigo w3-left-align inline">유료글 설정시 미리보기 분은 300글자 입니다.</h6>
				<div class="w3-col w3-margin-bottom">
					<label for="genr" class="w3-col m3 w3-padding right genrcolumn">장르(선택, 최대 5개) : </label>
<c:forEach var="genr" items="${GLIST}">
					<label class="w3-col m3 left mgt10"><input type="checkbox" id="genr" name="genr" value="${genr.gno}"> ${genr.gname}</label>
</c:forEach>
				</div>
				<div class="w3-col w3-margin-bottom">
					<label for="descr" class="w3-col m3 w3-padding right">내용 : </label>
					<textarea class="w3-col m7 w3-input w3-padding w3-border w3-margin-bottom norsize" 
						id="body" name="body" rows="20"></textarea>
				</div>
				<div class="w3-col w3-margin-bottom">
					<label for="thumb" class="w3-col m3 w3-padding right">썸네일(선택) : </label>
					<input type="file" class="w3-input w3-col m7" id="thumb" name="thumb">
				</div>
				<div class="w3-col w3-margin-bottom" id="previewbox">
					<label class="w3-col m3 w3-padding right">썸네일 미리보기 : </label>
					<div class="w3-col m7 w3-center">
						<div class="thbox">
							<img class="thumb" id="preview" src="/boa/img/noimage.jpg">
						</div>
					</div>
				</div>
				
				<%-- 데이터 전송용 --%>
				<input type="hidden" name="sgenre" id="genre">
				<input type="hidden" name="id" id="id" value="${SID}">
				<input type="hidden" name="vw" value="/boa/board/boardWrite.boa">
			</form>
		</div>
			
			<%-- 생성 버튼 --%>
		<div style="text-align:right">
			<div class="genre w3-round w3-margin-top" id="wpbtn">작성</div>
		</div>
		
		
		<%-- 모달창 --%>
		<div id="modal" class="w3-center w3-modal" style="display: none;">
			<div class="w3-modal-content mxw650 w3-animate-top w3-card-4">
				<header class="boablue w3-container">
					<span onclick="document.getElementById('modal').style.display='none'"
						class="w3-button w3-display-topright">&times;</span>
						<h2>주의</h2>
				</header>
				<div class="w3-container w3-center">
					<h4 id="mdcontext"></h4>
				</div>
			</div>
		</div>
	</div>
   
</body>
</html>