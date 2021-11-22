<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="row">
				<div class="col-12">
					<div class="hero owl-carousel" id="hero">
						<div class="hero__slide" data-bg="${pageContext.request.contextPath }/resources/user/img/home/slide1.jpg">
							<h1 class="hero__title">Record Label & Music streaming</h1>
							<p class="hero__text">There are many variations of passages
								of Lorem Ipsum available, but the majority have suffered
								alteration in some form, by injected humour, or randomised words
								which don't look even slightly believable</p>
						</div>

						<div class="hero__slide" data-bg="${pageContext.request.contextPath }/resources/user/img/home/slide2.jpg">
							<h2 class="hero__title">Metallica and Slipknot feature in
								trailer for ?Long Live Rock? documentary</h2>
							<p class="hero__text">It also features Rage Against The
								Machine, Guns N' Roses and a number of others</p>
						</div>

						<div class="hero__slide" data-bg="${pageContext.request.contextPath }/resources/user/img/home/slide3.jpg">
							<h2 class="hero__title">New Artist of Our Label</h2>
							<p class="hero__text">There are many variations of passages
								of Lorem Ipsum available, but the majority have suffered
								alteration in some form, by injected humour, or randomised words
								which don't look even slightly believable</p>
						</div>
					</div>

					<button class="main__nav main__nav--hero main__nav--prev"
						data-nav="#hero" type="button">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
							<path
								d="M17,11H9.41l3.3-3.29a1,1,0,1,0-1.42-1.42l-5,5a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l5,5a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L9.41,13H17a1,1,0,0,0,0-2Z" />
						</svg>
					</button>
					<button class="main__nav main__nav--hero main__nav--next"
						data-nav="#hero" type="button">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
							<path
								d="M17.92,11.62a1,1,0,0,0-.21-.33l-5-5a1,1,0,0,0-1.42,1.42L14.59,11H7a1,1,0,0,0,0,2h7.59l-3.3,3.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l5-5a1,1,0,0,0,.21-.33A1,1,0,0,0,17.92,11.62Z" />
						</svg>
					</button>
				</div>
			</section>