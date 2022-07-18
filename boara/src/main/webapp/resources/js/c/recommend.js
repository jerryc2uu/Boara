$(document).ready(function(){
	// 최다 조회 장르값 받기
	if(!$('#gno').val()) {
		$('#recobox').css('display', 'none');
		return;
	}
	
	var recojson = $.ajax({
		url: 'https://book.interpark.com/api/recommend.api',
		type: 'GET',
		dataType: 'jsonp',
		data: {
			key: '7AF4A97F95393A79AFD8FD22B374E368210424DE6026B490D6CF0C46EA748B4D',
			categoryId: $('#gno').val(),
			output: 'json'
		},
		success: function(data){
			for(var i=0; i < 5; i++){
				var add = '<div class="inblock w3-center mgl10">'
							+ '<div class="pic">'
								+ '<a href="' + data.item[i].link + '">'
									+ '<img class="top" src="'+ data.item[i].coverLargeUrl + '">'
								+ '</a>'
							+ '</div>'
							+ '<div class="w3-text-gray w3-large">'
								+ data.item[i].title + '<br>' + data.item[i].author
							+ '</div>'
						+ '</div>'
				$('#recommend').append(add);
			}
		}
		,error: function(){alert('도서추천 통신오류')}
	});
});