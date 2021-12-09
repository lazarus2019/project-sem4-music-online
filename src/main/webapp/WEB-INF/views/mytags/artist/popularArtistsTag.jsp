<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

			<section class="row row--grid">
				<!-- title -->
				<div class="col-12">
					<div class="main__title">
						<h2>Popular Artists</h2>

						<a href="${pageContext.request.contextPath }/artist" class="main__link">See all <svg
								xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
								<path
									d="M17.92,11.62a1,1,0,0,0-.21-.33l-5-5a1,1,0,0,0-1.42,1.42L14.59,11H7a1,1,0,0,0,0,2h7.59l-3.3,3.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l5-5a1,1,0,0,0,.21-.33A1,1,0,0,0,17.92,11.62Z" />
							</svg></a>
					</div>
				</div>
				<!-- end title -->

				<div class="col-12">
					<div class="main__carousel-wrap">
						<div class="main__carousel main__carousel--artists owl-carousel" id="artists">
							<c:forEach var="popularArtist" items="${popularArtists }">
								<a href="${pageContext.request.contextPath }/artist/id/${popularArtist.id }" class="artist">
									<div class="artist__cover">
										<img src="${pageContext.request.contextPath }/uploads/images/artist/${popularArtist.image }" alt="">
									</div>
									<h3 class="artist__title">${popularArtist.nickname }</h3>	
								</a> 
							</c:forEach>
							
						</div>

						<button class="main__nav main__nav--prev" data-nav="#artists"
							type="button">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
								<path
									d="M17,11H9.41l3.3-3.29a1,1,0,1,0-1.42-1.42l-5,5a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l5,5a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L9.41,13H17a1,1,0,0,0,0-2Z" />
							</svg>
						</button>
						<button class="main__nav main__nav--next" data-nav="#artists"
							type="button">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
								<path
									d="M17.92,11.62a1,1,0,0,0-.21-.33l-5-5a1,1,0,0,0-1.42,1.42L14.59,11H7a1,1,0,0,0,0,2h7.59l-3.3,3.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l5-5a1,1,0,0,0,.21-.33A1,1,0,0,0,17.92,11.62Z" />
							</svg>
						</button>
					</div>
				</div>
			</section>