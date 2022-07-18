$(document).ready(function(){
   //메인 버튼 클릭 이벤트
   $('#main').click(function(){
      $(location).attr('href', '/boa/main.boa');
   });
   
   //컬렉션 버튼 클릭 이벤트
   $('#collection').click(function(){
      $(location).attr('href', '/boa/collection/collecList.boa');
   });
   
   //새 컬렉션 작성버튼 클릭 이벤트
   $('#mcoll').click(function(){
		$(location).attr('href', '/boa/collection/collecWrite.boa');
   });
   
   //로그인 버튼 클릭 이벤트
   $('#mlogin').click(function(){
		if(!$('#bno').val()){
         $('#bno').prop('disabled', true);
      }
     	 if(!$('#cno').val()){
         $('#cno').prop('disabled', true);
      }
 	 $('#frm').attr('action', '/boa/member/login.boa');
     $('#frm').submit();
	});

	 $('#mlogout').click(function(){
	 	if(!$('#bno').val()){
         $('#bno').prop('disabled', true);
      }
     	 if(!$('#cno').val()){
         $('#cno').prop('disabled', true);
      }
 	 $('#frm').attr('action', '/boa/member/logout.boa');
     $('#frm').submit();
   });
 
  
   // 조인 버튼 클릭 이벤트
   $('#mjoin').click(function(){
   		if(!$('#bno').val()){
         $('#bno').prop('disabled', true);
      }
     	 if(!$('#cno').val()){
         $('#cno').prop('disabled', true);
      }
 	 $('#frm').attr('action', '/boa/member/join.boa');
     $('#frm').submit();
 
   });

   $('#msid').click(function(){
        $('input').prop('disabled', true);
        $('#id').prop('disabled', false);
      $('#frm').attr('action', '/boa/member/myinfo.boa');
      $('#frm').submit();
   });
   
   // 글쓰기 버튼 이동
   $('#mwrite').click(function(){
    $('input').prop('disabled', true);
    $('#id').prop('disabled', false);
   $('#frm').attr('action','/boa/board/boardWrite.boa');
   $('#frm').submit();
});
		
   // 주간 조회수 top5 클릭 이벤트
   $('.top').click(function(){
    	var sbno = $(this).attr('id');
    	$('#bno').val(sbno);
    	$('#cno').prop('disabled', true);
    	if(!$('#id').val()){
    		$('#id').prop('disabled', true);
    	}
    	$('#frm').attr('action','/boa/board/boardDetail.boa');
 	 	$('#frm').submit();

   });
    
     // hot 게시글 클릭 이벤트
      $('.hot').click(function(){
    	var sbno = $(this).attr('id');
    	$('#bno').val(sbno);
    	$('#cno').prop('disabled', true);
    	if(!$('#id').val()){
    		$('#id').prop('disabled', true);
    	}
    	$('#frm').attr('action','/boa/board/boardDetail.boa');
 	 	$('#frm').submit();

   });
   
   //-----------------------------------------------------------------
	
	$('#rbtn').click(function(){
		document.frm1.reset();
	});

   // 쪽지
   $('#message').click(function(){
   		$('#id01').css('display', 'block');
   });
   $('#exit').click(function(){
   		$('#id01').css('display', 'none');
   });
   $('#exit1').click(function(){
   		$('#succ').css('display', 'none');
   		$('#id01').css('display', 'none');
   });
  
   
   $('#receme, #sendme, #newme, #detame').css('display', 'none');
   
 
   $('#rebtn').click(function(){
   		$('#receme, #sendme, #newme, #detame').css('display', 'none');
   		var sid = $('#id').val();
   		
   		$.ajax({
   			url: "/boa/receive.boa",
   			type:'post',
   			dataType:'json',
   			data:{
				 id: sid		
   			},
   			success: function(arr){
   				$('#ajaxre').html('');
   			
   				for(var i = 0; i< arr.length ; i++){
   					if(arr[i].ck == '읽지않음'){
   						var strr = '<div class="s2 w3-col"><b>' + arr[i].sendid + '</b></div>'
   								+ '<div class="s7 w3-col"><b>' + arr[i].title + '</b></div>' 
   								+ '<div class="s2 w3-col"><b>' + arr[i].read + '</b></div>'
   					} else{
   						var strr = '<div class="s2 w3-col">' + arr[i].sendid + '</div>'
   								+ '<div class="s7 w3-col">' + arr[i].title + '</div>' 
   								+ '<div class="s2 w3-col">' + arr[i].mdate + '</div>'
   					}
   					
   					var str = ' <div class="w3-col h40 detail w3-button" id=" ' + arr[i].mgno + ' ">'
   							+ '<div class="s1 w3-col">'+(i+1)+'</div>'
   							+ strr + '</div>';
   				$('#ajaxre').append(str);
   			
   					}
   					$('#receme').css('display', 'block');
   				},
   			error: function(){
				alert('### 수신메세지 조회 실패 ###');
			}
		});
   });
 
   $('#sebtn').click(function(){
   		$('#receme, #sendme, #newme, #detame').css('display', 'none');
   		$('#sendme').css('display', 'block');
   		var sid = $('#id').val();
   		
   		$.ajax({
   			url: "/boa/send.boa",
   			type:'post',
   			dataType:'json',
   			data:{
				 id: sid		
   			},
   			success: function(arr){
   				$('#ajaxse').html('');
   			
   				for(var i = 0; i< arr.length ; i++){
   					var str = ' <div class="w3-col detail h40 w3-button" id=" ' + arr[i].mgno + ' ">'
   							+ '<div class="s1 w3-col">'+(i+1)+'</div>'
   							+ '<div class="s2 w3-col">' + arr[i].recvid + '</div>'
   							+ '<div class="s7 w3-col">' + arr[i].title + '</div>' 
   							+ '<div class="s2  w3-col">' + arr[i].mdate + '</div>' + '</div> ';
   				
   					$('#ajaxse').append(str);
   			
   					}
   					
   				},
   			error: function(){
				alert('### 발신메세지 조회 실패 ###');
			}
		});
   });

   $('#newbtn').click(function(){
   		$('#receme, #sendme, #newme, #detame').css('display', 'none');
   		$('#newme').css('display', 'block');
   		var sid = $('#id').val();
   		
   		$.ajax({
   			url: '/boa/idList.boa',
   			type: 'post',
   			dataType: 'json',
   			data:{
   				id: sid
   			},
   			success: function(arr){
				$('#recvid').html('<option disabled selected>*** 수신인 ***</option>');
					for(var i = 0; i < arr.length; i++ ){
						$('#recvid').append('<option class="ft13" value=' + arr[i].id + '>' + arr[i].id + '</option>');
					}
 				
   			},
   			error: function(){
   				alert('### id 조회 실패 ###');
   			}
   		});
   });
   
   $('.ch').change(function(){
		var stitle = $('.ch').val();
		var pwtitle = /^.{1,20}$/;
	var tiResult = pwtitle.test(stitle);	
   	if(!tiResult){
   		alert('제목은 최대 20자 입니다.');
   		$('.ch').val('');
 	}
	});
	
	$('#send').click(function(){
	
		var el = $('#frm1 .ck'); 
		for(var i = 0 ; i < el.length ; i++ ){
			var txt = $(el).eq(i).val();
			if(!txt){
				alert('필수 입력사항을 확인하세요.');
				$(el).eq(i).focus();
				return;
			}
		}
		var sid = $('#mid').val();
		var rid = $('#recvid').val();
		var sti = $('#title').val();
		var sbo = $('#body').val();
		
		$.ajax({
   			url: '/boa/sendMess.boa',
   			type: 'post',
   			dataType: 'json',
   			data:{
   				id : sid,
   				recvid : rid,
   				title : sti,
   				body : sbo
   			},
   			success: function(data){
   				var result = data.result;
				if(result == 'OK'){
					$('#succ').css('display', 'block');
					document.frm1.reset();
   				} else{
   					$('#succ').css('display', 'block');
   					$('.sufa').html('메세지 전송이 실패되었습니다.');
   				}
   			},
   			error: function(){
   				alert('### id 조회 실패 ###');
   			}
   		});
	});
   		
		$(document).on('click', ".detail", function(){
			var sno = $(this).attr('id');
			var sid = $('#id').val();

		$.ajax({
			url: '/boa/messDetail.boa',
			type: 'post',
			dataType: 'json',
			data:{
				mgno : sno,
				id	 : sid 
				
			},
			success: function(data){
				$('#receme, #sendme, #newme, #detame, #reply').css('display', 'none');
   				$('#detame').css('display', 'block');
					$('#mgn').val(data.mgno);
					$('#re').html(data.recvid);
					$('#se').html(data.sendid);
					$('#ti').html(data.title);
					$('#bo').html(data.body);
					$('#da').html(data.mdate);
					$('#rea').html(data.read);
					if(data.recvid == sid){
					$('#reply').css('display', 'none');
					$('.repl').append('<p class="w3-col s3 dets w3-text-white w3-indigo w3-large mar"  id="reply">reply</p> ');
					}
			},
			error: function(){
				$('#succ').css('display', 'block');
   					$('.sufa').html('### 통신오류 ###');
			}
		});
	});
   	
   	
   	$(document).on('click', "#reply", function(){
   		var reid = $('#se').html();
   		alert(reid)
   		
   		$('#detame').css('display', 'none');
   		$('#newme').css('display', 'block');
   		$('#recvid').html('');
   		$('#recvid').append('<option class="ft13" value=' + reid + '>' + reid + '</option>');
   		
   	
   	});	


});