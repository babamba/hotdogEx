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

	<br><br><br>
	<!-- CONTENT -->
        <!-- REVOLUTION SLIDER -->
        <div id="slider"> <div id="rev_slider_8_1_wrapper" class="rev_slider_wrapper fullwidthbanner-container" data-alias="flickr-gallery12" style="margin:0px auto;background-color:#000000;padding:0px;margin-top:0px;margin-bottom:0px;">
				<!-- START REVOLUTION SLIDER 5.0.7 auto mode -->
					<div id="rev_slider_8_1" class="rev_slider fullwidthabanner" style="display:none;" data-version="5.0.7">
						<ul>	<!-- SLIDE  -->
						<c:forEach items="${list }"	var="vo" varStatus="status">
							<li data-index="${vo.capture_no }" data-transition="scaledownfromleft" data-slotamount="default"  data-easein="default" 
							data-easeout="default" data-masterspeed="1500"  data-thumb="http://150.95.141.66/hotdog/hotdog/image/user/${vo.users_no }/${vo.save_name }"   
							data-rotate="0"  data-fstransition="fade" data-fsmasterspeed="500" data-fsslotamount="7" data-saveperformance="off"  
							data-title="${vo.regdate }" data-param1="${vo.regtime }" data-param2="" data-description="">
								<!-- MAIN IMAGE -->
								<img src="${pageContext.request.contextPath }/assets/template/vendor/rs-plugin/examples/assets/images/dummy.png"  
								alt=""  width="1920" height="1080" 
								data-lazyload="http://150.95.141.66/hotdog/hotdog/image/user/${vo.users_no }/${vo.save_name }" 
								data-bgposition="center center" 
								data-bgfit="contain" data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina>
								<!-- LAYERS -->

							</li>
							</c:forEach>
						</ul>
						<div class="tp-bannertimer tp-bottom" style="visibility: hidden !important;"></div>	
					</div>
				</div><!-- END REVOLUTION SLIDER -->
				<script type="text/javascript">
					var tpj=jQuery;							
					var revapi8;
					tpj(document).ready(function() {
						if(tpj("#rev_slider_8_1").revolution == undefined){
							revslider_showDoubleJqueryError("#rev_slider_8_1");
						}else{
							revapi8 = tpj("#rev_slider_8_1").show().revolution({
								sliderType:"standard",
								jsFileLocation: "${pageContext.request.contextPath }/assets/template/vendor/rs-plugin/js/",
								sliderLayout:"auto",
								dottedOverlay:"none",
								delay:9000,
								navigation: {
									keyboardNavigation:"on",
									keyboard_direction: "horizontal",
									mouseScrollNavigation:"off",
									onHoverStop:"off",
									touch:{
										touchenabled:"on",
										swipe_threshold: 75,
										swipe_min_touches: 1,
										swipe_direction: "horizontal",
										drag_block_vertical: false
									}
									,
									arrows: {
										style:"hesperiden",
										enable:true,
										hide_onmobile:true,
										hide_under:778,
										hide_onleave:true,
										hide_delay:200,
										hide_delay_mobile:200,
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
										style:"gyges",
										enable:true,
										width:60,
										height:60,
										min_width:60,
										wrapper_padding:5,
										wrapper_color:"#222222",
										wrapper_opacity:"1",
										tmp:'<span class="tp-thumb-img-wrap">  <span class="tp-thumb-image"></span></span>',
										visibleAmount:5,
										hide_onmobile:false,
										hide_over:777,
										hide_onleave:false,
										direction:"vertical",
										span:true,
										position:"outer-left",
										space:5,
										h_align:"left",
										v_align:"top",
										h_offset:0,
										v_offset:0
									}
									,
									tabs: {
										style:"gyges",
										enable:true,
										width:300,
										height:80,
										min_width:300,
										wrapper_padding:30,
										wrapper_color:"#222222",
										wrapper_opacity:"1",
										tmp:'<div class="tp-tab-content">  <span class="tp-tab-date">{{param1}}</span>  <span class="tp-tab-title">{{title}}</span></div><div class="tp-tab-image"></div>',
										visibleAmount: 10,
										hide_onmobile: true,
										hide_under:778,
										hide_onleave:false,
										hide_delay:200,
										direction:"vertical",
										span:true,
										position:"outer-left",
										space:0,
										h_align:"left",
										v_align:"top",
										h_offset:0,
										v_offset:0
									}
								},
								gridwidth:800,
								gridheight:640,
								lazyType:"single",
								shadow:0,
								spinner:"off",
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
        <!-- END REVOLUTION SLIDER -->

            <script type="text/javascript">
                var tpj = jQuery;
                var revapi8;
                tpj(document).ready(function() {
                    if (tpj("#rev_slider_8_1").revolution == undefined) {
                        revslider_showDoubleJqueryError("#rev_slider_8_1");
                    } else {
                        revapi8 = tpj("#rev_slider_8_1").show().revolution({
                            sliderType: "standard",
                            jsFileLocation: "${pageContext.request.contextPath }/assets/template/vendor/rs-plugin/js/",
                            sliderLayout: "auto",
                            dottedOverlay: "none",
                            delay: 9000,
                            navigation: {
                                keyboardNavigation: "on",
                                keyboard_direction: "horizontal",
                                mouseScrollNavigation: "off",
                                onHoverStop: "off",
                                touch: {
                                    touchenabled: "on",
                                    swipe_threshold: 75,
                                    swipe_min_touches: 1,
                                    swipe_direction: "horizontal",
                                    drag_block_vertical: false
                                },
                                arrows: {
                                    style: "gyges",
                                    enable: true,
                                    hide_onmobile: false,
                                    hide_onleave: false,
                                    tmp: '',
                                    left: {
                                        h_align: "right",
                                        v_align: "bottom",
                                        h_offset: 40,
                                        v_offset: 0
                                    },
                                    right: {
                                        h_align: "right",
                                        v_align: "bottom",
                                        h_offset: 0,
                                        v_offset: 0
                                    }
                                },
                                tabs: {
                                    style: "ares",
                                    enable: true,
                                    width: 350,
                                    height: 80,
                                    min_width: 350,
                                    wrapper_padding: 0,
                                    wrapper_color: "#f5f5f5",
                                    wrapper_opacity: "1",
                                    tmp: '<div class="tp-tab-content">  <span class="tp-tab-date">{{param1}}</span>  <span class="tp-tab-title">{{param2}}</span></div><div class="tp-tab-image"></div>',
                                    visibleAmount: 10,
                                    hide_onmobile: true,
                                    hide_under: 776,
                                    hide_onleave: false,
                                    hide_delay: 200,
                                    direction: "vertical",
                                    span: true,
                                    position: "outer-left",
                                    space: 0,
                                    h_align: "left",
                                    v_align: "top",
                                    h_offset: 0,
                                    v_offset: 0
                                }
                            },
                            gridwidth: 800,
                            gridheight: 640,
                            lazyType: "single",
                            shadow: 0,
                            spinner: "off",
                            stopLoop: "on",
                            stopAfterLoops: 0,
                            stopAtSlide: 1,
                            shuffle: "off",
                            autoHeight: "off",
                            disableProgressBar: "on",
                            hideThumbsOnMobile: "off",
                            hideSliderAtLimit: 0,
                            hideCaptionAtLimit: 0,
                            hideAllCaptionAtLilmit: 0,
                            debugMode: false,
                            fallbacks: {
                                simplifyAll: "off",
                                nextSlideOnWindowFocus: "off",
                                disableFocusListener: false,
                            }
                        });
                    }
                }); /*ready*/

            </script>
        </div>
        <!-- END REVOLUTION SLIDER -->				
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