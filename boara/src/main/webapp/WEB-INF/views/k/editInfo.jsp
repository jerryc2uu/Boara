<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INFO EDIT</title>
<link rel="stylesheet" type="text/css" href="/boa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/boa/css/user.css">
<link rel="stylesheet" type="text/css" href="/boa/css/k/soyeon.css">
<script type="text/javascript" src="/boa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/boa/js/k/edit.js"></script>
<style type="text/css">
	.main {
	max-width : 900px;
	}
	#repwmsg {
		display: none;
	}
	.picbox {
	width: 250px;
	height: 250px;
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
		<h1 class="w3-text-indigo w3-padding w3-xxxlarge w3-border-bottom "><b>회원정보 수정</b></h1>
			<form method="POST" action="/boa/member/editProc.boa" name="frm" id="frm" encType="multipart/form-data"
					class="w3-col w3-margin-top w3-border w3-margin-bottom w3-text-grey w3-padding">
				
				<input type="hidden" id="mno" name="mno" value="${DATA.mno}">
				<input type="hidden" id="id" name="id" value="${SID}">
				<input type="hidden" id="tmail" value="${DATA.email}">
				<input type="hidden" id="ttel" value="${DATA.tel}">
				<input type="hidden" id="tpw" value="${DATA.pw}">
				<input type="hidden" id="tbir" value="${DATA.birth}">
	
			<c:forEach var="data" items="${LIST}">
				<input type="hidden" id="tfno" value="${data.fno}" > 
			</c:forEach>
		<!--  
		-->
			<div class="w3-margin-top  w3-content">
				<label for="name" class="w3-col m3 w3-right-align ft18">회원이름 : </label>
				<h4 class="w3-col s8 w3-center ft18  w3-magrin-left ">${DATA.name}</h4>
			</div>
			<div class="w3-margin-top  w3-content">
				<label class="w3-col m3 w3-right-align ft18">아 이 디 : </label>
				<h4 class="w3-col ft18 s8 w3-center w3-magrin-left w3-magrin-left ">${DATA.id}</h4>
			</div>
			<div class="w3-margin-top  w3-content">
				<label class="w3-col m3 w3-right-align ft18">생년월일 : </label>
				<h4 class="w3-col s8 w3-center ft18  w3-magrin-left ">${DATA.birth}</h4>
			</div>
			<div class="w3-margin-top w3-content">
				<label for="pw" class="w3-col m3 w3-right-align ft18">비밀번호 : </label>
				<input type="password" name="pw" id="pw" class="w3-margin-bottom w3-margin-left m8 w3-col ft18 w3-input w3-border w3-round-medium pd3">
			</div>
			<div class="w3-margin-top  w3-content">
				<label for="repw" class="w3-col m3 w3-right-align ft18">비밀번호 확인 : </label>
				<div class="w3-col m8">
					<input type="password" id="repw" class="w3-margin-bottom w3-margin-left w3-col ft18 input w3-border w3-round-medium pd3">
					<span class="w3-col w3-text-red  w3-center mb5" id="repwmsg"># 비밀번호가 일치하지 않습니다.</span>
				</div>
			</div>
			<div class="w3-margin-top  w3-content">
				<label for="email" class="w3-col m3 w3-right-align ft18">회원메일 : </label>
				<input type="text" name="email" id="email" class="w3-margin-bottom w3-margin-left m8 w3-col ft18 w3-input w3-border w3-round-medium pd3" value="${DATA.email}">
			</div>
			<div class="w3-margin-top  w3-content">
				<label for="tel" class="w3-col m3 w3-right-align ft18">전화번호 : </label>
				<input type="text" name="tel" id="tel" class="w3-margin-bottom w3-margin-left m8 w3-col ft18 w3-input w3-border w3-round-medium pd3" value="${DATA.tel}">
			</div>
				
	<c:forEach var="data" items="${LIST}">
	<!-- 사진 삭제 기능 -->
		<c:if test="${not empty data.savename}">
			<div class="w3-margin-top  w3-content">
				<label for="file" class="w3-col m3 w3-right-align ft18">프로필 사진 : </label>
				<div class="w3-col m8" >
					<div id="${data.fno}" class="w3-display-container picbox w3-center" >
						<img  class="w3-display-middle evtPic" style="width: 100%; height: auto;" src="/boa/resources/upload/${data.savename}">
						 <span class="delImg w3-button w3-large w3-text-black w3-display-topright">&times;</span>
					</div>
				</div>
			</div> 
		</c:if>
	</c:forEach>
		<!-- 사진 삭제 했을 시 추가 기능 -->
		<c:if test="${empty LIST}">
			<div class="w3-margin-top w3-content">
				<label for="file" class="w3-col s3 w3-right-align ft18">프로필 사진 : </label>
				<div class="w3-col m8" id="filebox">
					<input type="file" id="file" name="file" class="ft18 upfile w3-input w3-border w3-col w3-margin-left w3-round-medium w3-margin-bottom">
				</div>
			</div>
		
			<div class="w3-margin-top w3-content">
				<label class="w3-col s3 w3-right-align ft18">preview : </label>
				<div class="w3-col m8" >
					<div class="w3-display-container picbox " >
						<img id="img1" class="w3-display-middle" style="width: 100%; height: auto;" src="">
					</div>
				</div>
			</div>

		</c:if>
		
		</form>	
		<div class="w3-col w3-margin-top w3-card-4 mgb30">
			<div class="w3-third w3-text-white w3-indigo w3-padding w3-xlarge w3-hover-grey w3-inline-block" id="hbtn">Main</div> 
			<div class="w3-third w3-text-white w3-indigo w3-padding w3-xlarge w3-hover-grey" id="rbtn">Reset</div> 
			<div class="w3-third w3-text-white w3-indigo w3-padding w3-xlarge w3-hover-grey" id="ebtn">Edit</div> 
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
	  
	</div>
</body>
</html>