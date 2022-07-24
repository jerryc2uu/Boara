<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID/PW SEARCH</title>
<link rel="stylesheet" type="text/css" href="/boa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/boa/css/user.css">
<link rel="stylesheet" type="text/css" href="/boa/css/k/soyeon.css">
<script type="text/javascript" src="/boa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/boa/js/k/idPw.js"></script>
</head>
<style type="text/css">
	.main {
	max-width :900px;
	}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('input[type="radio"]').click(function(){
	    var ckck = $(this).val();
	    if(ckck == 'idsear'){
	    	$('#ids').css('display', 'block');
	    	$('#pws').css('display', 'none');
	    } else if(ckck == 'pwsear'){
	    	$('#ids').css('display', 'none');
   		 	$('#pws').css('display', 'block');
	    }
	});
	$('#idexit').click(function(){
		$('#srchIdResult').css('display', 'none');
		$('#name').val("");
		$('#tel').val("");
		
	});
	$('#pwexit').click(function(){
		$('#srchPwResult').css('display', 'none');
		$('#id').val("");
		$('#mail').val("");
	});
	
});
</script>
<body>
	<div class="w3-center w3-content w3-margin-top main">
		<div class="s8" id="select ">
			<form method="POST" action="" id="frm1" name="frm1">
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
			</form>
			<div>
				<input type="radio" name="select" id="idsel" class=" w3-radio" value="idsear"> <label for="idsel" class="idpwbutton "> ID 찾기</label>
				<input type="radio" name="select" id="pwsel" class=" w3-radio" value="pwsear"> <label for="pwsel" class="idpwbutton"> PW 찾기</label>
			</div>
		</div>	
		<!-- 아이디 찾기 -->
		<div id="ids" style="display: none;">
			<div class="w3-show-inline-block w3-margin-top w3-margin-bottom main" >
				<h1 class="w3-text-indigo w3-xxxlarge w3-padding w3-border-bottom"><b>ID 찾기</b></h1>
				<div class="mgt60 w3-col w3-padding  w3-border">
					<div class="w3-col w3-margin-top ">
						<label for="name" class="w3-col s2 w3-right-align w3-text-grey ft16">이    름 : </label>
						<div class="w3-col m9 pdl10" >
							<input type="text" name="name" id="name" placeholder="이름을 입력하세요" class="w3-margin-left w3-col w3-input ft12 w3-border-bottom">			
						</div>
					</div>
					<div class="w3-col w3-margin-top w3-margin-bottom">
						<label for="tel" class="w3-col m2 w3-right-align w3-text-grey ft16">전화번호 : </label>
						<div class="w3-col m9 pdl10" >
								<input type="text" name="tel" id="tel" placeholder="전화번호를 입력하세요 (-제외)" class="w3-margin-left w3-col w3-input ft12 w3-border-bottom">			
						</div>
					</div>
				</div>
				<div class="w3-col w3-margin-top">
					<div class="w3-button w3-indigo w3-text-white w3-xlarge w3-hover-grey " id="login">Login</div>
					<div class="w3-button w3-indigo w3-xlarge w3-text-white w3-hover-grey" id="idck">Search</div>
				</div>
			</div>
		</div>
	<!-- id 찾았을때 보이는 모달창 -->
	<div class="w3-modal" id="srchIdResult">
		<div class="w3-modal-content w3-animate-top w3-card-4">
		 	<header class="w3-text-white w3-indigo w3-padding w3-border-bottom w3-xlarge">아이디 찾기
		 		 <span id="idexit" class="w3-button w3-display-topright">&times;</span>
		 	</header>
		 	<div class="w3-container ft20">
				<p class="w3-center">회원가입시 사용한 아이디는 </p>
				<b><p class="w3-cell" id ="serid" ></p></b>
				<p class="w3-center"> 입니다.</p>
			</div>
		</div>
	</div>
		<!-- 비번 찾기 -->
		<div id="pws" style="display: none;">
			<div class="w3-show-inline-block w3-margin-top w3-margin-bottom main " >
				<h1 class="w3-text-indigo w3-padding w3-xxxlarge w3-border-bottom"><b>PW 찾기</b></h1>
				<div class="mgt60 w3-col w3-padding  w3-border " >
					<input type="hidden" id="smscer"/>
					<div class="w3-col w3-margin-top">
						<label for="id" class="w3-col s2 w3-right-align w3-text-grey ft16">아이디 : </label>
						<div class="w3-col m9 pdl10" >
							<input type="text" name="id" id="id" placeholder="아이디를 입력하세요" class="w3-margin-left w3-col w3-input ft12 w3-border-bottom">			
						</div>
					</div>
					<div class="w3-col w3-margin-top w3-margin-bottom">
						<label for="tele" class="w3-col s2 w3-right-align w3-text-grey ft16">전화번호 : </label>
						<div class="w3-col m9 pdl10" >
							<input type="text" name="tele" id="tele" placeholder="전화번호를 입력하세요(-제외)" class="w3-margin-left w3-col w3-input ft12 w3-border-bottom">			
						</div>
					</div>
				<div id="certi" class="w3-col w3-margin-top w3-margin-bottom mar3">	
					<div class="w250 w3-center w3-indigo w3-text-white w3-xlarge w3-hover-grey" >본인인증</div>
				</div>	
					<div id="smstag" class="w3-col w3-margin-top w3-margin-bottom">
						<label for="sms" class="w3-col m2 w3-right-align w3-text-grey ft16 ">인증번호 : </label>
						<div class="w3-col m9 pdl10" >
								<input type="text" name="text" id="sms" disabled required placeholder="인증번호를 입력하세요" class="w3-margin-left w3-col w3-input s9 ft12 w3-border-bottom">			
								<div id="smsok" class=" s2 w3-col w3-right w3-indigo w3-text-white w3-xlarge w3-hover-grey" >확인</div>
						</div>
					</div>
				</div>
				<div class="w3-col w3-margin-top">
					<div class="w3-button w3-indigo w3-text-white w3-xlarge w3-hover-grey" id="login2">Login</div>
					<div class="w3-button w3-indigo w3-text-white w3-xlarge w3-hover-grey" id="pwck">Search</div>
				</div>
			</div>
		</div>
 
	<!-- 문장 인증 받았을때 비밀번호 변경할 수 있는 모달창 -->
	<div class="w3-modal" id="srchPwResult">
		<div class="w3-modal-content w3-animate-top w3-card-4">
		 	<header class="w3-text-white w3-indigo w3-padding w3-border-bottom w3-xlarge">비밀번호 변경
		 	 	<span id="pwexit" class="w3-button w3-display-topright">&times;</span>
		 	</header>
		 	<div id="modal" class="w3-container ft13" >
				<div class="mgt20 w3-content">
				<label for="pw" class="w3-col s3 w3-right-align ">비밀번호 : </label>
				<div class="w3-col m8">
					<input type="password" name="pw" id="pw" class="ft10 w3-margin-bottom w3-margin-left w3-col w3-input w3-border w3-round-medium"
							placeholder="[대,소문자,숫자,특수문자로 구성된 7~15 글자]">
				</div>
			</div>
			<div class="mgt20 w3-content">
				<label for="repw" class="w3-col s3 w3-right-align ">확인 : </label>
				<div class="w3-col m8">
					<input type="password" id="repw" class="w3-margin-bottom ft10 w3-margin-left w3-col w3-input w3-border w3-round-medium">
					<span class="w3-col mgb10 w3-text-red ft10 w3-center" id="repwmsg">비밀번호 체크 처리 메세지</span>
				</div>
				<div id="updatePw" class="w3-col w3-margin-top w3-margin-bottom mar2">	
					<div class="w250 w3-center w3-indigo w3-text-white w3-xlarge w3-hover-grey" >변경</div>
				</div>	
				
			</div>
			</div>
		</div>
	</div>
	
	</div>
	
	<!-- 통신오류 모달창 -->
		<div id="id01" class="w3-modal">
	    <div class="w3-modal-content">
	      <header id="color" class="w3-container" style="background-color:red; color:#fff"> 
	        <span onclick="document.getElementById('id01').style.display='none'" 
	        class="w3-button w3-display-topright">&times;</span>
	        <h4 id="head" class="w3-center">ERROR</h4>
	      </header>
	      <div class="w3-container w3-center">
	        <h5 id="mod">통신오류</h5>
	      </div>
	    </div>
	</div>
</body>
</html>