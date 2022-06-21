$(document).ready(function(){

	//페이징처리
	$('.pbtn').click(function(){
		var sno = $(this).attr('id');
		
		$('#nowPage').val(sno);
		$('#frm').submit();
	});
	
	// 회원 정보 수정
	
	// 회원 탈퇴
	
	$('dd').click(function(){
	
		
		$('iframe').css('display', 'none');
		
		var msg = $(this).html();
		
		if(msg == '회원정보 수정') {
			
		} else if(msg == '회원 탈퇴') {
		
		} else if(msg == '좋아요 목록') {
			
			$('#myLike').css('display', 'block');
		
		} else if(msg == '찜 목록') {
			
			$('#myJJim').css('display', 'block');
			
		} else if(msg == '구매글 리스트') {
			$('#myBuy').css('display', 'block');
		
		} else if(msg == '포인트 이용 내역') {
			
			$('#myPoint').css('display', 'block');
		}
	
	
	});
	
	//전체 포인트 내역
	$('#allList').click(function(){
		$('#frm').submit();
	});
	
	//게시글
	$('#bcnt').click(function(){
		$('iframe').css('display', 'none');
		$('#myBoard').css('display', 'block');
	});
	
	//댓글
	$('#rcnt').click(function(){
		$('iframe').css('display', 'none');
		$('#myReboard').css('display', 'block');
	});
	
});