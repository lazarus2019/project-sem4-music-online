<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://mytags.com" %>

		<div class="chart__list">
			<div class="chart__header">
				<h3>Weekly Chart</h3>
			</div>
			<section class="row row--grid">
						<div class="col-12 col-md-6 col-xl-4">
							<div class="row row--grid">
								<!-- title -->
								<div class="col-12">
									<div class="main__title">
										<h2><a class="clr-light" href="${pageContext.request.contextPath }/record-chart/all-track-weekly">All</a></h2>
									</div>
								</div>
								<!-- end title -->
			
								<div class="col-12">
									<ul class="main__list">
										<c:forEach var="allWeeklyTrack" items="${allWeeklyTracks }" varStatus="i">
											<li class="single-item none-hover">
												<span class="single-item__number">${i.index + 1 }</span>
												<span class="single-item__rate"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path d="M12.71,12.54a1,1,0,0,0-1.42,0l-3,3A1,1,0,0,0,9.71,17L12,14.66,14.29,17a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Zm-3-1.08L12,9.16l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Z" />
													</svg> 1</span>
												<a class="single-item__cover" data-link data-title="${allWeeklyTrack.title }" data-artist="AudioPizza"
													data-img="${pageContext.request.contextPath }/uploads/images/track/${allWeeklyTrack.thumbnail }"
													href="../blast2.0/audio/12071151_epic-cinematic-trailer_by_audiopizza_preview.mp3">
													<img src="${pageContext.request.contextPath }/uploads/images/track/${allWeeklyTrack.thumbnail }" alt="">
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" />
													</svg>
												</a>
												<div class="single-item__title">
													<h4>
														<a class="clr-white" href="#">
															${allWeeklyTrack.title }
															<c:if test="${allWeeklyTrack.premium == true}"><i class="las la-crown crown-icon flex-column yellow__icon"></i></c:if>
														</a>
													</h4>
													<c:forEach var="artist" items="${allWeeklyTrack.accounts }">
														<span><a href="#">${artist.nickname }</a></span>
													</c:forEach>
												</div>
												<span class="single-item__time"><t:trackTime totalSeconds="${allWeeklyTrack.duration }"/></span>
											</li>
										</c:forEach>
									</ul>
									<a href="${pageContext.request.contextPath }/record-chart/all-track-weekly" class="see__all">View all</a>
								</div>
							</div>
						</div>
			
						<div class="col-12 col-md-6 col-xl-4">
							<div class="row row--grid">
								<!-- title -->
								<div class="col-12">
									<div class="main__title">
										<h2><a class="clr-light" href="${pageContext.request.contextPath }/record-chart/us-uk-track-weekly">US - UK</a></h2>
									</div>
								</div>
								<!-- end title -->
			
								<div class="col-12">
									<ul class="main__list">
										<c:forEach var="usUkWeeklyTrack" items="${usUkWeeklyTracks }" varStatus="i">
											<li class="single-item none-hover">
												<span class="single-item__number">${i.index + 1 }</span>
												<span class="single-item__rate"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path d="M12.71,12.54a1,1,0,0,0-1.42,0l-3,3A1,1,0,0,0,9.71,17L12,14.66,14.29,17a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Zm-3-1.08L12,9.16l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Z" />
													</svg> 1</span>
												<a data-link data-title="${usUkWeeklyTrack.title }" data-artist=""
													data-img="${pageContext.request.contextPath }/uploads/images/track/${usUkWeeklyTrack.thumbnail }"
													href="../blast2.0/audio/12071151_epic-cinematic-trailer_by_audiopizza_preview.mp3"
													class="single-item__cover">
													<img src="${pageContext.request.contextPath }/uploads/images/track/${usUkWeeklyTrack.thumbnail }" alt="">
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" />
													</svg>
												</a>
												<div class="single-item__title">
													<h4>
														<a class="clr-white" href="#">
															${usUkWeeklyTrack.title }
															<c:if test="${usUkWeeklyTrack.premium == true}"><i class="las la-crown crown-icon flex-column yellow__icon"></i></c:if>
														</a>
													</h4>
													<c:forEach var="artist" items="${usUkWeeklyTrack.accounts }">
														<span><a href="#">${artist.nickname }</a></span>
													</c:forEach>
												</div>
												<span class="single-item__time"><t:trackTime totalSeconds="${usUkWeeklyTrack.duration }"/></span>
											</li>
										</c:forEach>
									</ul>
									<a href="${pageContext.request.contextPath }/record-chart/us-uk-track-weekly" class="see__all">View all</a>
								</div>
							</div>
						</div>
			
							<div class="col-12 col-md-6 col-xl-4">
								<div class="row row--grid">
									<!-- title -->
									<div class="col-12">
										<div class="main__title">
											<h2><a class="clr-light" href="${pageContext.request.contextPath }/record-chart/vietnam-track-weekly">Viet Nam</a></h2>
										</div>
									</div>
									<!-- end title -->
			
									<div class="col-12">
									<ul class="main__list">
										<c:forEach var="vnWeeklyTrack" items="${vnWeeklyTracks }" varStatus="i">
											<li class="single-item none-hover">
												<span class="single-item__number">${i.index + 1 }</span>
												<span class="single-item__rate"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path d="M12.71,12.54a1,1,0,0,0-1.42,0l-3,3A1,1,0,0,0,9.71,17L12,14.66,14.29,17a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Zm-3-1.08L12,9.16l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Z" />
													</svg> 1</span>
												<a data-link data-title="${vnWeeklyTrack.title }" data-artist=""
													data-img="${pageContext.request.contextPath }/uploads/images/track/${vnWeeklyTrack.thumbnail }"
													href="../blast2.0/audio/12071151_epic-cinematic-trailer_by_audiopizza_preview.mp3"
													class="single-item__cover">
													<img src="${pageContext.request.contextPath }/uploads/images/track/${vnWeeklyTrack.thumbnail }" alt="">
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" />
													</svg>
												</a>
												<div class="single-item__title">
													<h4>
														<a class="clr-white" href="#">
															${vnWeeklyTrack.title }
															<c:if test="${vnWeeklyTrack.premium == true}"><i class="las la-crown crown-icon flex-column yellow__icon"></i></c:if>
														</a>
													</h4>
													<c:forEach var="artist" items="${vnWeeklyTrack.accounts }">
														<span><a href="#">${artist.nickname }, </a></span>
													</c:forEach>
												</div>
												<span class="single-item__time"><t:trackTime totalSeconds="${vnWeeklyTrack.duration }"/></span>
											</li>
										</c:forEach>
									</ul>
									<a href="${pageContext.request.contextPath }/record-chart/vietnam-track-weekly" class="see__all">View all</a>
								</div>
									
								</div>
							</div>
						</section>
		</div>
