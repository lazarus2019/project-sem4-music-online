<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:userTemplate title="Your Track">
	<jsp:attribute name="content">
					<div class="row row--grid">
				<!-- breadcrumb -->
				<div class="col-12">
					<ul class="breadcrumb">
						<li class="breadcrumb__item"><a href="/">Home</a></li>
						<li class="breadcrumb__item breadcrumb__item--active">Profile</li>
					</ul>
				</div>
				<!-- end breadcrumb -->
			</div>

			<section class="row row--grid">
				<!-- title -->
				<div class="col-12">
					<div class="main__title">
						<h2>Your Tracks</h2>

						<button class="btn-add-new-track btn-glow">Add Track</button>
					</div>
				</div>
				<!-- end title -->

				<div class="col-12">
                    <form action="#" class="header__search">
                        <input type="text"
						placeholder="Artist, track or podcast">
                        <button type="button">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path
								d="M21.71,20.29,18,16.61A9,9,0,1,0,16.61,18l3.68,3.68a1,1,0,0,0,1.42,0A1,1,0,0,0,21.71,20.29ZM11,18a7,7,0,1,1,7-7A7,7,0,0,1,11,18Z"></path>
                            </svg>
					</button>
                        <button type="button" class="close">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path
								d="M13.41,12l6.3-6.29a1,1,0,1,0-1.42-1.42L12,10.59,5.71,4.29A1,1,0,0,0,4.29,5.71L10.59,12l-6.3,6.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l6.29,6.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z"></path>
                            </svg>
					</button>
                        <div class="result-layout">
        
                        </div>
                    </form>
                </div>

				<c:forEach var="track" items="${tracks }">
				
				<div class="col-6 col-sm-4 col-lg-2">
					<div class="album">
						<div class="album__cover">
							<img
								src="${pageContext.request.contextPath }/resources/user/img/covers/${track.thumbnail}"
								alt="${track.thumbnail}">
							<a href="#" class="artist-edit-track">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
									<path
										d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z"></path>
								</svg>
							</a>
							<span class="album__stat">
								<span><i class="las la-thumbs-up"></i> ${track.likes }</span>
								<span><svg xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 24 24">
										<path
											d="M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z" />
									</svg> ${track.listens}</span>
							</span>
							<button class="btn-dropdown-track-menu-artist">
								<i class="las la-braille audio__icon"></i>
								<div class="dropdown-track-menu-artist">
									<a class="dropdown-song-link-menu favorite-link"
										data-favorite="true">
										<i class="las la-heart"></i>
										<span>Favorite</span>
									</a>
									<a class="dropdown-song-link-menu">
										<i class="las la-plus small__icon"></i>
										<span>Add to Playlist</span>
									</a>
									<a class="dropdown-song-link-menu share-link" href="abc.com">
										<i class="las la-share small__icon"></i>
										<span>Share</span>
									</a>
									<a class="dropdown-song-link-menu" href="#">
										<i class="las la-info-circle small__icon"></i>
										<span>Song Info</span>
									</a>
								</div>
							</button>
						</div>
						<div class="album__title">
							<h3>
								<a href="release.html">${track.title }</a>
							</h3>
							
						</div>
					</div>
				</div>
				</c:forEach>


				<%-- 
				<div class="col-6 col-sm-4 col-lg-2">
					<div class="album">
						<div class="album__cover">
							<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover2.jpg" alt="">
							<a href="release.html" class="artist-edit-track">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
									<path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z"></path>
								</svg>
							</a>
							<span class="album__stat">
								<span><i class="las la-thumbs-up"></i> 7</span>
								<span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
										<path
											d="M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z" />
									</svg> 4 731</span>
							</span>
						</div>
						<div class="album__title">
							<h3><a href="release.html">Said Sum</a></h3>
							<span><a href="artist.html">Moneybagg</a></span>
						</div>
					</div>
				</div>

				<div class="col-6 col-sm-4 col-lg-2">
					<div class="album">
						<div class="album__cover">
							<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover3.jpg" alt="">
							<a href="release.html" class="artist-edit-track">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
									<path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z"></path>
								</svg>
							</a>
							<span class="album__stat">
								<span><i class="las la-thumbs-up"></i> 16</span>
								<span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
										<path
											d="M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z" />
									</svg> 300k</span>
							</span>
						</div>
						<div class="album__title">
							<h3><a href="release.html">I Love My Country</a></h3>
							<span><a href="artist.html">Florida Georgia</a></span>
						</div>
					</div>
				</div>

				<div class="col-6 col-sm-4 col-lg-2">
					<div class="album">
						<div class="album__cover">
							<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover4.jpg" alt="">
							<a href="release.html" class="artist-edit-track">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
									<path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z"></path>
								</svg>
							</a>
							<span class="album__stat">
								<span><i class="las la-thumbs-up"></i> 16</span>
								<span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
										<path
											d="M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z" />
									</svg> 100k</span>
							</span>
						</div>
						<div class="album__title">
							<h3><a href="release.html">Toosie Slide</a></h3>
							<span><a href="artist.html">Drake</a></span>
						</div>
					</div>
				</div>

				<div class="col-6 col-sm-4 col-lg-2">
					<div class="album">
						<div class="album__cover">
							<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover5.jpg" alt="">
							<a href="release.html" class="artist-edit-track">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
									<path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z"></path>
								</svg>
							</a>
							<span class="album__stat">
								<span><i class="las la-thumbs-up"></i> 11</span>
								<span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
										<path
											d="M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z" />
									</svg> 1 279</span>
							</span>							
						</div>
						<div class="album__title">
							<h3><a href="release.html">Got What I Got</a></h3>
							<span><a href="artist.html">Jason Aldean</a></span>
						</div>
					</div>
				</div>

				<div class="col-6 col-sm-4 col-lg-2">
					<div class="album">
						<div class="album__cover">
							<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover6.jpg" alt="">
							<a href="release.html" class="artist-edit-track">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
									<path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z"></path>
								</svg>
							</a>
							<span class="album__stat">
								<span><i class="las la-thumbs-up"></i> 14</span>
								<span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
										<path
											d="M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z" />
									</svg> 9 045</span>
							</span>
						</div>
						<div class="album__title">
							<h3><a href="release.html">Supalonely</a></h3>
							<span><a href="artist.html">BENEE Featuring</a></span>
						</div>
					</div>
				</div>

				<div class="col-6 col-sm-4 col-lg-2">
					<div class="album">
						<div class="album__cover">
							<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover7.jpg" alt="">
							<a href="release.html" class="artist-edit-track">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
									<path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z"></path>
								</svg>
							</a>
							<span class="album__stat">
								<span><i class="las la-thumbs-up"></i> 16</span>
								<span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
										<path
											d="M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z" />
									</svg> 500k</span>
							</span>
						</div>
						<div class="album__title">
							<h3><a href="release.html">Girls In The Hood</a></h3>
							<span><a href="artist.html">Megan Thee</a></span>
						</div>
					</div>
				</div>

				<div class="col-6 col-sm-4 col-lg-2">
					<div class="album">
						<div class="album__cover">
							<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover8.jpg" alt="">
							<a href="release.html" class="artist-edit-track">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
									<path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z"></path>
								</svg>
							</a>
							<span class="album__stat">
								<span><i class="las la-thumbs-up"></i> 8</span>
								<span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
										<path
											d="M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z" />
									</svg> 56 042</span>
							</span>
						</div>
						<div class="album__title">
							<h3><a href="release.html">Got It On Me</a></h3>
							<span><a href="artist.html">Summer Walker</a></span>
						</div>
					</div>
				</div>

				<div class="col-6 col-sm-4 col-lg-2">
					<div class="album">
						<div class="album__cover">
							<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover9.jpg" alt="">
							<a href="release.html" class="artist-edit-track">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
									<path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z"></path>
								</svg>
							</a>
							<span class="album__stat">
								<span><i class="las la-thumbs-up"></i> 24</span>
								<span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
										<path
											d="M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z" />
									</svg> 100k</span>
							</span>
						</div>
						<div class="album__title">
							<h3><a href="release.html">Righteous</a></h3>
							<span><a href="artist.html">Juice WRLD</a></span>
						</div>
					</div>
				</div>

				<div class="col-6 col-sm-4 col-lg-2">
					<div class="album">
						<div class="album__cover">
							<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover10.jpg" alt="">
							<a href="release.html" class="artist-edit-track">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
									<path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z"></path>
								</svg>
							</a>
							<span class="album__stat">
								<span><i class="las la-thumbs-up"></i> 16</span>
								<span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
										<path
											d="M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z" />
									</svg> 2 482</span>
							</span>
						</div>
						<div class="album__title">
							<h3><a href="release.html">Walk Em Down</a></h3>
							<span><a href="artist.html">NLE Choppa</a></span>
						</div>
					</div>
				</div>

				<div class="col-6 col-sm-4 col-lg-2">
					<div class="album">
						<div class="album__cover">
							<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover11.jpg" alt="">
							<a href="release.html" class="artist-edit-track">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
									<path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z"></path>
								</svg>
							</a>
							<span class="album__stat">
								<span><i class="las la-thumbs-up"></i> 19</span>
								<span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
										<path
											d="M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z" />
									</svg> 50k</span>
							</span>
						</div>
						<div class="album__title">
							<h3><a href="release.html">Like That</a></h3>
							<span><a href="artist.html">Stefflon Don</a></span>
						</div>
					</div>
				</div>

				<div class="col-6 col-sm-4 col-lg-2">
					<div class="album">
						<div class="album__cover">
							<img src="${pageContext.request.contextPath }/resources/user/img/covers/cover12.jpg" alt="">
							<a href="release.html" class="artist-edit-track">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
									<path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z"></path>
								</svg>
							</a>
							<span class="album__stat">
								<span><i class="las la-thumbs-up"></i> 16</span>
								<span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
										<path
											d="M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z" />
									</svg> 75k</span>
							</span>
						</div>
						<div class="album__title">
							<h3><a href="release.html">One Big Country</a></h3>
							<span><a href="artist.html">LOCASH</a></span>
						</div>
					</div>
				</div>
			
			 --%>
			</section>
		
	</jsp:attribute>
</mt:userTemplate>