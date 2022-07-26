<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN PAGE</title>
<link rel="stylesheet" type="text/css" href="/boa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/boa/css/user.css">
<link rel="stylesheet" type="text/css" href="/boa/css/k/soyeon.css">
<script type="text/javascript" src="/boa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/boa/js/k/login.js"></script>
<style type="text/css">
	#msg {
		font-size: 20pt;
		font-weight: bold;
		color: indigo;
	}
	.main{
	max-width : 900px;
	}	
</style>

</head>
<body>
	<div class="w3-content w3-center main">
		<h1 class="w3-text-indigo w3-xxxlarge w3-padding w3-border-bottom"><b>Login</b></h1>
		<form method="POST" action="" class="w3-col w3-padding w3-border h200 mgt60 " id="frm" name="frm">
<c:if test="${not empty param.vw}">
			<input type="hidden" name="vw" value="${param.vw}">
			<input type="hidden" name="nowPage" value="${param.nowPage}">
</c:if>
<c:if test="${not empty param.cno}">
			<input type="hidden" name="cno" id="cno" value="${param.cno}">
</c:if>
<c:if test="${not empty param.bno}">
			<input type="hidden" name="bno" id="bno" value="${param.bno}">
</c:if>
<c:if test="${not empty param.cid}">
			<input type="hidden" name="cid" id="cid" value="${param.cid}">
</c:if>
			<div class="w3-col  mgt30">
				<label for="id" class="w3-col s2 w3-right-align w3-text-grey ft18">I D : </label>
				<div class="w3-col m9 ">
					<input type="text" name="id" id="id" placeholder="아이디를 입력하세요"
							class="w3-col ft15 w3-input w3-border-bottom w3-margin-left">
				</div>
			</div>
			<div class="w3-col w3-margin-top w3-margin-bottom">
				<label for="pw" class="w3-col s2 w3-right-align w3-text-grey ft18">P W : </label>
				<div class="w3-col m9">
					<input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요"
							class="w3-col ft15 w3-input w3-border-bottom w3-margin-left">
				</div>
			</div>
		</form>
		<div class="w3-col mgt30">
			<div class="w3-half w3-indigo w3-text-white w3-hover-grey w3-xlarge" id="hbtn">Main</div>
			<div class="w3-half w3-indigo w3-text-white w3-hover-grey w3-xlarge" id="lbtn">Login</div>
		</div>
		<div class="w3-col w3-margin-top">
			<div class="w3-button w3-text-indigo w3-right w3-large" id="check">ID / PW 확인</div>
			<div class="w3-button w3-text-indigo w3-right w3-large" id="join">JOIN</div>
		</div>
		<div class="w3-col w3-padding w3-card-4 w3-hide"><span id="msg">${SID} 님은 이미 로그인했습니다.</span></div>
	</div>
		  
	  <!-- 통신오류 모달창 -->
	  <div id="id01" class="w3-modal">
	    <div class="w3-modal-content">
	      <header class="w3-container w3-red"> 
	        <span onclick="document.getElementById('id01').style.display='none'" 
	        class="w3-button w3-display-topright">&times;</span>
	        <h4 class="w3-center">ERROR</h4>
	      </header>
	      <div class="w3-container w3-center">
	        <h4 id="mod">통신오류</h4>
	      </div>
	    </div>
	  </div>
	  
	  <!-- 휴면계정 인증 모달창 -->
	  <div id="id02" class="w3-modal">
	    <div class="w3-modal-content">
	      <header class="w3-container w3-indigo"> 
	        <span onclick="document.getElementById('id02').style.display='none'" 
	        class="w3-button w3-display-topright">&times;</span>
	        <h4 class="w3-center">휴면계정 해제</h4>
	      </header>
	      <div class="w3-col  w3-white w3-margin-bottom w3-container w3-text-grey ">
	      	<div class="mgt20 w3-content">
				<label for="email" class="w3-right-align w3-col s2 ftj14">회원메일 : </label>
				<div class="w3-col m9">
					<input type="text" name="email" id="email" class="ft12 w3-margin-bottom w3-margin-left  w3-col m9 w3-input w3-border w3-round-medium"
							placeholder="메일을 입력하세요">	
					<div class=" w3-col s2 w3-right w3-button w3-indigo w3-round-medium ft12 " id="mailck">certify</div>
					<span class="w3-col mgb10 w3-center ft10 w3-text-green w3-margin-bottom" id="mailmsg">인증번호 전송 처리 메세지</span>
				</div>
			</div>
	        <div class="mgt20 w3-content">
				<label for="certi" class="w3-right-align w3-col s2 ftj14">인증번호 : </label>
				<div class="w3-col m9">
					<input id="certi" name="certi"class="form-control w3-margin-left  w3-margin-bottom ft12 w3-col m9 w3-input w3-border"  disabled="disabled" placeholder="인증번호 6자리를 입력해주세요"  maxlength="6">
					<div class=" w3-col s2 w3-right w3-button w3-indigo w3-round-medium ft12" id="cerck">check</div>
					<span class="w3-col mgb10 w3-center ft10 w3-text-green w3-margin-bottom" id="cermsg">인증번호 체크 처리 메세지</span>
					<input id="code" name="code" style="display:none;">
				</div>
			</div>
			<div class="w3-center">
				<div id="clear" class="inblock w3-center mgtb30 w3-button w3-indigo w3-round-medium w150">해제</div>
				<span class="w3-col mgb10 w3-center ft10 w3-text-green w3-margin-bottom" id="error">통신에러</span>
			</div>
			</div>
	    </div>
	  </div>

</body>
</html>