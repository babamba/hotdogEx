<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	
	
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/template/images/favicon.png">
	<title>Hot dog</title>
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
	<link href="${pageContext.request.contextPath}/assets/template/css/color-variations/blue.css" rel="stylesheet" type="text/css" media="screen" title="blue">

	<!-- LOAD GOOGLE FONTS -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,800,700,600%7CRaleway:100,300,600,700,800" rel="stylesheet" type="text/css" />

	<!-- CSS CUSTOM STYLE -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/template/css/custom.css" media="screen" />

    <!--VENDOR SCRIPT-->
    <script src="${pageContext.request.contextPath}/assets/template/vendor/jquery/jquery-1.11.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/template/vendor/plugins-compressed.js"></script>

</head>

<body class="wide">
	
	<!-- WRAPPER -->
	<div class="wrapper">

		<!-- HEADER -->
		<header id="header" class="header-transparent">
			<div id="header-wrap">
				<div class="container">

					<!--LOGO-->
				    <div id="logo"> <a href="${pageContext.request.contextPath}" class="logo" data-dark-logo="images/logo-dark.png"> <img src="${pageContext.request.contextPath}/assets/img/hotdog_logo-01.png" alt="Hotdog Logo"> </a> </div>
				    <!--END: LOGO--> 

					<!--MOBILE MENU -->
					<div class="nav-main-menu-responsive">
						<button class="lines-button x">
							<span class="lines"></span>
						</button>
					</div>
					<!--END: MOBILE MENU -->

					

					<!--TOP SEARCH -->
					<div id="top-search"> <a id="top-search-trigger"><i class="fa fa-search"></i><i class="fa fa-close"></i></a>
						<form action="search-results-page.html" method="get">
							<input type="text" name="q" class="form-control" value="" placeholder="Start typing & press  &quot;Enter&quot;">
						</form>
					</div>
					<!--END: TOP SEARCH -->
					
					 <!--NAVIGATION-->
			        <c:import url="/WEB-INF/views/includes/navigation2.jsp" />
			        <!--END: NAVIGATION--> 
				</div>
			</div>
		</header>
		<!-- END: HEADER -->
    
		<!-- PAGE TITLE -->
		<!-- <section id="page-title" class="page-title-parallax page-title-center text-dark" style="background-image:url(images/parallax/page-title-parallax.jpg);">
			<div class="container">
				<div class="page-title col-md-8">
					<h1>BLOG</h1>
		            <span>Work is easy when you have all tools around you!</span>
		        </div>
		        <div class="breadcrumb col-md-4">
		            <ul>
		                <li><a href="#"><i class="fa fa-home"></i></a>
		                </li>
		                <li><a href="#">Home</a>
		                </li>
		                <li><a href="#">Page title</a>
		                </li>
		                <li class="active"><a href="#">Page title version</a>
		                </li>
		            </ul>
		        </div>
		    </div>
		</section> -->
		<!-- END: PAGE TITLE -->


