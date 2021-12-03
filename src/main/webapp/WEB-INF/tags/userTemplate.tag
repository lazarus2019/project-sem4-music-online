<%@ tag language="java" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ attribute name="title" required="true"  rtexprvalue="true"%> 
<%@ attribute name="content" fragment="true" %> 
<%@ taglib prefix="t" uri="http://mytags.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from dmitryvolkov.me/demo/volna/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 13 Nov 2021 02:08:35 GMT -->

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/bootstrap-reboot.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/bootstrap-grid.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/magnific-popup.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/select2.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/paymentfont.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/slider-radio.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/plyr.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/adminlte.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/all.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/icheck-bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/css/bootstrap.min.css">

	<!-- CSS Listen -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/1.3.0/css/line-awesome.min.css">

	<!-- My custom CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/my_custom.css">

	<!-- Sweetalert CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/sweetalert2/dist/sweetalert2.min.css">

	<!-- Favicons -->
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/resources/user/icon/favicon-32x32.png" sizes="32x32">
	<link rel="apple-touch-icon" href="${pageContext.request.contextPath }/resources/user/icon/favicon-32x32.png">

	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="Dmitry Volkov">
	<title>Volna - Record label & Music streaming HTML Template</title>

</head>

<body>
<!-- header -->
<header class="header">
    <div class="header__content">
        <div class="header__logo">
            <a href="index.html">
                <img src="${pageContext.request.contextPath }/resources/user/img/logo.svg" alt="">
            </a>
        </div>

        <ul class="header__nav">
            <li>
                <a href="${pageContext.request.contextPath }/">Home</a>
            </li>
            <!-- <a href="profile.html">Profile</a>
				<a href="about.html">About</a>
				<a href="contacts.html">Contacts</a> -->
            <li>
                <a href="${pageContext.request.contextPath }/genres">Genres</a>
            </li>
            <li class="dropdown-btn">
                <a href="#" class="link">Library</a>
                <div class="dropdown-menu">
                    <a href="releases.html"><i class="las la-music"></i> New Release</a>
                    <a href="custom_playlist.html"><i class="las la-stream"></i> Playlist</a>
                    <a href="${pageContext.request.contextPath }/liked"><i class="las la-heart"></i> Liked</a>
                    <a href="${pageContext.request.contextPath }/recentplay"><i class="las la-headphones"></i> Recently Played</a>
                    <a href="record_chart.html"><i class="las la-sort-numeric-down"></i> Record Chart</a>
                </div>
            </li>


            <a href="${pageContext.request.contextPath }/artist">Artist</a>
        </ul>

		<!-- base search -->
		<t:baseSearch />
		<!-- base search end -->

        <div class="header__actions">
            <div class="header__action header__action--search">
                <button class="header__action-btn" type="button"><svg xmlns="http://www.w3.org/2000/svg"
                        viewBox="0 0 24 24">
                        <path
                            d="M21.71,20.29,18,16.61A9,9,0,1,0,16.61,18l3.68,3.68a1,1,0,0,0,1.42,0A1,1,0,0,0,21.71,20.29ZM11,18a7,7,0,1,1,7-7A7,7,0,0,1,11,18Z" />
                    </svg></button>
            </div>
            <!-- end search box -->
    
            <!-- notification button -->
            <t:notification />
            <!-- end notification button -->
    
            <div class="header__action header__action--signin">
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <a class="header__action-btn" href="${pageContext.request.contextPath }/user/login/login">
                        <span>Sign in</span>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path
                                d="M20,12a1,1,0,0,0-1-1H11.41l2.3-2.29a1,1,0,1,0-1.42-1.42l-4,4a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l4,4a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L11.41,13H19A1,1,0,0,0,20,12ZM17,2H7A3,3,0,0,0,4,5V19a3,3,0,0,0,3,3H17a3,3,0,0,0,3-3V16a1,1,0,0,0-2,0v3a1,1,0,0,1-1,1H7a1,1,0,0,1-1-1V5A1,1,0,0,1,7,4H17a1,1,0,0,1,1,1V8a1,1,0,0,0,2,0V5A3,3,0,0,0,17,2Z" />
                        </svg>
                    </a>
                </c:if>
                <div class="header__action-btn">
                    <c:if test="${pageContext.request.userPrincipal.name  != null }">
                        <span>${ accountSignined.nickname }</span>
    
                        <div class="user__box">
                            <i class="las la-crown"></i>
                            <img src="https://yt3.ggpht.com/IbzRdnm7aoMvV_fdLAAmL1D7IlJ3fQ-FA5kuRujQst_1MnQTNRO1wlrvjEVocAmsqIOLP6D34Q=s900-c-k-c0x00ffffff-no-rj"
                                alt="" class="user__avatar">
                            <div class="dropdown__user-menu">
                                <a href="${pageContext.request.contextPath }/user/profile/index">
                                    <i class="lar la-user-circle"></i> Profile
                                </a>
                                <a href="${pageContext.request.contextPath }/artist/yourtrack">
                                    <i class="las la-music"></i> Your Tracks
                                </a>
                                <a href="${pageContext.request.contextPath }/artist/youralbum">
                                    <i class="las la-record-vinyl"></i> Your Albums
                                </a>
                                <a href="#">
                                    <i class="las la-crown yellow__icon"></i> Upgrade to Premium <i
                                        class="las la-crown yellow__icon"></i>
                                </a>
                                <a href="#">
                                    <i class="las la-user-cog"></i> Settings
                                </a>
                                <a href="${pageContext.request.contextPath }/user/login/logout">
                                    <i class="las la-sign-out-alt"></i> Log out
                                </a>
                            </div>
                        </div>
                    </c:if>
                </div>
            
            
            </div>
        </div>
    
        <button class="header__btn" type="button">
            <span></span>
            <span></span>
            <span></span>
        </button>
    </div>
