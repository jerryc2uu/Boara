$(document).ready(function(){
	// 로그인 페이지 이동
	$('#lbtn').click(function(){
		var sid = $('#id').val();
		var spw = $('#pw').val();
		if(!sid){
			$('#id').focus();
			return;
		}
		if(!spw){
			$('#pw').focus();
			return;
		}
		
		$('#frm').attr('action', '/boa/member/loginProc.boa');
		$('#frm').submit();
	});
	

	// 홈버튼 클릭이벤트
	$('#hbtn').click(function(){
		$(location).attr('href', '/boa/main.boa');
	});
	


});
		