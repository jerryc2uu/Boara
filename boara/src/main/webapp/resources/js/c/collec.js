$(document).ready(function(){

// 상단 바 처리 -------------------------------------------------------------------------------

	// 로그인
	$('#lbtn').click(function(){
		// 파라미터 세팅
		$('#vw').val('/boa/collection/collecList.boa');
		$('#cno').prop('disabled', true);
		
		$('#frm').attr('action', '/boa/member/login.boa');
		$('#frm').submit();
	});

	// 회원가입
	$('#jbtn').click(function(){
		// 파라미터 세팅
		$('#vw').val('/boa/collection/collecList.boa');
		$('#cno').prop('disabled', true);
		
		$('#frm').attr('action', '/boa/member/join.boa');
		$('#frm').submit();
	});

	// 로그아웃
	$('#obtn').click(function(){
		// 파라미터 세팅
		$('#vw').val('/boa/collection/collecList.boa');
		$('#cno').prop('disabled', true);
		
		$('#frm').attr('action', '/boa/member/logout.boa');
		$('#frm').submit();
	});
	
// 페이지 처리 --------------------------------------------------------------------------------

	$('.cpbtn').click(function(){
		// cno, vw 파라미터 무효화
		$('#cno').prop('disabled', true);
		$('#vw').prop('disabled', true);
		
		// 페이지 데이터 읽어오기
		var page = $(this).attr('id');
		
		$('#nowPage').val(page);
		$('#frm').attr('action', '/boa/collection/collecList.boa');
		$('#frm').submit();
	});
	
// 리스트 페이지 기능 -------------------------------------------------------------------------

	// 컬렉션 클릭시
	$('.cbox').click(function(){
		// cno 외의 파라미터 무효화
		$('#nowPage').prop('disabled', true);
		$('#cid').prop('disabled', true);
		$('#vw').prop('disabled', true);
		
		// cno 세팅
		var cno = $(this).attr('id');
		$('#cno').val(cno);
		
		$('#frm').attr('action', '/boa/board/boardList.boa');
		$('#frm').submit();
	});

	// 컬렉션 삭제 버튼
	$('.dbtn').click(function(){
		// 컬렉션 번호 읽어오기
		var scno = $(this).parent().attr('id');
		
		// 폼태그에 파라미터 세팅
		$('#cno').val(scno);
		
		// 불필요한 파라미터 무효화
		$('#cid').prop('disabled', true);
		$('#vw').prop('disabled', true);

		// 전송
		$('#frm').attr('action', '/boa/collection/collecDel.boa');
		$('#frm').submit();
	});
	
	/* 컬렉션 수정 버튼
	$('.ebtn').click(function(){
		// 컬렉션 번호 읽어오기
		var scno = $(this).parent().attr('id');
		
		// 폼태그에 파라미터 세팅
		$('#cno').val(scno);
		
		// 전송
		$('#frm').attr('action', '/boara/collection/collecEdit.boa');
		$('#frm').submit();
	});*/

/* 컬렉션 작성 페이지 ---------------------------------------------------------------------

	// 파일 프리뷰
	$('#thumb').change(function(e){
		var sfile = $(this).val();
		var path;
		if(sfile){
			path = URL.createObjectURL(e.target.files[0]);
		}
		$('#preview').attr('src', path);
	});
	
	$('#wpbtn').click(function(){
		// 유효성 검사 : 값 가져오기
		var cname = $('#cname').val();
		var descr = $('#descr').val();

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
		
		// 일반 텍스트
		if(!cname){
			alert('컬렉션 이름은 필수입니다.');
			$('#cname').focus();
			return;
		}else if(cname.length > 30){
			alert('컬렉션 이름은 최대 30글자입니다.');
			$('#cname').focus();
			return;
		}
		
		if(descr.legnth > 30){
			alert('컬렉션 설명은 최대 30글자입니다.');
			$('#descr').focus();
			return;
		}else if(descr.length == 0){// 입력값 없으면 name 지워주기
			$('#descr').prop('disabled', true);
		}
		
		// 체크박스 : 장르
		if(genre == ""){
			$('input:checkbox[id="genr"]').prop('disabled', true);
			$('#genre').prop('disabled', true);
		}else{
			$('#genre').val(genre);
		}
		$('#frm').submit();
	});
*/
/* 컬렉션 수정 페이지 ---------------------------------------------------------------------

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
		var tcname = $('#tcname').val();
		var tdescr = $('#tdescr').val();
		var tgenre = $('#tgenre').val();
		 
		// 변경 된 값 찾아오기
		var cname = $('#cname').val().trim();
		var descr = $('#descr').val().trim();
		
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
		
		// 새 파일 : 유효성 검사
		var el = $('#newthumb');
		// 입력된 파일 없으면 name 값 제거
		if(!$(el).val()){
			el.prop('disabled', true);
			
		}else{// 파일 두개 올라온경우
			if($('input:radio[id="sthumb"]:checked').val()){
				alert('새 파일을 올리거나, 아래 이미지 중 선택해 주세요.');
				return;
			}	
		}
		
		// 변경 안됐으면 전송 안되게 막기
		if(cname == tcname){
			$('#cname').prop('disabled', true);
		}
		if(descr == tdescr){
			$('#descr').prop('disabled', true);
		}
		if(genre == tgenre) {
			$('#genre').prop('disabled', true);
		}else{
			$('#genre').val(genre);
		}
		
		$('#frm').submit();
	});
*/
});