</header>
<!-- end header -->
	<!-- player -->
	<div class="player" id="audioPlayer">
		<div class="progressbar">
			<input type="range" class="audio-progress" max="100" min="0" value="0" step="0.01">
			<span class="bar"></span>
		</div>
		<div class="audio">
			<div class="song-image">
				<img src="https://yt3.ggpht.com/IbzRdnm7aoMvV_fdLAAmL1D7IlJ3fQ-FA5kuRujQst_1MnQTNRO1wlrvjEVocAmsqIOLP6D34Q=s900-c-k-c0x00ffffff-no-rj"
					alt="">
			</div>
			<div class="song-content">
				<h3>Why Don't We</h3>
				<span>For You</span>
			</div>
		</div>
		<div class="audio-controls">
			<div class="audio-controls-left">
				<button class="btn-loop-song default-btn active">
					<i class="las la-sync audio__icon"></i>
				</button>
			</div>
			<div class="audio-controls-main">
				<button class="btn-prev-audio default-btn">
					<i class="las la-step-backward audio__icon"></i>
				</button>
				<button class="btn-play-pause-audio default-btn circle__btn" onclick="audioControl(this);">
					<i class="las la-play audio__icon"></i>
					<i class="las la-pause audio__icon"></i>
				</button>
				<button class="btn-next-audio default-btn">
					<i class="las la-step-forward audio__icon"></i>
				</button>
			</div>
			<div class="audio-controls-right">
				<button class="btn-random-song default-btn">
					<i class="las la-random audio__icon"></i>
				</button>
			</div>
		</div>
		<div class="audio-info">
			<button id="lyrics" class="default-btn" onclick="toggleLyrics()">
				<i class="las la-file-alt audio__icon"></i>
			</button>
			<span class="duration-info">
				<span class="current-time">00:00</span> /
				<span class="base-duration">03:22</span>
			</span>
			<div class="audio-control-volume">
				<button class="btn-toggle-volume default-btn" onclick="toggleMenuVolume('dropdown-volume-range')">
					<i class="las la-volume-up audio__icon"></i>
				</button>
				<div class="dropdown-volume-range">
					<input type="range" class="audio-volume" min="0" max="100" value="50" step="1"
						oninput="changeVolumeIcon(this)">
				</div>
			</div>
			<div class="dropleft">
				<button class="default-btn" onclick="toggleMenuSong('dropdown-song-menu', 'dropdown-song-link')">
					<i class="las la-braille audio__icon"></i>
				</button>
				<div class="dropdown-song-menu">
					<a class="dropdown-song-link favorite-link" data-favorite="true">
						<i class="las la-heart"></i>
						<span>Favorite</span>
					</a>
					<a class="dropdown-song-link">
						<i class="las la-plus small__icon"></i>
						<span>Add to Playlist</span>
					</a>
					<a class="dropdown-song-link share-link" href="abc.com">
						<i class="las la-share small__icon"></i>
						<span>Share</span>
					</a>
					<a class="dropdown-song-link" href="#">
						<i class="las la-info-circle small__icon"></i>
						<span>Song Info</span>
					</a>
				</div>
			</div>
			<button id="playlist" class="default-btn" onclick="togglePlaylist()">
				<i class="las la-film audio__icon audio__icon"></i>
			</button>
		</div>
	</div>

	<!-- Lyric box -->
	<div class="lyric-box">
		<button class="default-btn hide-lyric-box" onclick="hideLyrics()">
			<i class="las la-angle-down audio__icon"></i>
		</button>
		<div class="row row--grid">
			<div class="col-6">
				<div class="lyric-thumbnail">
					<img src="https://yt3.ggpht.com/IbzRdnm7aoMvV_fdLAAmL1D7IlJ3fQ-FA5kuRujQst_1MnQTNRO1wlrvjEVocAmsqIOLP6D34Q=s900-c-k-c0x00ffffff-no-rj"
						alt="">
				</div>
			</div>
			<div class="col-6">
				<div class="lyric-content">					
				</div>
			</div>
		</div>
	</div>
	<!-- end Lyric box -->

	<!-- Playlist box -->
	<div class="playlist__box">
		<div class="playlist-title">
			<div class="playlist-title-content">
				Listen Special
			</div>
			<button class="default-btn show-timer-btn" onclick="showTimer()">
				<i class="las la-stopwatch audio__icon"></i>
			</button>
		</div>
		<ul class="playlist__list">

		</ul>
	</div>
	<!-- end Playlist box -->

	<!-- audio -->
	<audio id="audio" src=""></audio>
	<audio src="${pageContext.request.contextPath }\resources\user\audio\advertisement\premium_sound.mp3" id="advertisement"></audio>
	<!-- audio end-->

	<!-- timer -->
	<div class="set-timer">
		<div class="timer-layout">
			<p>Set Stop Playing Countdown</p>
			<select name="" id="timer-countdown">
				<option value="1" selected>1 minute</option>
				<option value="5">5 minutes</option>
				<option value="15">15 minutes</option>
				<option value="30">30 minutes</option>
				<option value="60">60 minutes</option>
				<option value="120">120 minutes</option>
			</select>
			<button class="btn-set-timer">Save</button>
			<button class="btn-timer-cancel">Cancel</button>
		</div>
	</div>

	<div class="timer">
		<i class="las la-stopwatch"></i>
		<span class="timer-left">05:00</span>
		<i class="las la-times-circle remove-timer large__icon"></i>
	</div>
	<!-- timer end -->

	<!-- end player -->

	<!-- main content -->
	<main class="main">
		<div class="container-fluid">
			<jsp:invoke fragment="content"></jsp:invoke>
		</div>
	
	</main>
	<!-- end main content -->

	<!-- footer -->
	<footer class="footer">
		<div class="container-fluid">

			<div class="row">
				<div class="col-12">
					<div class="footer__content">
						<div class="footer__social">
							<a href="#" target="_blank"><svg width="30" height="30" viewBox="0 0 30 30" fill="none"
									xmlns="../../../www.w3.org/2000/svg.html">
									<path
										d="M0 15C0 6.71573 6.71573 0 15 0C23.2843 0 30 6.71573 30 15C30 23.2843 23.2843 30 15 30C6.71573 30 0 23.2843 0 15Z"
										fill="#3B5998" />
									<path
										d="M16.5634 23.8197V15.6589H18.8161L19.1147 12.8466H16.5634L16.5672 11.4391C16.5672 10.7056 16.6369 10.3126 17.6904 10.3126H19.0987V7.5H16.8457C14.1394 7.5 13.1869 8.86425 13.1869 11.1585V12.8469H11.4999V15.6592H13.1869V23.8197H16.5634Z"
										fill="white" />
								</svg></a>
							<a href="#" target="_blank"><svg width="30" height="30" viewBox="0 0 30 30" fill="none"
									xmlns="../../../www.w3.org/2000/svg.html">
									<path
										d="M0 15C0 6.71573 6.71573 0 15 0C23.2843 0 30 6.71573 30 15C30 23.2843 23.2843 30 15 30C6.71573 30 0 23.2843 0 15Z"
										fill="#55ACEE" />
									<path
										d="M14.5508 12.1922L14.5822 12.7112L14.0576 12.6477C12.148 12.404 10.4798 11.5778 9.06334 10.1902L8.37085 9.50169L8.19248 10.0101C7.81477 11.1435 8.05609 12.3405 8.843 13.1455C9.26269 13.5904 9.16826 13.654 8.4443 13.3891C8.19248 13.3044 7.97215 13.2408 7.95116 13.2726C7.87772 13.3468 8.12953 14.3107 8.32888 14.692C8.60168 15.2217 9.15777 15.7407 9.76631 16.0479L10.2804 16.2915L9.67188 16.3021C9.08432 16.3021 9.06334 16.3127 9.12629 16.5351C9.33613 17.2236 10.165 17.9545 11.0883 18.2723L11.7388 18.4947L11.1723 18.8337C10.3329 19.321 9.34663 19.5964 8.36036 19.6175C7.88821 19.6281 7.5 19.6705 7.5 19.7023C7.5 19.8082 8.78005 20.4014 9.52499 20.6344C11.7598 21.3229 14.4144 21.0264 16.4079 19.8506C17.8243 19.0138 19.2408 17.3507 19.9018 15.7407C20.2585 14.8827 20.6152 13.315 20.6152 12.5629C20.6152 12.0757 20.6467 12.0121 21.2343 11.4295C21.5805 11.0906 21.9058 10.7198 21.9687 10.6139C22.0737 10.4126 22.0632 10.4126 21.5281 10.5927C20.6362 10.9105 20.5103 10.8681 20.951 10.3915C21.2762 10.0525 21.6645 9.43813 21.6645 9.25806C21.6645 9.22628 21.5071 9.27924 21.3287 9.37458C21.1398 9.4805 20.7202 9.63939 20.4054 9.73472L19.8388 9.91479L19.3247 9.56524C19.0414 9.37458 18.6427 9.16273 18.4329 9.09917C17.8978 8.95087 17.0794 8.97206 16.5967 9.14154C15.2852 9.6182 14.4563 10.8469 14.5508 12.1922Z"
										fill="white" />
								</svg></a>
							<a href="../../../www.instagram.com/volkov_des1gn/index.html" target="_blank"><svg
									width="30" height="30" viewBox="0 0 30 30" fill="none"
									xmlns="../../../www.w3.org/2000/svg.html">
									<path
										d="M0 15C0 6.71573 6.71573 0 15 0C23.2843 0 30 6.71573 30 15C30 23.2843 23.2843 30 15 30C6.71573 30 0 23.2843 0 15Z"
										fill="white"></path>
									<mask x="0" y="0" width="30" height="30">
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M0 15C0 6.71573 6.71573 0 15 0C23.2843 0 30 6.71573 30 15C30 23.2843 23.2843 30 15 30C6.71573 30 0 23.2843 0 15Z"
											fill="white"></path>
									</mask>
									<g>
										<path fill-rule="evenodd" clip-rule="evenodd"
											d="M14.9984 7C12.8279 7 12.5552 7.00949 11.7022 7.04834C10.8505 7.08734 10.2692 7.22217 9.76048 7.42001C9.23431 7.62433 8.78797 7.89767 8.3433 8.3425C7.8983 8.78717 7.62496 9.23352 7.41996 9.75952C7.22162 10.2684 7.08662 10.8499 7.04829 11.7012C7.01012 12.5546 7.00012 12.8274 7.00012 15.0001C7.00012 17.1728 7.00979 17.4446 7.04846 18.2979C7.08762 19.1496 7.22246 19.731 7.42013 20.2396C7.62463 20.7658 7.89796 21.2122 8.3428 21.6568C8.78731 22.1018 9.23365 22.3758 9.75948 22.5802C10.2685 22.778 10.85 22.9128 11.7015 22.9518C12.5548 22.9907 12.8273 23.0002 14.9999 23.0002C17.1727 23.0002 17.4446 22.9907 18.2979 22.9518C19.1496 22.9128 19.7316 22.778 20.2406 22.5802C20.7666 22.3758 21.2123 22.1018 21.6568 21.6568C22.1018 21.2122 22.3751 20.7658 22.5801 20.2398C22.7768 19.731 22.9118 19.1495 22.9518 18.2981C22.9901 17.4448 23.0001 17.1728 23.0001 15.0001C23.0001 12.8274 22.9901 12.5547 22.9518 11.7014C22.9118 10.8497 22.7768 10.2684 22.5801 9.7597C22.3751 9.23352 22.1018 8.78717 21.6568 8.3425C21.2118 7.89752 20.7668 7.62418 20.2401 7.42001C19.7301 7.22217 19.1484 7.08734 18.2967 7.04834C17.4434 7.00949 17.1717 7 14.9984 7ZM14.5903 8.44156L14.7343 8.44165L15.0009 8.44171C17.1369 8.44171 17.3901 8.44937 18.2336 8.4877C19.0136 8.52338 19.437 8.65369 19.719 8.76321C20.0923 8.9082 20.3585 9.08154 20.6383 9.36154C20.9183 9.64154 21.0916 9.9082 21.237 10.2816C21.3465 10.5632 21.477 10.9866 21.5125 11.7666C21.5508 12.6099 21.5591 12.8633 21.5591 14.9983C21.5591 17.1333 21.5508 17.3866 21.5125 18.23C21.4768 19.01 21.3465 19.4333 21.237 19.715C21.092 20.0883 20.9183 20.3542 20.6383 20.634C20.3583 20.914 20.0925 21.0873 19.719 21.2323C19.4373 21.3423 19.0136 21.4723 18.2336 21.508C17.3903 21.5463 17.1369 21.5547 15.0009 21.5547C12.8647 21.5547 12.6115 21.5463 11.7682 21.508C10.9882 21.472 10.5649 21.3417 10.2827 21.2322C9.90935 21.0872 9.64268 20.9138 9.36268 20.6338C9.08268 20.3538 8.90934 20.0878 8.76401 19.7143C8.65451 19.4326 8.52401 19.0093 8.48851 18.2293C8.45017 17.386 8.4425 17.1326 8.4425 14.9963C8.4425 12.8599 8.45017 12.6079 8.48851 11.7646C8.52417 10.9846 8.65451 10.5612 8.76401 10.2792C8.90901 9.90588 9.08268 9.63922 9.36268 9.35919C9.64268 9.07919 9.90935 8.90588 10.2827 8.76053C10.5647 8.65054 10.9882 8.52054 11.7682 8.48471C12.5062 8.45135 12.7922 8.44138 14.2832 8.4397V8.44171C14.3803 8.44156 14.4825 8.44153 14.5903 8.44156ZM18.3113 10.7296C18.3113 10.1994 18.7413 9.76987 19.2713 9.76987V9.76953C19.8013 9.76953 20.2313 10.1995 20.2313 10.7296C20.2313 11.2596 19.8013 11.6895 19.2713 11.6895C18.7413 11.6895 18.3113 11.2596 18.3113 10.7296ZM15.0011 10.8916C12.7323 10.8916 10.8928 12.7311 10.8928 15C10.8928 17.2688 12.7323 19.1075 15.0011 19.1075C17.27 19.1075 19.1088 17.2688 19.1088 15C19.1088 12.7311 17.2698 10.8916 15.0011 10.8916ZM17.6678 14.9999C17.6678 13.5271 16.4738 12.3333 15.0011 12.3333C13.5283 12.3333 12.3344 13.5271 12.3344 14.9999C12.3344 16.4726 13.5283 17.6666 15.0011 17.6666C16.4738 17.6666 17.6678 16.4726 17.6678 14.9999Z"
											fill="black"></path>
									</g>
								</svg></a>
							<a href="#" target="_blank"><svg width="30" height="30" viewBox="0 0 30 30" fill="none"
									xmlns="../../../www.w3.org/2000/svg.html">
									<path
										d="M0 15C0 6.71573 6.71573 0 15 0C23.2843 0 30 6.71573 30 15C30 23.2843 23.2843 30 15 30C6.71573 30 0 23.2843 0 15Z"
										fill="#4C6C91" />
									<path
										d="M15.7848 19.9226C15.7848 19.9226 16.0736 19.8911 16.2215 19.7351C16.3568 19.5922 16.3521 19.3226 16.3521 19.3226C16.3521 19.3226 16.3341 18.0636 16.9297 17.8777C17.5166 17.6949 18.2702 19.0952 19.07 19.6337C19.6741 20.0408 20.1327 19.9517 20.1327 19.9517L22.2699 19.9226C22.2699 19.9226 23.3874 19.855 22.8576 18.9923C22.8137 18.9216 22.5485 18.354 21.269 17.1879C19.9284 15.9673 20.1084 16.1647 21.7221 14.053C22.705 12.7672 23.0978 11.9821 22.975 11.6464C22.8584 11.3253 22.1353 11.4106 22.1353 11.4106L19.7297 11.4252C19.7297 11.4252 19.5513 11.4014 19.419 11.4789C19.2899 11.555 19.2061 11.7324 19.2061 11.7324C19.2061 11.7324 18.8258 12.7272 18.3179 13.5737C17.2466 15.3589 16.8185 15.4534 16.6433 15.3428C16.2355 15.0839 16.3373 14.3042 16.3373 13.7504C16.3373 12.0197 16.6049 11.2984 15.8169 11.1118C15.5555 11.0495 15.363 11.0088 14.6939 11.0019C13.8354 10.9935 13.1092 11.005 12.6976 11.2024C12.4237 11.3338 12.2124 11.6272 12.3415 11.6441C12.5004 11.6648 12.8604 11.7394 13.0513 11.9944C13.2978 12.3239 13.2892 13.0629 13.2892 13.0629C13.2892 13.0629 13.4308 15.1 12.9582 15.3528C12.6342 15.5264 12.1897 15.1723 11.2342 13.5522C10.7451 12.7226 10.3757 11.8054 10.3757 11.8054C10.3757 11.8054 10.3045 11.6341 10.177 11.5419C10.0228 11.4306 9.80759 11.396 9.80759 11.396L7.52173 11.4106C7.52173 11.4106 7.17818 11.4198 7.05219 11.5665C6.94029 11.6963 7.04358 11.966 7.04358 11.966C7.04358 11.966 8.8333 16.0764 10.8601 18.1481C12.7187 20.047 14.8285 19.9226 14.8285 19.9226H15.7848Z"
										fill="white" />
								</svg></a>
							<a href="#" target="_blank"><svg width="30" height="30" viewBox="0 0 30 30" fill="none"
									xmlns="../../../www.w3.org/2000/svg.html">
									<path
										d="M0 15C0 6.71573 6.71573 0 15 0C23.2843 0 30 6.71573 30 15C30 23.2843 23.2843 30 15 30C6.71573 30 0 23.2843 0 15Z"
										fill="#010101" />
									<path
										d="M13.2143 13.1245V12.4195C12.9696 12.3808 12.7224 12.3595 12.4747 12.356C10.0763 12.3509 7.95291 13.9051 7.23271 16.1928C6.51252 18.4805 7.36263 20.9708 9.33138 22.3405C7.85664 20.7622 7.44716 18.4646 8.28583 16.474C9.1245 14.4834 11.0547 13.1716 13.2143 13.1245Z"
										fill="#25F4EE" />
									<path
										d="M13.3472 21.1097C14.6881 21.1079 15.7904 20.0515 15.8491 18.7118V6.75693H18.0332C17.9886 6.50713 17.9673 6.25373 17.9696 6H14.9824V17.9433C14.9327 19.2898 13.8279 20.3564 12.4804 20.3586C12.0778 20.3552 11.6817 20.2561 11.3248 20.0697C11.794 20.7197 12.5456 21.1062 13.3472 21.1097Z"
										fill="#25F4EE" />
									<path
										d="M22.1125 10.8133V10.1489C21.3087 10.1491 20.5227 9.91193 19.8533 9.46704C20.4401 10.1493 21.2332 10.6219 22.1125 10.8133Z"
										fill="#25F4EE" />
									<path
										d="M19.8534 9.46693C19.1939 8.71597 18.8304 7.75063 18.8306 6.75122H18.0333C18.2414 7.86795 18.8996 8.84996 19.8534 9.46693Z"
										fill="#FE2C55" />
									<path
										d="M12.4747 15.343C11.324 15.3489 10.325 16.1372 10.0517 17.2551C9.77836 18.3729 10.3009 19.5333 11.3191 20.0695C10.7674 19.3078 10.6895 18.301 11.1174 17.4635C11.5453 16.626 12.4067 16.0992 13.3472 16.0999C13.598 16.103 13.8471 16.1419 14.0868 16.2155V13.1762C13.842 13.1395 13.5948 13.1202 13.3472 13.1184H13.2143V15.4296C12.9733 15.365 12.7242 15.3358 12.4747 15.343Z"
										fill="#FE2C55" />
									<path
										d="M22.1125 10.813V13.1242C20.6245 13.1214 19.1751 12.6503 17.9696 11.7779V17.8507C17.9632 20.881 15.5049 23.3341 12.4746 23.3341C11.3493 23.3361 10.251 22.9889 9.33136 22.3403C10.8662 23.991 13.2547 24.5344 15.3525 23.71C17.4504 22.8857 18.8301 20.8616 18.8306 18.6076V12.5522C20.0401 13.4189 21.4913 13.8838 22.9792 13.8812V10.9054C22.6879 10.9045 22.3975 10.8735 22.1125 10.813Z"
										fill="#FE2C55" />
									<path
										d="M17.9696 17.851V11.7782C19.1787 12.6456 20.6301 13.1105 22.1182 13.1071V10.7959C21.2391 10.6102 20.4441 10.1438 19.8532 9.46693C18.8994 8.84996 18.2413 7.86795 18.0331 6.75122H15.849V18.7119C15.8053 19.779 15.0906 20.7013 14.0682 21.01C13.0458 21.3186 11.9401 20.9459 11.3132 20.0813C10.295 19.5451 9.77243 18.3847 10.0457 17.2669C10.319 16.1491 11.3181 15.3607 12.4688 15.3548C12.7197 15.357 12.9688 15.396 13.2084 15.4704V13.1591C11.0368 13.1959 9.09197 14.5124 8.25091 16.5149C7.40985 18.5174 7.83142 20.8277 9.32553 22.4041C10.2543 23.0313 11.3541 23.3562 12.4746 23.3344C15.5049 23.3344 17.9632 20.8812 17.9696 17.851Z"
										fill="white" />
								</svg></a>
							<a href="#" target="_blank"><svg width="30" height="30" viewBox="0 0 30 30" fill="none"
									xmlns="../../../www.w3.org/2000/svg.html">
									<path
										d="M14.9999 0C6.71586 0 0 6.71569 0 14.9997C0 23.2847 6.71586 30 14.9999 30C23.2843 30 30 23.2847 30 14.9997C30 6.71569 23.2843 0 14.9999 0"
										fill="#1ED760" />
									<path
										d="M21.5494 21.3091C21.2839 21.7445 20.717 21.8809 20.2832 21.6156C16.814 19.4952 12.4472 19.0164 7.30464 20.191C6.80908 20.3046 6.31511 19.9941 6.2022 19.4987C6.08859 19.0032 6.39803 18.5092 6.89464 18.3961C12.5224 17.1097 17.3497 17.6633 21.2438 20.0428C21.678 20.308 21.8147 20.8751 21.5494 21.3091"
										fill="white" />
									<path
										d="M23.3571 17.2862C23.023 17.8283 22.3141 17.9984 21.7727 17.6655C17.8025 15.2251 11.7482 14.518 7.05106 15.9438C6.44207 16.1278 5.79867 15.7845 5.6136 15.1764C5.43013 14.5674 5.77361 13.9252 6.38173 13.74C11.7475 12.1117 18.4181 12.9003 22.9781 15.7027C23.5196 16.0361 23.69 16.7453 23.3571 17.2862"
										fill="white" />
									<path
										d="M23.5131 13.0974C18.7508 10.2692 10.8956 10.0092 6.34947 11.389C5.61927 11.6105 4.84726 11.1984 4.62621 10.4684C4.40498 9.73787 4.81656 8.96639 5.54711 8.74445C10.7659 7.16039 19.4411 7.4663 24.9235 10.7207C25.5803 11.1106 25.7956 11.9586 25.4064 12.6142C25.0169 13.2708 24.1681 13.4873 23.5131 13.0974"
										fill="white" />
								</svg></a>
							<a href="#" target="_blank"><svg width="30" height="30" viewBox="0 0 30 30" fill="none"
									xmlns="../../../www.w3.org/2000/svg.html">
									<path
										d="M0 15C0 6.71573 6.71573 0 15 0C23.2843 0 30 6.71573 30 15C30 23.2843 23.2843 30 15 30C6.71573 30 0 23.2843 0 15Z"
										fill="#FF0000" />
									<path
										d="M22.6656 11.2958C22.4816 10.5889 21.9395 10.0322 21.251 9.84333C20.0034 9.5 15 9.5 15 9.5C15 9.5 9.99664 9.5 8.74891 9.84333C8.06045 10.0322 7.51827 10.5889 7.33427 11.2958C7 12.5769 7 15.25 7 15.25C7 15.25 7 17.923 7.33427 19.2042C7.51827 19.9111 8.06045 20.4678 8.74891 20.6568C9.99664 21 15 21 15 21C15 21 20.0034 21 21.251 20.6568C21.9395 20.4678 22.4816 19.9111 22.6656 19.2042C23 17.923 23 15.25 23 15.25C23 15.25 23 12.5769 22.6656 11.2958"
										fill="white" />
									<path d="M13.5 18V13L17.5 15.5001L13.5 18Z" fill="#FF0000" />
								</svg></a>
						</div>
						<small class="footer__copyright">@ Volna, 2021. Created by <a
								href="../../../themeforest.net/user/dmitryvolkov/portfolio.html" target="_blank">Dmitry
								Volkov</a>.</small>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<div class="white__space"></div>
	<!-- end footer -->


	<!-- modal ticket -->
	<form action="#" id="modal-ticket" class="zoom-anim-dialog mfp-hide modal modal--form">
		<button class="modal__close" type="button"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
				<path
					d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z" />
			</svg></button>

		<h4 class="sign__title">To buy tickets</h4>

		<div class="sign__group sign__group--row">
			<label class="sign__label">Your balance:</label>
			<span class="sign__value">$90.99</span>
		</div>

		<div class="sign__group sign__group--row">
			<label class="sign__label" for="value">Choose ticket:</label>
			<select class="sign__select" name="value" id="value">
				<option value="50">Regular - $49</option>
				<option value="100">VIP Light - $99</option>
				<option value="200">VIP - $169</option>
			</select>

			<span class="sign__text sign__text--small">You can spend money from your account on the renewal of the
				connected packages, or on the purchase of goods on our website.</span>
		</div>

		<button class="sign__btn" type="button">Buy</button>
	</form>
	<!-- end modal ticket -->

	<!-- modal info -->
	<div id="modal-info2" class="zoom-anim-dialog mfp-hide modal modal--info">
		<span class="modal__icon modal__icon--green">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
				<path
					d="M14.72,8.79l-4.29,4.3L8.78,11.44a1,1,0,1,0-1.41,1.41l2.35,2.36a1,1,0,0,0,.71.29,1,1,0,0,0,.7-.29l5-5a1,1,0,0,0,0-1.42A1,1,0,0,0,14.72,8.79ZM12,2A10,10,0,1,0,22,12,10,10,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8,8,0,0,1,12,20Z">
				</path>
			</svg>
		</span>

		<button class="modal__close" type="button"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
				<path
					d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z" />
			</svg></button>

		<h4 class="sign__title">Payment #51 was successful!</h4>

		<div class="sign__group sign__group--row">
			<label class="sign__label">Total cost:</label>
			<span class="sign__value">$18.00</span>
		</div>

		<div class="sign__group sign__group--row">
			<label class="sign__label">Payment method: <b>Paypal</b></label>

			<span class="sign__text sign__text--small">There are many variations of passages of Lorem Ipsum available,
				but the majority have suffered alteration in some form, by injected humour, or randomised words which
				don't look even slightly believable.</span>
		</div>
	</div>
	<!-- end modal info -->

	<!-- modal info -->
	<div id="modal-info3" class="zoom-anim-dialog mfp-hide modal modal--info">
		<span class="modal__icon modal__icon--red">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
				<path
					d="M15.71,8.29a1,1,0,0,0-1.42,0L12,10.59,9.71,8.29A1,1,0,0,0,8.29,9.71L10.59,12l-2.3,2.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L13.41,12l2.3-2.29A1,1,0,0,0,15.71,8.29Zm3.36-3.36A10,10,0,1,0,4.93,19.07,10,10,0,1,0,19.07,4.93ZM17.66,17.66A8,8,0,1,1,20,12,7.95,7.95,0,0,1,17.66,17.66Z">
				</path>
			</svg>
		</span>

		<button class="modal__close" type="button"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
				<path
					d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z" />
			</svg></button>

		<h4 class="sign__title">Payment #50 failed!</h4>

		<div class="sign__group sign__group--row">
			<label class="sign__label">Total cost:</label>
			<span class="sign__value">$18.00</span>
		</div>

		<div class="sign__group sign__group--row">
			<label class="sign__label">Payment method: <b>Paypal</b></label>

			<span class="sign__text sign__text--small">There are many variations of passages of Lorem Ipsum available,
				but the majority have suffered alteration in some form, by injected humour, or randomised words which
				don't look even slightly believable.</span>
		</div>
	</div>
	<!-- end modal info -->

	<!-- modal info -->
	<div id="modal-info4" class="zoom-anim-dialog mfp-hide modal modal--info">
		<span class="modal__icon">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
				<path
					d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20Zm0-8.5a1,1,0,0,0-1,1v3a1,1,0,0,0,2,0v-3A1,1,0,0,0,12,11.5Zm0-4a1.25,1.25,0,1,0,1.25,1.25A1.25,1.25,0,0,0,12,7.5Z">
				</path>
			</svg>
		</span>

		<button class="modal__close" type="button"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
				<path
					d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z" />
			</svg></button>

		<h4 class="sign__title">Example of notification.</h4>

		<div class="sign__group sign__group--row">
			<label class="sign__label">Amount to auto-renew:</label>
			<span class="sign__value">$18.00</span>
		</div>

		<div class="sign__group sign__group--row">
			<span class="sign__text sign__text--small">There are many variations of passages of Lorem Ipsum available,
				but the majority have suffered alteration in some form, by injected humour, or randomised words which
				don't look even slightly believable.</span>
		</div>
	</div>
	<!-- end modal info -->

	<!-- modal info -->
	<div id="modal-info5" class="zoom-anim-dialog mfp-hide modal modal--info">
		<span class="modal__icon modal__icon--purple">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
				<path
					d="M18,7h-.35A3.45,3.45,0,0,0,18,5.5a3.49,3.49,0,0,0-6-2.44A3.49,3.49,0,0,0,6,5.5,3.45,3.45,0,0,0,6.35,7H6a3,3,0,0,0-3,3v2a1,1,0,0,0,1,1H5v6a3,3,0,0,0,3,3h8a3,3,0,0,0,3-3V13h1a1,1,0,0,0,1-1V10A3,3,0,0,0,18,7ZM11,20H8a1,1,0,0,1-1-1V13h4Zm0-9H5V10A1,1,0,0,1,6,9h5Zm0-4H9.5A1.5,1.5,0,1,1,11,5.5Zm2-1.5A1.5,1.5,0,1,1,14.5,7H13ZM17,19a1,1,0,0,1-1,1H13V13h4Zm2-8H13V9h5a1,1,0,0,1,1,1Z">
				</path>
			</svg>
		</span>

		<button class="modal__close" type="button"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
				<path
					d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z" />
			</svg></button>

		<h4 class="sign__title">You have received a gift!</h4>

		<div class="sign__group sign__group--row">
			<span class="sign__text sign__text--small">There are many variations of passages of Lorem Ipsum available,
				but the majority have suffered alteration in some form, by injected humour, or randomised words which
				don't look even slightly believable.</span>

			<span class="sign__text sign__text--small">There are many variations of passages of Lorem Ipsum available,
				but the majority have suffered alteration in some form, by injected humour, or randomised words which
				don't look even slightly believable.</span>
		</div>
	</div>
	<!-- end modal info -->
	 <!-- modal ticket -->
    <form action="#" id="modal-ticket" class="zoom-anim-dialog mfp-hide modal modal--form">
        <button class="modal__close" type="button"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                <path
                    d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z" />
            </svg></button>

        <h4 class="sign__title">To buy tickets</h4>

        <div class="sign__group sign__group--row">
            <label class="sign__label">Your balance:</label>
            <span class="sign__value">$90.99</span>
        </div>

        <div class="sign__group sign__group--row">
            <label class="sign__label" for="value">Choose ticket:</label>
            <select class="sign__select" name="value" id="value">
                <option value="50">Regular - $49</option>
                <option value="100">VIP Light - $99</option>
                <option value="200">VIP - $169</option>
            </select>

            <span class="sign__text sign__text--small">You can spend money from your account on the renewal of the
                connected packages, or on the purchase of goods on our website.</span>
        </div>

        <button class="sign__btn" type="button">Buy</button>
    </form>
    <!-- end modal ticket -->
    

	<!-- JS -->
	<script src="${pageContext.request.contextPath }/resources/user/js/jquery-3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/smooth-scrollbar.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/select2.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/slider-radio.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/jquery.inputmask.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/plyr.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/main.js"></script>

	<!-- My custom JS -->
	<script src="${pageContext.request.contextPath }/resources/user/css/sweetalert2/dist/sweetalert2.all.min.js"></script>
	<script defer type="module" src="${pageContext.request.contextPath }/resources/user/js/alert_custom.js"></script>
	<script src="${pageContext.request.contextPath }/resources/user/js/my_custom.js"></script>
	

	<!-- Player -->
	<script defer>

	class Song{
	    constructor(id, title, singer, path, image, duration){
	        this.elements = {}
	        this.elements.root = Song.createRoot()
	        this.elements.image = this.elements.root.querySelector('.playlist__list-item-image img')
	        this.elements.title = this.elements.root.querySelector('.playlist__song-content h3')
	        this.elements.singer = this.elements.root.querySelector('.playlist__song-content span')

	        this.elements.root.dataset.id = id
	        // this.elements.image.src = `resources/image/document.querySelector{image}`
	        this.elements.image.src = image
	        this.elements.title.textContent = title
	        this.elements.singer.textContent = singer

	    }

	    static createRoot() {
	        const range = document.createRange();

	        range.selectNode(document.body);

	        return range.createContextualFragment(`
	        <li class="playlist__list-item">
	        <div class="playlist__item-desc">
	            <div class="playlist__list-item-image">
	                <img src=""
	                alt="">
	                </div>
	                <div class="playlist__song-content">
	                    <h3></h3>
	                    <span></span>
	                    </div>
	                    </div>
	                    <button class="btn-dropdown-playlist-menu default-btn">
	                        <i class="las la-braille audio__icon"></i>
	                        <div class="dropdown__playlist-item-menu">
	                <a class="dropdown-song-link favorite-link" data-favorite="true">
	                    <i class="las la-heart"></i>
	                    <span>Favorite</span>
	                    </a>
	                    <a class="dropdown-song-link">
	                    <i class="las la-plus small__icon"></i>
	                    <span>Add to Playlist</span>
	                    </a>
	                    <a class="dropdown-song-link share-link" href="abc.com">
	                    <i class="las la-share small__icon"></i>
	                    <span>Share</span>
	                </a>
	                <a class="dropdown-song-link" href="#">
	                    <i class="las la-info-circle small__icon"></i>
	                    <span>Song Info</span>
	                    </a>
	                    </div>
	                    </button>
	                    </li>
	                    `).children[0];
	    }
	}

	const PlAYER_STORAGE_KEY = "MUSIC_APP"
	const PLAYLIST_STORAGE_KEY = "MUSIC_APP_PLAYLIST"
	const WAITING_PLAYLIST_STORAGE_KEY = "MUSIC_APP_WAITING_PLAYLIST"
	let adsStep = 5

	const player = document.querySelector('.player');
	const songName = document.querySelector('.song-content h3')
	const songArtist = document.querySelector('.song-content span')
	const cdThumb = document.querySelector('.song-image img')
	const audio = document.querySelector('#audio')
	const playBtn = document.querySelector('.btn-play-pause-audio')
	const progress = document.querySelector('.audio-progress')
	const progressBar = document.querySelector('.progressbar .bar')
	const nextBtn = document.querySelector('.btn-next-audio')
	const prevBtn = document.querySelector('.btn-prev-audio')
	const randomBtn = document.querySelector('.btn-random-song')
	const repeatBtn = document.querySelector('.btn-loop-song')
	const playlist = document.querySelector('.playlist__list')
	playlist.innerHTML = ""
	const baseDuration = document.querySelector('.base-duration')
	const trackTime = document.querySelector('.current-time')
	const lyricContent = document.querySelector('.lyric-content')
	const lyricThumbnail = document.querySelector('.lyric-thumbnail img')
	const audioVolume = document.querySelector('.audio-volume')
	const timerSelect = document.querySelector('#timer-countdown')
	const setTimerBtn = document.querySelector('.btn-set-timer')
	const cancelTimerLayout = document.querySelector('.btn-timer-cancel')
	const removeTimer = document.querySelector('.remove-timer')
	const timerLeft = document.querySelector('.timer-left')
	const timerCountDown = document.querySelector('.timer')
	const advertisement = document.querySelector('#advertisement');
	
	let songPlaylist = JSON.parse(localStorage.getItem(PLAYLIST_STORAGE_KEY)) || []

	let newSongs = [
	{
	    id: 7,
	    title: "Tu Phir Se Aana",
	    singer: "Raftaar x Salim Merchant x Karma",
	    path: "https://docs.google.com/uc?export=download&id=1BXF9GlkjfHAfM3rfP0nvKvop7K43zFh8",
	    image:
	        "https://1.bp.blogspot.com/-kX21dGUuTdM/X85ij1SBeEI/AAAAAAAAKK4/feboCtDKkls19cZw3glZWRdJ6J8alCm-gCNcBGAsYHQ/s16000/Tu%2BAana%2BPhir%2BSe%2BRap%2BSong%2BLyrics%2BBy%2BRaftaar.jpg",
	    duration: 246
	},
	{
	    id: 40,
	    title: "Ibiza",
	    singer: "MBB",
	    path: "https://docs.google.com/uc?export=download&id=10wjlQf92ph-EAma7TFqmcIlIegCDNI9G",
	    image:
	        "https://www.stockbiz.vn/Handlers/GetThumbnail.axd?i=202003270834059375000&w=220",
	    duration: 246
	},
	{
	    id: 25,
	    title: "For You",
	    singer: "Why Don't We",
	    path: "https://docs.google.com/uc?export=download&id=19Lh7YjzCBrGlNVAADVkiEXwHLzpY2K8b",
	    image:
	        "https://avatar-ex-swe.nixcdn.com/song/2020/08/06/6/0/8/0/1596669230164_640.jpg",
	    duration: 246
	}
	]

	let waitingPlaylist = [
	{
	    id: 40,
	    title: "Ibiza",
	    singer: "MBB",
	    path: "https://docs.google.com/uc?export=download&id=10wjlQf92ph-EAma7TFqmcIlIegCDNI9G",
	    image:
	        "https://www.stockbiz.vn/Handlers/GetThumbnail.axd?i=202003270834059375000&w=220",
	    duration: 246
	},
	{
	    id: 25,
	    title: "For You",
	    singer: "Why Don't We",
	    path: "https://docs.google.com/uc?export=download&id=19Lh7YjzCBrGlNVAADVkiEXwHLzpY2K8b",
	    image:
	        "https://avatar-ex-swe.nixcdn.com/song/2020/08/06/6/0/8/0/1596669230164_640.jpg",
	    duration: 246
	},
	{
	    id: 8,
	    title: "Tu Phir Se Aana",
	    singer: "Raftaar x Salim Merchant x Karma",
	    path: "https://docs.google.com/uc?export=download&id=1BXF9GlkjfHAfM3rfP0nvKvop7K43zFh8",
	    image:
	        "https://1.bp.blogspot.com/-kX21dGUuTdM/X85ij1SBeEI/AAAAAAAAKK4/feboCtDKkls19cZw3glZWRdJ6J8alCm-gCNcBGAsYHQ/s16000/Tu%2BAana%2BPhir%2BSe%2BRap%2BSong%2BLyrics%2BBy%2BRaftaar.jpg",
	    duration: 246
	},
	{
	    id: 9,
	    title: "Tu Phir Se Aana",
	    singer: "Raftaar x Salim Merchant x Karma",
	    path: "https://docs.google.com/uc?export=download&id=1BXF9GlkjfHAfM3rfP0nvKvop7K43zFh8",
	    image:
	        "https://1.bp.blogspot.com/-kX21dGUuTdM/X85ij1SBeEI/AAAAAAAAKK4/feboCtDKkls19cZw3glZWRdJ6J8alCm-gCNcBGAsYHQ/s16000/Tu%2BAana%2BPhir%2BSe%2BRap%2BSong%2BLyrics%2BBy%2BRaftaar.jpg",
	    duration: 246
	},
	{
	    id: 3,
	    duration: 130,
	    image: "https://a10.gaanacdn.com/gn_img/albums/YoEWlabzXB/oEWlj5gYKz/size_xxl_1586752323.webp",
	    title: "Feeling You",
	    path: "https://docs.google.com/uc?export=download&id=1kC4OK-CMPKfHUbRgB1uRkqX6YBYpaCyd",
	    singer: "Raftaar x Harjas"
	},
	{
	    id: 4,
	    duration: 130,
	    image: "https://a10.gaanacdn.com/gn_img/albums/YoEWlabzXB/oEWlj5gYKz/size_xxl_1586752323.webp",
	    title: "Sax",
	    path: "https://docs.google.com/uc?export=download&id=16ELzmbgvkTcU0L8GUngXL8MYcpjYq7oD",
	    singer: "Raftaar x Harjas"
	},
	{
	    id: 2,
	    duration: 130,
	    image: "https://a10.gaanacdn.com/gn_img/albums/YoEWlabzXB/oEWlj5gYKz/size_xxl_1586752323.webp",
	    title: "Smell Like Summer",
	    path: "https://docs.google.com/uc?export=download&id=1CEQDcny85bzP8Xvonukm9BMQF0hPsw35",
	    singer: "Raftaar x Harjas"
	},
	{
	    id: 1,
	    duration: 130,
	    image: "https://a10.gaanacdn.com/gn_img/albums/YoEWlabzXB/oEWlj5gYKz/size_xxl_1586752323.webp",
	    title: "Steam Like Gone",
	    path: "https://docs.google.com/uc?export=download&id=1CXF1XCQeiLuGvC515vFkKHtYT2JrreQm",
	    singer: "Raftaar x Harjas"
	}
	]

	let isPremium = false;

	const app = {
	oldIndex: 0,
	currentIndex: 0,
	currentSong: {},
	volume: .5, // [0;1]
	isPlaying: false,
	isRepeat: false,
	isRandom: false,
	isAdvertisement: false,
	startTime: 0,
	amount: 0,
	isCountdown: false,
	secondsTimerLeft: 0,
	timer: setInterval(() => { }, 1000),
	config: JSON.parse(localStorage.getItem(PlAYER_STORAGE_KEY)) || {},
	songs: JSON.parse(localStorage.getItem(PLAYLIST_STORAGE_KEY)) || [],
	setConfig: function (key, value) {
	    this.config[key] = value
	    localStorage.setItem(PlAYER_STORAGE_KEY, JSON.stringify(this.config))
	},
	renderFirstTime: function () {
	    songPlaylist.forEach(song => {
	        const songEl = new Song(song.id, song.title, song.singer, song.path, song.image, song.duration)
	        playlist.appendChild(songEl.elements.root)
	    })
	},
	defineProperties: function () {
	    Object.defineProperty(this, "currentSong", {
	        get: function () {
	            this.setConfig('currentIndex', this.currentIndex)
	            this.setConfig('currentSong', songPlaylist[this.currentIndex])
	            return songPlaylist[this.currentIndex]
	        }
	    });
	},
	handleEvents: function () {
	    const _this = this;

	    playBtn.onclick = () => {
	        _this.setConfig('isPlaying', !_this.isPlaying)
	        if (!_this.isAdvertisement) {
	            if (_this.isPlaying) {
	                audio.pause()
	            } else {
	                audio.play()
	            }
	        } else {
	            _this.runAdvertisement()
	        }
	    }

	    audio.onplay = () => {
	        _this.isPlaying = true
	        player.classList.add('playing')
	    }

	    audio.onpause = () => {
	        _this.isPlaying = false
	        player.classList.remove('playing')
	    }

	    audio.ontimeupdate = () => {
	        if (audio.duration) {
	            _this.startTime = audio.currentTime
	            _this.setConfig('startTime', _this.startTime)
	            const progressPercent = Math.floor(audio.currentTime / audio.duration * 100 * 100) / 100
	            progress.value = progressPercent
	            progressBar.style.width = progressPercent + '%';
	            trackTime.innerHTML = _this.audioCalTime(audio.currentTime)
	        }
	    }

	    progress.oninput = (e) => {
	        const seekTime = Math.floor(audio.duration / 100 * e.target.value * 100) / 100
	        audio.currentTime = seekTime
	        progressBar.style.width = e.target.value + '%';
	    }

	    nextBtn.onclick = () => {
	        if (_this.isRandom) {
	            _this.playRandomSong()
	        } else {
	            _this.nextSong()
	        }
	        if (!_this.isAdvertisement) {
	            audio.currentTime = 0
	            audio.play()
	        }
	        // _this.renderFirstTime()
	    }

	    prevBtn.onclick = () => {
	        if (_this.isRandom) {
	            _this.playRandomSong()
	        } else {
	            _this.prevSong()
	        }
	        if (!_this.isAdvertisement) {
	            audio.currentTime = 0
	            audio.play()
	        }
	        // _this.renderFirstTime()
	    }

	    randomBtn.onclick = () => {
	        _this.isRandom = !_this.isRandom
	        _this.setConfig('isRandom', _this.isRandom)
	        randomBtn.classList.toggle('active', _this.isRandom)
	    }

	    repeatBtn.onclick = () => {
	        _this.isRepeat = !_this.isRepeat
	        _this.setConfig('isRepeat', _this.isRepeat)
	        repeatBtn.classList.toggle('active', _this.isRepeat)
	    }

	    audio.onended = () => {
	        if (_this.isRepeat) {
	            audio.play()
	        } else {
	            if (!_this.isRandom && _this.currentIndex === (songPlaylist.length - 1)) {
	                addSongs(waitingPlaylist[0])
	                playSong(waitingPlaylist[0].id)
	            } else {
	                nextBtn.click()
	            }
	        }
	    }

	    advertisement.onended = () => {
	        _this.isAdvertisement = false
	        _this.setConfig('isAdvertisement', _this.isAdvertisement)
	        _this.loadSongWithoutAds()
	    }

	    playlist.onclick = (e) => {
	        const songNode = e.target.closest('.playlist__list-item');
	        if (songNode && !e.target.closest('.btn-dropdown-playlist-menu')) {
	            // if (songNode) {
	            // console.log('songnode')
	            // audio.src = songNode.dataset.filename
	            const id = Number(songNode.dataset.id)
	            const currentSong = songPlaylist.find(song => song.id === id)
	            _this.currentIndex = songPlaylist.indexOf(currentSong)
	            // _this.currentIndex = Number(songNode.dataset.id)
	            _this.loadCurrentSong()
	            // _this.renderFirstTime()
	            // }

	            if (e.target.closest('.btn-dropdown-playlist-menu')) {

	            }
	        }
	    }

	    audioVolume.oninput = (e) => {
	        const volume = e.target.value / 100
	        audio.volume = volume
	        _this.setConfig('volume', volume)
	    }

	    setTimerBtn.onclick = () => {
	        clearInterval(_this.timer)
	        _this.secondsTimerLeft = timerSelect.value * 60;
	        _this.countDownTimer()
	        _this.closeTimer()
	    }

	    cancelTimerLayout.onclick = () => {
	        _this.closeTimer()
	    }

	    removeTimer.onclick = () => {
	        _this.removeCountDown()
	    }
	},
	audioCalTime: function (time) {
	    const duration = Number.parseInt(time)
	    if (duration < 3600) {
	        return new Date(duration * 1000).toISOString().substr(14, 5)
	    } else {
	        return new Date(duration * 1000).toISOString().substr(11, 8)
	    }
	},
	countDownTimer: function () {
	    timerLeft.innerHTML = this.audioCalTime(this.secondsTimerLeft)
	    this.setCountdownToStorage(true)
	    timerCountDown.classList.add('show')
	    this.timer = setInterval(() => {
	        this.secondsTimerLeft--
	        this.setConfig('secondsTimerLeft', this.secondsTimerLeft)
	        timerLeft.innerHTML = this.audioCalTime(this.secondsTimerLeft)
	        if (this.secondsTimerLeft == 0) {
	            this.removeCountDown()
	            this.setCountdownToStorage(false)
	            audio.pause()
	            this.setConfig('isPlaying', false)
	            this.playAlarmTimer()
	        }
	    }, 1000)
	},
	setCountdownToStorage: function (status) {
	    this.isCountdown = status;
	    this.setConfig('isCountdown', this.isCountdown)
	},
	playAlarmTimer: function () {

	},
	closeTimer: function () {
	    document.querySelector('.set-timer').classList.remove('show')
	},
	removeCountDown: function () {
	    this.secondsTimerLeft = 0
	    this.setConfig('secondsTimerLeft', this.secondsTimerLeft)
	    clearInterval(this.timer)
	    timerCountDown.classList.remove('show')
	},
	loadCurrentSong: function () {
	    this.activeSong()

	    if (this.amount % adsStep === 0 && this.amount !== 0) {
	        this.isAdvertisement = true
	        this.setConfig('isAdvertisement', this.isAdvertisement)
	    }
	    if (this.isAdvertisement) {
	        this.runAdvertisement()
	    } else {
	        this.amount++
	        this.setConfig('amount', this.amount)
	        audio.src = this.currentSong.path
	        cdThumb.src = this.currentSong.image
	        songName.textContent = this.currentSong.title;
	        songArtist.textContent = this.currentSong.singer
	        baseDuration.innerHTML = this.audioCalTime(this.currentSong.duration)
	        if (this.isPlaying) {
	            audio.load()
	            audio.autoplay = true
	        }
	        this.renderLyrics()
	        lyricThumbnail.src = this.currentSong.image
	    }
	},
	loadSongWithoutAds: function () {
	    this.activeSong()

	    this.amount++
	    this.setConfig('amount', this.amount)
	    audio.src = this.currentSong.path
	    cdThumb.src = this.currentSong.image
	    songName.textContent = this.currentSong.title;
	    songArtist.textContent = this.currentSong.singer
	    baseDuration.innerHTML = this.audioCalTime(this.currentSong.duration)
	    audio.play()
	    this.renderLyrics()
	    lyricThumbnail.src = this.currentSong.image
	},
	activeSong: function () {
	    const oldSong = document.querySelector('.playlist__list-item.active')
	    if (oldSong) {
	        oldSong.classList.remove('active')
	    }
	    const songActive = document.querySelector(".playlist__list-item[data-id='"+this.currentSong.id+"']")
	    if (songActive) {
	        songActive.classList.add('active')
	    }
	},
	runAdvertisement: function () {
	    audio.autoplay = false
	    audio.pause()
	    advertisement.load()
	    advertisement.autoplay = true
	},
	renderLyrics: function () {
	    let htmls = this.currentSong.lyrics.map(line => "<p>"+line+"</p>")

	    lyricContent.innerHTML = htmls.join('')
	},
	loadConfig: function () {
	    this.currentIndex = this.config.currentIndex || 0
	    this.currentSong = this.config.currentSong || songPlaylist[this.currentIndex] || {}

	    this.volume = this.config.volume || .5
	    audioVolume.value = this.volume * 100
	    audio.volume = this.volume

	    this.startTime = this.config.startTime || 0
	    if (this.startTime != 0) {
	        audio.currentTime = this.startTime
	    }
	    if (songPlaylist.length > 0) {
	        this.loadCurrentSong()
	    }

	    this.isPlaying = this.config.isPlaying || false
	    if (this.isPlaying) {
	        audio.autoplay = true
	    }

	    this.amount = this.config.amount || 0
	    this.isAdvertisement = this.config.isAdvertisement || false
	    this.isRandom = this.config.isRandom || false
	    this.isRepeat = this.config.isRepeat || false
	    this.isCountdown = this.config.isCountdown || false
	    this.secondsTimerLeft = this.config.secondsTimerLeft || 0
	    if (this.secondsTimerLeft != 0 && this.isCountdown) {
	        this.countDownTimer()
	    }
	    this.amount = this.config.amount || 0

	},
	nextSong: function () {
	    this.currentIndex++
	    if (this.currentIndex >= songPlaylist.length) {
	        this.currentIndex = 0
	    }
	    this.loadCurrentSong()
	},
	prevSong: function () {
	    this.currentIndex--
	    if (this.currentIndex < 0) {
	        this.currentIndex = songPlaylist.length - 1
	    }
	    this.loadCurrentSong()
	},
	playRandomSong: function () {
	    let newIndex
	    do {
	        newIndex = Math.floor(Math.random() * songPlaylist.length)
	    } while (newIndex === this.currentIndex);

	    this.currentIndex = newIndex
	    this.loadCurrentSong()
	},
	addNewSong: function (songs) {
	    if (songs.isArray()) {

	    } else {
	        if (songPlaylist.indexOf(newSong) === -1) {
	            songPlaylist.push(newSong)
	            this.updatePlaylist(songPlaylist)
	        }
	    }

	},
	findSong: function (id) {
	    return songPlaylist.find(song => song.id === id) || null
	},
	deleteSong: function (songId) {
	    const song = this.findSong(songId)
	    if (song) {
	        songPlaylist.splice(songs.indexOf(song), 1)
	    }
	},
	getPlaylist: function () {

	},
	updatePlaylist: function (playlist) {
	    localStorage.setItem(PLAYLIST_STORAGE_KEY, JSON.stringify(playlist))
	},
	start: function () {
	    //RenderFirstTime playlist
	    this.renderFirstTime()

	    this.loadConfig()

	    this.defineProperties()

	    this.handleEvents()

	    // this.loadCurrentSong()

	    // this.updatePlaylist(songPlaylist)

	    randomBtn.classList.toggle('active', this.isRandom)
	    repeatBtn.classList.toggle('active', this.isRepeat)
	}
	}

	const appPremium = {
	oldIndex: 0,
	currentIndex: 0,
	currentSong: {},
	volume: .5, // [0;1]
	isPlaying: false,
	isRepeat: false,
	isRandom: false,
	startTime: 0,
	isCountdown: false,
	secondsTimerLeft: 0,
	timer: setInterval(() => { }, 1000),
	config: JSON.parse(localStorage.getItem(PlAYER_STORAGE_KEY)) || {},
	songs: JSON.parse(localStorage.getItem(PLAYLIST_STORAGE_KEY)) || [],
	setConfig: function (key, value) {
	    this.config[key] = value
	    localStorage.setItem(PlAYER_STORAGE_KEY, JSON.stringify(this.config))
	},
	renderFirstTime: function () {
	    songPlaylist.forEach(song => {
	        const songEl = new Song(song.id, song.title, song.singer, song.path, song.image, song.duration)
	        playlist.appendChild(songEl.elements.root)
	    })
	    console.log('renderFirstTimeed')
	},
	defineProperties: function () {
	    Object.defineProperty(this, "currentSong", {
	        get: function () {
	            this.setConfig('currentIndex', this.currentIndex)
	            this.setConfig('currentSong', songPlaylist[this.currentIndex])
	            return songPlaylist[this.currentIndex]
	        }
	    });
	},
	handleEvents: function () {
	    const _this = this;

	    playBtn.onclick = () => {
	        _this.setConfig('isPlaying', !_this.isPlaying)
	        if (_this.isPlaying) {
	            audio.pause()
	        } else {
	            audio.play()
	        }
	    }

	    audio.onplay = () => {
	        _this.isPlaying = true
	        player.classList.add('playing')
	    }

	    audio.onpause = () => {
	        _this.isPlaying = false
	        player.classList.remove('playing')
	    }

	    audio.ontimeupdate = () => {
	        if (audio.duration) {
	            _this.startTime = audio.currentTime
	            _this.setConfig('startTime', _this.startTime)
	            const progressPercent = Math.floor(audio.currentTime / audio.duration * 100 * 100) / 100
	            progress.value = progressPercent
	            progressBar.style.width = progressPercent + '%';
	            trackTime.innerHTML = _this.audioCalTime(audio.currentTime)
	        }
	    }

	    progress.oninput = (e) => {
	        const seekTime = Math.floor(audio.duration / 100 * e.target.value * 100) / 100
	        audio.currentTime = seekTime
	        progressBar.style.width = e.target.value + '%';
	    }

	    nextBtn.onclick = () => {
	        if (_this.isRandom) {
	            _this.playRandomSong()
	        } else {
	            _this.nextSong()
	        }
	        audio.play()
	    }

	    prevBtn.onclick = () => {
	        if (_this.isRandom) {
	            _this.playRandomSong()
	        } else {
	            _this.prevSong()
	        }
	        audio.play()
	    }

	    randomBtn.onclick = () => {
	        _this.isRandom = !_this.isRandom
	        _this.setConfig('isRandom', _this.isRandom)
	        randomBtn.classList.toggle('active', _this.isRandom)
	    }

	    repeatBtn.onclick = () => {
	        _this.isRepeat = !_this.isRepeat
	        _this.setConfig('isRepeat', _this.isRepeat)
	        repeatBtn.classList.toggle('active', _this.isRepeat)
	    }

	    audio.onended = () => {
	        if (_this.isRepeat) {
	            audio.play()
	        } else {
	            if (!_this.isRandom && _this.currentIndex === (songPlaylist.length - 1)) {
	                addSongs(waitingPlaylist[0])
	                playSong(waitingPlaylist[0].id)
	            } else {
	                nextBtn.click()
	            }
	        }
	    }

	    playlist.onclick = (e) => {
	        const songNode = e.target.closest('.playlist__list-item');
	        if (songNode && !e.target.closest('.btn-dropdown-playlist-menu')) {
	            // if (songNode) {
	            // console.log('songnode')
	            // audio.src = songNode.dataset.filename
	            const id = Number(songNode.dataset.id)
	            const currentSong = songPlaylist.find(song => song.id === id)
	            _this.currentIndex = songPlaylist.indexOf(currentSong)
	            // _this.currentIndex = Number(songNode.dataset.id)
	            _this.loadCurrentSong()
	            // }

	            if (e.target.closest('.btn-dropdown-playlist-menu')) {

	            }
	        }
	    }

	    audioVolume.oninput = (e) => {
	        const volume = e.target.value / 100
	        audio.volume = volume
	        _this.setConfig('volume', volume)
	    }

	    setTimerBtn.onclick = () => {
	        clearInterval(_this.timer)
	        _this.secondsTimerLeft = timerSelect.value * 60;
	        _this.countDownTimer()
	        _this.closeTimer()
	    }

	    cancelTimerLayout.onclick = () => {
	        _this.closeTimer()
	    }

	    removeTimer.onclick = () => {
	        _this.removeCountDown()
	    }
	},
	audioCalTime: function (time) {
	    const duration = Number.parseInt(time)
	    if (duration < 3600) {
	        return new Date(duration * 1000).toISOString().substr(14, 5)
	    } else {
	        return new Date(duration * 1000).toISOString().substr(11, 8)
	    }
	},
	countDownTimer: function () {
	    timerLeft.innerHTML = this.audioCalTime(this.secondsTimerLeft)
	    this.setCountdownToStorage(true)
	    timerCountDown.classList.add('show')
	    this.timer = setInterval(() => {
	        this.secondsTimerLeft--
	        this.setConfig('secondsTimerLeft', this.secondsTimerLeft)
	        timerLeft.innerHTML = this.audioCalTime(this.secondsTimerLeft)
	        if (this.secondsTimerLeft == 0) {
	            this.removeCountDown()
	            this.setCountdownToStorage(false)
	            audio.pause()
	            this.setConfig('isPlaying', false)
	            this.playAlarmTimer()
	        }
	    }, 1000)
	},
	setCountdownToStorage: function (status) {
	    this.isCountdown = status;
	    this.setConfig('isCountdown', this.isCountdown)
	},
	playAlarmTimer: function () {

	},
	closeTimer: function () {
	    document.querySelector('.set-timer').classList.remove('show')
	},
	removeCountDown: function () {
	    this.secondsTimerLeft = 0
	    this.setConfig('secondsTimerLeft', this.secondsTimerLeft)
	    clearInterval(this.timer)
	    timerCountDown.classList.remove('show')
	},
	loadCurrentSong: function () {
	    this.activeSong()

	    audio.src = this.currentSong.path
	    cdThumb.src = this.currentSong.image
	    songName.textContent = this.currentSong.title;
	    songArtist.textContent = this.currentSong.singer
	    baseDuration.innerHTML = this.audioCalTime(this.currentSong.duration)
	    if (this.isPlaying) {
	        audio.load()
	        audio.autoplay = true
	    }
	    this.renderLyrics()
	    lyricThumbnail.src = this.currentSong.image
	},
	activeSong: function () {
	    const oldSong = document.querySelector('.playlist__list-item.active')
	    if (oldSong) {
	        oldSong.classList.remove('active')
	    }
	    const songActive = document.querySelector(".playlist__list-item[data-id='"+this.currentSong.id+"']")
	    if (songActive) {
	        songActive.classList.add('active')
	    }
	},
	renderLyrics: function () {
		if(this.currentSong.lyrics){
		    let htmls = this.currentSong.lyrics.map(line => "<p>"+line+"</p>")

		    lyricContent.innerHTML = htmls.join('')
		}
	},
	loadConfig: function () {
	    this.currentIndex = this.config.currentIndex || 0
	    this.currentSong = this.config.currentSong || songPlaylist[this.currentIndex] || {}

	    this.volume = this.config.volume || .5
	    audioVolume.value = this.volume * 100
	    audio.volume = this.volume

	    this.startTime = this.config.startTime || 0
	    if (this.startTime != 0) {
	        audio.currentTime = this.startTime
	    }
	    if (songPlaylist.length > 0) {
	        this.loadCurrentSong()
	    }

	    this.isPlaying = this.config.isPlaying || false
	    if (this.isPlaying) {
	        audio.autoplay = true
	    }

	    this.isRandom = this.config.isRandom || false
	    this.isRepeat = this.config.isRepeat || false
	    this.isCountdown = this.config.isCountdown || false
	    this.secondsTimerLeft = this.config.secondsTimerLeft || 0
	    if (this.secondsTimerLeft != 0 && this.isCountdown) {
	        this.countDownTimer()
	    }

	},
	nextSong: function () {
	    this.currentIndex++
	    if (this.currentIndex >= songPlaylist.length) {
	        this.currentIndex = 0
	    }
	    this.loadCurrentSong()
	},
	prevSong: function () {
	    this.currentIndex--
	    if (this.currentIndex < 0) {
	        this.currentIndex = songPlaylist.length - 1
	    }
	    this.loadCurrentSong()
	},
	playRandomSong: function () {
	    let newIndex
	    do {
	        newIndex = Math.floor(Math.random() * songPlaylist.length)
	    } while (newIndex === this.currentIndex);

	    this.currentIndex = newIndex
	    this.loadCurrentSong()
	},
	addNewSong: function (songs) {
	    if (songs.isArray()) {

	    } else {
	        if (songPlaylist.indexOf(newSong) === -1) {
	            songPlaylist.push(newSong)
	            this.updatePlaylist(songPlaylist)
	        }
	    }

	},
	findSong: function (id) {
	    return songPlaylist.find(song => song.id === id) || null
	},
	deleteSong: function (songId) {
	    const song = this.findSong(songId)
	    if (song) {
	        songPlaylist.splice(songs.indexOf(song), 1)
	    }
	},
	getPlaylist: function () {

	},
	updatePlaylist: function (playlist) {
	    localStorage.setItem(PLAYLIST_STORAGE_KEY, JSON.stringify(playlist))
	},
	start: function () {
	    this.renderFirstTime()

	    this.loadConfig()

	    this.defineProperties()

	    this.handleEvents()

	    // this.loadCurrentSong()

	    // this.updatePlaylist(songPlaylist)

	    randomBtn.classList.toggle('active', this.isRandom)
	    repeatBtn.classList.toggle('active', this.isRepeat)
	}
	}

	if (isPremium) {
	appPremium.start()
	} else {
	app.start()
	}
	function renderSong(data) {
	const song = new Song(data.id, data.title, data.singer, data.path, data.image, data.duration)
	playlist.appendChild(song.elements.root)
	}

	function updatePlaylist(localKey, data) {
	localStorage.setItem(localKey, JSON.stringify(data))
	}

	function findSong(songId) {
	return songPlaylist.find(song => song.id === songId) || null
	}

	function removePlaylist() {
	songPlaylist = []
	updatePlaylist(PLAYLIST_STORAGE_KEY, songPlaylist)
	}

	function replaceNewPlaylist(playlist) {
	removePlaylist()
	document.querySelector('.playlist__list').innerHTML = ""
	addSongs(playlist)
	playSong(playlist[0].id)
	}

	function addSongToWaiting(song) {
	waitingPlaylist[0] = song
	updatePlaylist(WAITING_PLAYLIST_STORAGE_KEY, waitingPlaylist)
	}

	function addSongs(songs) {
	if (Array.isArray(songs)) {
	    songs.forEach(song => {
	        checkSongRender(song)
	    })
	} else {
	    checkSongRender(songs)
	}
	}

	function checkSongRender(song) {
	const newSong = findSong(song.id);
	if (!newSong) {
	    songPlaylist.push(song)
	    renderSong(song)
	    updatePlaylist(PLAYLIST_STORAGE_KEY, songPlaylist)
	}
	}

	function deleteSong(songId) {
	const song = findSong(songId)
	if (song) {
	    const htmlEl = playlist.querySelector(".playlist__list-item[data-id='"+ songId+"']")
	    if (htmlEl) {
	        htmlEl.remove()
	    }
	    playlist.splice(songs.indexOf(song), 1)
	    updatePlaylist(songPlaylist)
	    const songActive = playlist.querySelector('.playlist__list-item.active')
	    if (songActive) {
	        const currentSong = findSong(songActive.dataset.id)
	        if (currentSong) app.currentIndex = songPlaylist.indexOf(currentSong)
	    }
	}
	}

	function playSong(songId) {
	const currentSong = findSong(songId)
	if (isPremium) {
	    appPremium.currentIndex = songPlaylist.indexOf(currentSong)

	    appPremium.loadCurrentSong()
	} else {
	    app.currentIndex = songPlaylist.indexOf(currentSong)

	    app.loadCurrentSong()
	}
	}

	// Save waiting songs
	// updatePlaylist(WAITING_PLAYLIST_STORAGE_KEY, waitingPlaylist)

	// addSongs(waitingPlaylist)

	// TESTING

	// const playAudioBtn = document.querySelector('.play-audio-btn')
	// if(playAudioBtn){
