$(document).ready(function(){
	// 아이디 중복검사
	$('#id').change(function(){
		var sid = $('#id').val();
		 
		$.ajax({
			url: '/boa/member/idCheck.boa',
			type: 'post',
			dataType: 'json',
			data: {
				id: sid
			},
			success: function(data){
				var result = data.result;
				$('#idmsg').removeClass('w3-text-green w3-text-red');
					
				if(result == 'OK'){
					// 입력한 아이디가 사용가능한 경우
					$('#idmsg').html('사용 가능한 아이디 입니다.');
					$('#idmsg').addClass('w3-text-green');
				} else {
					// 입력한 아이디가 사용불가능한 경우
					$('#idmsg').html('사용 불가능한 아이디 입니다.');
					$('#idmsg').addClass('w3-text-red');
				}
					$('#idmsg').css('display', 'block');
				},
			error: function(){
				$('#id01').css('display', 'block');
			}
		});
			
	});
		
	// 메일 중복검사
	$('#email').change(function(){
		var smail = $('#email').val();

		$.ajax({
			url: '/boa/member/mailCheck.boa',
			type: 'post',
			dataType: 'json',
			data: {
				email: smail
			},
			success: function(data){
				var result = data.result;
				$('#mailmsg').removeClass('w3-text-green w3-text-red');
					
					if(result == 'OK'){
						$('#mailmsg').html('사용 가능한 메일 입니다.');
						$('#mailmsg').addClass('w3-text-green');
					} else {
						$('#mailmsg').html('사용 불가능한 메일 입니다.');
						$('#mailmsg').addClass('w3-text-red');
					}
						$('#mailmsg').css('display', 'block');
					},
					error: function(){
						$('#id01').css('display', 'block');
					}
				});
				
			});
			
	// 전화번호 중복검사
	$('#tel').change(function(){
	var stel = $('#tel').val();
	
		$.ajax({
			url: '/boa/member/telCheck.boa',
			type: 'post',
			dataType: 'json',
			data: {
				tel: stel
			},
			success: function(data){
				var result = data.result;
				$('#telmsg').removeClass('w3-text-green w3-text-red');
					
					if(result == 'OK'){
						$('#telmsg').html('사용 가능한 전화번호 입니다.');
						$('#telmsg').addClass('w3-text-green');
					} else {
						$('#telmsg').html('사용 불가능한 전화번호 입니다.');
						$('#telmsg').addClass('w3-text-red');
					}
						$('#telmsg').css('display', 'block');
					},
					error: function(){
						$('#id01').css('display', 'block');
					}
				});
				
			});
	// 비밀번호 정규 표현식
	$('#pw').change(function(){
		var spw = $('#pw').val();
		var pwPat = /^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{7,15}$/;
	
		var pwResult = pwPat.test(spw);
		if(!pwResult){
		$('#id01').css('display', 'block');
		$('#mod').html('비밀번호를 다시 입력하세요');
		$('#pw').val('');
		}
	
	});
	
	// 전화번호 정규 표현식
	$('#tel').change(function(){
		var stel = $('#tel').val();
		var pwTel =  /^[0-9].{10,11}$/;
	var telResult = pwTel.test(stel);
		if(!telResult){
		$('#id01').css('display', 'block');
		$('#mod').html('전화번호를 다시 입력하세요');
		$('#tel').val('');
		}
	});
	
	
	// 비밀번호 일치 처리
	$('#repw').keyup(function(){
		// 할일
		// 입력된 데이터 읽어온다.
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
	
		
	// reset
	$('#rbtn').click(function(){
		document.frm.reset();
	});
	// home 
	$('#hbtn').click(function(){
		$(location).attr('href', '/boa/main.boa');
	});	
	// join
	$('#jbtn').click(function(){
		// 데이터 유효성 검사

	
		
		var el = $('#name, #id, #pw, #tel, #email, #file, #certi'); 
		
		for(var i = 0 ; i < el.length ; i++ ){
			var txt = $(el).eq(i).val();
			if(!txt){
			$('#id01').css('display', 'block');
			$('#mod').html('필수 입력사항을 입력해주세요');
				$(el).eq(i).focus();
				return;
			}
		}
		$('#frm').attr('action', '/boa/member/joinProc.boa').submit();
	});	
	
	
	// 사진 올릴시 보여주기
	$('.upfile').change(function(e){
		var path = URL.createObjectURL(e.target.files[0]);
		$('#img1').attr('src', path);	
		
	});
	
	
	// 메일 인증
	$('#mailck').click(function(){
		var email = $('#email').val();
		var ser = $('#certi').val();
		if(!email){
			$('#id01').css('display', 'block');
			$('#mod').html('이메일을 입력하세요');
			$('#email').focus();
		}

		
		$.ajax({
				type : 'GET',
				url : '/boa/member/certi.boa?email=' + email,
				success : function (data) {
					$('#certi').attr('disabled',false);
					alert(data);
					$('#code').val(data);
					$('#id01').css('display', 'block');
					$('#color').css('background-color', 'green');
					$('#head').html('SUCCESS');
					$('#mod').html('인증번호가 전송되었습니다.');
				}			
			}); 
		}); 
		
		$('#cerck').click(function(){
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

	
});
	