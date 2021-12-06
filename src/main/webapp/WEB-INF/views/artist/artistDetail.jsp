<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:userTemplate title="Artist">
	<jsp:attribute name="content">
	
	<!-- NTanh -->
	<!-- main content -->
    <main class="main">
        <div class="container-fluid">
            <div class="row row--grid">
                <!-- breadcrumb -->
                <div class="col-12">
                    <ul class="breadcrumb">
                        <li class="breadcrumb__item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb__item"><a href="releases.html">Releases</a></li>
                        <li class="breadcrumb__item breadcrumb__item--active">Release</li>
                    </ul>
                </div>
                <!-- end breadcrumb -->

                <div class="col-12 flex-fill mt-2">
                    <div class="row row--grid">
                        <div class="col-6 flex-box">
                            <div class="artist__avatar mr-4">
                                <img src="${pageContext.request.contextPath }/uploads/images/artist/${arti.image}"
                                    alt="">
                                <div class="follow-artist">
                                    <button class="circle-icon-lg bg-clr-red">
                                        <i class="las la-heart"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="artist__intro flex-box flex-column justify-content-start mt-4">
                                <h3 class="text-large">${arti.nickname }</h3>
                                <p class="nickname">${arti.countryname }</p>
                                <p class="follower clr-blue"><i class="las la-users audio__icon"></i>${arti.follower } k followers</p>
                                <button class="btn-artist-play-all btn-glow">PLAY ALL</button>
                            </div>
                        </div>
                        <div class="col-6">
                            <h3 class="text-large">Profile</h3>
                            <p>${arti.description }</p>
                        </div>
                    </div>
                </div>

                <div class="col-12 flex-fill mt-4">
                    <ul class="artist__content-menu">
                        <li class="artist__content-item">
                            <a href="#track" id="track-tab">Top Tracks</a>
                        </li>
                        <li class="artist__content-item">
                            <a href="#album" id="album-tab">Top Albums</a>
                        </li>
                    </ul>
                    <div class="artist__tab-container mt-4">
                        <div class="artist__tab-box mr-3" id="track">
                            <div class="track-control">
                                <h4>Tracks</h4>
                            </div>
                            <ul class="list__tracks">
                            	<c:forEach var="tr" items="${trac }">
                                <li class="list-track-item">
                                    <div class="track-left">
                                        <div class="track-image mr-3">
                                            <img src="https://www.kri8thm.in/html/listen/theme/assets/images/cover/small/2.jpg"
                                                alt="">
                                        </div>
                                        <div class="track-content">
                                            <h3>${tr.title }</h3>
                                            <p>Gerrina Linda</p>
                                        </div>
                                    </div>
                                    <div class="track-right">
                                        <button class="circle-icon-sm bg-clr-red mr-3">
                                            <i class="las la-heart"></i>
                                        </button>
                                        <button class="circle-icon-sm bg-clr-yellow mr-3 only-premium">
                                            <i class="las la-crown"></i>
                                        </button>
                                        <div class="duration-track">05:03</div>
                                        <button class="btn-song-menu">
                                            <i class="las la-braille audio__icon"></i>
                                            <div class="song__menu-list">
                                                <a class="dropdown-song-link-menu favorite-link" data-favorite="true">
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
                                </li>
                                </c:forEach>
                               
                            </ul>
                        </div>
                        <div class="artist__tab-box ml-3" id="track">
                            <div class="track-control">
                                <h4>10 Albums</h4>
                                <div class="filter">
                                    Sorted By:
                                    <select name="filter-track" id="">
                                        <option value="">Popular</option>
                                        <option value="">A-Z</option>
                                        <option value="">Z-A</option>
                                    </select>
                                </div>
                            </div>
                            <ul class="list__tracks">
                                <li class="list-track-item">
                                    <div class="track-left">
                                        <div class="track-image mr-3">
                                            <img src="https://www.kri8thm.in/html/listen/theme/assets/images/cover/small/2.jpg"
                                                alt="">
                                        </div>
                                        <div class="track-content">
                                            <h3>Shack your butty</h3>
                                            <p>Gerrina Linda</p>
                                        </div>
                                    </div>
                                    <div class="track-right">
                                        <button class="circle-icon-sm bg-clr-red mr-3">
                                            <i class="las la-heart"></i>
                                        </button>
                                        <button class="circle-icon-sm bg-clr-yellow mr-3 only-premium">
                                            <i class="las la-crown"></i>
                                        </button>
                                        <div class="duration-track">05:03</div>
                                        <button class="btn-song-menu">
                                            <i class="las la-braille audio__icon"></i>
                                            <div class="song__menu-list">
                                                <a class="dropdown-song-link-menu favorite-link" data-favorite="true">
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
                                </li>
                                <li class="list-track-item">
                                    <div class="track-left">
                                        <div class="track-image mr-3">
                                            <img src="https://www.kri8thm.in/html/listen/theme/assets/images/cover/small/2.jpg"
                                                alt="">
                                        </div>
                                        <div class="track-content">
                                            <h3>Shack your butty</h3>
                                            <p>Gerrina Linda</p>
                                        </div>
                                    </div>
                                    <div class="track-right">
                                        <button class="circle-icon-sm bg-clr-red mr-3">
                                            <i class="las la-heart"></i>
                                        </button>
                                        <button class="circle-icon-sm bg-clr-yellow mr-3 only-premium">
                                            <i class="las la-crown"></i>
                                        </button>
                                        <div class="duration-track">05:03</div>
                                        <button class="btn-song-menu">
                                            <i class="las la-braille audio__icon"></i>
                                            <div class="song__menu-list">
                                                <a class="dropdown-song-link-menu favorite-link" data-favorite="true">
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
                                </li>
                                <li class="list-track-item">
                                    <div class="track-left">
                                        <div class="track-image mr-3">
                                            <img src="https://www.kri8thm.in/html/listen/theme/assets/images/cover/small/2.jpg"
                                                alt="">
                                        </div>
                                        <div class="track-content">
                                            <h3>Shack your butty</h3>
                                            <p>Gerrina Linda</p>
                                        </div>
                                    </div>
                                    <div class="track-right">
                                        <button class="circle-icon-sm bg-clr-red mr-3">
                                            <i class="las la-heart"></i>
                                        </button>
                                        <button class="circle-icon-sm bg-clr-yellow mr-3 only-premium">
                                            <i class="las la-crown"></i>
                                        </button>
                                        <div class="duration-track">05:03</div>
                                        <button class="btn-song-menu">
                                            <i class="las la-braille audio__icon"></i>
                                            <div class="song__menu-list">
                                                <a class="dropdown-song-link-menu favorite-link" data-favorite="true">
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
                                </li>
                                <li class="list-track-item">
                                    <div class="track-left">
                                        <div class="track-image mr-3">
                                            <img src="https://www.kri8thm.in/html/listen/theme/assets/images/cover/small/2.jpg"
                                                alt="">
                                        </div>
                                        <div class="track-content">
                                            <h3>Shack your butty</h3>
                                            <p>Gerrina Linda</p>
                                        </div>
                                    </div>
                                    <div class="track-right">
                                        <button class="circle-icon-sm bg-clr-red mr-3">
                                            <i class="las la-heart"></i>
                                        </button>
                                        <button class="circle-icon-sm bg-clr-yellow mr-3 only-premium">
                                            <i class="las la-crown"></i>
                                        </button>
                                        <div class="duration-track">05:03</div>
                                        <button class="btn-song-menu">
                                            <i class="las la-braille audio__icon"></i>
                                            <div class="song__menu-list">
                                                <a class="dropdown-song-link-menu favorite-link" data-favorite="true">
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
                                </li>
                                <li class="list-track-item">
                                    <div class="track-left">
                                        <div class="track-image mr-3">
                                            <img src="https://www.kri8thm.in/html/listen/theme/assets/images/cover/small/2.jpg"
                                                alt="">
                                        </div>
                                        <div class="track-content">
                                            <h3>Shack your butty</h3>
                                            <p>Gerrina Linda</p>
                                        </div>
                                    </div>
                                    <div class="track-right">
                                        <button class="circle-icon-sm bg-clr-red mr-3">
                                            <i class="las la-heart"></i>
                                        </button>
                                        <button class="circle-icon-sm bg-clr-yellow mr-3 only-premium">
                                            <i class="las la-crown"></i>
                                        </button>
                                        <div class="duration-track">05:03</div>
                                        <button class="btn-song-menu">
                                            <i class="las la-braille audio__icon"></i>
                                            <div class="song__menu-list">
                                                <a class="dropdown-song-link-menu favorite-link" data-favorite="true">
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
                                </li>
                                <li class="list-track-item">
                                    <div class="track-left">
                                        <div class="track-image mr-3">
                                            <img src="https://www.kri8thm.in/html/listen/theme/assets/images/cover/small/2.jpg"
                                                alt="">
                                        </div>
                                        <div class="track-content">
                                            <h3>Shack your butty</h3>
                                            <p>Gerrina Linda</p>
                                        </div>
                                    </div>
                                    <div class="track-right">
                                        <button class="circle-icon-sm bg-clr-red mr-3">
                                            <i class="las la-heart"></i>
                                        </button>
                                        <button class="circle-icon-sm bg-clr-yellow mr-3 only-premium">
                                            <i class="las la-crown"></i>
                                        </button>
                                        <div class="duration-track">05:03</div>
                                        <button class="btn-song-menu">
                                            <i class="las la-braille audio__icon"></i>
                                            <div class="song__menu-list">
                                                <a class="dropdown-song-link-menu favorite-link" data-favorite="true">
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
                                </li>
                                <li class="list-track-item">
                                    <div class="track-left">
                                        <div class="track-image mr-3">
                                            <img src="https://www.kri8thm.in/html/listen/theme/assets/images/cover/small/2.jpg"
                                                alt="">
                                        </div>
                                        <div class="track-content">
                                            <h3>Shack your butty</h3>
                                            <p>Gerrina Linda</p>
                                        </div>
                                    </div>
                                    <div class="track-right">
                                        <button class="circle-icon-sm bg-clr-red mr-3">
                                            <i class="las la-heart"></i>
                                        </button>
                                        <button class="circle-icon-sm bg-clr-yellow mr-3 only-premium">
                                            <i class="las la-crown"></i>
                                        </button>
                                        <div class="duration-track">05:03</div>
                                        <button class="btn-song-menu">
                                            <i class="las la-braille audio__icon"></i>
                                            <div class="song__menu-list">
                                                <a class="dropdown-song-link-menu favorite-link" data-favorite="true">
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
                                </li>
                                <li class="list-track-item">
                                    <div class="track-left">
                                        <div class="track-image mr-3">
                                            <img src="https://www.kri8thm.in/html/listen/theme/assets/images/cover/small/2.jpg"
                                                alt="">
                                        </div>
                                        <div class="track-content">
                                            <h3>Shack your butty</h3>
                                            <p>Gerrina Linda</p>
                                        </div>
                                    </div>
                                    <div class="track-right">
                                        <button class="circle-icon-sm bg-clr-red mr-3">
                                            <i class="las la-heart"></i>
                                        </button>
                                        <button class="circle-icon-sm bg-clr-yellow mr-3 only-premium">
                                            <i class="las la-crown"></i>
                                        </button>
                                        <div class="duration-track">05:03</div>
                                        <button class="btn-song-menu">
                                            <i class="las la-braille audio__icon"></i>
                                            <div class="song__menu-list">
                                                <a class="dropdown-song-link-menu favorite-link" data-favorite="true">
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
                                </li>
                                <li class="list-track-item">
                                    <div class="track-left">
                                        <div class="track-image mr-3">
                                            <img src="https://www.kri8thm.in/html/listen/theme/assets/images/cover/small/2.jpg"
                                                alt="">
                                        </div>
                                        <div class="track-content">
                                            <h3>Shack your butty</h3>
                                            <p>Gerrina Linda</p>
                                        </div>
                                    </div>
                                    <div class="track-right">
                                        <button class="circle-icon-sm bg-clr-red mr-3">
                                            <i class="las la-heart"></i>
                                        </button>
                                        <button class="circle-icon-sm bg-clr-yellow mr-3 only-premium">
                                            <i class="las la-crown"></i>
                                        </button>
                                        <div class="duration-track">05:03</div>
                                        <button class="btn-song-menu">
                                            <i class="las la-braille audio__icon"></i>
                                            <div class="song__menu-list">
                                                <a class="dropdown-song-link-menu favorite-link" data-favorite="true">
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
                                </li>
                                <li class="list-track-item">
                                    <div class="track-left">
                                        <div class="track-image mr-3">
                                            <img src="https://www.kri8thm.in/html/listen/theme/assets/images/cover/small/2.jpg"
                                                alt="">
                                        </div>
                                        <div class="track-content">
                                            <h3>Shack your butty</h3>
                                            <p>Gerrina Linda</p>
                                        </div>
                                    </div>
                                    <div class="track-right">
                                        <button class="circle-icon-sm bg-clr-red mr-3">
                                            <i class="las la-heart"></i>
                                        </button>
                                        <button class="circle-icon-sm bg-clr-yellow mr-3 only-premium">
                                            <i class="las la-crown"></i>
                                        </button>
                                        <div class="duration-track">05:03</div>
                                        <button class="btn-song-menu">
                                            <i class="las la-braille audio__icon"></i>
                                            <div class="song__menu-list">
                                                <a class="dropdown-song-link-menu favorite-link" data-favorite="true">
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
                                </li>
                            </ul>
                        </div>

                    </div>

                </div>

                <!-- Recent Listen -->
                <section class="row row--grid">
                    <!-- title -->
                    <div class="col-12">
                        <div class="main__title">
                            <h2>New Release Tracks</h2>
                        </div>
                    </div>
                    <!-- end title -->

                    <div class="col-6 col-sm-4 col-lg-2">
                        <div class="album">
                            <div class="album__cover">
                                <img src="img/covers/cover1.jpg" alt="">
                                <a href="release.html"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path
                                            d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
                                    </svg></a>
                                <span class="album__stat">
                                    <span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path
                                                d="M3.71,16.29a1,1,0,0,0-.33-.21,1,1,0,0,0-.76,0,1,1,0,0,0-.33.21,1,1,0,0,0-.21.33,1,1,0,0,0,.21,1.09,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1,1,0,0,0,.21-1.09A1,1,0,0,0,3.71,16.29ZM7,8H21a1,1,0,0,0,0-2H7A1,1,0,0,0,7,8ZM3.71,11.29a1,1,0,0,0-1.09-.21,1.15,1.15,0,0,0-.33.21,1,1,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1,1,0,0,0,3.71,11.29ZM21,11H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2ZM3.71,6.29a1,1,0,0,0-.33-.21,1,1,0,0,0-1.09.21,1.15,1.15,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21,1,1,0,0,0,1.09-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1.15,1.15,0,0,0,3.71,6.29ZM21,16H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2Z" />
                                        </svg> 22</span>
                                    <span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path
                                                d="M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z" />
                                        </svg> 19 503</span>
                                </span>
                            </div>
                            <div class="album__title">
                                <h3><a href="release.html">Space Melody</a></h3>
                                <span><a href="artist.html">VIZE</a> & <a href="artist.html">Alan Walker</a> & <a
                                        href="artist.html">Leony</a></span>
                            </div>
                        </div>
                    </div>

                    <div class="col-6 col-sm-4 col-lg-2">
                        <div class="album">
                            <div class="album__cover">
                                <img src="img/covers/cover2.jpg" alt="">
                                <a href="release.html"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path
                                            d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
                                    </svg></a>
                                <span class="album__stat">
                                    <span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path
                                                d="M3.71,16.29a1,1,0,0,0-.33-.21,1,1,0,0,0-.76,0,1,1,0,0,0-.33.21,1,1,0,0,0-.21.33,1,1,0,0,0,.21,1.09,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1,1,0,0,0,.21-1.09A1,1,0,0,0,3.71,16.29ZM7,8H21a1,1,0,0,0,0-2H7A1,1,0,0,0,7,8ZM3.71,11.29a1,1,0,0,0-1.09-.21,1.15,1.15,0,0,0-.33.21,1,1,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1,1,0,0,0,3.71,11.29ZM21,11H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2ZM3.71,6.29a1,1,0,0,0-.33-.21,1,1,0,0,0-1.09.21,1.15,1.15,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21,1,1,0,0,0,1.09-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1.15,1.15,0,0,0,3.71,6.29ZM21,16H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2Z" />
                                        </svg> 7</span>
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
                                <img src="img/covers/cover3.jpg" alt="">
                                <a href="release.html"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path
                                            d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
                                    </svg></a>
                                <span class="album__stat">
                                    <span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path
                                                d="M3.71,16.29a1,1,0,0,0-.33-.21,1,1,0,0,0-.76,0,1,1,0,0,0-.33.21,1,1,0,0,0-.21.33,1,1,0,0,0,.21,1.09,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1,1,0,0,0,.21-1.09A1,1,0,0,0,3.71,16.29ZM7,8H21a1,1,0,0,0,0-2H7A1,1,0,0,0,7,8ZM3.71,11.29a1,1,0,0,0-1.09-.21,1.15,1.15,0,0,0-.33.21,1,1,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1,1,0,0,0,3.71,11.29ZM21,11H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2ZM3.71,6.29a1,1,0,0,0-.33-.21,1,1,0,0,0-1.09.21,1.15,1.15,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21,1,1,0,0,0,1.09-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1.15,1.15,0,0,0,3.71,6.29ZM21,16H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2Z" />
                                        </svg> 16</span>
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
                                <img src="img/covers/cover4.jpg" alt="">
                                <a href="release.html"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path
                                            d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
                                    </svg></a>
                                <span class="album__stat">
                                    <span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path
                                                d="M3.71,16.29a1,1,0,0,0-.33-.21,1,1,0,0,0-.76,0,1,1,0,0,0-.33.21,1,1,0,0,0-.21.33,1,1,0,0,0,.21,1.09,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1,1,0,0,0,.21-1.09A1,1,0,0,0,3.71,16.29ZM7,8H21a1,1,0,0,0,0-2H7A1,1,0,0,0,7,8ZM3.71,11.29a1,1,0,0,0-1.09-.21,1.15,1.15,0,0,0-.33.21,1,1,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1,1,0,0,0,3.71,11.29ZM21,11H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2ZM3.71,6.29a1,1,0,0,0-.33-.21,1,1,0,0,0-1.09.21,1.15,1.15,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21,1,1,0,0,0,1.09-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1.15,1.15,0,0,0,3.71,6.29ZM21,16H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2Z" />
                                        </svg> 16</span>
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
                                <img src="img/covers/cover5.jpg" alt="">
                                <a href="release.html"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path
                                            d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
                                    </svg></a>
                                <span class="album__stat">
                                    <span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path
                                                d="M3.71,16.29a1,1,0,0,0-.33-.21,1,1,0,0,0-.76,0,1,1,0,0,0-.33.21,1,1,0,0,0-.21.33,1,1,0,0,0,.21,1.09,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1,1,0,0,0,.21-1.09A1,1,0,0,0,3.71,16.29ZM7,8H21a1,1,0,0,0,0-2H7A1,1,0,0,0,7,8ZM3.71,11.29a1,1,0,0,0-1.09-.21,1.15,1.15,0,0,0-.33.21,1,1,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1,1,0,0,0,3.71,11.29ZM21,11H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2ZM3.71,6.29a1,1,0,0,0-.33-.21,1,1,0,0,0-1.09.21,1.15,1.15,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21,1,1,0,0,0,1.09-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1.15,1.15,0,0,0,3.71,6.29ZM21,16H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2Z" />
                                        </svg> 11</span>
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
                                <img src="img/covers/cover6.jpg" alt="">
                                <a href="release.html"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path
                                            d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
                                    </svg></a>
                                <span class="album__stat">
                                    <span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path
                                                d="M3.71,16.29a1,1,0,0,0-.33-.21,1,1,0,0,0-.76,0,1,1,0,0,0-.33.21,1,1,0,0,0-.21.33,1,1,0,0,0,.21,1.09,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1,1,0,0,0,.21-1.09A1,1,0,0,0,3.71,16.29ZM7,8H21a1,1,0,0,0,0-2H7A1,1,0,0,0,7,8ZM3.71,11.29a1,1,0,0,0-1.09-.21,1.15,1.15,0,0,0-.33.21,1,1,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1,1,0,0,0,3.71,11.29ZM21,11H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2ZM3.71,6.29a1,1,0,0,0-.33-.21,1,1,0,0,0-1.09.21,1.15,1.15,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21,1,1,0,0,0,1.09-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1.15,1.15,0,0,0,3.71,6.29ZM21,16H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2Z" />
                                        </svg> 14</span>
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
                                <img src="img/covers/cover7.jpg" alt="">
                                <a href="release.html"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path
                                            d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
                                    </svg></a>
                                <span class="album__stat">
                                    <span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path
                                                d="M3.71,16.29a1,1,0,0,0-.33-.21,1,1,0,0,0-.76,0,1,1,0,0,0-.33.21,1,1,0,0,0-.21.33,1,1,0,0,0,.21,1.09,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1,1,0,0,0,.21-1.09A1,1,0,0,0,3.71,16.29ZM7,8H21a1,1,0,0,0,0-2H7A1,1,0,0,0,7,8ZM3.71,11.29a1,1,0,0,0-1.09-.21,1.15,1.15,0,0,0-.33.21,1,1,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1,1,0,0,0,3.71,11.29ZM21,11H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2ZM3.71,6.29a1,1,0,0,0-.33-.21,1,1,0,0,0-1.09.21,1.15,1.15,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21,1,1,0,0,0,1.09-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1.15,1.15,0,0,0,3.71,6.29ZM21,16H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2Z" />
                                        </svg> 16</span>
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
                                <img src="img/covers/cover8.jpg" alt="">
                                <a href="release.html"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path
                                            d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
                                    </svg></a>
                                <span class="album__stat">
                                    <span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path
                                                d="M3.71,16.29a1,1,0,0,0-.33-.21,1,1,0,0,0-.76,0,1,1,0,0,0-.33.21,1,1,0,0,0-.21.33,1,1,0,0,0,.21,1.09,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1,1,0,0,0,.21-1.09A1,1,0,0,0,3.71,16.29ZM7,8H21a1,1,0,0,0,0-2H7A1,1,0,0,0,7,8ZM3.71,11.29a1,1,0,0,0-1.09-.21,1.15,1.15,0,0,0-.33.21,1,1,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1,1,0,0,0,3.71,11.29ZM21,11H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2ZM3.71,6.29a1,1,0,0,0-.33-.21,1,1,0,0,0-1.09.21,1.15,1.15,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21,1,1,0,0,0,1.09-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1.15,1.15,0,0,0,3.71,6.29ZM21,16H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2Z" />
                                        </svg> 8</span>
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
                                <img src="img/covers/cover9.jpg" alt="">
                                <a href="release.html"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path
                                            d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
                                    </svg></a>
                                <span class="album__stat">
                                    <span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path
                                                d="M3.71,16.29a1,1,0,0,0-.33-.21,1,1,0,0,0-.76,0,1,1,0,0,0-.33.21,1,1,0,0,0-.21.33,1,1,0,0,0,.21,1.09,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1,1,0,0,0,.21-1.09A1,1,0,0,0,3.71,16.29ZM7,8H21a1,1,0,0,0,0-2H7A1,1,0,0,0,7,8ZM3.71,11.29a1,1,0,0,0-1.09-.21,1.15,1.15,0,0,0-.33.21,1,1,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1,1,0,0,0,3.71,11.29ZM21,11H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2ZM3.71,6.29a1,1,0,0,0-.33-.21,1,1,0,0,0-1.09.21,1.15,1.15,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21,1,1,0,0,0,1.09-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1.15,1.15,0,0,0,3.71,6.29ZM21,16H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2Z" />
                                        </svg> 24</span>
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
                                <img src="img/covers/cover10.jpg" alt="">
                                <a href="release.html"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path
                                            d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
                                    </svg></a>
                                <span class="album__stat">
                                    <span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path
                                                d="M3.71,16.29a1,1,0,0,0-.33-.21,1,1,0,0,0-.76,0,1,1,0,0,0-.33.21,1,1,0,0,0-.21.33,1,1,0,0,0,.21,1.09,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1,1,0,0,0,.21-1.09A1,1,0,0,0,3.71,16.29ZM7,8H21a1,1,0,0,0,0-2H7A1,1,0,0,0,7,8ZM3.71,11.29a1,1,0,0,0-1.09-.21,1.15,1.15,0,0,0-.33.21,1,1,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1,1,0,0,0,3.71,11.29ZM21,11H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2ZM3.71,6.29a1,1,0,0,0-.33-.21,1,1,0,0,0-1.09.21,1.15,1.15,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21,1,1,0,0,0,1.09-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1.15,1.15,0,0,0,3.71,6.29ZM21,16H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2Z" />
                                        </svg> 16</span>
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
                                <img src="img/covers/cover11.jpg" alt="">
                                <a href="release.html"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path
                                            d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
                                    </svg></a>
                                <span class="album__stat">
                                    <span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path
                                                d="M3.71,16.29a1,1,0,0,0-.33-.21,1,1,0,0,0-.76,0,1,1,0,0,0-.33.21,1,1,0,0,0-.21.33,1,1,0,0,0,.21,1.09,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1,1,0,0,0,.21-1.09A1,1,0,0,0,3.71,16.29ZM7,8H21a1,1,0,0,0,0-2H7A1,1,0,0,0,7,8ZM3.71,11.29a1,1,0,0,0-1.09-.21,1.15,1.15,0,0,0-.33.21,1,1,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1,1,0,0,0,3.71,11.29ZM21,11H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2ZM3.71,6.29a1,1,0,0,0-.33-.21,1,1,0,0,0-1.09.21,1.15,1.15,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21,1,1,0,0,0,1.09-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1.15,1.15,0,0,0,3.71,6.29ZM21,16H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2Z" />
                                        </svg> 19</span>
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
                                <img src="img/covers/cover12.jpg" alt="">
                                <a href="release.html"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path
                                            d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
                                    </svg></a>
                                <span class="album__stat">
                                    <span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path
                                                d="M3.71,16.29a1,1,0,0,0-.33-.21,1,1,0,0,0-.76,0,1,1,0,0,0-.33.21,1,1,0,0,0-.21.33,1,1,0,0,0,.21,1.09,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1,1,0,0,0,.21-1.09A1,1,0,0,0,3.71,16.29ZM7,8H21a1,1,0,0,0,0-2H7A1,1,0,0,0,7,8ZM3.71,11.29a1,1,0,0,0-1.09-.21,1.15,1.15,0,0,0-.33.21,1,1,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1,1,0,0,0,3.71,11.29ZM21,11H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2ZM3.71,6.29a1,1,0,0,0-.33-.21,1,1,0,0,0-1.09.21,1.15,1.15,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21,1,1,0,0,0,1.09-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1.15,1.15,0,0,0,3.71,6.29ZM21,16H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2Z" />
                                        </svg> 16</span>
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

                </section>
                <!-- end releases -->
            </div>
    </main>
    <!-- end main content -->
    
	</jsp:attribute>
</mt:userTemplate>