<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="row">
				<div class="col-12">
					<div class="hero owl-carousel" id="hero">
						<c:forEach var="banner" items="${banners }">
							<div class="hero__slide" data-bg="${pageContext.request.contextPath }/uploads/images/banner/${banner.image }">
								<h1 class="hero__title">${banner.title }</h1>
								<p class="hero__text">${banner.description }</p>
							</div>
						</c:forEach>
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