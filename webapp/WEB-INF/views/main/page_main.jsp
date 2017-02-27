<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	
	
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">
	<title>Hot Dog</title>

	<!-- Bootstrap Core CSS -->
	<link href="${pageContext.request.contextPath}/assets/template/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/template/vendor/fontawesome/css/font-awesome.min.css" type="text/css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/template/vendor/animateit/animate.min.css" rel="stylesheet">

	<!-- Vendor css -->
	<link href="${pageContext.request.contextPath}/assets/template/vendor/owlcarousel/owl.carousel.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/template/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

	<!-- Template base -->
	<link href="${pageContext.request.contextPath}/assets/template/css/theme-base.css" rel="stylesheet">

	<!-- Template elements -->
	<link href="${pageContext.request.contextPath}/assets/template/css/theme-elements.css" rel="stylesheet">	
	
<!-- Responsive classes -->
	<link href="${pageContext.request.contextPath}/assets/template/css/responsive.css" rel="stylesheet">

<!--[if lt IE 9]>
		<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->	


	<!-- Template color -->
	<link href="${pageContext.request.contextPath}/assets/template/css/color-variations/red-dark.css" rel="stylesheet" type="text/css" media="screen" title="blue">

	<!-- LOAD GOOGLE FONTS -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,800,700,600%7CRaleway:100,300,600,700,800" rel="stylesheet" type="text/css" />

	<link href="http://fonts.googleapis.com/css?family=Roboto:400,300,800,700,600" rel="stylesheet" type="text/css" />

	<!-- CSS CUSTOM STYLE -->
    <link rel="${pageContext.request.contextPath}/assets/template/stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/template/css/custom.css" media="screen" />

    <!--VENDOR SCRIPT-->
    <script src="${pageContext.request.contextPath}/assets/template/vendor/jquery/jquery-1.11.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/template/vendor/plugins-compressed.js"></script>
    
    <!-- User Profile -->
	<script src="${pageContext.request.contextPath}/assets/js/userProfile.js"></script>
	<link href="${pageContext.request.contextPath}/assets/css/userProfile.css" rel="stylesheet">

	<script src="${pageContext.request.contextPath}/assets/js/board_list.js"></script>
	<!-- Alert -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/alertify/alertify.core.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/alertify/alertify.default.css">
	
	<script src="${pageContext.request.contextPath}/assets/alertify/alertify.js"></script>
</head>

<script type="text/javascript">
/* $(function(){
	var pi = '${piVo.device_num}';
	var user = '${authUser.users_no}';
		
 	if(user !=0){
        $.ajax({
            url:"http://150.95.141.66/test/cgi-bin/send.py",
            type:"post",
            data: { msg:"stream", ip: pi },
            success: function(){
                console.log("Streaming Start");
            },
            error : function(jqXHR, status, e) {
            console.log(status + ":" + e);
            }            
        });

	}

 	$(document).on("click", "#logout-stream", function(){
 		
         $.ajax({
            url:"http://150.95.141.66/test/cgi-bin/send.py",
            type:"post",
            data: { msg:"streamstop", ip: pi },
            success: function(){
                console.log("Streaming Stop");
            },
            error : function(jqXHR, status, e) {
            console.log(status + ":" + e);
            }            
        });
 
 	})
 	
})
 */</script>


