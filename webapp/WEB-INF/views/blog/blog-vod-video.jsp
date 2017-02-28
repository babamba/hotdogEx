<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->

<html class="no-js">
<!--<![endif]-->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">
<title>Hot dog</title>

<head>

<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/assets/template/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/template/vendor/fontawesome/css/font-awesome.min.css"
	type="text/css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/template/vendor/animateit/animate.min.css"
	rel="stylesheet">

<!-- Vendor css -->
<link
	href="${pageContext.request.contextPath}/assets/template/vendor/owlcarousel/owl.carousel.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/template/vendor/magnific-popup/magnific-popup.css"
	rel="stylesheet">

<!-- Template base -->
<link
	href="${pageContext.request.contextPath}/assets/template/css/theme-base.css"
	rel="stylesheet">

<!-- Template elements -->
<link
	href="${pageContext.request.contextPath}/assets/template/css/theme-elements.css"
	rel="stylesheet">

<!-- Responsive classes -->
<link
	href="${pageContext.request.contextPath}/assets/template/css/responsive.css"
	rel="stylesheet">

<!--[if lt IE 9]>
		<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->

<!-- Template color -->
<link
	href="${pageContext.request.contextPath}/assets/template/css/color-variations/blue.css"
	rel="stylesheet" type="text/css" media="screen" title="blue">

<!-- LOAD GOOGLE FONTS -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,800,700,600%7CRaleway:100,300,600,700,800"
	rel="stylesheet" type="text/css" />

<!-- CSS CUSTOM STYLE -->
<link
	rel="${pageContext.request.contextPath}/assets/template/stylesheet"
	type="text/css" href="css/custom.css" media="screen" />

<!--VENDOR SCRIPT-->
<script
	src="${pageContext.request.contextPath}/assets/template/vendor/jquery/jquery-1.11.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/template/vendor/plugins-compressed.js"></script>
	
<!-- SLIDER REVOLUTION 5.x CSS SETTINGS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/template/vendor/rs-plugin/css/settings.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/template/vendor/rs-plugin/css/layers.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/template/vendor/rs-plugin/css/navigation.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/template/css/rs-plugin-styles.css">
    
    <!-- SLIDER REVOLUTION 5.x SCRIPTS  -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/template/vendor/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/template/vendor/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<!-- User Profile -->
<script
	src="${pageContext.request.contextPath}/assets/js/userProfile.js"></script>
<link
	href="${pageContext.request.contextPath}/assets/css/userProfile.css" rel="stylesheet">
	
<!-- alertify -->
<link href="${pageContext.request.contextPath}/assets/alertify/alertify.core.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/alertify/alertify.default.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/assets/alertify/alertify.js"></script>
	
<script>


var deleteVod = function(delvideoNo,deluserNo,delname){
	
	$.ajax({
        url:"${pageContext.request.contextPath}/blog/api/deletevod",
        type:"post",
        data:"videoNo="+delvideoNo,
        success: function(){
            console.log("success");
            
        	$.ajax({
                url:"http://150.95.141.66/test/cgi-bin/deleteVod.py",
                type:"post",
                data: { userNo : deluserNo , name: delname },
                success: function(){
                    history.go(0);                   
                },
                error : function(jqXHR, status, e) {
                console.log(status + ":" + e);
                }   
        	})
        	
        },
        error : function(jqXHR, status, e) {
       		console.log(status + ":" + e);
        }   
	})



}

