<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<!-- <div class="banner-bg" id="top">
      <div role="main">
      <ul id="container" class="tiles-wrap animated"></ul>
  	  </div>
	</div>
-->


<div class="banner-bg" id="top">
	<h4>나의 기록</h4>
	<div class = "list_container">
				<div class="imagelist">
				<a href="${pageContext.request.contextPath}/assets/sample-images/image_1.jpg"  rel="lightbox" data-title="vo.content">
					<img src="${pageContext.request.contextPath}/assets/sample-images/image_1.jpg" data-toggle="lightbox">
					<h5>vo.title</h5>
					<ul class="list_content">
						<li>vo.regdate </li>
						<li>${authUser.nickname }</li>
						<li>vo.content</li>
						<li>동해물과 백두산이 마르고 닳도록 머니ㅏㅇ러ㅣㅏㅁ 넝리ㅏ머니ㅏㅇ러마ㅣ넝리ㅏ머닝라ㅓㄴ</li>
					</ul>
					</a>
				</div>
				<div>
					<img src="${pageContext.request.contextPath}/assets/sample-images/sample_image11.jpg">
					<h5>vo.title</h5>	
					<p>2016.01.31</p>
					<p>vo.content</p>
				</div>
				<div>
					<img src="${pageContext.request.contextPath}/assets/sample-images/image_3.jpg">
					<h5>vo.title</h5>	
					<p>vo.regdate</p>
					<p>vo.content</p>
				</div>
				<div>
					<img src="${pageContext.request.contextPath}/assets/sample-images/image_4.jpg">
					<h5>vo.title</h5>	
					<p>vo.regdate</p>
					<p>vo.content</p>
				</div>	
				<div>
					<img src="${pageContext.request.contextPath}/assets/sample-images/image_5.jpg">
					<h5>vo.title</h5>	
					<p>vo.regdate</p>
					<p>vo.content</p>
				</div>
				<div>
					<img src="${pageContext.request.contextPath}/assets/sample-images/image_5.jpg">
					<h5>vo.title</h5>	
					<p>vo.regdate</p>
					<p>vo.content</p>
				</div>
				<div>
					<img src="${pageContext.request.contextPath}/assets/sample-images/image_6.jpg">
					<h5>vo.title</h5>	
					<p>vo.regdate</p>
					<p>vo.content</p>
				</div>
				<div>
					<img src="${pageContext.request.contextPath}/assets/sample-images/image_7.jpg">
					<h5>vo.title</h5>	
					<p>vo.regdate</p>
					<p>vo.content</p>
				</div>	
				<div>
					<img src="${pageContext.request.contextPath}/assets/sample-images/image_7.jpg">
					<h5>vo.title</h5>	
					<p>vo.regdate</p>
					<p>vo.content</p>
				</div>	
				<div>
					<img src="${pageContext.request.contextPath}/assets/sample-images/image_7.jpg">
					<h5>vo.title</h5>	
					<p>vo.regdate</p>
					<p>vo.content</p>
				</div>	
				<div>
					<img src="${pageContext.request.contextPath}/assets/sample-images/image_7.jpg">
					<h5>vo.title</h5>	
					<p>vo.regdate</p>
					<p>vo.content</p>
				</div>	
				<div>
					<img src="${pageContext.request.contextPath}/assets/sample-images/image_7.jpg">
					<h5>vo.title</h5>	
					<p>vo.regdate</p>
					<p>vo.content</p>
				</div>	
				</div>
</div>