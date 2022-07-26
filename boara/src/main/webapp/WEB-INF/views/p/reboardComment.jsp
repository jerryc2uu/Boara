<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>댓글의 댓글 작성 페이지</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/boa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/boa/css/user.css">
<link rel="stylesheet" type="text/css" href="/boa/css/k/soyeon.css">
<script type="text/javascript" src="/boa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/boa/js/p/reboard.js"></script>
<script type="text/javascript" src="/boa/js/k/main.js"></script>
<script type="text/javascript"></script>
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
.w3-bar,h1,button {font-family: "Montserrat", sans-serif}
.fa-anchor,.fa-coffee {font-size:200px}
img {
   width: 150px; 
   height: 200px;
}
</style>
</head>
<body>
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
   
   <!-- First Grid -->
   <div class="w3-row-padding w3-padding-64 w3-container">
   		<h1 class="w3-center w3-padding mg0">대댓글 작성</h1>
   		<div style="width: 800px; height: 200px; margin: 0 auto;">
   			<div class="w3-padding mxw700 mg0 w3-margin-bottom">
		   		<button class="w3-indigo w3-hover-grey listbutton" id="goboard" style="border: none;">게시글로</button>
	   		</div>
			<div class="w3-col w3-center" style="width: 700px; height: 100%;">
				<div class="w3-col w3-round-large w3-card-4 w3-padding" style="height: 200px;">
					<div class="w3-col box120 pdAll10 w3-border-right" style="height: 100%;">
					<c:if test="${not empty param.uprno}">
						<div>대댓글 작성</div>
					</c:if>
				<%-- 	<c:if test="${empty param.uprno}">
						<div>댓글 작성</div>
					</c:if> --%>
						<img src="/boa/resources/upload/${DATA.savename}" class="inblock avtBox100 w3-border w3-border-grey" style="margin-top: 20px;">
					</div>
					<div class="w3-rest w3-padding">
						<div class="w3-col w3-border-bottom">
							<span style="float: left;">${SID}</span>
						</div>
						<form method="POST" action="/boa/reboard/reboardCommentProc.boa" 
											id="frm" name="frm" class="w3-col" style="margin-top:10px;">
							<input type="hidden" id="bno" name="bno" value="${param.bno}">
							<input type="hidden" id="uprno" name="uprno" value="${param.uprno}">
							<input type="hidden" id="nowPage" name="nowPage" value="${param.nowPage}">
							<input type="hidden" id="mno" name="mno" value="${DATA.mno}">
							<input type="hidden" id="cno" name="cno" value="${param.cno}">
							<input type="hidden" id="bnowPage" name="bnowPage" value="${param.bnowPage}">
							<textarea class="w3-col w3-padding ft12" id="rbody" name="body"
										style="resize: none; height:120px;"></textarea>
							<div class="w3-col w3-right" id="" style="height: 15px;">
							 	<label style="float:left;"><input type="checkbox" name="isshow" id="spo" value="S"> 스포일러 포함 시 체크</label>
								<div class="w3-col w3-button w70 w3-indigo w3-right" style="padding-top:2px; width: 55px; height:20px; font-size:5pt;" id="cmtbtn">등록</div>
							</div>
						</form>	
					</div>
				</div>
			</div>
   		</div>
   </div>
   
   <!-- Footer -->
   <footer class="w3-container w3-padding-64 w3-center w3-opacity">
   		<p>(주)보아라</p>
   </footer>



</body>
</html>