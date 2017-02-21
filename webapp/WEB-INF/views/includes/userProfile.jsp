<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

	
				<!-- user profile modal -->
					<div class="container modal-body-container">
						<div class="modal-frame">
							<div class="modal">
								<div class="modal-inset">
		
									<div class="icon-box effect medium closeProfile" id="infoModal-close" 
										 style="float:right; padding:10px; margin:10px;">
										<i class="fa fa-close"></i>
									</div>
								
								
									<div class="modal-body" style="clear:both;">
										<div id="emptyProfile" style="z-index:10000"></div>
										<div id="emptyFollowerButton" ></div>
										<div id="emptyButton" ></div>
									</div>
		
								</div>
							</div>
						</div>
					</div>
					
					<div class="modal-overlay">
					</div>
				<!-- user profile modal -->


</body>

</html>