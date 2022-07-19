$(document).ready(function(){

	// 페이징 버튼
	$('.pbtn').click(function(){
		var spage = $(this).attr('id');
		$('#nowPage').val(spage);
		
		$('#bno').prop('disabled', true);
		$('#cno').prop('disabled', true);
		
		$('#frm').attr('action', '/boa/search.boa');
		$('#frm').submit();
	});
	
	
	// search 버튼 클릭
	$('#sertitle').click(function(){
	
		var ssel= $('#sel > option:selected').val();
		$('#sel').val(ssel);
		
		var el = $('#sel', '#search'); 
		
		for(var i = 0 ; i < el.length ; i++ ){
			var txt = $(el).eq(i).val();
			if(!txt){
				$(el).eq(i).focus();
				return;
			}
		}
		
		if(!$('#bno').val()){
	         $('#bno').prop('disabled', true);
	      }
	     if(!$('#cno').val()){
	         $('#cno').prop('disabled', true);
	      }
		$('#bno').prop('disabled', true);
		$('#frm').attr('action','/boa/search.boa');
		$('#frm').submit();
	}); 
	
	// 컬렉션 클릭시 board 리스트 조회
	$('.cloWh').click(function(){
		var str = $(this).attr('id');
		$('#cno').val(str);
		$('#bno').prop('disabled', true);
		$('#frm').attr('action','/boa/board/boardList.boa');
		$('#frm').submit();
	});
	
	// 게시물 클릭시 상세내용 조회
	$('.boWh').click(function(){
		var str = $(this).attr('id');
		$('#bno').val(str);
		$('#cno').prop('disabled', true);
		$('#sel').prop('disabled', true);
		if(!$('#id').val()){
    		$('#id').prop('disabled', true);
    	}
		$('#frm').attr('action','/boa/board/boardDetail.boa');
		$('#frm').submit();
	
	}); 
});
