$(document).ready(function(){
	// 로그인처리 
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
		if(!$('#bno').val()){
         $('#bno').prop('disabled', true);
      }
     	 if(!$('#cno').val()){
         $('#cno').prop('disabled', true);
      }
		$('#frm').attr('action', '/boa/member/loginProc.boa');
		$('#frm').submit();
	});
	

	// 홈버튼 클릭이벤트
	$('#hbtn').click(function(){
		$(location).attr('href', '/boa/main.boa');
	});
	
	// 조인 버튼 클릭 이벤트
   $('#join').click(function(){
   		$(location).attr('href', '/boa/member/join.boa');
   });
	
	// login 버튼
	$('#login').click(function(){
		$(location)	.attr('href', '/boa/member/login.boa');
	});
	$('#login2').click(function(){
		$(location)	.attr('href', '/boa/member/login.boa');
	});
	
	// id/pw 찾기 버튼 이벤트
	$('#check').click(function(){
		$(location).attr('href','/boa/member/idpwSearch.boa');
	});
	
	// id 찾기 조회
	$('#idck').click(function(){
		var sname = $('#name').val();
		var stel = $('#tel').val();
		
		if(!sname) {
			$('#name').focus();
			return;
		}
		if(!stel) {
			$('#tel').focus();
			return;
		}
		$.ajax({
		url: '/boa/member/idSearchProc.boa',
		type: 'post',
		dataType: 'json',
		data: {
			name: sname,
			tel: stel	
		},
		success: function(data){
				if(data.result == 'OK'){
					var id = data.id;
					
					$('#serid').html(id);
					$('#srchIdResult').css('display', 'block');		
				}
			},
			error: function(){
				$('#id01').css('display', 'block');
			}
		});
	});
	
	
	// pw 찾기 조회
	$('#pwck').click(function(){
		var sid = $('#id').val();
		var smail = $('#mail').val();
		
		if(!sid) {
			$('#id').focus();
			return;
		}
		if(!smail) {
			$('#mail').focus();
			return;
		}
		$.ajax({
		url: '/boa/member/pwSearchProc.boa',
		type: 'post',
		dataType: 'json',
		data: {
			id: sid,
			mail: smail	
		},
		success: function(data){
				if(data.result == 'OK'){
					var pw = data.pw;	
					$('#serpw').html(pw);
					$('#srchPwResult').css('display', 'block');		
				}
			},
			error: function(){
				$('#id01').css('display', 'block');
			}
		});
	});
	
});
		