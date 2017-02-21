// PROFILE SCRIPT

		var users_no = $(this).data("no");

		$(document).on('ready', function(){
	    $modal = $('.modal-frame');
	    $overlay = $('.modal-overlay');

	    /* Need this to clear out the keyframe classes so they dont clash with each other between ener/leave. Cheers. */
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
	    	
	      $overlay.addClass('state-show');
	      $modal.removeClass('state-leave').addClass('state-appear');
	    });

	  });
	
       // 1. 유저를 클릭했을때,팔로우 유무, 대상의 요약정보를 요청한다.
       $("#showInfo").click(function(){
    	  var users_no = $(this).data("no");
//          var users_no= ${map.userVo.users_no};
          var follower;
          var didfollow;
          
          console.log("showinfo click")
          
          $.ajax({
             url:"${pageContext.request.contextPath}/follow/infomodal",
             type:"post",
             data:"users_no="+users_no,
             dataType:"json",
             success:function(response){
                createButton(response.data.didFollow);
                createFollower(response.data.countFollower);
             }
          })
       })
       
       // 2-1.팔로우 유무를 판단하여 버튼을 생성한다.
       var createButton = function(didFollow){
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
       
       // 2-2. 갱신된 팔로워 숫자를 불러와 버튼을 생성한다.
       var createFollower=function(countFollower){
          var htmls = "<buttion id='followerButtion' data-no='" + users_no + "' >Follower : "+countFollower+"명</button>";
          $("#emptyFollowerButton").append(htmls);
       }
       
       // 3. 팔로우 / 팔로우 삭제 버튼 클릭시 요청 처리해주고 버튼 바꾸기
        $(document).on("click", "#followButton", function(){
           var htmls;
           
           $.ajax({
              url:"${pageContext.request.contextPath}/follow/add",
              type:"post",
              data:"users_no="+users_no,
              dataType:"json",
              success:function(response){
                 $("#followButton").remove();
                 htmls ="<button id='deleteFollowButton' data-no='" + users_no + "' >Delete Follow</button>";
                 $("#emptyButton").append(htmls);
              }
           })
         });
       
        $(document).on("click", "#deleteFollowButton", function(){
          
           var htmls;
           
           $.ajax({
              url:"${pageContext.request.contextPath}/follow/delete",
              type:"post",
              data:"users_no="+users_no,
              dataType:"json",
              success:function(response){
                 $("#deleteFollowButton").remove();
                 htmls = "<button id='followButton' data-no='" + users_no + "' >Follow</button>";
                 $("#emptyButton").append(htmls);
              }
           })
         });
      
        // 4. 유저 상세보기 창 닫을때 추가된 html 버튼 제거하기( 버튼 쌓이지 않게 )
        $(document).on("click","#infoModal-close",function(){
        $("#followButton").remove();
        $("#deleteFollowButton").remove();
        $("#followerButtion").remove();
        })
       