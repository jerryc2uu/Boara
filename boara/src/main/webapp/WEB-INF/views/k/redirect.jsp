<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Redirect View</title>
<script type="text/javascript" src="/boa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#frm').submit();
	});
</script>
</head>
<body>
	<form method="POST" action="${VIEW}" id="frm" name="frm">
<c:if test="${not empty NOWPAGE}">
		<input type="hidden" name="nowPage" value="${NOWPAGE}">
</c:if>
<c:if test="${not empty SID}">
		<input type="hidden" name="id" value="${SID}">
</c:if>
<c:if test="${not empty param.cno}">
		<input type="hidden" name="cno" value="${param.cno}">
</c:if>
<c:if test="${not empty param.bno}">
		<input type="hidden" name="bno" value="${param.bno}">
</c:if>
<c:if test="${not empty param.cid}">
		<input type="hidden" name="cid" value="${param.cid}">
</c:if>
	</form>
</body>
</html>