<section class="content">
    <div class="container">
        <div class="row">
            <div class="post-content post-classic post-content-single col-md-9">

                <div class="post-item">
                    <div class="post-image">
                        <a href="#">
                            <img alt="" src= "${pageContext.request.contextPath}/hotdog/image/user/${postVo.post_image}" >
                        </a>
                    </div>
                    <div class="post-content-details">
                        <div class="post-title">
                            <h2>${postVo.title}</h2>
                        </div>
                        <div class="post-info">
                            <span class="post-autor">Post by: <a href="#">${postVo.nickname}</a></span>
                        </div>
                        <div class="post-description">
							${postVo.content}
                        </div>
                    </div>
                    <div class="post-meta">
                        <div class="post-date">
                           	${postVo.regdate}
                        </div>

                        <div class="post-comments">
                            <a href="#">
                                <i class="fa fa-comments-o"></i>
                                <span class="post-comments-number">324</span>
                            </a>
                        </div>
                        <div class="post-comments">
                            <a href="#">
                                <i class="fa fa-share-alt"></i>
                                <span class="post-comments-number">324</span>
                            </a>
                        </div>
                    </div>
                </div>


                <div id="comments" class="comments">
                    <div class="heading">
                        <h4 class="comments-title">Comments <small class="number">(4)</small></h4>
                    </div>



                    <div class="comment">
                        <a href="#" class="pull-left">
                            <img alt="" src="images/team/2.jpg" class="avatar">
                        </a>
                        <div class="media-body">
                            <h4 class="media-heading">Juna Smith</h4>
                            <p class="time">Jan 18, 2015 at 10:30 PM</p>
                            <p>Nullam nisl dui, congue in mi non, dapibus adipiscing metus. Donec mollis semper rutrum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed euismod neque. Aliquam eget malesuada enim, eu interdum elit. Sed sagittis ornare velit a congue.</p>
                            <a href="#" class="comment-reply pull-right"><i class="fa fa-reply"></i> Reply</a>
                        </div>



                        <div class="comment comment-replied">
                            <a href="#" class="pull-left">
                                <img alt="" src="images/team/3.jpg" class="avatar">
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading">Ariol Smith</h4>
                                <p class="time">Jun 24, 2015 at 14:28 PM</p>
                                <p>Ut ultrices consectetur eleifend. Nullam nisl dui, congue in mi non, dapibus adipiscing metus. Donec mollis semper rutrum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed euismod neque. Aliquam eget malesuada enim, eu interdum elit. Sed sagittis ornare velit a congue.</p>
                                <a href="#" class="comment-reply pull-right"><i class="fa fa-reply"></i> Reply</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="comment-form">
                    <div class="heading heading_form">
                        <h4>Leave a comment</h4>
                    </div>
                    <form class="form-gray-fields">
                       
                            <div class="col-md-4 form_group_nickname">
                                <div class="form-group">
                                    <label for="name" class="upper">${authUser.nickname}</label>
                                    
                                </div>
                            </div>
                     
                        
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="comment" class="upper">Your comment</label>
                                    <textarea aria-required="true" id="comment" placeholder="Enter comment" rows="9" name="comment" class="form-control required"></textarea>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group text-center">
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-paper-plane"></i>&nbsp;Post comment</button>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
            
            
            
            <div class="sidebar sidebar-modern col-md-3">
                <!--widget newsletter-->
                <!-- <div class="widget clearfix widget-newsletter">
                                <form id="widget-subscribe-form-sidebar" action="include/subscribe-form.php" role="form" method="post" class="form-inline">
                                    <h4 class="widget-title">Newsletter</h4>
                                    <small>Stay informed on our latest news!</small>
                                    <div class="input-group">
                                        <input type="email" aria-required="true" name="widget-subscribe-form-email" class="form-control required email" placeholder="Enter your Email">
                                        <span class="input-group-btn">
                  <button type="submit" id="widget-subscribe-submit-button" class="btn btn-primary"><i class="fa fa-paper-plane"></i></button>
                  </span> </div>
                                </form>
                                <script type="text/javascript">
                                    jQuery("#widget-subscribe-form-sidebar").validate({
                                        submitHandler: function(form) {
                                            jQuery(form).ajaxSubmit({
                                                dataType: 'json',
                                                success: function(text) {
                                                    if (text.response == 'success') {
                                                        $.notify({
                                                            message: "You have successfully subscribed to our mailing list."
                                                        }, {
                                                            type: 'success'
                                                        });
                                                        $(form)[0].reset();

                                                    } else {
                                                        $.notify({
                                                            message: text.message
                                                        }, {
                                                            type: 'warning'
                                                        });
                                                    }
                                                }
                                            });
                                        }
                                    });

                                </script>
                            </div> -->
                <!--end: widget newsletter-->

                <!--widget tweeter-->
             	<!--<div class="widget clearfix widget-tweeter">
				     <h4 class="widget-title">Recent Tweets</h4>
				</div> -->
                <!--end: widget tweeter-->

                <!--widget tags -->
                <!-- <div class="widget clearfix widget-tags">
                    <h4 class="widget-title">Tags</h4>
                    <div class="tags">
                        <a href="#">Design</a>
                        <a href="#">Portfolio</a>
                        <a href="#">Digital</a>
                        <a href="#">Branding</a>
                        <a href="#">HTML</a>
                        <a href="#">Clean</a>
                        <a href="#">Peace</a>
                        <a href="#">Love</a>
                        <a href="#">CSS3</a>
                        <a href="#">jQuery</a>
                    </div>
                </div> -->
                <!--end: widget tags -->
                <!--widget archive-->
                <!-- <div class="widget clearfix widget-archive">
                    <h4 class="widget-title">Archive</h4>
                    <ul class="list list-lines">
                        <li>Jun 2015 </li>
                        <li>May 2015 </li>
                        <li>Apr 2015 </li>
                        <li>Mar 2015 </li>
                    </ul>
                </div> -->
                <!--end: widget archive-->
            </div>
        </div>
    </div>
</section>
<!-- END: SECTION -->

<!-- FOOTER -->
  <footer class="background-dark text-grey" id="footer">
    
    <div class="copyright-content">
      <div class="container">
        <div class="row">
          <div class="copyright-text col-md-6"> &copy; 2017 Hotdog. &nbsp;&nbsp;<a target="_blank" href="http://www.inspiro-media.com">Bit Academy</a> </div>
          <div class="col-md-6">
            <div class="social-icons">
              <ul>
                <li class="social-facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li class="social-twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                <li class="social-google"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                <li class="social-pinterest"><a href="#"><i class="fa fa-pinterest"></i></a></li>
                <li class="social-vimeo"><a href="#"><i class="fa fa-vimeo-square"></i></a></li>
                <li class="social-linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                <li class="social-dribbble"><a href="#"><i class="fa fa-dribbble"></i></a></li>
                <li class="social-youtube"><a href="#"><i class="fa fa-youtube-play"></i></a></li>
                <li class="social-rss"><a href="#"><i class="fa fa-rss"></i></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>
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
