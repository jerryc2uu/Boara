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
<!-- 포인트 충전 -->
    <div class="w3-content mxw700" style="margin-right: 550px;">
	    <header class="w3-col mgb20">
			<h1 class="w3-center mg0" style="width: 900px; margin-top: 30px; margin-bottom: 30px;">충전할 포인트</h1>
		</header>
		<div>
			<div class="w3-col">
				<input type="radio" name="money" value="5000">
				<label>5000P</label>
			</div>
			<div class="w3-col">
				<input type="radio" name="money" value="10000">
				<label>10000P</label>
			</div>
			<div class="w3-col">
				<input type="radio" name="money" value="15000">
				<label>15000P</label>
			</div>
			<div class="w3-col">
				<input type="radio" name="money" value="20000">
				<label>20000P</label>
			</div>
		</div>
		<div class="w3-button w3-hover-blue w3-indigo btnbox parent" id="pay">결제하기</div>
	</div>
</body>
</html>