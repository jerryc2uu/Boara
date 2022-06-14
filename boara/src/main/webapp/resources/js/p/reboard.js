$(document).ready(function(){
	//1. 댓글 리스트 페이지 <<reboardList.jsp>>
	
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
	
	
});