//		     playAudioBtn.addEventListener('click', ()=>{
//		         const currentSong = songPlaylist.find(song => song.id === 3)
//		         app.currentIndex = songPlaylist.indexOf(currentSong)
//		         app.loadCurrentSong()
//		     })
	// }

	// replaceNewPlaylist(waitingPlaylist)

		
		//==== Click functions: Track - Album ====

 function getTrackById(e){
		var trackId = $(e).data("id");
        $.ajax({
            type: 'GET',
            data: {
                trackId: trackId
            },
            url: '${pageContext.request.contextPath }/home/getTrackById',
            success: function (track) {
                if (track) {
                    console.log(track)
                    var singer = ""
                    if(track.artist){
                    	singer = track.artist.map(artist => artist.nickname + " - ")
                        }
                    var playTrack = {
							id: track.id,
							title:track.title,
							image: '${pageContext.request.contextPath }/resources/user/img/tracks/' + track.thumbnail,
							path: '${pageContext.request.contextPath }/resources/user/audio/tracks/' + track.fileName,
							duration: track.duration,
							singer: singer,
							lyrics: track.lyrics
                        }
                    addSongs(playTrack)
                    playSong(playTrack.id)
                    var lyrics = renderLyrics(track.lyrics)
	                            var songTitle = "<p>Song: " + track.title + " - " + singer + "</p>"
	                            $(".lyric-content").html(songTitle + lyrics)
                }
            }
        })
}

	function getWaitingTrack(track){
		$.ajax({
            type: 'GET',
            data: {
                trackId: track.id,
                genresId: track.genresId
            },
            url: '${pageContext.request.contextPath }/home/getWaitingTrack',
            success: function (waitingTrack) {
                console.log("waiting track:" + waitingTrack.title)
                addSongToWaiting(waitingTrack)
            }
        })
	}

	function getListTrackByAlbumId(e){
		var albumId = $(e).data("id");
		$.ajax({
            type: 'GET',
            data: {
            	albumId: albumId
            },
            url: '${pageContext.request.contextPath }/home/getAlbumWithTracksById',
            success: function (album) {
                if(album){
                    addSongs(album.trackInfos)
                }
            }
        })
		
	}
	</script>
	
	<!-- Main Search -->
	<script defer>
	
		/* Set select2 */
		$('.js-example-basic-multiple').select2();

	    $('.input-search').keyup(function () {
	        var keyword = $('.input-search').val();

	        /* Top Artist */
	        $.ajax({
	            type: 'GET',
	            data: {
	                keyword: keyword
	            },
	            url: '${pageContext.request.contextPath}/home/searchTopArtist',
	            success: function (artists) {
	            	if(artists.length < 6){
						$("#artist-result-all").addClass("hide")
			            }else{
			            	$("#artist-result-all").removeClass("hide")    
				            }
	                var htmls = "";
	                for (var i = 0; i < artists.length; i++) {

	                    htmls += "<a href='${pageContext.request.contextPath}/artist/" + artists[i].id + "' class='artist-box'><div class='artist-image-box'>" +
	                        "<img src='${pageContext.request.contextPath}/resources/user/img/artists/" + artists[i].image + "'></div>" +
	                        "<p class='artist-name'>" + artists[i].nickname + "</p></a>"
	                }
	                $("#artist-container").html(htmls);
	            }
	        })

	        /* Top Track */
	        $.ajax({
	            type: 'GET',
	            data: {
	                keyword: keyword
	            },
	            url: '${pageContext.request.contextPath}/home/searchTopTrack',
	            success: function (tracks) {
		             console.log(tracks)
	            	if(tracks.length < 6){
						$("#track-result-all").addClass("hide")
			            }else{
			            	$("#track-result-all").removeClass("hide")    
				            }
	                var htmls = "";
               for (var i = 0; i < tracks.length; i++) {
	                    htmls += "<div class='track-box' data-id='" + tracks[i].id + "' onclick='getTrackById(this)'><div class='track-box-image'>" +

	                        "<img src='${pageContext.request.contextPath}/resources/user/img/tracks/" + tracks[i].thumbnail + "' /></div>" +
	                        "<div class='track-box-content'><p>" + tracks[i].title + "</p><span>"+ "aritst" + "</span></div></div>"
	                }
	                $("#track-container").html(htmls);
	            }
	        })

	        /* Top Album */
	        $.ajax({
	            type: 'GET',
	            data: {
	                keyword: keyword
	            },
	            url: '${pageContext.request.contextPath }/home/searchTopAlbum',
	            success: function (albums) {
		            if(albums.length < 6){
						$("#album-result-all").addClass("hide")
			            }else{
			            	$("#album-result-all").removeClass("hide")    
				            }
	                var htmls = "";
	                for (var i = 0; i < albums.length; i++) {
	                    htmls += "<div href='${pageContext.request.contextPath}/album/" + albums[i].id + "' class='album-box' data-id='" + albums[i].id + "' onclick='getListTrackByAlbumId(this)'><div class='album-box-image'>" +

	                        "<img src='${pageContext.request.contextPath}/resources/user/img/playlist/" + albums[i].thumbnail + "'/></div>" +
	                        "<div class='album-box-content'><p>" + albums[i].title + "</p><a href='${pageContext.request.contextPath}/artist/" + albums[i].artistId + "'>" + albums[i].artistNickName + "</a></div></div>"
	                }
	                $("#album-container").html(htmls);
	            }
	        })
	    })

	    /* Show All Artist */
	    $("#artist-result-all").click(function () {
	        var keyword = $('.input-search').val();
			var url = '${pageContext.request.contextPath }/track?keyword='+ keyword + '&' + 'type=artist'
	        window.location.replace(url);
	    })

	    /* Show All Track */
	    $("#track-result-all").click(function () {
	        var keyword = $('.input-search').val();
			var url = '${pageContext.request.contextPath }/track?keyword='+ keyword + '&' + 'type=track'
	        window.location.replace(url);
	    })

	    /* Show All Album */
	    $("#album-result-all").click(function () {
	        var keyword = $('.input-search').val();
			var url = '${pageContext.request.contextPath }/track?keyword='+ keyword + '&' + 'type=album'
	        window.location.replace(url);
	    })
	    /* Button get track by id */
	    $(".btn-track-id").click(function () {
	        var trackId = $(".btn-track-id").data("id");
	        $.ajax({
	            type: 'GET',
	            data: {
	                trackId: trackId
	            },
	            url: '${pageContext.request.contextPath }/home/getTrackById',
	            success: function (track) {
	                if (track) {
	                    console.log("playing track:" + track.title)
	                    $.ajax({
	                        type: 'GET',
	                        data: {
	                            trackId: track.id,
	                            genresId: track.genresId
	                        },
	                        url: '${pageContext.request.contextPath }/home/getWaitingTrack',
	                        success: function (data) {
	                            console.log("waiting track:" + data.title)
	                            var lyrics = renderLyrics(data.lyrics)
	                            var songTitle = "<p>Song: " + data.title + " - " + data.artists + "</p>"
	                            $(".lyric-content").html(songTitle + lyrics)
	                        }
	                    })
	                }
	            }
	        })
	    })
	</script>
	
</body>

<!-- Mirrored from dmitryvolkov.me/demo/volna/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 13 Nov 2021 02:17:54 GMT -->

</html>