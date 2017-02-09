<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<script type="text/javascript"
   src="${pageContext.request.contextPath }/assets/js/jquery.js"></script>
<script
   src="${pageContext.request.contextPath}/assets/js/min/bootstrap.min.js"></script>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/assets/css/bootstrap.css">

<link rel="stylesheet"
   href="${pageContext.request.contextPath}/assets/css/userProfile.css">
<script type="text/javascript"
   src="${pageContext.request.contextPath }/assets/js/userProfile.js"></script>


<style>
#InfoModal .modal-content {
/*    background: transparent; */
   background: grey;
   shadow: none;
}
</style>

<!-- Modal Core -->

<div class="modal fade" id="InfoModal" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">

         <div class="modal-body">

            <div class="row">


            
               <!-- Contenedor -->
               <ul id="accordion" class="accordion">
                  <li>
                     <div class="col col_4 iamgurdeep-pic">
                        <img class="img-responsive iamgurdeeposahan"
                           alt="User Image"
                           src="${pageContext.request.contextPath}/hotdog/image/user/${map.userVo.users_image}">
                        <div class="edit-pic">
                           <a href="https://web.facebook.com/iamgurdeeposahan"
                              target="_blank" class="fa fa-facebook"></a> <a
                              href="https://www.instagram.com/gurdeeposahan/"
                              target="_blank" class="fa fa-instagram"></a> <a
                              href="https://twitter.com/gurdeeposahan1" target="_blank"
                              class="fa fa-twitter"></a> <a
                              href="https://plus.google.com/u/0/105032594920038016998"
                              target="_blank" class="fa fa-google"></a>



                        </div>
                        <div class="username">
                           <h2>
                              ${map.userVo.users_image}
                           </h2>
                           <p>
                              <i class="fa fa-briefcase"></i> ${map.userVo.infomation }
                           </p>

                           <a href="https://web.facebook.com/iamgurdeeposahan"
                              target="_blank" class="btn-o"> <i class="fa fa-user-plus"></i>
                              Blog
                           </a> <a href="https://www.instagram.com/gurdeeposahan/"
                              target="_blank" class="btn-o"> <i class="fa fa-plus"></i>
                              Follow
                           </a>


                           <ul class="nav navbar-nav">
                              <li class="dropdown"><a href="#" class="dropdown-toggle"
                                 data-toggle="dropdown"><span
                                    class="fa fa-ellipsis-v pull-right"></span></a>
                                 <ul class="dropdown-menu pull-right">
                                    <li><a href="#">Video Call <i
                                          class="fa fa-video-camera"></i></a></li>
                                    <li><a href="#">Poke <i class="fa fa-hand-o-right"></i></a></li>
                                    <li><a href="#">Report <i class="fa fa-bug"></i></a></li>
                                    <li><a href="#">Block <i class="fa fa-lock"></i></a></li>
                                 </ul></li>
                           </ul>

                        </div>

                     </div>

                  </li>
                  <li>
                     <div class="link">
                        <i class="fa fa-globe"></i>About<i class="fa fa-chevron-down"></i>
                     </div>
                     <ul class="submenu">
                        <li><a href="#"><i class="fa fa-calendar left-none"></i>
                              Date of Birth : 03/09/1994</a></li>
                        <li><a href="#">Address : INDIA,Punjab</a></li>
                        <li><a href="mailto:gurdeepjawaddi94@gmail.com">Email :
                              gurdeepjawaddi94@gmail.com</a></li>
                        <li><a href="#">Phone : +91 85680-79956</a></li>
                     </ul>
                  </li>
                  <li class="default open">
                     <div class="link">
                        <i class="fa fa-code"></i>Professional Skills<i
                           class="fa fa-chevron-down"></i>
                     </div>
                     <ul class="submenu">
                        <li><a href="#"><span class="tags">Adobe
                                 Photoshop</span> <span class="tags">Corel Draw</span> <span
                              class="tags">CSS</span> <span class="tags">Css 3</span> <span
                              class="tags">Graphic Design</span> <span class="tags">HTML</span>
                              <span class="tags">HTML5</span> <span class="tags">JavaScript</span>
                              <span class="tags">Twitter bootstrap</span> <span class="tags">bootstrap</span>
                              <span class="tags">User Interface Design</span> <span
                              class="tags">Wordpress</span></li>
                        </a>
                     </ul>
                  </li>
                  <li>
                     <div class="link">
                        <i class="fa fa-picture-o"></i>Photos <small>1,120</small><i
                           class="fa fa-chevron-down"></i>
                     </div>
                     <ul class="submenu">
                        <li class="photosgurdeep"><a href="#"><img
                              class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan"
                              src="http://www.webncc.in/images/gurdeeposahan.jpg"> </a> <a
                           href="#"><img class="img-responsive iamgurdeeposahan"
                              alt="iamgurdeeposahan"
                              src="http://www.webncc.in/images/gurdeeposahan.jpg"> </a> <a
                           href="#"><img class="img-responsive iamgurdeeposahan"
                              alt="iamgurdeeposahan"
                              src="http://www.webncc.in/images/gurdeeposahan.jpg"> </a> <a
                           href="#"><img class="img-responsive iamgurdeeposahan"
                              alt="iamgurdeeposahan"
                              src="http://www.webncc.in/images/gurdeeposahan.jpg"> </a> <a
                           class="view-all"
                           href="https://web.facebook.com/iamgurdeeposahan"
                           target="_blank">15+ </a></li>
                     </ul>
                  </li>
                  <li><div class="link">
                        <i class="fa fa-users"></i>Friends <small>1,053</small><i
                           class="fa fa-chevron-down"></i>
                     </div>
                     <ul class="submenu">
                        <li class="photosgurdeep"><a href="#"><img
                              class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan"
                              src="http://www.webncc.in/images/gurdeeposahan.jpg"> </a> <a
                           href="#"><img class="img-responsive iamgurdeeposahan"
                              alt="iamgurdeeposahan"
                              src="http://www.webncc.in/images/gurdeeposahan.jpg"> </a> <a
                           href="#"><img class="img-responsive iamgurdeeposahan"
                              alt="iamgurdeeposahan"
                              src="http://www.webncc.in/images/gurdeeposahan.jpg"> </a> <a
                           href="#"><img class="img-responsive iamgurdeeposahan"
                              alt="iamgurdeeposahan"
                              src="http://www.webncc.in/images/gurdeeposahan.jpg"> </a> <a
                           href="#"><img class="img-responsive iamgurdeeposahan"
                              alt="iamgurdeeposahan"
                              src="http://www.webncc.in/images/gurdeeposahan.jpg"> </a> <a
                           href="#"><img class="img-responsive iamgurdeeposahan"
                              alt="iamgurdeeposahan"
                              src="http://www.webncc.in/images/gurdeeposahan.jpg"> </a> <a
                           href="#"><img class="img-responsive iamgurdeeposahan"
                              alt="iamgurdeeposahan"
                              src="http://www.webncc.in/images/gurdeeposahan.jpg"> </a> <a
                           href="#"><img class="img-responsive iamgurdeeposahan"
                              alt="iamgurdeeposahan"
                              src="http://www.webncc.in/images/gurdeeposahan.jpg"> </a> <a
                           href="#"><img class="img-responsive iamgurdeeposahan"
                              alt="iamgurdeeposahan"
                              src="http://www.webncc.in/images/gurdeeposahan.jpg"> </a> <a
                           class="view-all"
                           href="https://web.facebook.com/iamgurdeeposahan"
                           target="_blank">50+ </a></li>
                     </ul></li>
               </ul>
            </div>

         </div>

      </div>

   </div>
</div>