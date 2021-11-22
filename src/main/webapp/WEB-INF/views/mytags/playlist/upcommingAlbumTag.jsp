<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<section class="row row--grid">
				<!-- title -->
				<div class="col-12">
					<div class="main__title">
						<h2>Upcoming Albums</h2>
					</div>
				</div>
				<!-- end title -->
				
				<div class="col-12">
					<div class="main__carousel-wrap">
						<div class="main__carousel main__carousel--events owl-carousel" id="events">
							<c:forEach var="upcommingAlbum" items="${upcommingAlbums }">
								<div class="event" data-bg="${pageContext.request.contextPath }/resources/user/img/events/${upcommingAlbum.thumbnail }">
									<span class="event__date"><fmt:formatDate value="${upcommingAlbum.publishDate }" type="date" pattern="MMM-dd-yyyy"/></span>
									<h3 class="event__title">
										<a href="event.html">${upcommingAlbum.title }</a>
									</h3>
									<p class="event__address">Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>
								</div>
							</c:forEach>
						</div>

						<button class="main__nav main__nav--prev" data-nav="#events"
							type="button">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
								<path
									d="M17,11H9.41l3.3-3.29a1,1,0,1,0-1.42-1.42l-5,5a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l5,5a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L9.41,13H17a1,1,0,0,0,0-2Z" />
							</svg>
						</button>
						<button class="main__nav main__nav--next" data-nav="#events"
							type="button">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
								<path
									d="M17.92,11.62a1,1,0,0,0-.21-.33l-5-5a1,1,0,0,0-1.42,1.42L14.59,11H7a1,1,0,0,0,0,2h7.59l-3.3,3.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l5-5a1,1,0,0,0,.21-.33A1,1,0,0,0,17.92,11.62Z" />
							</svg>
						</button>
					</div>
				</div>
			</section>