<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<div class="banner-bg" id="top">
<table class="table" id="post_list">
    <tbody class="post_ajax" data-id="${no}">
          
    </tbody>
</table>

<div class="gallery" data-id="${no}">
 <!--  <figure>
    <img src="https://images.unsplash.com/photo-1448814100339-234df1d4005d?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=600" alt="" />
    <figcaption>vo.title<small>vo.post_no</small><small>vo.regdate</small>
    <small>vo.content</small>
    <small>vo.publish</small>
    <button type='button' title='View Profile' class='btn btn-info btn-simple btn-xs' id="post_view"><i class='fa fa-user'></i></button>
    <button type='button' title='Edit Profile' class='btn btn-success btn-simple btn-xs' id="post_edit"> <i class='fa fa-edit'></i></button>
    <button type='button' title='Remove' class='btn btn-danger btn-simple btn-xs' id="post_delete"><i class='fa fa-times'></i></button>
    </figcaption>
    
  </figure> -->

</div>

<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="display:none;">
  <symbol id="close" viewBox="0 0 18 18">
    <path fill-rule="evenodd" clip-rule="evenodd" fill="#FFFFFF" d="M9,0.493C4.302,0.493,0.493,4.302,0.493,9S4.302,17.507,9,17.507
			S17.507,13.698,17.507,9S13.698,0.493,9,0.493z M12.491,11.491c0.292,0.296,0.292,0.773,0,1.068c-0.293,0.295-0.767,0.295-1.059,0
			l-2.435-2.457L6.564,12.56c-0.292,0.295-0.766,0.295-1.058,0c-0.292-0.295-0.292-0.772,0-1.068L7.94,9.035L5.435,6.507
			c-0.292-0.295-0.292-0.773,0-1.068c0.293-0.295,0.766-0.295,1.059,0l2.504,2.528l2.505-2.528c0.292-0.295,0.767-0.295,1.059,0
			s0.292,0.773,0,1.068l-2.505,2.528L12.491,11.491z"/>
  </symbol>
</svg>
</div>