// PROFILE SCRIPT
//		var users_no = $(this).data("no");
		var users_no;

		$(document).on('ready', function(){
	    $modal = $('.modal-frame');
	    $overlay = $('.modal-overlay');
	    
	    $modal.bind('webkitAnimationEnd oanimationend msAnimationEnd animationend', function(e){
	      if($modal.hasClass('state-leave')) {
	        $modal.removeClass('state-leave');
	      }
	    });

	    $('.closeProfile').on('click', function(){
	      $overlay.removeClass('state-show');
	      $modal.removeClass('state-appear').addClass('state-leave');
	    });

	    $('.openProfile').on('click', function(){
	    	users_no = $(this).data("no");
	      $overlay.addClass('state-show');
	      $modal.removeClass('state-leave').addClass('state-appear');
	      openModal(users_no);
	    });

	  });
	

		
  // 1. 모달을 띄우면서  유저 번호를 가지고 모달 내용을 채운다.
  
       var openModal = function(users_no){
    	   
    	   $.ajax({
               url:"/hotdog/follow/profilemodal",
               type:"post",
               data:"users_no="+users_no,
               dataType:"json",
               success:function(response){
            	   basicProfile(response.data.basicProfile);
                  createButton(response.data.didFollow,response.data.myProfile,users_no);
                  createFollower(response.data.countFollower,users_no);
               }}
    	   )}
    
       
       // 2-1 기본 정보를 가져온다.
       var basicProfile = function(basicProfile){
    	   var htmls ='<img id="pf1" src="/hotdog/hotdog/image/user/'+basicProfile.users_image+'">'+
						'<h3 id="pf2" style="color:black;">'+basicProfile.nickname+'</h3>'+
						'<p id="pf3">'+basicProfile.infomation+'</p>'+
						'<p id="pf4">'+basicProfile.email+'</p>';
    	   $("#emptyProfile").append(htmls);
       }
       // 2-2.팔로우 유무를 판단하여 버튼을 생성한다. 본인 제외
       var createButton = function(didFollow,myProfile,users_no){
          
    	   if( myProfile == true){
    		   return;
    	   }
    	   
    	   var htmls;
          // 팔로우 안되어 있을 때 
          if(didFollow == false){
             htmls = "<button id='followButton' class='btn btn-white' data-no='" + users_no + "'>Follow</button>";
          }
          // 팔로우 되어 있을 때 생성할 버튼
          else{
             htmls ="<button id='deleteFollowButton' class='btn btn-white'>Delete Follow</button>";
          }
          
          $("#emptyButton").append(htmls);
       }
       
       // 2-3. 갱신된 팔로워 숫자를 불러와 버튼을 생성한다.
       var createFollower=function(countFollower,users_no){
          var htmls = "<buttion id='followerButtion' data-no='" + users_no + "' >Follower : "+countFollower+"명</button>";
          $("#emptyFollowerButton").append(htmls);
       }
       
       // 3. 팔로우 / 팔로우 삭제 버튼 클릭시 요청 처리해주고 버튼 바꾸기
        $(document).on("click", "#followButton", function(){
           var htmls;
           
           $.ajax({
              url:"/hotdog/follow/add",
              type:"post",
              data:"users_no="+users_no,
              dataType:"json",
              success:function(response){
                 $("#followButton").remove();
                 htmls ="<button  class='btn btn-white' id='deleteFollowButton' data-no='" + users_no + "' >UnFollow</button>";
                 $("#emptyButton").append(htmls);
              }
           })
         });
       
        $(document).on("click", "#deleteFollowButton", function(){
          
           var htmls;
           
           $.ajax({
              url:"/hotdog/follow/delete",
              type:"post",
              data:"users_no="+users_no,
              dataType:"json",
              success:function(response){
                 $("#deleteFollowButton").remove();
                 htmls = "<button  class='btn btn-white' id='followButton' data-no='" + users_no + "' >Follow</button>";
                 $("#emptyButton").append(htmls);
              }
           })
         });
      
        // 4. 유저 상세보기 창 닫을때 추가된 html 버튼 제거하기( 버튼 쌓이지 않게 )
        $(document).on("click","#infoModal-close",function(){
        $("#followButton").remove();
        $("#deleteFollowButton").remove();
        $("#followerButtion").remove();
        
        $("#pf1").remove();
        $("#pf2").remove();
        $("#pf3").remove();
        $("#pf4").remove();
    
        })
       