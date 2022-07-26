$(document).ready(function(){
// 페이지 처리 --------------------------------------------------------------------------------

	$('.cpbtn').click(function(){
		// bno, vw 파라미터 무효화
		$('#bno').prop('disabled', true);
		$('#vw').prop('disabled', true);
		$('#id').prop('disabled', true);
		
		// 페이지 데이터 읽어오기
		var page = $(this).attr('id');
		
		$('#nowPage').val(page);
		$('#frm').attr('action', '/boa/board/boardList.boa');
		$('#frm').submit();
	});
	
// 리스트 페이지 기능 -------------------------------------------------------------------------

	// 게시글 클릭시
	$('.pbox').click(function(){
		var bno = $(this).attr('id');
		$('#bno').val(bno);
		$('#vw').prop('disabled', true);
		$('#cno').prop('disabled', true);
		
		$('#frm').attr('action', '/boa/board/boardDetail.boa');
		$('#frm').submit();
	});
	
	// 게시글 삭제
	$('.dbtn').click(function(){
		// 게시글 번호 읽어오기
		var sbno = $(this).parent().attr('id');
		
		// 폼태그에 파라미터 세팅
		$('#bno').val(sbno);
		
		// 불필요한 태그 무효화
		$('#vw').prop('disabled', true);
		
		// 전송
		$('#frm').attr('action', '/boa/board/boardDel.boa');
		$('#frm').submit();
	});
	
	
	// 게시글 수정
	$('.ebtn').click(function(){
		// 게시글 번호 읽어오기
		var sbno = $(this).parent().attr('id');
		
		// 폼태그에 파라미터 세팅
		$('#bno').val(sbno);
		
		// 불필요한 태그 무효화
		$('#cno').prop('disabled', true);
		$('#vw').prop('disabled', true);
		$('#cno').prop('disabled', true);
		
		// 전송
		$('#frm').attr('action', '/boa/board/boardEdit.boa');
		$('#frm').submit();
	});

// 게시글 상세보기 페이지 ----------------------------------------------------------------------

	// 좋아요 기능
	$('.like').click(function(){
		var sbno = $('#bno').val();
		var sid = $('#id').val();
		var targ = '/boa/board/likeProc.boa';
		var img = '/boa/img/c/liked.jpg';
		var aid = 'like';
		
		// 이미 좋아요 되어있으면 해제 처리
		if($(this).attr('id') == 'like') {
			targ = '/boa/board/discardMark.boa';
			img = '/boa/img/c/unlike.jpg';
			aid = 'unlike';
		}
		
		$.ajax({
			url: targ,
			type: 'post',
			dataType: 'json',
			data: {
				bno: sbno,
				id: sid
			},
			success: function(data){
				if(data.result == 'YES'){
					$('.like').attr('src', img);
					$('.like').attr('id', aid);
				}
			},
			error: function(){
			}
		});
	});
	
	// 찜 기능
	$('.jjim').click(function(){
		var sbno = $('#bno').val();
		var sid = $('#id').val();
		var targ = '/boa/board/jjimProc.boa';
		var clas = 'w3-round-large genre jjim w3-indigo'
		var aid = 'jjimed';
		
		// 이미 찜 되어있으면 해제 처리
		if($(this).attr('id') == 'jjimed') {
			targ = '/boa/board/discardMark.boa';
			clas = 'w3-round-large genre jjim';
			aid = 'jjimyet';
		}
		
		$.ajax({
			url: targ,
			type: 'post',
			dataType: 'json',
			data: {
				bno: sbno,
				id: sid
			},
			success: function(data){
				if(data.result == 'YES'){
					$('.jjim').attr('class', clas);
					$('.jjim').attr('id', aid);
				}
			},
			error: function(){
			}
		});
		
	});
	
	// 게시글 구매
	$('#buyPost').click(function(){
		$('#mdcontext').html('게시글을 구매하시겠습니까?');
		$('#modal, #buy, #cancel').css('display', 'block');
	});
	
	$('#buy').click(function(){
		$('#vw').prop('disabled', true);
		$('#frm').attr('action', '/boa/board/buyBoard.boa');
		$('#frm').submit();
	});
	$('#cancel').click(function(){
		$('#modal, #cancel, #buy').css('display', 'none');
	});
	
	// 컬렉션으로
	$('#upcoll').click(function(){
		$('#bno').prop('disabled', true);
		$('#id').prop('disabled', true);
		$('#vw').prop('disabled', true);
		
		$('#frm').attr('action', '/boa/board/boardList.boa');
		$('#frm').submit();
	});
	
	// 게시글 상세보기 -> 댓글 리스트
	$('#reshow').click(function(){
		$('#vw').prop('disabled', true);
		$('#gnp').prop('disabled', true);
		$('#nowPage').attr('name', 'bnowPage');
		
		$('#frm').attr('action', '/boa/reboard/reboardList.boa');
		$('#frm').submit();
	});

	// 게시글 상세보기 -> 게시글 삭제
	$('#dbtn').click(function(){
		$('#vw').prop('disabled', true);
		$('#gnp').prop('disabled', true);
		
		$('#frm').attr('action', '/boa/board/boardDel.boa');
		$('#frm').submit();
	});
	
	// 게시글 상세보기 -> 게시글 수정
	$('#ebtn').click(function(){
		$('#vw').prop('disabled', true);
		$('#gnp').prop('disabled', true);
		
		$('#frm').attr('action', '/boa/board/boardEdit.boa');
		$('#frm').submit();
	});

// 게시글 작성 페이지 -----------------------------------------------------------------

	// 파일 프리뷰
	$('#thumb').change(function(e){
		var sfile = $(this).val();
		var path;
		if(sfile){
			path = URL.createObjectURL(e.target.files[0]);
		}
		$('#preview').attr('src', path);
	});
	
	// cno 클릭시 비워줌
	$('#cno').click(function(){
		$(this).val('');
		$(this).focus();
	});
	
	// 작성버튼
	$('#wpbtn').click(function(){
		// 쪽지쪽 input태그 무효화
		$('#title, #body').prop('disabled', true);
		
		// 데이터 따오기
		var title = $('#btitle').val();
		var cno = $('#cno').val();
		var body = $('#bbody').val().trim();
		var price = $('#price').val();
		
		// 체크박스 : 장르
		var genre = "";
		var chkbox = $('input:checkbox[id="genr"]:checked');
		var ck_gnr = chkbox.length;
		for(i=0; i<ck_gnr; i++){
			if(i == (ck_gnr - 1)){
				genre += chkbox[i].value;
			}else{
				genre += chkbox[i].value + "/";
			}
		}
		
		// 유효성 검사 실시
		// 파일
		var el = $('#thumb');
		// 입력된 파일 없으면 name 값 제거
		if(!$(el).val()){
			el.prop('disabled', true);
		}
		
		// 체크박스 : 장르
		if(genre == ""){
			$('input:checkbox[id="genr"]').prop('disabled', true);
			$('#genre').prop('disabled', true);
		}else{
			$('#genre').val(genre);
		}
		
		// 일반 텍스트
		if(!title){
			$('#mdcontext').html('글 제목은 필수입니다.');
			$('#modal').css('display', 'block');
			$('#thumb').prop('disabled', false);
			$('#title').focus();
			return;
		}else if(title.length > 50){
			$('#mdcontext').html('글 제목은 최대 50글자입니다.');
			$('#modal').css('display', 'block');
			$('#title').focus();
			return;
		}
		
		if(!cno){
			$('#mdcontext').html('게시글이 들어갈 컬렉션을 선택하세요.');
			$('#modal').css('display', 'block');
			return;
		}
		
		if(!body){
			$('#mdcontext').html('본문을 입력하세요.');
			$('#modal').css('display', 'block');
			$('#body').focus();
			return;			
		}else if(body.length > 2000){
			$('#mdcontext').html('본문은 최대 2000자입니다.');
			$('#modal').css('display', 'block');
			$('#body').focus();
			return;			
		}
		
		if(price > 50000){
			$('#mdcontext').html('가격은 최대 50000P입니다.');
			$('#modal').css('display', 'block');
			$('#price').focus();
			return;
		}else if(!price){// 입력값 없으면 0으로 세팅
			$('#price').val('0');
		}
		
		$('#frm').submit();
	});

// 게시글 수정 페이지 ---------------------------------------------------------------------

	// 파일 프리뷰
	$('#newthumb').change(function(e){
		var sfile = $(this).val();
		var path;
		if(sfile){
			path = URL.createObjectURL(e.target.files[0]);
		}
		$('#preview').attr('src', path);
	});
	
	$('#epbtn').click(function(){
		// 쪽지쪽 input 태그 무효화
		$('#title, #body').prop('disabled', true);
		
		// 유효성 검사 : 원래 값 꺼내기
		var ttitle = $('#ttitle').val();
		var tisshow = $('#tisshow').val();
		var tforwho = $('#tforwho').val();
		var tprice = $('#tprice').val();
		var tgenre = $('#tgenre').val();
		var tbody = $('#tbody').val();
		
		// 변경 된 값 찾아오기
		var title = $('#btitle').val().trim();
		var isshow = $('[name="isshow"]:checked').val();
		var forwho = $('[name="forwho"]:checked').val();
		var price = $('#price').val().trim();
		if(!price){// 입력값 없으면 0으로 세팅
			$('#price').val('0');
			price = 0;
		}
		var body = $('#bbody').val().trim();
		
		// 체크박스 : 장르
		var genre = "";
		var chkbox = $('input:checkbox[id="genr"]:checked');
		var ck_gnr = chkbox.length;
		if(ck_gnr == 0) genre = 'empty';
		for(i=0; i<ck_gnr; i++){
			if(i == (ck_gnr - 1)){
				genre += chkbox[i].value;
			}else{
				genre += chkbox[i].value + "/";
			}
		}
		
		// 유효성 검사 변수
		var titBool = true;
		var showBool = true;
		var whoBool = true;
		var priceBool = true;
		var gnrBool = true;
		var bodyBool = true;
		var thumbBool = false;
		
		// 새 파일 : 유효성 검사
		var el = $('#newthumb');
		// 입력된 파일 없으면 name 값 제거
		if(!$(el).val()){
			el.prop('disabled', true);
		}else{// 파일 업로드, 선택 동시에 함
			if($('input:radio[id="sthumb"]:checked').val()){
				$('#mdcontext').html('새 썸네일 업로드, 히스토리 썸네일 선택 중 하나만 가능합니다.');
				$('#modal').css('display', 'block');
				return;
			}
		}
		
		// 통과한 경우 : 새 썸네일O
		if($(el).val()){
			thumbBool = true;
		// 새 썸네일, 히스토리 체크 모두 안함
		}else if(!$('input:radio[id="sthumb"]:checked').val()){
			// 이미 스킵버튼 눌렀으면 실행 X
			if($('#skipThumb').css('display') != 'block'){
					
				$('#mdcontext').html('선택된 썸네일이 없습니다. 기존 썸네일을 사용하시겠습니까?');
				$('#skipThumb').css('display', 'block');
				$('#continue').css('display', 'block');
				$('#modal').css('display', 'block');
				
				return;
			}
			
		// 선택 파일 존재 : 선택 파일 유효성 검사
		}else if($('input:radio[id="sthumb"]:checked').val() != tfno){
			thumbBool = true;
		}else{
			$('#sthumb').prop('disabled', true);
		}
		
		// 변경 안됐으면 전송 안되게 막기
		if(title == ttitle){
			$('#title').prop('disabled', true);
			titBool = false;
		}else if(title.length > 50){
			$('#mdcontext').html('글 제목은 최대 50글자입니다.');
			$('#modal').css('display', 'block');
			$('#title').focus();
			return;
		}
		if(tisshow == isshow){
			$('#isshow').prop('disabled', true);
			showBool = false;
		}
		if(tforwho == forwho){
			$('#forwho').prop('disabled', true);
			whoBool = false;
		}
		if(price == tprice){
			priceBool = false;
		}else if(price > 50000){
			$('#mdcontext').html('가격은 최대 50000P입니다.');
			$('#modal').css('display', 'block');
			$('#price').focus();
			return;
		}
		if(genre == tgenre){
			$('#genre').prop('disabled', true);
			gnrBool = false;
		}else{
			$('#genre').val(genre);
		}
		if(!body){
			$('#mdcontext').html('본문을 입력하세요.');
			$('#modal').css('display', 'block');
			$('#body').focus();
			return;
		}else if(body.length > 2000){
			$('#mdcontext').html('본문은 최대 2000자입니다.');
			$('#modal').css('display', 'block');
			$('#body').focus();
			return;			
		}else if(body == tbody){
			$('#body').prop('disabled', true);
			bodyBool = false;
		}
		
		// 아무 변경사항이 없다면
		if((titBool | showBool | whoBool | priceBool | gnrBool | bodyBool | thumbBool) == false){
			$('#mdcontext').html('변경사항이 없습니다.');
			$('#skipThumb').css('display', 'none');
			$('#continue').css('display', 'none');
			$('#modal').css('display', 'block');
			$('#title').prop('disabled', false);
			$('#price').prop('disabled', false);
			$('#genr').prop('disabled', false);
			$('#body').prop('disabled', false);
			$('#newthumb').prop('disabled', false);
			$('#sthumb').prop('disabled', false);
			$('[name="forwho"]').prop('disabled', false);
			$('[name="isshow"]').prop('disabled', false);
			return;
		}
		
		$('#frm').submit();
	});

	// 모달 창 버튼 function
	$('#skipThumb').click(function(){
		$('#modal').css('display', 'none');
		$('#sthumb').prop('disabled', true);
		$('#newThumb').prop('disabled', true);
		$('#epbtn').trigger('click');
	});
	$('#continue').click(function(){
		$('#modal').css('display', 'none');
		$('#newthumb').prop('disabled', false);
	});
});