$(document).ready(function(){
	
	
	//페이징처리
	$('.pbtn').click(function(){
		var sno = $(this).attr('id');	
		var pcode = $(this).parent().attr('id');
		
		if(pcode == 101) {
			$('#pcode').prop('disabled', false);
		}
		
		$('#nowPage').val(sno);
		$('#frm').submit();
	});
	
	//충전 버튼
	$('#plusPoint').click(function(){
		var sumpoint = $('#spoint').html();
		$('#sumpoint').prop('disabled', false);
		$('#sumpoint').val(sumpoint);
		$('#frm').attr('action', '/boa/member/addPoint.boa');
		$('#frm').submit();
	});
	
	//자동 충전 해지 버튼
	$('#notAuto').click(function(){
		$('#id').val();
		$('#frm').attr('action', '/boa/member/cancleAuto.boa');
		$('#frm').submit();
	});
	
	$('dd').click(function(){
		
		$('iframe').css('display', 'none');
		
		var msg = $(this).html();
		
		if(msg == '회원정보 수정') {
		
			$('#frm').attr('action', '/boa/member/editInfo.boa');
        	$('#frm').submit();
		
		} else if(msg == '회원 탈퇴') {
		
		 	$('#frm').attr('action', '/boa/member/delMember.boa');
         	$('#frm').submit();
		
		} else if(msg == '좋아요 목록') {
		
			$('#myLike').css('display', 'block');
		
		} else if(msg == '찜 목록') {
			
			$('#myJJim').css('display', 'block');
			
		} else if(msg == '구매한 게시글') {
		
			$('#myBuy').css('display', 'block');
		
		} else if(msg == '포인트 이용 내역') {
			
			$('#myPoint').css('display', 'block');
			
		} else if(msg == '나의 컬렉션') {
			
			$('#id').attr('name', 'cid');
			$('#frm').attr('action', '/boa/collection/collecList.boa');
			$('#frm').submit();
		}
	
	});
	
	//전체 포인트 내역
	$('#allList').click(function(){
		$('#nowPage').val(1);
		$('#frm').submit();
	});
	
	//충전 내역만 보기
	$('#addList').click(function(){
		$('#nowPage').val(1);
		$('#pcode').prop('disabled', false);
		var pcode = $('#pcode').val();
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
	
	//결제하기 버튼
	$('#pay').click(function(){
		//가맹점 식별코드
		IMP.init('imp45012205');
		
		var money = $('input[name="money"]:checked').val();
		var isAuto = $('input[name="isAuto"]:checked').val();
		sid = $(this).parent().attr('id');
		
		$('#gnp').val(money);
		$('#isAuto').val(isAuto);
		
		IMP.request_pay({
		    pg : 'inicis',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '포인트 충전' , //결제창에서 보여질 이름
		    amount : money,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : sid,
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울 강남구 도곡동',
		    buyer_postcode : '123-456'
		}, function (rsp) {
			console.log(rsp);
	      
	      if(rsp.success) {
	      
	       	var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid; //결제 번호
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;	        
	        
	        var marchan = rsp.merchant_uid;
	        $('#mer').val(rsp.merchant_uid);
	        $('#imp').val(rsp.imp_uid);
	        $('#frm').submit();
	        
	      } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	      }
	      alert(msg);
	  });
	});
	
	//포인트 환불 버튼
	$('.canclePay').click(function(){
		 
      $('#imp').prop('disabled', false);
      $('#gnp').prop('disabled', false);

      //결제번호
      var imp = $(this).attr('id');
      $('#imp').val(imp);
      
      //환불 금액
      var gnp = $(this).prev().text();
      $('#gnp').val(gnp);
      
      $('#frm').attr('action', '/boa/member/canclePay.boa');
      $('#frm').submit();
	});
});