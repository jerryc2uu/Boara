<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DELETE PAGE</title>
<link rel="stylesheet" type="text/css" href="/boa/resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="/boa/resources/css/k/soyeon.css">
<script type="text/javascript" src="/boa/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/boa/resources/js/k/edit.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<style type="text/css">
	.main {
	max-width :900px;
	}
	#repwmsg, #delbox{
	display: none;
	}
</style>
</head> 
<body>
	<div class="w3-content w3-center main">
		<h1 class="w3-text-indigo w3-padding w3-border-bottom "><b>${SID} 회원탈퇴</b></h1>
		<form method="POST" action="" name="frm" id="frm" class="w3-col w3-margin-top w3-border w3-margin-bottom w3-text-grey w3-padding">
			<input type="hidden" id="mecerti" name="mecerti" >
			<input type="hidden" id="id" name="id" value="${SID}">
			
			<div class="w3-margin-top w3-content">
				<label for="dname" class="w3-col s3 w3-right-align w3-large">이름 : </label>
				<div class="w3-col m8">
					<input type="text" name="dname" id="dname" class="w3-margin-bottom w3-margin-left w3-col w3-input w3-border w3-round-medium"
									placeholder="이름을 입력하세요">
				</div>
			</div>
			
			<div class="w3-margin-top w3-content">
				<label for="dpw" class="w3-col s3 w3-right-align w3-large">비밀번호 : </label>
				<div class="w3-col m8">
					<input type="password" name="dpw" id="dpw" class="w3-margin-bottom w3-margin-left w3-col w3-input w3-border w3-round-medium"
									placeholder="비밀번호를 입력하세요">
				</div>
			</div>
			<div class="w3-margin-top w3-content">
				<label for="drepw" class="w3-col s3 w3-right-align w3-large">비밀번호 확인 : </label>
				<div class="w3-col m8">
					<input type="password" id="drepw" class="w3-margin-bottom w3-margin-left w3-col w3-input w3-border w3-round-medium">
					<span class="w3-col w3-text-red w3-center w3-margin-bottom" id="repwmsg">비밀번호 체크 처리 메세지</span>
				</div>
			</div>
			<div class="w3-margin-top w3-contents">
				<div id="mecertifi" class="w3-quarter w3-button w3-col w3-indigo mar">본인인증</div>
			</div>
		</form>
		<div class="w3-content w3-center main">
			<h4 class="w3-margin-bottom w3-center ">
			탈퇴 후에는 [ID ${SID}] 로 다시 가입할 수 없으며 아이디와 데이터는 복구 할 수 없습니다.
			<br>
			게시판형 서비스에 남아있는 게시글은 탈퇴 후 삭제 할 수 없습니다.
			</h4>
		</div>
		<div >
			<input type="radio" name="delete" id="delete" class="w3-radio" value="delete"> <label for="delete"> <b class="w3-large">안내 사항을 모두 확인하였으며, 이에 동의합니다.</b></label>
		</div>
		<div class="w3-col w3-margin-top" id="delbox">
			<div class="w3-button w3-indigo w3-large w3-text-white w3-hover-grey" id="dbtn">탈퇴하기</div>
		</div>
	</div>
		

	<div id="id01" class="w3-modal">
	    <div class="w3-modal-content">
	      <header class="w3-container w3-red"> 
	        <span onclick="document.getElementById('id01').style.display='none'" 
	        class="w3-button w3-display-topright">&times;</span>
	        <h4 class="w3-center">ERROR</h4>
	      </header>
	      <div class="w3-container">
	        <h4 id="me">통신오류</h4>
	      </div>
	    </div>
	  </div>


		
	<!-- 탈퇴 모달창 -->	
	<div id="delMo" class="w3-modal">
	    <div class="w3-modal-content">
	      <header class="w3-container w3-red"> 
	        <span id="cancle"class="w3-button w3-display-topright" >&times;</span>
	        <h4 class="w3-center">확인시 영구 탈퇴됩니다.</h4>
	      </header>
	      <div class="w3-container w3-center">
	       	<p id="exit" class="w3-center w3-button w3-red w3-large">확  인</p>
	      </div>
	    </div>
	</div>
</body>
</html>