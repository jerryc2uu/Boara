$(document).ready(function(){
	// reset 버튼
	$('#rbtn').click(function(){
		document.frm.reset();	
	});
	
	// home
	$('#hbtn').click(function(){
		$(location).attr('href', '/boa/main.boa');
	});
	
	// edit 버튼
	$('#edit').click(function(){
	
	});
	
	// dell 버튼
	$('#dbtn').click(function(){
		$(location).attr('href', '/boa/member/delMember.boa');
	});
	
	// 비밀번호 일치 확인
	$('#repw').keyup(function(){
		var spw = $('#pw').val();
		var repw = $(this).val();
		if(spw != repw){
			$('#repwmsg').html('비밀번호가 일치하지 않습니다.');
			$('#repwmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-red');
			$('#repwmsg').css('display', 'block');
		} else {
			$('#repwmsg').html('비밀번호가 일치합니다.');
			$('#repwmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-green');
			$('#repwmsg').css('display', 'block');
			$('#pw').css('background-color', 'lightgray').prop('readonly', true);
			$('#repw').css('background-color', 'lightgray').prop('readonly', true);
		}
	});
	
	
});