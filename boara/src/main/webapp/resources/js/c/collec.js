$(document).ready(function(){

// 상단 바 처리 ---------------------------------------------------------------------------------

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
	
// 페이지 처리 ----------------------------------------------------------------------------------

	$('.cpbtn').click(function(){
		// cno, vw 파라미터 무효화
		$('#cno').prop('disabled', true);
		$('#vw').prop('disabled', true);
		$('#id').prop('disabled', true);
		
		// 페이지 데이터 읽어오기
		var page = $(this).attr('id');
		
		$('#nowPage').val(page);
		$('#frm').attr('action', '/boa/collection/collecList.boa');
		$('#frm').submit();
	});
	
// 리스트 페이지 기능 ---------------------------------------------------------------------------

	// 컬렉션 클릭시
	$('.cbox').click(function(){
		// cno 외의 파라미터 무효화
		$('#nowPage').prop('disabled', true);
		$('#cid').prop('disabled', true);
		$('#vw').prop('disabled', true);
		$('#id').prop('disabled', true);
		
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
	
	// 컬렉션 수정 버튼
	$('.ebtn').click(function(){
		// 컬렉션 번호 읽어오기
		var scno = $(this).parent().attr('id');
		
		// 폼태그에 파라미터 세팅
		$('#cno').val(scno);
		
		// 전송
		$('#frm').attr('action', '/boa/collection/collecEdit.boa');
		$('#frm').submit();
	});

// 컬렉션 작성/수정 페이지 ----------------------------------------------------------------------

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
			$('#sgenre').prop('disabled', true);
		}else{
			$('#sgenre').val(genre);
		}
		
		$('#frm').submit();
	});

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
		var tfno = $('#tfno').val();
		 
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
		
		// 유효성 검사 변수
		var nameChange = true;
		var descrChange = true;
		var genreChange = true;
		var thumbChange = false;
		
		// 새 파일 유효성 검사
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
			thumbChange = true;
		}else if(!$('input:radio[id="sthumb"]:checked').val()){
			alert('썸네일을 추가해주세요.');
			$('#newthumb').prop('disabled', false);
			return;
		}
		
		// 통과 한 경우 : 선택 파일이 있는 경우
		if($('input:radio[id="sthumb"]:checked').val() != tfno){
			thumbChange = true;
		}else{
			$('#sthumb').prop('disabled', true);
		}
		
		// 변경 안됐으면 전송 안되게 막기
		if(cname == tcname){
			$('#cname').prop('disabled', true);
			nameChange = false;
		}
		if(descr == tdescr){
			$('#descr').prop('disabled', true);
			descrChange = false;
		}
		if(genre == tgenre) {
			$('#sgenre').prop('disabled', true);
			genreChange = false;
		}else{
			$('#sgenre').val(genre);
		}
		
		// 변경 사항이 아예 없을시 alert
		if((nameChange | descrChange | genreChange | thumbChange) == false){
			alert('변경 사항이 없습니다.');
			$('#cname').prop('disabled', false);
			$('#descr').prop('disabled', false);
			$('#genr').prop('disabled', false);
			$('#sthumb').prop('disabled', false);
			$('#newthumb').prop('disabled', false);
			return;
		}
		
		$('#frm').submit();
	});

});