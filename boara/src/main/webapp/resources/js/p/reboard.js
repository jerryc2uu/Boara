$(document).ready(function(){
	//=========1. 댓글 리스트 페이지================
	
	//페이지 버튼 클릭 이벤 처리
	$('.pbtn').click(function(){
		
		var pno = $(this).attr('id');//this : 클릭된 태그, 아이디값(페이지 번호)
		
		//페이지 번호 셋팅
		$('#nowPage').val(pno);
		$('#rno').prop('disabled', true);
		$('#uprno').prop('disabled', true);
		$('#lid').prop('disabled', true);
		
		//폼 태그 전송
		$('#frm').submit();
	});
	
	//새댓글작성 버튼 이벤트
	$('#newwrite').click(function(){
		$('#frm').attr('action', '/boa/reboard/reboardWrite.boa');	
		$('#rno').prop('disabled', true);
		$('#uprno').prop('disabled', true);
		$('#sid').prop('disabled', true);
		$('#frm').submit();
	});
	
	//댓글의 수정/삭제/대댓글 버튼 클릭 이벤트
	$('.listbutton').click(function(){
		
		var btxt = $(this).html();
		
		var srno = $(this).parent().attr('id');
		$('#rno').val(srno);
		
		
		
		if(btxt == '삭제') {
			$('#sid').prop('disabled', true);
			$('#id').prop('disabled', true);
			$('#uprno').prop('disabled', true);
			$('#frm').attr('action', '/boa/reboard/reboardDel.boa');
		
		} else if(btxt == '수정') {
			//댓글 작성자 아이디
			$('#id').prop('disabled', true);
			var sid = $(this).attr('id');
			$('#sid').val(sid);
			
			$('#uprno').prop('disabled', true);
			$('#frm').attr('action', '/boa/reboard/reboardEdit.boa');
		
		} else if(btxt == '댓글') {
			$('#sid').prop('disabled', true);
			//클릭한 댓글의 글번호가 대댓글의 상위댓글번호가 된다.
			var suprno = $(this).parent().attr('id');
			$('#uprno').val(srno);		
			$('#frm').attr('action', '/boa/reboard/reboardComment.boa');
		
		}
		
		$('#frm').submit();
	});
	
	//스포일러 댓글 클릭 시 내용 보이기
	$('.spoiler').click(function(){
			$(this).css('display', 'none');
			$(this).next().css('display', 'block');
	});
	
	//============ 2. 새 댓글 작성 페이지================
	//새 댓글 및 대댓글 등록 버튼
	$('#cmtbtn').click(function(){
		var btxt = $('#body').val();
		btxt = btxt.trim();
		
		if(!btxt) {
			$('#body').focus();
			return;
		}
		
		if(btxt.length > 200) {
			btxt = btxt.subString(0, 200);
			$('#body').val(btxt);
			alert('코멘트의 글자수는 200자를 초과할 수 없습니다.');
			return;
		}
		
		$('#frm').submit();
	});
	
	//============ 3. 댓글 수정 페이지================
	//댓글 등록 버튼
	$('#editbtn').click(function(){
		var txt = $('#body').val();
		//var otxt = $('#obody').val();
		
		if(txt.length > 200) {
			txt = txt.subString(0, 200);
			$('#body').val(txt);
			alert('댓글의 글자수는 200자를 초과할 수 없습니다.');
			return;
		}
		
		$('#frm').submit();
	}); 
});