<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

			<section class="row row--grid">
				<!-- title -->
				<div class="col-12">
					<div class="main__title">
						<h2>New Releases</h2>

						<a href="${pageContext.request.contextPath }/track/all" class="main__link">See all <svg
								xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
								<path
									d="M17.92,11.62a1,1,0,0,0-.21-.33l-5-5a1,1,0,0,0-1.42,1.42L14.59,11H7a1,1,0,0,0,0,2h7.59l-3.3,3.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l5-5a1,1,0,0,0,.21-.33A1,1,0,0,0,17.92,11.62Z" />
							</svg></a>
					</div>
				</div>
				<!-- end title -->

			<c:forEach var="newRelease" items="${newReleases }">
				<div class="col-6 col-sm-4 col-lg-2">
					<div class="album">
						<div class="album__cover">
							<img src="${pageContext.request.contextPath }/uploads/images/track/${newRelease.thumbnail }" alt=""> 
							<a onclick="getTrackById(this)" data-id="${newRelease.id}"><svg xmlns="http://www.w3.org/2000/svg"
									viewBox="0 0 24 24">
									<path
										d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
								</svg>
							</a> 
							<span class="album__stat"> 
							<span>
								<i class="las la-thumbs-up"></i> ${newRelease.likes }</span> <span>
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
									<path d="M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z" />
								</svg> 19 503</span>
							</span>
						</div>
						<div class="album__title">
							<h3>
								<a href="release.html">${newRelease.title }</a>
							</h3>
							<span class="artist-nickname">
								<c:forEach var="artist" items="${newRelease.accounts }">
                                    <a href="${pageContext.request.contextPath }/artist/id/${artist.id }">${artist.nickname}</a>
                                </c:forEach>
							</span>
						</div>
					</div>
				</div>
			</c:forEach>

			
			</section>