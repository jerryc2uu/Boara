$(document).ready(function(){

// 상단 바 처리 -------------------------------------------------------------------------------

	// 로그인
	$('#lbtn').click(function(){
		$('#frm').attr('action', '/boa/member/login.boa');
		$('#frm').submit();
	});

	// 회원가입
	$('#jbtn').click(function(){
		$('#frm').attr('action', '/boa/member/join.boa');
		$('#frm').submit();
	});

	// 로그아웃
	$('#obtn').click(function(){
		$('#frm').attr('action', '/boa/member/logout.boa');
		$('#frm').submit();
	});

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
		$('#id').prop('disabled', true);
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
		$('#cno').prop('disabled', true);
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
		$('#cno').prop('disabled', true);
		
		// 전송
		$('#frm').attr('action', '/boa/board/boardEdit.boa');
		$('#frm').submit();
	});

// 게시글 상세보기 페이지 ----------------------------------------------------------------------

	/* 좋아요 기능
	$('.like').click(function(){
		
	});*/
	
	/* 찜 기능
	$('.jjim').click(function(){
		
	});*/
	
	// 컬렉션으로
	$('#upcoll').click(function(){
		$('#bno').prop('disabled', true);
		$('#id').prop('disabled', true);
		$('#vw').prop('disabled', true);
		
		$('#frm').attr('action', '/boa/board/boardList.boa');
		$('#frm').submit();
	});
	
	// 댓글 리스트
	$('#reshow').click(function(){
		$('#vw').prop('disabled', true);
		
		$('#frm').attr('action', '/boa/reboard/reboardList.boa');
		$('#frm').submit();
	});

	// 게시글 상세보기 -> 게시글 삭제
	$('#dbtn').click(function(){
		$('#vw').prop('disabled', true);
		
		$('#frm').attr('action', '/boa/board/boardDel.boa');
		$('#frm').submit();
	});
	
	// 게시글 상세보기 -> 게시글 수정
	$('#ebtn').click(function(){
		$('#vw').prop('disabled', true);
		
		$('#frm').attr('action', '/boara/board/boardEdit.boa');
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
	
	// 작성버튼
	$('#wpbtn').click(function(){
		// 데이터 따오기
		var title = $('#title').val();
		var cno = $('#cno').val();
		var body = $('#body').val().trim();
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
			alert('글 제목은 필수입니다.');
			$('#title').focus();
			return;
		}else if(title.length > 50){
			alert('글 제목은 최대 50글자입니다.');
			$('#title').focus();
			return;
		}
		
		if(!cno){
			alert('게시글이 들어갈 컬렉션을 선택하세요.');
			return;
		}
		
		if(!body){
			alert('본문을 입력하세요.');
			$('#body').focus();
			return;			
		}else if(body.length > 2000){
			alert('본문은 최대 2000자입니다.');
			$('#body').focus();
			return;			
		}
		
		if(price > 50000){
			alert('가격은 최대 50000P입니다.');
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
		// 유효성 검사 : 원래 값 꺼내기
		var ttitle = $('#ttitle').val();
		var tisshow = $('#tisshow').val();
		var tforwho = $('#tforwho').val();
		var tprice = $('#tprice').val();
		var tgenre = $('#tgenre').val();
		var tbody = $('#tbody').val();
		
		// 변경 된 값 찾아오기
		var title = $('#title').val().trim();
		var isshow = $('[name="isshow"]:checked').val();
		var forwho = $('[name="forwho"]:checked').val();
		var price = $('#price').val().trim();
		if(!price){// 입력값 없으면 0으로 세팅
			$('#price').val('0');
			price = 0;
		}
		var body = $('#body').val().trim();
		
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
				alert('새 썸네일 업로드, 히스토리 썸네일 선택 중 하나만 가능합니다.');
				return;
			}
		}
		
		// 통과 한 경우 : 새 파일만 있음
		if($(el).val()){
			thumbBool = true;
		}else if(!$('input:radio[id="sthumb"]:checked').val()){
			alert('썸네일을 선택해주세요.');
			return;
		}
		
		// 통과 한 경우 : 선택 파일이 있는 경우
		if($('input:radio[id="sthumb"]:checked').val() != tfno){
			thumbBool = true;
		}else{
			$('#sthumb').prop('disabled', true);
		}
		
		// 변경 안됐으면 전송 안되게 막기
		if(title == ttitle){
			$('#title').prop('disabled', true);
			titBool = false;
		}else if(title.length > 50){
			alert('글 제목은 최대 50글자입니다.');
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
			alert('가격은 최대 50000P입니다.');
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
			alert('본문을 입력하세요.');
			$('#body').focus();
			return;
		}else if(body.length > 2000){
			alert('본문은 최대 2000자입니다.');
			$('#body').focus();
			return;			
		}else if(body == tbody){
			$('#body').prop('disabled', true);
			bodyBool = false;
		}
		
		// 아무 변경사항이 없다면
		if((titBool | showBool | whoBool | priceBool | gnrBool | bodyBool | thumbBool) == false){
			alert('변경사항이 없습니다.');
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
		
		alert('fno : ' + $('input:radio[id="sthumb"]:checked').val());
		alert('title : ' + titBool + ', show : ' + showBool + ', who : ' + whoBool + ', price : ' + priceBool
			+ ', body : ' + bodyBool + ', thumb : ' + thumbBool);
		$('#frm').submit();
	});

});