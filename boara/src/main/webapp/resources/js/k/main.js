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
	
	//################### 페이지마다 바뀌는 부분 #############
	/*
   //hot 클릭 이벤트
   $('.mhot').click(function(){
	//모든 컬렉션 리스트 페이지로 이동 => 추후 hot 게시물 리스트로 이동하도록 수정..
      $(location).attr('href', '/boara/collection/collecList.boa');
   });
   
	
	//컬렉션 리스트 중 하나 클릭 시 해당 컬렉션 번호 전달 이벤트 처리
	$('.collectionlist').click(function(){
		var cno = $(this).attr('id');
		$('#cno').val(cno);
		//#####추후 수정 ######## 해당 컬렉션의 게시물 리스트 페이지로 이동
		$('#frm').attr('action', '/boara/board/boardList.boa');
		$('#frm').submit();
	});
   */
});