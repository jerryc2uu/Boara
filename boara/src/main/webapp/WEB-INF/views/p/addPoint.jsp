<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title> 포인트 충전</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/boa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/boa/css/user.css">
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
	</form>
	
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
						<input type="radio" name="money" value="1000">
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
        <div class="w3-content w3-col w3-center">
        	<h3>현재 보유 포인트 : ${DATA.sumpoint} P</h3>
        </div>
	</div>
    <div class="w3-content w3-col w3-center" style="margin-left: 1350px; margin-top: 30px;">
    	<div class="w3-button w3-center w3-hover-blue w3-indigo btnbox parent" style="width: 200px;"id="pay">결제하기</div>
    </div>
</body>
</html>