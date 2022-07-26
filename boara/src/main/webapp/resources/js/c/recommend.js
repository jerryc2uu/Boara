$(document).ready(function(){
	// 최다 조회 장르값 받기
	if(!$('#gno').val() || $('#gno').val() == 0) {
		$('#recobox').css('display', 'none');
		return;
	}
	
	$.ajax({
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
				var pic = $(document.createElement('img')).prop('src', data.item[i].coverLargeUrl);
				var width = pic.prop('width');
				var height = pic.prop('height');
				
				var add = '<div class="inblock w3-center mgl10 bk">'
							+ '<div class="bookbox">'
									+ '<img class="bkimg" src="'+ data.item[i].coverLargeUrl + '"'
									
				if(width >= height){
					add += 'style="height:223px; width:auto; overflow:hidden;"'
				}else{
					add += 'style="height:auto; width:198px; overflow:hidden;"'
				}
				add += 'id="' + data.item[i].link + '">'
								+ '</div>'
							+ '<h5 class="w3-text-gray mg0">';
								
				if(data.item[i].title.length > 12){
               		add += data.item[i].title.substring(0, 12) + '..';
	            }else{
	            	add += data.item[i].title;
	            }
				
           		add += '</h5>' 
           			   + '<p class="w3-text-gray mg0">' + data.item[i].author + '</p>'
           				+ '</div>';
           		
				$('#recommend').append(add);
			}
			
			$('.bkimg').click(function(){
				var id =  $(this).attr('id');
				$(location).attr('href', id);
			});
		}
	});
});