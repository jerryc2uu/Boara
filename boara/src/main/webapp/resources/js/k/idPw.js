$(document).ready(function(){

// idpw 찾기에서 login 버튼
	$('#login').click(function(){
		$('#frm1').attr('action', '/boa/member/login.boa');
    	$('#frm1').submit();
	});
	$('#login2').click(function(){
		$('#frm1').attr('action', '/boa/member/login.boa');
    	$('#frm1').submit();
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
	
	$('#smstag, #certi, #srchPwResult, #repwmsg').css('display', 'none');
	
	
	// id, tel ajax 처리후 본인인증 버튼 노출
	$('#pwck').click(function(){
		var sid = $('#id').val();
		var stel = $('#tele').val();
		
		if(!sid) {
			$('#id').focus();
			return;
		}
		if(!stel) {
			$('#tele').focus();
			return;
		}
		$.ajax({
		url: '/boa/member/pwSearchProc.boa',
		type: 'post',
		dataType: 'json',
		data: {
			id: sid,
			tel: stel	
		},
		success: function(data){
				if(data.result == 'OK'){
					  $('#smstag, #certi').css('display', 'block');
				}else{
					$('#id01').css('display', 'block');
					$('#mod').html('회원가입시 기입한 정보를 입력해주세요');
				}
			},
			error: function(){
				$('#id01').css('display', 'block');
			}
		});
	});
	
	
	// 휴대폰 번호 인증
		var code2 = "";
		$("#certi").click(function(){
			alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
			var tel = $("#tele").val();
			$.ajax({
		        type:"GET",
		        url:"telCheck.boa?tel=" + tel,
		        cache : false,
		        success:function(data){
		        	if(data == "error"){
		        		alert("휴대폰 번호가 올바르지 않습니다.")
						$('#id01').css('display', 'block');
						$('#mod').html("유효한 번호를 입력해주세요.");
						$("#phone").attr("autofocus",true);
		        	}else{	        		
		        		$("#sms").attr("disabled",false);
		        		$("#tele").attr("readonly",true);
		        		code2 = data;
		        	}
		        }
		    });
		});

	// 인증번호 일치 확인
	
	$("#smsok").click(function(){
		var sid = $('#id').val();
		if($("#sms").val() == code2){
			$('#srchPwResult').css('display', 'block');
		}else{
			$('#id01').css('display', 'block');
			$('#mod').html("인증번호를 확인 부탁드립니다.");
		}
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
	
	// 비밀번호 변경
	$('#updatePw').click(function(){
		var spw = $('#pw').val();
		var stel = $('#tele').val();
		
		$.ajax({
			url: '/boa/member/updatePw.boa',
			type: 'post',
			dataType: 'json',
			data: {
				pw: spw,
				tel: stel	
			},
			success: function(data){
					if(data.result == 'OK'){
						$('#frm1').attr('action', '/boa/member/login.boa');
    					$('#frm1').submit();
					}else{
						$('#id01').css('display', 'block');
						$('#mod').html('회원가입시 기입한 전화번호를 입력해주세요');
					}
				},
				error: function(){
					$('#id01').css('display', 'block');
				}
			});

	});	
	
	
	
	
	
	
	
	
	
	
});
	