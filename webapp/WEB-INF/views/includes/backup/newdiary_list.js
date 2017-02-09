

/* $('.banner-bg').vgrid({
	time:400,
	delay:30,
	wait:500
});	   */

/*  $(function(){
    $(".list_container").vgrid({
        easing: "easeOutQuint",
        time: 500,
        delay: 20,
        fadeIn: {
            time: 300,
            delay: 50
        }
    }).click(function(){
    	console.log("list click!!!");
    })
});  */
 
	$(function(){
	    $(".list_container").vgrid({
	        easing: "easeOutQuint",
	        time: 500,
	        delay: 20,
	        fadeIn: {
	            time: 300,
	            delay: 50
	        }
	    }).click(function(){
	    	console.log("list click!!!");
	    })
	}); 


var isEnd = false;
var authUser = ${authUser.users_no};
var page = 0;			// 게시글의 0번째 인덱스 
var pluspage = 5;	// 게시글이 15개씩 fetchList로 로딩 되니까 fetchList가 요청될 시 15만큼 더해서 db인덱스값을 더해서 요청한다.

var render = function(vo, mode){
		
 var htmls = /*"<div class='list'><a href='#' rel='lightbox'><img src=''><h5>'" + vo.title + "</h5>" + 
			 "<ul class='list_content'><li>" + vo.regdate + "</li><li>" + vo.content + "</li>" + 
			 "</ul></a></div>"*/

	console.log("htmls");
			
	if(mode == true ){
		$(".list_container").prepend(htmls);
	}else{
		$(".list_container").append(htmls);
	}
}



var fetchList = function(){
	console.log("fetchList")
	if(isEnd == true){
		  return;
	  }
	
	  console.log(page);
	  
	  $.ajax({
		url: "${pageContext.request.contextPath }/post/api/list?p=" + page + "&no=" + authUser,
		type: "get",
		dataType: "json",
		data:"",
		success: function(response){

			if(response.result != "success"){
				console.error(response.message);
				isEnd = true;
				return;
			}
			
		$(response.data).each(function(index, vo){
			render(vo, false);
			console.log("render")
			 $(".list_container").vgrid({
	        easing: "easeOutQuint",
	        time: 500,
	        delay: 20,
	        fadeIn: {
	            time: 300,
	            delay: 50
	        }
	        
	    })
			
		});
		
		if( response.data.length < 10 ) {
			isEnd = true;
			$( ".load-more-link" ).prop( "disabled", true );
		}
		
		
		},
	error: function(jqXHR, status, e){
		console.error(status + ":" + e)
	}
});
}


	
	  $(function(){
		$(window).scroll( function(){
			var $window = $(this);				  // 브라우저 창 기준
			var scrollTop = $window.scrollTop();  // 스크롤의 현재 위치
			var windowHeight = $window.height();  // 윈도우창의 높이 가변
			var documentHeight = $( document ).height();  //문서의 기준
			
			
			// 창사이즈가 줄어들수록 window 값을 달라짐.
			// 스크롤의 맨마지막 top값을 알려면 
			// 문서높이  - 브라우저 창 높이 = 스크롤 스크롤 창 끝
			
			
			// 스크롤 바가 바닥까지 왔을 때( 10px 덜 왔을 때 )
			if( scrollTop == documentHeight - windowHeight ) {
				console.log( "call fetchList" );
				fetchList();
				++page;
				page = page * pluspage;
			}
		});
		fetchList();
		++page;
		page = page * pluspage;
	});
	  

  $(document).on('click', ".list", function(){
    lightbox.option({
      'resizeDuration': 200,
      'wrapAround': true
   		 })
    })
