<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>포인트 충전</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/boa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/boa/css/user.css">
<link rel="stylesheet" type="text/css" href="/boa/css/k/soyeon.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
	<!-- 데이터 전송용 폼태그 -->
	<form method="POST" action="/boa/member/addPointProc.boa" id="frm" name="frm">
		<input type="hidden" name="id" id="id" value="${SID}">
		<input type="hidden" name="gnp" id="gnp">
		<input type="hidden" name="merchant_uid" id="mer">
		<input type="hidden" name="imp_uid" id="imp">
		<input type="hidden" name="isAuto" id="isAuto">
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
    
    <div class="w3-content w3-center" style="width: 1000px; hegith: 550px;">
	    <div class="w3-content w3-border mxwh1000 w3-card-4" id="spoint" style="margin-top: 50px;" id="${SID}">
	    	<div class="w3-col w3-center w3-padding w3-border-bottom" style="margin-bottom: 30px;">
				<h1>충전할 포인트</h1>
			</div>
			<div class="w3-content w3-col w3-center" style="margin-left: 105px; margin-bottom: 20px;">
	            <label>
	            	<div class="w3-col m3">
		            	<div class="w3-col w3-center w3-border">
		            		<h1>1000P</h1>
		            	</div>
		            	<div class="w3-col">
							<input type="radio" name="money" value="1000" checked="checked">
						</div>
	            	</div>
	            </label>
				<label>
					<div class="w3-col m3 w3-margin-left">
						<div class="w3-col w3-center w3-border">
							<h1>5000P</h1>
						</div>
						<div class="w3-col">
							<input type="radio" name="money" value="5000">
						</div>
					</div>
				</label>
				<label>
					<div class="w3-col m3 w3-margin-left">
						<div class="w3-col w3-center w3-border">
							<h1>10000P</h1>
						</div>
						<div class="w3-col">
							<input type="radio" name="money" value="10000">
						</div>
					</div>
				</label>
	        </div>
			<div class="w3-content w3-col w3-center" style="margin-left: 105px; margin-bottom: 20px;">
	            <label>
	            	<div class="w3-col m3">
		            	<div class="w3-col w3-center w3-border">
		            		<h1>30000P</h1>
		            	</div>
		            	<div class="w3-col">
							<input type="radio" name="money" value="30000">
						</div>
	            	</div>
	            </label>
				<label>
					<div class="w3-col m3 w3-margin-left">
						<div class="w3-col w3-center w3-border">
							<h1>50000P</h1>
						</div>
						<div class="w3-col">
							<input type="radio" name="money" value="50000">
						</div>
					</div>
				</label>
				<label>
					<div class="w3-col m3 w3-margin-left">
						<div class="w3-col w3-center w3-border">
							<h1>100000P</h1>
						</div>
						<div class="w3-col">
							<input type="radio" name="money" value="100000">
						</div>
					</div>
				</label>
	        </div>
	        <div class="w3-col w3-padding w3-border-top w3-border-bottom" style="margin-top: 20px; margin-bottom: 15px;">
	        	<div class="w3-col">
					<label><input type="radio" name="isAuto" id="isAuto" value="N" checked="checked">일반충전</label>
	        	</div>
	        </div>
	        <div class="w3-content w3-col w3-center">
	        	<h3>현재 보유 포인트 : ${DATA.sumpoint} P</h3>
	        </div>
		</div>
	    <div class="w3-content w3-center" style="margin-top: 30px;">
	    	<div class="w3-button w3-center w3-hover-blue w3-indigo btnbox parent" style="width: 200px; float: right; line-height: 45px;" id="pay">결제하기</div>
	    </div>
    </div>
</body>
</html>