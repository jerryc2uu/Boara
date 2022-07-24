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
	
	// 프로필 사진 삭제
	$('.delImg').click(function(){
		var sno = $('.picbox').attr('id');
		$('#tfno').val(sno);
		var el = $('.evtPic');
		if(confirm('프로필 사진을 삭제하시겠습니까?')){
			
			$.ajax({
				url: '/boa/member/delImg.boa',
				type : 'post',
				dataType: 'json',
				data: {
					fno: sno		
				},
				success: function(data){
					if(data.result == 'OK'){
						$(el).remove();
						$('#frm').attr('action', '/boa/member/editInfo.boa');
						$('#frm').submit();
						}
					},
					error: function(){
						$('#id01').css('display', 'block');
					}
			});
		}
	});
	
	// 새로운 사진 추가사 보여주기
	$('.upfile').change(function(e){
		var path = URL.createObjectURL(e.target.files[0]);
		$('#img1').attr('src', path);
	
	});
	
	
	// 회원 정보 수정 버튼
	$('#ebtn').click(function(){
		// 기존데이터
		var tmail = $('#tmail').val();
		var ttel = $('#ttel').val();
		var tbir = $('#tbir').val();
		
	
		// 수정데이터
		var email = $('#email').val();
		var tel = $('#tel').val();
		var pw = $('#pw').val();
		var birth = $('#birth').val();
		var fno = $('#file').val();
		
		if(!pw){
			$('#pw').prop('disabled', true);
		}
		if(tmail == email) {
			$('#email').prop('disabled', true);
		}
		if(ttel == tel) {
			$('#tel').prop('disabled', true);
		}
		if(!fno){
			$('#fno').prop('disabled', true);
		}
		if(!pw && (tmail == email) && (ttel == tel)   &&!fno){
			// 수정을 X
			$('#id01').css('display', 'block');
			$('#me').html('수정된 개인정보가 없습니다.');
			return;
		}
		$('#frm').submit();
	});	
	
	// 비밀번호 정규 표현식
	$('#pw').change(function(){
		var spw = $('#pw').val();
		var pwPat = /^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{7,15}$/;
	
		var pwResult = pwPat.test(spw);
		if(!pwResult){
		$('#id01').css('display', 'block');
		$('#me').html('비밀번호를 다시 입력하세요');
		$('#pw').val('');
		}
	
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
	
	//-------------------------------------------------------------------------------
	// 탈퇴
	$('#mecertifi').css('display','none');


	// 비밀번호 일치시 본인인증 창 노출
	$('#drepw').blur(function(){
		var spw = $('#drepw').val();
		var sid = $('#id').val();
		
		$.ajax({
			url : '/boa/member/pwCk.boa',
			type : 'post',
			dataType: 'json',
			data : {
				id : sid, 
				pw : spw
			},
			success : function(data){
				var result = data.ck
				if(result == 'OK'){
					$('#mecertifi').css('display', 'block');
				}else{
					$('#id01').css('display', 'block');
					$('#me').html('회원가입시 사용한 비밀번호로 입력해주세요');
				}
			},
			error: function(){
					$('#id01').css('display', 'block');
			}		
		});
	});
	
	
	// 본인인증
	$('#mecertifi').click(function(){
		var IMP = window.IMP; 
		IMP.init('imp53161363'); 

		var sname = $('#dname').val();
		
		 IMP.certification({
		 	 name : sname,
			 popup : true 
		 }, function (rsp) { 
			 if ( rsp.success ) {
		         // 인증성공
		         $('#mecerti').val('Y');
			  } else {
			         // 인증취소 또는 인증실패
			        var msg = '인증에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			 
			        alert(msg);
			        $('#certi').prop('disabled', true);
			        $('frm').attr('action', '/boa/member/delMember.boa');
			        $('#frm').submit();
			    }
			});
	});
	
	// 체크시 탈퇴 버튼 노출
	$('#delete').click(function(){
		var el = $('#dname, #dpw, #mecerti'); 
		for(var i = 0 ; i < el.length ; i++ ){
			var txt = $(el).eq(i).val();
			if(!txt){
			$('#id01').css('display', 'block');
			$('#me').html('필수 입력사항을 입력해주세요');
				$(el).eq(i).focus();
				return;
			}
		}
		$('#delbox').css('display','block')
	});


	// 탈퇴 모달창
	$('#dbtn').click(function(){
		$('#delMo').css('display', 'block');
	});
	
	// 탈퇴 처리 
	$('#exit').click(function(){
		
		$('#frm').attr('action', '/boa/member/delMemberProc.boa');
		$('#frm').submit();
	});
	
	$('#cancle').click(function(){
		$('#delMo').css('display', 'none');
	});

});