<body class="boxed background-white no-page-loader">
	

	<!-- WRAPPER -->
	<div class="wrapper">
		<!-- HEADER -->
		<header id="header">
			<div id="header-wrap" >
				<div class="container">
					
					<!--LOGO-->
					<div id="logo" >
						<a href="${pageContext.request.contextPath}" class="logo"
							data-dark-logo="images/logo-dark.png"> <img
							src="${pageContext.request.contextPath}/assets/img/hotdog_logo_02.png"
							alt="Hotdog Logo">
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
					<c:import url="/WEB-INF/views/includes/search-bar.jsp" />
					<!--END: TOP SEARCH -->

					
				</div>
			</div>
		</header>
		<!-- END: HEADER -->
		
		<!-- INSPIRO SLIDER -->
		<div style="width:100%; height:500px; overflow-y:hidden;">
        <div  class="inspiro-slider " >
            <!-- Slide 1 -->
            <div class="slide background-overlay-dark" data-animation="fadeIn" data-animation-delay="100" data-vide-bg="${pageContext.request.contextPath}/assets/img/dog_video.mp4">

                <div class="container m-b-200" data-animation="fadeIn">
                	<div class="col-md-6 col-sm-12 col-xs-12">
	                    <div class="slide-captions col-md-12 col-sm-12 col-xs-12 m-b-40">
	                        <!-- Captions -->
	                        <h2 class="text-center">Hot Dog</h2>
	                        <h4 class="m-b-40 text-center">핫도그 커뮤니티에 오신 걸 환영해요!</h4>
	                       	<a class="text-center button transparent effect fill-vertical col-md-12 col-sm-12 col-xs-4 " href="${pageContext.request.contextPath}/community"><span>커뮤니티 게시판으로!</span></a>
	                        <!-- End: Captions -->
	                    </div>
                    </div>
                    
                 <!-- authUser info  부분  -->
                 <c:choose>
					<c:when test="${empty authUser}">
							<div class="col-md-4 col-sm-4 col-xs-4 pull-right" style="right:20px; padding-top:20px;">
								<div id="book">
								
										<div class="row text-center">
											<div class="col-md-12 col-sm-12 col-xs-12">
												<label>핫도그를 시작하세요!</label>
											</div>
										</div>
										
										
									<div class="row">
											<div class="col-md-12 col-sm-12 col-xs-12 text-center">	
												<a href="${pageContext.request.contextPath}/loginpage"><div class="button transparent effect fill-vertical col-md-12 col-sm-12 col-xs-4 text-center"><span>로그인 & 회원가입</span></div></a>
											</div>
									</div> 
								
								</div>
							</div>
						</c:when>
					
						<c:otherwise>
						<div class="col-md-5 col-sm-5 col-xs-5 pull-right" >
								<div id="book" class="col-md-12 col-sm-12 col-xs-12" >
										<div class="col-md-12 col-sm-12 col-xs-12 text-center">
											<button class="fancy-btn " style="position:relative; display:inline-block; left:-1%; margin-bottom:-38px;">
												<img src="${pageContext.request.contextPath}/hotdog/image/user/${authUser.users_image}">
											</button>
										</div>
										
										<div class="col-md-12 col-sm-12 col-xs-12">
											<div class="row">
												
											
												<div class="col-md-6 col-sm-6 col-xs-6 text-center">
													<label style="margin-top:10px;">"${authUser.nickname}"님</br>안녕하세요!</label>
												</div> 
												
												<div class="col-md-6 col-sm-6 col-xs-6 text-center">
													<a class="button transparent full-rounded" id="logout-stream" href="${pageContext.request.contextPath}/user/logout" ><span>로그아웃</span></a>
												</div>
											</div>
										</div>
									
									<div class="auth_nav col-md-12 col-sm-12 col-xs-12" style="margin:0px; padding:0px" >
										<div class="row">
												<!-- <a class="button transparent effect fill-vertical col-md-4 col-sm-4 col-xs-4 text-center" href="#" ><span>블로그</span></a>
												<a class="button transparent effect fill-vertical col-md-4 col-sm-4 col-xs-4 text-center" href="#" ><span>뉴스피드</span></a>
												<a class="button transparent effect fill-vertical col-md-4 col-sm-4 col-xs-4 text-center" href="#" ><span>스트리밍</span></a> -->
										
												<a href="${pageContext.request.contextPath}/blog/${authUser.nickname}"><div class="button transparent effect fill-vertical col-md-4 col-sm-4 col-xs-3 text-center"><span>블로그</span></div></a>
												<a href="${pageContext.request.contextPath}/community/newsfeed"><div class="button transparent effect fill-vertical col-md-4 col-sm-4 col-xs-3 text-center"><span>뉴스피드</span></div></a>
												<a href="${pageContext.request.contextPath}/blog/${authUser.nickname}/streaming"><div class="button transparent effect fill-vertical col-md-4 col-sm-4 col-xs-3 text-center"><span>스트리밍</span></div></a>								
										</div>
									</div>
								</div>
							
							</div>
						</c:otherwise>
			    	</c:choose>
					<!-- authUser info  부분  -->
					</div>
                </div>
       		 </div>
       		 </div>

		<div class="heading-fancy text-center heading-line m-t-15 m-l-40 m-r-40" data-animation="fadeInUp" data-animation-delay="300">
			<h3 style="padding-top:15px;margin-top:15px;font-size:20px;"><i class='fa fa-paw'></i>&nbsp;핫도그베스트</h3>
			<p style="margin-top:10px; font-size:13px;">친구들을 팔로잉 하고 오늘의  핫도그가 되어보세요 </p>
		</div>
		
		

		<section class="p-b-10 p-t-20">

		 <div class="portfolio">
                <!-- Portfolio Items -->
                <div id="isotope" class="isotope portfolio-items" data-animation="fadeIn" data-animation-delay="700" data-isotope-item-space="1" data-isotope-mode="masonry" data-isotope-col="5" data-isotope-item=".portfolio-item">
		  			<c:forEach items="${list }"	var="vo" varStatus="status">
		  			 
	                    <div class="portfolio-item design artwork" data-no="${vo.users_no }">
	                   
	                        <div class="image-box effect victor"> 
	                        	
	                        	<img style="width:100%;height:100%;" src="${pageContext.request.contextPath}/hotdog/image/user/${vo.pet_image }" alt="">
	                            
	                            <div class="image-box-content">
	                                <h3><a href="${pageContext.request.contextPath }/blog/${vo.nickname}" style="color:white;"><i class='fa fa-paw'></i>${vo.name }</a></h3>
	                                <p>${vo.gender }</p>
	                            </div>
	                        </div>
	                    </div>
                    
		  			</c:forEach>
				</div>
                <!-- END: Portfolio Items -->

            </div>

		</section>
		
		<div class="heading-fancy text-center heading-line m-t-15 m-l-40 m-r-40" data-animation="fadeInUp" data-animation-delay="400">
			<h3 style="padding-top:15px;margin-top:15px;font-size:20px;"><i class='fa fa-paw'></i>&nbsp;핫도그베스트</h3>
			<p style="margin-top:10px; font-size:13px;">친구들을 팔로잉 하고 오늘의  핫도그가 되어보세요 </p>
		</div>
		
		<!-- CATEGORIES -->
		<section class="p-t-20 p-b-20">
			<div class="container">
				<div class="row">
					<div class="col-md-4 board_category_list" data-animation="fadeInUp" data-animation-delay="100">
						<div class="heading-fancy heading-line" >
							<h4><a href="${pageContext.request.contextPath}/community/freeboard">프리톡!</a></h4>
						</div>
						
						<!-- ajax category List -->
						<div class="post-thumbnail-list">
							<div class="post-thumbnail-entry free_List">
								
							
							</div>
						</div>
						
					</div>
					
					<div class="col-md-4" data-animation="fadeInUp" data-animation-delay="300">
						<div class="heading-fancy heading-line board_list" >
							<h4><a href="${pageContext.request.contextPath}/community/galleryboard">갤러리톡!</a></h4>
						</div>
							
							
						<div class="post-thumbnail-list">
							<div class="post-thumbnail-entry gallery_list">
								
								
							</div>
						</div>
					</div>
					
					
					<div class="col-md-4" data-animation="fadeInUp" data-animation-delay="500">
						<div class="heading-fancy heading-line board_List" >
							<h4><a href="${pageContext.request.contextPath}/community/diaryboard">다이어리톡!</a></h4></div>
						<div class="post-thumbnail-list">
							<div class="post-thumbnail-entry diary_list">
								
							</div>

						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- END: HIGHTLIGHTS -->
		
		<div class="heading-fancy text-center heading-line m-t-5 m-l-40 m-r-40 p-b-10" data-animation="fadeInUp">
			<h3 style="padding-top:15px;margin-top:40px;font-size:20px;"><i class='fa fa-paw'></i>&nbsp;Welcome</h3>
			<p style="margin-top:10px; font-size:13px;">간단한 가입만으로 핫도그를 함께하세요 </p>
		</div>
		
		
		<!-- ADVERTISEMENT -->
		<section class="p-t-0 p-b-0" data-animation="fadeInUp">
			<div class="container">
			<div class="marketing-box" style="height:400px;">
				<img src="${pageContext.request.contextPath}/assets/img/Mock-Up2.png" style="width:100%;"/>
			
			</div>
			</div>
		</section>
		<!-- END: ADVERTISEMENT -->
		
		<section class="background text-dark p-b-40" style="margin-bottom:60px;">
			<div class="container">
				<div class="row">
					<div class="col-md-12" data-animation="fadeInUp" data-animation-delay="100">
						<div class="text-center" >
							<h1 class="text-medium-light" style="margin-bottom:40px;">핫도그를 사용해보셨나요?</h1>
						</div>
					</div>
					<div class="col-md-6 text-center" data-animation="fadeInUp" data-animation-delay="300" >
						<img class="col-md-12" src="${pageContext.request.contextPath}/assets/img/raspberry_pi.jpg">
					
					</div>
					<div class="col-md-6 text-center p-t-20 p-b-20" data-animation="fadeInUp" data-animation-delay="300">
						<br>핫도그(HotDog)는 라즈베리파이 기반의 센서 제어를 활용하여 <br>
						반려동물의 상태나 행돟을 원격으로 볼수 있는 시스템입니다.<br>
						<br>
						외부에서도 쉽게 반려동물의 상태를 알 수 있게 PetCam을 이용해 볼 수 있고,  <br>
						스피커를 이용하여 외로워하는 반려동물과의 대화를 할 수 있습니다.<br>
						<br>
						가입 후 자신만의 블로그에 반려동물과의 일상을 기록하고<br>
						커뮤니티를 통해 일상의 공유 및 자신의 반려동물을 더욱 멋지게 자랑하세요.
						<br><br></div>
				</div>
			</div>
		</section>
			
		<!-- FOOTER -->
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
		<!-- END: FOOTER -->	

	</div>
	<!-- END: WRAPPER -->

	<!-- GO TOP BUTTON -->
	<a class="gototop gototop-button" href="#"><i class="fa fa-chevron-up"></i></a>

	<!-- Theme Base, Components and Settings -->
	<script src="${pageContext.request.contextPath}/assets/template/js/theme-functions.js"></script>

	<!-- Custom js file -->
	<script src="${pageContext.request.contextPath}/assets/template/js/custom.js"></script>

	

</body>

</html>
