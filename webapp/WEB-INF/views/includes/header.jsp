<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

		<!-- HEADER -->
		<header id="header" class="header-transparent">
			<div id="header-wrap">
				<div class="container">

					<!--LOGO-->
					<div id="logo">
						<a href="${pageContext.request.contextPath}" class="logo">
							<img src="${pageContext.request.contextPath}/assets/img/hotdog_logo_02.png" alt="Hotdog">
						</a>
					</div>
					<!--END: LOGO-->

					<!--MOBILE MENU -->
					<div class="nav-main-menu-responsive">
						<button class="lines-button x">
							<span class="lines"></span>
						</button>
					</div>
					<!--END: MOBILE MENU -->

					<!--TOP SEARCH -->
					<div id="top-search">
						<a id="top-search-trigger"><i class="fa fa-search"></i><i
							class="fa fa-close"></i></a>
						<form action="search-results-page.html" method="get">
							<input type="text" name="q" class="form-control" value=""
								placeholder="Start typing & press  &quot;Enter&quot;">
						</form>
					</div>
					<!--END: TOP SEARCH -->
					
					<!--NAVIGATION-->
					<c:import url="/WEB-INF/views/includes/navigation.jsp" />
					<!--END: NAVIGATION-->
					
				</div>
			</div>
		</header>
		<!-- END: HEADER -->
		
		<!-- PAGE TITLE -->
		<section id="page-title"
			class="page-title-parallax page-title-center text-dark"
			style="background-image:url(${pageContext.request.contextPath}/hotdog/image/user/${map.blogVo.logo_image})">
			<div class="container">
			  <div class="page-title col-md-8">
					<h1>${map.blogVo.title}</h1>
					<span>${map.userVo.infomation}</span>
					
					 <!-- profile modal  -->
					<div id="showInfo">
						<button class="fancy-btn openProfile">
							<img
								src="${pageContext.request.contextPath}/hotdog/image/user/${map.userVo.users_image}">
						</button>
					</div>
				<div class="container modal-body-container">
					<div class="modal-frame">
						<div class="modal">
							<div class="modal-inset">

								<div class="icon-box effect medium closeProfile" id="infoModal-close" 
									 style="float:right; padding:10px; margin:10px;">
									<i class="fa fa-close"></i>
								</div>
								
								
									<div class="modal-body" style="clear:both; ">
										<img
											src="${pageContext.request.contextPath}/hotdog/image/user/${map.userVo.users_image}">
										<h3>${map.userVo.nickname}</h3>
										<p>${map.userVo.infomation}</p>
										<p>${map.userVo.email}</p>
										<div id="emptyFollowerButton" ></div>
										<div id="emptyButton" ></div>
										<%--<ul><li><a href="${pageContext.request.contextPath }/blog/${map.userVo.nickname">블로그 가기</a></li></ul> --%>
								</div>

								</div>
							</div>
						</div>
					</div>
				<div class="modal-overlay">
					
				</div>
			</div>
		</div>
	</section>
	<!-- END: PAGE TITLE -->
	
	<!-- user profile modal -->
	<script>
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
	
	</script>
	 <!--  PROFILE SCRIPT -->
               <script type="text/javascript">
               // 1. 유저를 클릭했을때,팔로우 유무, 대상의 요약정보를 요청한다.
               $("#showInfo").click(function(){
                  var users_no= ${map.userVo.users_no};
                  var follower;
                  var didfollow;
                  
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
                     htmls = "<button id='followButton' class='btn btn-white'>Follow</button>";
                  }
                  // 팔로우 되어 있을 때 생성할 버튼
                  else{
                     htmls ="<button id='deleteFollowButton' class='btn btn-white'>Delete Follow</button>";
                  }
                  
                  $("#emptyButton").append(htmls);
               }
               
               // 2-2. 갱신된 팔로워 숫자를 불러와 버튼을 생성한다.
               var createFollower=function(countFollower){
                  var htmls = "<buttion id='followerButtion' >Follower : "+countFollower+"명</button>";
                  $("#emptyFollowerButton").append(htmls);
               }
               
               // 3. 팔로우 / 팔로우 삭제 버튼 클릭시 요청 처리해주고 버튼 바꾸기
                $(document).on("click", "#followButton", function(){
                   var users_no= ${map.userVo.users_no};
                   var htmls;
                   
                   $.ajax({
                      url:"${pageContext.request.contextPath}/follow/add",
                      type:"post",
                      data:"users_no="+users_no,
                      dataType:"json",
                      success:function(response){
                         $("#followButton").remove();
                         htmls ="<button id='deleteFollowButton'>Delete Follow</button>";
                         $("#emptyButton").append(htmls);
                      }
                   })
                 });
               
                $(document).on("click", "#deleteFollowButton", function(){
                   var users_no= ${map.userVo.users_no};
                   var htmls;
                   
                   $.ajax({
                      url:"${pageContext.request.contextPath}/follow/delete",
                      type:"post",
                      data:"users_no="+users_no,
                      dataType:"json",
                      success:function(response){
                         $("#deleteFollowButton").remove();
                         htmls = "<button id='followButton'>Follow</button>";
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
               
               </script>
	
		