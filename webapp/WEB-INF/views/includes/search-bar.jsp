<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<!--TOP SEARCH -->
	<div id="top-search"> <a id="top-search-trigger"><i class="fa fa-search"></i><i class="fa fa-close"></i></a>
		<form action="${pageContext.request.contextPath}/search" method="get">
			<input type="text" name="keyword" class="form-control" value="" placeholder="검색어를 입력해주세요.">
		</form>
		
	</div>