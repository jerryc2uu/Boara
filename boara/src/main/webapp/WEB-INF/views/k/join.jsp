<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOIN PAGE</title>
<link rel="stylesheet" type="text/css" href="/boa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/boa/css/user.css">
<link rel="stylesheet" type="text/css" href="/boa/css/k/soyeon.css">
<script type="text/javascript" src="/boa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/boa/js/k/join.js"></script>

<style type="text/css">
	.main {
	max-width :900px;
	}
	#idmsg, #telmsg, #repwmsg, #mailmsg, #cermsg{
	display: none;
	}  
	 
	.picbox {
	width: 300px;
	height: 300px;
	margin-left: 10px;
	overflow: hidden;
	display: inline-block;
	margin-top : 10px;
	margin-bottom : 20px;
}
</style>
</head>
<body>
	<div class="w3-content w3-center main">
		<h1 class="w3-text-indigo w3-padding w3-xxxlarge w3-border-bottom "><b>BOARA 회원가입</b></h1>
		<form method="POST" action="" name="frm" id="frm" encType="multipart/form-data"
									class="w3-col mgt60 w3-border w3-margin-bottom w3-text-grey w3-padding">
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
			<div class="mgt20  w3-content">
				<label for="name" class="w3-col s3 w3-right-align ft16">회원이름 : </label>
				<div class="w3-col m8">
					<input type="text" name="name" id="name"class="ft12 w3-margin-bottom w3-margin-left w3-col w3-input w3-border w3-round-medium" 
								placeholder="이름을 입력하세요">
				</div>				
			</div>
			
			<div class="mgt20 w3-content">
				<label for="id" class="w3-col s3 w3-right-align ft16">아 이 디 : </label>
				<div class="w3-col m8">
					<input type="text" name="id" id="id" class="ft12 w3-margin-bottom w3-margin-left w3-col w3-input w3-border w3-round-medium" 
								placeholder="아이디를 입력하세요 [10글자 이하]">
					<span class="w3-col mgb10 w3-center w3-text-green" id="idmsg">아이디 체크 처리 메세지</span>
				</div>
			</div>
			<div class="mgt20 w3-content">
				<label for="pw" class="w3-col s3 w3-right-align ft16">비밀번호 : </label>
				<div class="w3-col m8">
					<input type="password" name="pw" id="pw" class="ft12 w3-margin-bottom w3-margin-left w3-col w3-input w3-border w3-round-medium"
							placeholder="[대,소문자,숫자,특수문자로 구성된 7~15 글자]">
				</div>
			</div>
			<div class="mgt20 w3-content">
				<label for="repw" class="w3-col s3 w3-right-align ft16">비밀번호 확인 : </label>
				<div class="w3-col m8">
					<input type="password" id="repw" class="w3-margin-bottom ft12 w3-margin-left w3-col w3-input w3-border w3-round-medium">
					<span class="w3-col mgb10 w3-text-red w3-center" id="repwmsg">비밀번호 체크 처리 메세지</span>
				</div>
			</div>
			<div class="mgt20 w3-content">
				<label for="birth" class="w3-col s3 w3-right-align ft16">생년월일 : </label>
				<div class="w3-col m8">
					<input type="date" id="birth" name="birth" class="w3-margin-bottom ft12 w3-margin-left w3-col w3-input w3-border w3-round-medium">
				</div>
			</div>
			<div class="mgt20  w3-content">
				<label for="tel" class="w3-col s3 w3-right-align ft16">전화번호 : </label>
				<div class="w3-col m8">
					<input type="text" name="tel" id="tel" class="ft12 w3-margin-bottom w3-margin-left w3-col w3-input w3-border w3-round-medium"
								placeholder="전화번호를 입력하세요 (-제외)">
					<span class="w3-col mgb10 w3-center w3-text-green w3-margin-bottom" id="telmsg">전화번호 체크 처리 메세지</span>
				</div>
			</div>		
			<div class="mgt20 w3-content">
				<label for="email" class="w3-col s3 w3-right-align ft16">회원메일 : </label>
				<div class="w3-col m8">
					<input type="text" name="email" id="email" class="ft12 w3-margin-bottom w3-margin-left w3-col m9 w3-input w3-border w3-round-medium"
							placeholder="메일을 입력하세요">
					<div class=" w3-col m2 w3-right w3-button w3-indigo w3-text-white w3-round-medium ft15 " id="mailck">certify</div>
					<span class="w3-col mgb10 w3-center w3-text-green w3-margin-bottom" id="mailmsg">메일 체크 처리 메세지</span>
				</div>
			</div>
			<div class="mgt20 w3-content">
				<label for="certi" class="w3-col s3 w3-right-align ft16">본인인증 : </label>
				<div class="w3-col m8">
					<input id="certi" name="certi" class="form-control w3-margin-left w3-margin-bottom ft12 w3-col m9 w3-input w3-border"  disabled="disabled" placeholder="인증번호 6자리를 입력해주세요"  maxlength="6">
					<div class=" w3-col m2 w3-right w3-button w3-indigo w3-text-white w3-round-medium ft15" id="cerck">check </div>
					<span class="w3-col mgb10 w3-center w3-text-green w3-margin-bottom" id="cermsg">인증번호 체크 처리 메세지</span>
					<input id="code" name="code" style="display:none;">
				</div>
			</div>
			<div class="mgt20 w3-content">
				<label for="file" class="w3-col s3 w3-right-align ft16">프로필 사진 : </label>
				<div class="w3-col m8" id="filebox">
					<input type="file" id="file" name="file" class="ft12 upfile w3-input w3-border w3-col w3-margin-left w3-round-medium w3-margin-bottom">
				</div>
			</div>
			<div class="mgt20 w3-content">
				<label class="w3-col s3 w3-right-align ft16">preview : </label>
				<div class="w3-col m8" >
					<div class="w3-display-container picbox " >
						<img id="img1" class="w3-display-middle" style="width: 100%; height: auto;" src="">
					</div>
				</div>
			</div>
		</form>
		<div class="w3-col w3-margin-top w3-card-4 mgb30 ">
			<div class="w3-third w3-text-white w3-indigo w3-padding w3-xlarge w3-hover-grey" id="rbtn">Reset</div> 
			<div class="w3-third w3-text-white w3-indigo w3-padding w3-xlarge w3-hover-grey" id="hbtn">Main</div> 
			<div class="w3-third w3-text-white w3-indigo w3-padding w3-xlarge w3-hover-grey" id="jbtn">Join</div> 
		</div>
	</div>
	
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