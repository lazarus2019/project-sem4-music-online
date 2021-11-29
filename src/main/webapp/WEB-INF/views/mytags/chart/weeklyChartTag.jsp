<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
											<h2><a class="clr-light" href="#">Viet Name</a></h2>
										</div>
									</div>
									<!-- end title -->
			
									<div class="col-12">
										<ul class="main__list">
											<li class="single-item none-hover">
												<span class="single-item__number">1</span>
												<span class="single-item__rate"><svg xmlns="http://www.w3.org/2000/svg"
														viewBox="0 0 24 24">
														<path
															d="M12.71,12.54a1,1,0,0,0-1.42,0l-3,3A1,1,0,0,0,9.71,17L12,14.66,14.29,17a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Zm-3-1.08L12,9.16l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Z" />
													</svg> 1</span>
												<a data-link data-title="Cinematic" data-artist="AudioPizza"
													data-img="${pageContext.request.contextPath }/resources/user/img/covers/cover1.jpg"
													href="../blast2.0/audio/12071151_epic-cinematic-trailer_by_audiopizza_preview.mp3"
													class="single-item__cover">
													<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover1.jpg" alt="">
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" />
													</svg>
												</a>
												<div class="single-item__title">
													<h4><a class="clr-white" href="#">Cinematic</a></h4>
													<span><a href="artist.html">AudioPizza</a></span>
												</div>
												<span class="single-item__time">2:35</span>
											</li>
											<li class="single-item none-hover">
												<span class="single-item__number">2</span>
												<span class="single-item__rate single-item__rate--red"><svg
														xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M11.29,11.46a1,1,0,0,0,1.42,0l3-3A1,1,0,1,0,14.29,7L12,9.34,9.71,7A1,1,0,1,0,8.29,8.46Zm3,1.08L12,14.84l-2.29-2.3A1,1,0,0,0,8.29,14l3,3a1,1,0,0,0,1.42,0l3-3a1,1,0,0,0-1.42-1.42Z" />
													</svg> 1</span>
												<a data-link data-title="Adventure" data-artist="AudioPizza"
													data-img="${pageContext.request.contextPath }/resources/user/img/covers/cover2.jpg"
													href="../blast2.0/audio/9106709_epic-adventure-cinematic-trailer_by_audiopizza_preview.mp3"
													class="single-item__cover">
													<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover2.jpg" alt="">
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" />
													</svg>
												</a>
												<div class="single-item__title">
													<h4><a class="clr-white" href="#">Adventure</a></h4>
													<span><a href="artist.html">AudioPizza</a></span>
												</div>
												<span class="single-item__time">3:37</span>
											</li>
											<li class="single-item none-hover">
												<span class="single-item__number">3</span>
												<span class="single-item__rate"><svg xmlns="http://www.w3.org/2000/svg"
														viewBox="0 0 24 24">
														<path
															d="M12.71,12.54a1,1,0,0,0-1.42,0l-3,3A1,1,0,0,0,9.71,17L12,14.66,14.29,17a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Zm-3-1.08L12,9.16l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Z" />
													</svg> 15</span>
												<a data-link data-title="Epic Motivational" data-artist="AudioPizza"
													data-img="${pageContext.request.contextPath }/resources/user/img/covers/cover3.jpg"
													href="../blast2.0/audio/10938456_inspiring-epic-motivational-cinematic-trailer_by_audiopizza_preview.mp3"
													class="single-item__cover">
													<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover3.jpg" alt="">
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" />
													</svg>
												</a>
												<div class="single-item__title">
													<h4><a class="clr-white" href="#">Epic Motivational</a></h4>
													<span><a href="artist.html">AudioPizza</a></span>
												</div>
												<span class="single-item__time">5:30</span>
											</li>
											<li class="single-item none-hover">
												<span class="single-item__number">4</span>
												<span class="single-item__rate"><svg xmlns="http://www.w3.org/2000/svg"
														viewBox="0 0 24 24">
														<path
															d="M12.71,12.54a1,1,0,0,0-1.42,0l-3,3A1,1,0,0,0,9.71,17L12,14.66,14.29,17a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Zm-3-1.08L12,9.16l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Z" />
													</svg> 11</span>
												<a data-link data-title="Upbeat Rock" data-artist="AudioPizza"
													data-img="${pageContext.request.contextPath }/resources/user/img/covers/cover4.jpg"
													href="../blast2.0/audio/16412111_upbeat-rock_by_audiopizza_preview.mp3"
													class="single-item__cover">
													<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover4.jpg" alt="">
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" />
													</svg>
												</a>
												<div class="single-item__title">
													<h4><a class="clr-white" href="#">Upbeat Rock</a></h4>
													<span><a href="artist.html">AudioPizza</a></span>
												</div>
												<span class="single-item__time">3:42</span>
											</li>
											<li class="single-item none-hover">
												<span class="single-item__number">5</span>
												<span class="single-item__rate"><svg xmlns="http://www.w3.org/2000/svg"
														viewBox="0 0 24 24">
														<path
															d="M12.71,12.54a1,1,0,0,0-1.42,0l-3,3A1,1,0,0,0,9.71,17L12,14.66,14.29,17a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Zm-3-1.08L12,9.16l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Z" />
													</svg> 2</span>
												<a data-link data-title="Ambient Pop" data-artist="AudioPizza"
													data-img="${pageContext.request.contextPath }/resources/user/img/covers/cover5.jpg"
													href="../blast2.0/audio/19478377_ambient-pop_by_audiopizza_preview.mp3"
													class="single-item__cover">
													<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover5.jpg" alt="">
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" />
													</svg>
												</a>
												<div class="single-item__title">
													<h4><a class="clr-white" href="#">Ambient Pop</a></h4>
													<span><a href="artist.html">AudioPizza</a></span>
												</div>
												<span class="single-item__time">3:02</span>
											</li>
										</ul>
									</div>
								</div>
							</div>
			
							<div class="col-12 col-md-6 col-xl-4">
								<div class="row row--grid">
									<!-- title -->
									<div class="col-12">
										<div class="main__title">
											<h2><a class="clr-light" href="#">US - UK</a></h2>
										</div>
									</div>
									<!-- end title -->
			
									<div class="col-12">
										<ul class="main__list">
											<li class="single-item none-hover">
												<span class="single-item__number">1</span>
												<span class="single-item__rate"><svg xmlns="http://www.w3.org/2000/svg"
														viewBox="0 0 24 24">
														<path
															d="M12.71,12.54a1,1,0,0,0-1.42,0l-3,3A1,1,0,0,0,9.71,17L12,14.66,14.29,17a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Zm-3-1.08L12,9.16l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Z" />
													</svg> 1</span>
												<a data-link data-title="Cinematic" data-artist="AudioPizza"
													data-img="${pageContext.request.contextPath }/resources/user/img/covers/cover1.jpg"
													href="../blast2.0/audio/12071151_epic-cinematic-trailer_by_audiopizza_preview.mp3"
													class="single-item__cover">
													<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover1.jpg" alt="">
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" />
													</svg>
												</a>
												<div class="single-item__title">
													<h4><a class="clr-white" href="#">Cinematic</a></h4>
													<span><a href="artist.html">AudioPizza</a></span>
												</div>
												<span class="single-item__time">2:35</span>
											</li>
											<li class="single-item none-hover">
												<span class="single-item__number">2</span>
												<span class="single-item__rate single-item__rate--red"><svg
														xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M11.29,11.46a1,1,0,0,0,1.42,0l3-3A1,1,0,1,0,14.29,7L12,9.34,9.71,7A1,1,0,1,0,8.29,8.46Zm3,1.08L12,14.84l-2.29-2.3A1,1,0,0,0,8.29,14l3,3a1,1,0,0,0,1.42,0l3-3a1,1,0,0,0-1.42-1.42Z" />
													</svg> 1</span>
												<a data-link data-title="Adventure" data-artist="AudioPizza"
													data-img="${pageContext.request.contextPath }/resources/user/img/covers/cover2.jpg"
													href="../blast2.0/audio/9106709_epic-adventure-cinematic-trailer_by_audiopizza_preview.mp3"
													class="single-item__cover">
													<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover2.jpg" alt="">
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" />
													</svg>
												</a>
												<div class="single-item__title">
													<h4><a class="clr-white" href="#">Adventure</a></h4>
													<span><a href="artist.html">AudioPizza</a></span>
												</div>
												<span class="single-item__time">3:37</span>
											</li>
											<li class="single-item none-hover">
												<span class="single-item__number">3</span>
												<span class="single-item__rate"><svg xmlns="http://www.w3.org/2000/svg"
														viewBox="0 0 24 24">
														<path
															d="M12.71,12.54a1,1,0,0,0-1.42,0l-3,3A1,1,0,0,0,9.71,17L12,14.66,14.29,17a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Zm-3-1.08L12,9.16l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Z" />
													</svg> 15</span>
												<a data-link data-title="Epic Motivational" data-artist="AudioPizza"
													data-img="${pageContext.request.contextPath }/resources/user/img/covers/cover3.jpg"
													href="../blast2.0/audio/10938456_inspiring-epic-motivational-cinematic-trailer_by_audiopizza_preview.mp3"
													class="single-item__cover">
													<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover3.jpg" alt="">
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" />
													</svg>
												</a>
												<div class="single-item__title">
													<h4><a class="clr-white" href="#">Epic Motivational</a></h4>
													<span><a href="artist.html">AudioPizza</a></span>
												</div>
												<span class="single-item__time">5:30</span>
											</li>
											<li class="single-item none-hover">
												<span class="single-item__number">4</span>
												<span class="single-item__rate"><svg xmlns="http://www.w3.org/2000/svg"
														viewBox="0 0 24 24">
														<path
															d="M12.71,12.54a1,1,0,0,0-1.42,0l-3,3A1,1,0,0,0,9.71,17L12,14.66,14.29,17a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Zm-3-1.08L12,9.16l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Z" />
													</svg> 11</span>
												<a data-link data-title="Upbeat Rock" data-artist="AudioPizza"
													data-img="${pageContext.request.contextPath }/resources/user/img/covers/cover4.jpg"
													href="../blast2.0/audio/16412111_upbeat-rock_by_audiopizza_preview.mp3"
													class="single-item__cover">
													<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover4.jpg" alt="">
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" />
													</svg>
												</a>
												<div class="single-item__title">
													<h4><a class="clr-white" href="#">Upbeat Rock</a></h4>
													<span><a href="artist.html">AudioPizza</a></span>
												</div>
												<span class="single-item__time">3:42</span>
											</li>
											<li class="single-item none-hover">
												<span class="single-item__number">5</span>
												<span class="single-item__rate"><svg xmlns="http://www.w3.org/2000/svg"
														viewBox="0 0 24 24">
														<path
															d="M12.71,12.54a1,1,0,0,0-1.42,0l-3,3A1,1,0,0,0,9.71,17L12,14.66,14.29,17a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Zm-3-1.08L12,9.16l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Z" />
													</svg> 2</span>
												<a data-link data-title="Ambient Pop" data-artist="AudioPizza"
													data-img="${pageContext.request.contextPath }/resources/user/img/covers/cover5.jpg"
													href="../blast2.0/audio/19478377_ambient-pop_by_audiopizza_preview.mp3"
													class="single-item__cover">
													<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover5.jpg" alt="">
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" />
													</svg>
												</a>
												<div class="single-item__title">
													<h4><a class="clr-white" href="#">Ambient Pop</a></h4>
													<span><a href="artist.html">AudioPizza</a></span>
												</div>
												<span class="single-item__time">3:02</span>
											</li>
										</ul>
									</div>
								</div>
							</div>
			
							<div class="col-12 col-md-6 col-xl-4">
								<div class="row row--grid">
									<!-- title -->
									<div class="col-12">
										<div class="main__title">
											<h2><a class="clr-light" href="#">Top All</a></h2>
										</div>
									</div>
									<!-- end title -->
			
									<div class="col-12">
										<ul class="main__list">
											<li class="single-item none-hover">
												<span class="single-item__number">1</span>
												<span class="single-item__rate"><svg xmlns="http://www.w3.org/2000/svg"
														viewBox="0 0 24 24">
														<path
															d="M12.71,12.54a1,1,0,0,0-1.42,0l-3,3A1,1,0,0,0,9.71,17L12,14.66,14.29,17a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Zm-3-1.08L12,9.16l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Z" />
													</svg> 1</span>
												<a data-link data-title="Cinematic" data-artist="AudioPizza"
													data-img="${pageContext.request.contextPath }/resources/user/img/covers/cover1.jpg"
													href="../blast2.0/audio/12071151_epic-cinematic-trailer_by_audiopizza_preview.mp3"
													class="single-item__cover">
													<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover1.jpg" alt="">
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" />
													</svg>
												</a>
												<div class="single-item__title">
													<h4><a class="clr-white" href="#">Cinematic</a></h4>
													<span><a href="artist.html">AudioPizza</a></span>
												</div>
												<span class="single-item__time">2:35</span>
											</li>
											<li class="single-item none-hover">
												<span class="single-item__number">2</span>
												<span class="single-item__rate single-item__rate--red"><svg
														xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M11.29,11.46a1,1,0,0,0,1.42,0l3-3A1,1,0,1,0,14.29,7L12,9.34,9.71,7A1,1,0,1,0,8.29,8.46Zm3,1.08L12,14.84l-2.29-2.3A1,1,0,0,0,8.29,14l3,3a1,1,0,0,0,1.42,0l3-3a1,1,0,0,0-1.42-1.42Z" />
													</svg> 1</span>
												<a data-link data-title="Adventure" data-artist="AudioPizza"
													data-img="${pageContext.request.contextPath }/resources/user/img/covers/cover2.jpg"
													href="../blast2.0/audio/9106709_epic-adventure-cinematic-trailer_by_audiopizza_preview.mp3"
													class="single-item__cover">
													<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover2.jpg" alt="">
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" />
													</svg>
												</a>
												<div class="single-item__title">
													<h4><a class="clr-white" href="#">Adventure</a></h4>
													<span><a href="artist.html">AudioPizza</a></span>
												</div>
												<span class="single-item__time">3:37</span>
											</li>
											<li class="single-item none-hover">
												<span class="single-item__number">3</span>
												<span class="single-item__rate"><svg xmlns="http://www.w3.org/2000/svg"
														viewBox="0 0 24 24">
														<path
															d="M12.71,12.54a1,1,0,0,0-1.42,0l-3,3A1,1,0,0,0,9.71,17L12,14.66,14.29,17a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Zm-3-1.08L12,9.16l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Z" />
													</svg> 15</span>
												<a data-link data-title="Epic Motivational" data-artist="AudioPizza"
													data-img="${pageContext.request.contextPath }/resources/user/img/covers/cover3.jpg"
													href="../blast2.0/audio/10938456_inspiring-epic-motivational-cinematic-trailer_by_audiopizza_preview.mp3"
													class="single-item__cover">
													<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover3.jpg" alt="">
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" />
													</svg>
												</a>
												<div class="single-item__title">
													<h4><a class="clr-white" href="#">Epic Motivational</a></h4>
													<span><a href="artist.html">AudioPizza</a></span>
												</div>
												<span class="single-item__time">5:30</span>
											</li>
											<li class="single-item none-hover">
												<span class="single-item__number">4</span>
												<span class="single-item__rate"><svg xmlns="http://www.w3.org/2000/svg"
														viewBox="0 0 24 24">
														<path
															d="M12.71,12.54a1,1,0,0,0-1.42,0l-3,3A1,1,0,0,0,9.71,17L12,14.66,14.29,17a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Zm-3-1.08L12,9.16l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Z" />
													</svg> 11</span>
												<a data-link data-title="Upbeat Rock" data-artist="AudioPizza"
													data-img="${pageContext.request.contextPath }/resources/user/img/covers/cover4.jpg"
													href="../blast2.0/audio/16412111_upbeat-rock_by_audiopizza_preview.mp3"
													class="single-item__cover">
													<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover4.jpg" alt="">
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" />
													</svg>
												</a>
												<div class="single-item__title">
													<h4><a class="clr-white" href="#">Upbeat Rock</a></h4>
													<span><a href="artist.html">AudioPizza</a></span>
												</div>
												<span class="single-item__time">3:42</span>
											</li>
											<li class="single-item none-hover">
												<span class="single-item__number">5</span>
												<span class="single-item__rate"><svg xmlns="http://www.w3.org/2000/svg"
														viewBox="0 0 24 24">
														<path
															d="M12.71,12.54a1,1,0,0,0-1.42,0l-3,3A1,1,0,0,0,9.71,17L12,14.66,14.29,17a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Zm-3-1.08L12,9.16l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Z" />
													</svg> 2</span>
												<a data-link data-title="Ambient Pop" data-artist="AudioPizza"
													data-img="${pageContext.request.contextPath }/resources/user/img/covers/cover5.jpg"
													href="../blast2.0/audio/19478377_ambient-pop_by_audiopizza_preview.mp3"
													class="single-item__cover">
													<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover5.jpg" alt="">
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
													</svg>
													<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" />
													</svg>
												</a>
												<div class="single-item__title">
													<h4><a class="clr-white" href="#">Ambient Pop</a></h4>
													<span><a href="artist.html">AudioPizza</a></span>
												</div>
												<span class="single-item__time">3:02</span>
											</li>
										</ul>
									</div>
									
								</div>
							</div>
						</section>
		</div>
