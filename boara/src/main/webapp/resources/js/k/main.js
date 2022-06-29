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
		$(location).attr('href', '/boa/member/login.boa');
	});

   //로그아웃 버튼 클릭 이벤트
   $('#mlogout').click(function(){
   		$(location).attr('href', '/boa/member/logout.boa');
   }); 
   
   // 조인 버튼 클릭 이벤트
   $('#mjoin').click(function(){
   		$(location).attr('href', '/boa/member/join.boa');
   });

   $('#msid').click(function(){
        $('input').prop('disabled', true);
        $('#id').prop('disabled', false);
      $('#frm').attr('action', '/boa/member/myinfo.boa');
      $('#frm').submit();
   });
   
   // 글쓰기 버튼 이동
   $('#mwrite').click(function(){
   $('#frm').attr('/boa/board/boardWrite.boa');
   $('#frm').submit();
});
		
   //hot 클릭 이벤트
   $('.hot').click(function(){
    	var sbno = $(this).attr('id');
    	$('#bno').val(sbno);
//    	$('#frm').attr('/boa/board/boardDetail.boa');
// 	 	$('#frm').submit();
//			$(location).attr('href', '/boa/board/boardDetail.boa');
  	 	alert(sbno);
   });
   
	
	
});