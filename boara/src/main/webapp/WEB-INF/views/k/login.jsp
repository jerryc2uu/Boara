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
			<div class="w3-col  mgt30">
				<label for="id" class="w3-col s2 w3-right-align w3-text-grey ft22">I D : </label>
				<div class="w3-col m9 ">
					<input type="text" name="id" id="id" placeholder="아이디를 입력하세요"
							class="w3-col ft18 w3-input w3-border-bottom w3-margin-left">
				</div>
			</div>
			<div class="w3-col w3-margin-top w3-margin-bottom">
				<label for="pw" class="w3-col s2 w3-right-align w3-text-grey ft22">P W : </label>
				<div class="w3-col m9">
					<input type="password" name="pw" id="pw" placeholder="비밀번호를 입력하세요"
							class="w3-col ft18 w3-input w3-border-bottom w3-margin-left">
				</div>
			</div>
		</form>
		<div class="w3-col mgt30">
			<div class="w3-half w3-indigo w3-text-white w3-hover-grey w3-xlarge" id="hbtn">Main</div>
			<div class="w3-half w3-indigo w3-text-white w3-hover-grey w3-xlarge" id="lbtn">Login</div>
		</div>
		<div class="w3-col w3-margin-top">
			<div class="w3-button w3-text-indigo w3-right w3-xlarge" id="check">ID / PW 확인</div>
			<div class="w3-button w3-text-indigo w3-right w3-xlarge" id="join">JOIN</div>
		</div>
		<div class="w3-col w3-padding w3-card-4 w3-hide"><span id="msg">${SID} 님은 이미 로그인했습니다.</span></div>
	</div>
</body>
</html>