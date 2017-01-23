<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="banner-bg" id="top">

		<!-- Swiper -->
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide"
					style="background-image: url(http :// lorempixel.com/ 600/ 600/ nature/ 1)">
				</div>

				<div class="swiper-slide"
					style="background-image: url(http://lorempixel.com/600/600/nature/2)"></div>

				<div class="swiper-slide"
					style="background-image: url(http://lorempixel.com/600/600/nature/3)"></div>

				<div class="swiper-slide"
					style="background-image: url(http://lorempixel.com/600/600/nature/4)"></div>

				<div class="swiper-slide"
					style="background-image: url(http://lorempixel.com/600/600/nature/5)"></div>

				<div class="swiper-slide"
					style="background-image: url(http://lorempixel.com/600/600/nature/6)"></div>

				<div class="swiper-slide"
					style="background-image: url(http://lorempixel.com/600/600/nature/7)"></div>

				<div class="swiper-slide"
					style="background-image: url(http://lorempixel.com/600/600/nature/8)"></div>

				<div class="swiper-slide"
					style="background-image: url(http://lorempixel.com/600/600/nature/9)"></div>

				<div class="swiper-slide"
					style="background-image: url(http://lorempixel.com/600/600/nature/10)"></div>
			</div>
			<!-- Add Pagination -->
			<div class="swiper-pagination"></div>
		</div>

		<a href="${pageContext.request.contextPath}/diary/${authUser.nickname}/write">포스트하기</a>


		<div id="post">
			<div class="blog-text">
				<!-- Add Pagination -->
				<div class="post-image">
					<img
						src="${pageContext.request.contextPath}/assets/img/%EC%82%AC%EC%A7%846.jpg"
						alt="Volton">
					<!--					<p class="post_title">선택한 사진에 대한 포스팅제목</p>
					<p class="post_sub_title"></p>
					<p class="postdate"></p>-->
				</div>
				<div class="post_content">
					<p>
						<p>${PostVo.content}</p>
					
						<span>Lorem ipsum dolor sit amet, consectetur adipisicing
							elit. Architecto perspiciatis quaerat, corporis, corrupti
							repellat sed fugiat aliquam voluptatum officiis illo eveniet vel
							deserunt rem laborum! Maxime recusandae qui voluptas minima.</span> <br>
						<br> <span>Quisquam laborum omnis eum minus esse quia
							debitis ipsa, ducimus quasi illo non! Laborum commodi
							perferendis, similique dolor autem nesciunt in! Molestiae quia
							omnis distinctio autem esse quis, at nostrum?</span> <br> <br>
						<span>Quos perferendis voluptatibus amet fugiat porro
							maxime nam natus illo adipisci, modi. Animi dolores ipsam
							voluptas, dolorem, dolorum aut recusandae eius repudiandae
							debitis in, quisquam ullam odit eligendi deserunt nihil!</span> <br>
						<br> <span>Atque, fuga, ut. Doloribus, dignissimos. At
							necessitatibus, facilis nulla. Expedita facilis, itaque, aliquid
							recusandae similique obcaecati enim, unde libero dolore voluptate
							voluptatum neque tenetur illum repellat dicta! Natus, quasi
							consequuntur.</span> <br> <br> <span>Quis magnam
							explicabo impedit laborum nobis aspernatur ipsa ad ut
							reprehenderit eos, quo corporis dicta laboriosam suscipit,
							voluptatibus vero? Eveniet ab est veniam mollitia ipsam,
							provident in quia consectetur amet.</span>
					</p>

				</div>


			</div>
		</div>
	</div>