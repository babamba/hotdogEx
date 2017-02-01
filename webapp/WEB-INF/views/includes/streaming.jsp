<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="banner-bg" id="top">
<div class="streaming_browser">
			 <div>
	            <video id="videoPlayer" controls></video>
	       	 </div>
		
			<div class="streaming_control">
				<button type='button' class='btn btn-info' id='left'><i id="left" class="material-icons">fast_rewind</i></button>
	    		<button type='button' class='btn btn-info' id='center'><i class="material-icons">filter_center_focus</i></button>
	    		<button type='button' class='btn btn-info' id='right'><i class="material-icons">fast_forward</i></button>
	
			<div class="togglebutton">
				<label> 
					<input type="checkbox" checked="checked">
				</label>
			</div>
		</div>
	</div>
</div>
