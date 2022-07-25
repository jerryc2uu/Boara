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
	
		// 휴면 조회
		$.ajax({
			url: '/boa/member/humeonCk.boa',
			type: 'post',
			dataType: 'json',
			data : {
				id : sid, 
				pw : spw
			},
			success : function(data){
				var result = data.result;
				if(result == 'OK'){
					$('#frm').attr('action', '/boa/member/loginProc.boa');
					$('#frm').submit();
				}else if(result == 'NO'){
					// 메일 인증 모달창 띄우기	
					$('#id02').css('display', 'block');
				} else if(result == 'XX'){
					$('#id01').css('display', 'block');
					$('#mod').html('가입한 이력이 없는 회원입니다.');
					$('#id').val('');
					$('#pw').val('');
				}
		},
			error: function(){
				$('#id01').css('display', 'block');
			}
		});
	});
	
	$('#cermsg, #mailmsg, #error').css('display', 'none');
	
	// 메일 인증
	$('#mailck').click(function(){
		var email = $('#email').val();
		if(!email){
			$('#email').focus();
		} else{
		
			$.ajax({
					type : 'GET',
					url : '/boa/member/certi.boa?email=' + email,
					success : function (data) {
						$('#certi').attr('disabled',false);
						$('#code').val(data);
						$('#mailmsg').css('display', 'block');
						$('#mailmsg').html('인증 메일이 발송되었습니다.');
					}			
				}); 
			}
		}); 
		
		$('#cerck').click(function(){
			var email = $('#email').val();
			if(!email){
				$('#email').focus();
			}
			var msgcode = $('#certi').val();
			var code = $('#code').val();
			
			if(msgcode == code){
				$('#cermsg').html('인증번호가 일치합니다.');
				$('#cermsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-green');
				$('#cermsg').css('display', 'block');
				$('#certi').css('background-color', 'lightgray').prop('readonly', true);
			}else if(msgcode != code){
				$('#cermsg').html('인증번호가 일치하지 않습니다.');
				$('#cermsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-red');
				$('#cermsg').css('display', 'block');
				$('#certi').val('');
			}
		});
	
		$('#clear').click(function(){
			var sid = $('#id').val();
			var spw = $('#pw').val();
			var el = $('#email, #certi');
			
			for(var i = 0; i < el.length; i++){
				var txt = $(el).eq(i).val();
				if(!txt){
					$(el).eq(i).focus();
					return;
				}
			}
			$.ajax({
				url : '/boa/member/huClear.boa',
				type : 'post',
				dataType : 'json',
				data: {
					id : sid, 
					pw : spw
				},
				success: function(data){
					var result = data.result;
					if(result == 'OK'){
						$('#frm').attr('action', '/boa/member/loginProc.boa');
						$('#frm').submit();
					}
				},
				error: function(){
				$('#error').css('display', 'block');
				}
			});
		
		});



	// 홈버튼 클릭이벤트
	$('#hbtn').click(function(){
		$(location).attr('href', '/boa/main.boa');
	});
	
	// 조인 버튼 클릭 이벤트
   $('#join').click(function(){
   		$('#frm').attr('action', '/boa/member/join.boa');
    	$('#frm').submit();
   });
	
	
	// id/pw 찾기 버튼 이벤트
	$('#check').click(function(){
		$('#frm').attr('action', '/boa/member/idpwSearch.boa');
    	$('#frm').submit();
	});
	

});
		