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

<!-- ##########################여기서부터 동일 -->
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

쪽지 모달 추가!!!

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
                      <textarea id="body" name="body" rows="10" class="w3-col ft13 ck" style="resize: none;"   ></textarea>
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
   <header class="w3-container w3-indigo w3-center" style="padding:40px 16px; height: 200px;">
       <h1 class="pdt40 w3-xxxlarge dfn"><b>Boara</b></h1>
   </header>
	<!-- ###########################여기까지 동일 -->


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
					<h4><span class="w3-col m2">포인트 : </span><span class="w3-col m3 w3-margin-right" style="text-align:right;" id="point"><strong id="spoint">${DATA.sumpoint}</strong></span></h4>
						<div class="w3-rest w3-button w3-indigo w3-hover-orange" id="plusPoint">충전</div>
						<c:if test="${DATA.isAuto eq 'A'}">						
							<div class="w3-rest w3-button w3-green w3-hover-yellow w3-margin-left" id="notAuto">자동 충전 해지</div>
						</c:if>
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
						<dt>포인트</dt>
							<dd>포인트 이용 내역</dd>
						<dt>게시물 관련</dt>
							<dd>나의 컬렉션</dd>
							<dd>좋아요 목록</dd>
							<dd>찜 목록</dd>
							<dd>구매한 게시글</dd>
					</dl>
	   			</div>
	  	 </nav>
	  	 <!-- 보여질 기능들 -->
			<div class="w3-rest w3-text-grey w3-margin-left">
			
			<!-- 버튼마다 다른 기능들-->
	         <div id="area" style="position: relative; width: 100%; padding-bottom: 56.25%;">
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
   
   	<!-- 메세지 출력 모달창 -->
<c:if test="${not empty param.msg}">
	<div id="modal" class="w3-modal" style="display:block;">
	    <div class="w3-modal-content mxw650 w3-animate-top w3-card-4">
	      <header class="w3-container w3-indigo"> 
	        <span onclick="document.getElementById('modal').style.display='none'" 
	        class="w3-button w3-display-topright">&times;</span>
	        <h2>BOARA Message</h2>
	      </header>
	      <div class="w3-container w3-center">
	        <h4>${param.msg}</h4>
	      </div>
	    </div>
 	</div>
</c:if>

   <footer class="w3-container w3-margin-top w3-padding-64 w3-center w3-opacity w3-border-top">
		<p>(주)보아라</p>
	</footer>

</body>
</html>