$(function(){
	
	$(document).on("click", "#deleteVOD" ,function(event){
		event.preventDefault();
		
		var delname = $(this).data("name");
		var deluserNo = $(this).data("no");
		var delvideoNo = $(this).data("vno");
		
		alertify.confirm("비디오를 삭제하시겠습니까?",function(e){
			if(e){
				alertify.success("삭제완료", deleteVod(delvideoNo,deluserNo,delname));
			}else{
				alertify.error('삭제가 취소되었습니다.');
			}
	});		
	})
	
})
</script>
<body class="boxed background-grey" >
	<div class="wrapper" style="border:none;">
	
		<!-- START: HEADER PAGE TITLE -->
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<!-- END: PAGE TITLE -->
		<c:import url="/WEB-INF/views/includes/navigation-blog.jsp" />

		
		

		<!-- CONTENT -->
		<!-- REVOLUTION SLIDER -->
        <div id="slider"> <div id="rev_slider_60_1_wrapper" class="rev_slider_wrapper fullwidthbanner-container" data-alias="vimeo-gallery58" style="margin:0px auto;background-color:#000000;padding:0px;margin-top:0px;margin-bottom:0px;">
				<!-- START REVOLUTION SLIDER 5.0.7 auto mode -->
					<div id="rev_slider_60_1" class="rev_slider fullwidthabanner" style="display:none;" data-version="5.0.7">
						<ul>	
						
							<!-- SLIDE  -->
							<c:forEach items="${list }"	var="vo" varStatus="status">
														
							<li data-title="${vo.regdate }<br>${vo.regtime}" style="font-size:60px;" >
								<button id="deleteVOD" class="button red-dark button-3d rounded" style="float:right;" data-name="${vo.save_name }" data-no="${vo.users_no }" data-vno="${vo.video_no }"> 삭제</button>
								<video width="100%" height="90%"  controls="controls">
							    <source src="http://150.95.141.66/hotdog/hotdog/image/user/${vo.users_no }/${vo.save_name }" type="video/mp4" />
								</video>
							
							</li>
							</c:forEach>
							
						</ul>
						<div class="tp-bannertimer tp-bottom" style="visibility: hidden !important;"></div>	
					</div>
				</div><!-- END REVOLUTION SLIDER -->
				<script type="text/javascript">
					var tpj=jQuery;
					
					var revapi60;
					tpj(document).ready(function() {
						if(tpj("#rev_slider_60_1").revolution == undefined){
							window.locatino.href="${pageContext.request.contextPath }/hotdog/community";
						}else{
							revapi60 = tpj("#rev_slider_60_1").show().revolution({
								sliderType:"standard",
								jsFileLocation: "${pageContext.request.contextPath }/assets/template/vendor/rs-plugin/js/",
								sliderLayout:"auto",
								dottedOverlay:"none",
								delay:9000,
								navigation: {
									keyboardNavigation:"off",
									keyboard_direction: "horizontal",
									mouseScrollNavigation:"off",
									onHoverStop:"off",
									arrows: {
										style:"uranus",
										enable:true,
										hide_onmobile:true,
										hide_under:778,
										hide_onleave:true,
										hide_delay:200,
										hide_delay_mobile:1200,
										tmp:'',
										left: {
											h_align:"left",
											v_align:"center",
											h_offset:20,
											v_offset:0
										},
										right: {
											h_align:"right",
											v_align:"center",
											h_offset:20,
											v_offset:0
										}
									}
									,
									thumbnails: {
										style:"erinyen",
										enable:true,
										width:200,
										height:113,
										min_width:170,
										wrapper_padding:30,
										wrapper_color:"#333333",
										wrapper_opacity:"1",
										tmp:'<span class="tp-thumb-over"></span><span class="tp-thumb-image"></span><span class="tp-thumb-title">{{title}}</span><span class="tp-thumb-more"></span>',
										visibleAmount:10,
										hide_onmobile:false,
										hide_onleave:false,
										direction:"horizontal",
										span:true,
										position:"outer-top",
										space:20,
										h_align:"center",
										v_align:"top",
										h_offset:0,
										v_offset:0
									}
								},
								gridwidth:1230,
								gridheight:692,
								lazyType:"none",
								shadow:0,
								spinner:"spinner2",
								stopLoop:"on",
								stopAfterLoops:0,
								stopAtSlide:1,
								shuffle:"off",
								autoHeight:"off",
								disableProgressBar:"on",
								hideThumbsOnMobile:"off",
								hideSliderAtLimit:0,
								hideCaptionAtLimit:0,
								hideAllCaptionAtLilmit:0,
								debugMode:false,
								fallbacks: {
									simplifyAll:"off",
									nextSlideOnWindowFocus:"off",
									disableFocusListener:false,
								}
							});
						}
					});	/*ready*/
				</script></div>
				<!-- END: SECTION -->
		<br><br>
		<!-- END: SECTION -->

		<!-- FOOTER -->
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
		<!-- END: FOOTER -->
		
	</div>
	<!-- END: WRAPPER -->
	<!-- Theme Base, Components and Settings -->
	<script
		src="${pageContext.request.contextPath}/assets/template/js/theme-functions.js"></script>

	<!-- Custom js file -->
	<script
		src="${pageContext.request.contextPath}/assets/template/js/custom.js"></script>
</body>
</html>