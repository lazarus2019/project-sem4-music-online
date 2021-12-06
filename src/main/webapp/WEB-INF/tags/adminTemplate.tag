<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ attribute name="title" required="true"  rtexprvalue="true"%> 
<%@ attribute name="content" fragment="true" %> 
<%@ taglib prefix="t" uri="http://mytags.com" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  

<!doctype html>
<html lang="en">

<!-- Mirrored from templates.iqonic.design/muzik/html/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Nov 2021 05:02:30 GMT -->

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Muzik- Responsive Bootstrap 4 Admin Dashboard Template</title>
    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/admin/images/favicon.ico" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/css/bootstrap.min.css">
    <!-- Datatable CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/css/dataTables.bootstrap4.min.css">
    <!-- Typography CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/css/typography.css">
    <!-- Style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/css/responsive.css">
    <!-- Remix Icon -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/css/remixicon.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/css/custom.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/sweetalert2/dist/sweetalert2.min.css">
    
   	<!-- jQuery -->
   	<script src="${pageContext.request.contextPath }/resources/admin/js/jquery.min.js"></script>
   	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
   	<!-- Sweetalert CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/user/css/sweetalert2/dist/sweetalert2.min.css">
</head>

<body>
    <!-- loader Start -->
   <!--  <div id="loading">
        <div id="loading-center">
        </div>
    </div> -->
    <!-- loader END -->
    <!-- Wrapper Start -->
    
    <div class="wrapper">
        <!-- Sidebar  -->
        <div class="iq-sidebar">
            <div class="iq-sidebar-logo d-flex justify-content-between">
                <a href="index.html" class="header-logo">
                    <img src="${pageContext.request.contextPath }/resources/admin/images/logo.png" class="img-fluid rounded-normal" alt="">
                    <div class="logo-title">
                        <span class="text-primary text-uppercase">Muzik</span>
                    </div>
                </a>
                <div class="iq-menu-bt-sidebar">
                    <div class="iq-menu-bt align-self-center">
                        <div class="wrapper-menu">
                            <div class="main-circle"><i class="las la-bars"></i></div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="sidebar-scrollbar">
                <nav class="iq-sidebar-menu">
                    <ul id="iq-sidebar-toggle" class="iq-menu">
                  		<li>
                  			<a href="${pageContext.request.contextPath }/admin/dashboard"><i class="las la-house-damage"></i>Dashboard</a>
                  		</li>


                        <li>
                            <a href="${pageContext.request.contextPath }/admin/playlist" class="iq-waves-effect">
                            	<i class="ri-function-line"></i><span>Manage Playlist</span>
                            </a>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath }/admin/manage-track" class="iq-waves-effect">
                            	<i class="ri-album-line iq-arrow-left"></i><span>Manage Track</span>
                            </a>
                        </li>
                        

                        <li>
                            <a href="${pageContext.request.contextPath }/admin/artist" class="iq-waves-effect">
                            	<i class="ri-folder-user-line iq-arrow-left"></i><span>Manage Artist</span>
                            </a>
                        </li>

                        <li>
                            <a href="admin-add-song.html"><i class="ri-upload-cloud-line "></i><span>Song Uploader</span>    </a>
                        </li>
                        <li class="mailbox nav-parent " data-toggle="collapse">
                            <a href="#mailbox" class="iq-waves-effect" data-toggle="collapse" aria-expanded="false"><span
                           class="ripple rippleEffect"></span><i
                           class="ri-mail-unread-line iq-arrow-left"></i><span>Mailbox</span><i
                           class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                            <ul id="mailbox" class="nav iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                                <li><a class="nav-link" href="/zestreact/appnew/music/mail-inbox"><span>Inbox</span></a></li>
                                <li><a class="nav-link" href="/zestreact/appnew/music/mail-compose"><span>Compose</span></a>
                                </li>
                                <li><a class="nav-link" href="/zestreact/appnew/music/mail-view"><span>View</span></a></li>
                            </ul>
                        </li>

                        <li class="reports nav-parent " data-toggle="collapse">
                            <a href="#report" class="iq-waves-effect" data-toggle="collapse" aria-expanded="false"><span
                           class="ripple rippleEffect"></span><i
                           class="ri-pie-chart-line iq-arrow-left"></i><span>Report</span><i
                           class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                            <ul id="report" class="nav iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                                <li><a class="nav-link active" href="/zestreact/appnew/music/reports-songs" aria-current="page"><span>Songs</span></a></li>
                                <li><a class="nav-link" href="/zestreact/appnew/music/reports-statistics"><span>Statistics</span></a></li>
                                <li><a class="nav-link" href="/zestreact/appnew/music/reports-trending"><span>Trending</span></a></li>
                                <li><a class="nav-link" href="/zestreact/appnew/music/reports-visitors"><span>Visitors</span></a></li>
                            </ul>
                        </li>

                        <li class="genres nav-parent " data-toggle="collapse">
                            <a href="#genres" class="iq-waves-effect" data-toggle="collapse" aria-expanded="false"><span
                           class="ripple rippleEffect"></span><i
                           class="ri-headphone-line iq-arrow-left"></i><span>Genres</span><i
                           class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                            <ul id="genres" class="nav iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                                <li><a class="nav-link" href="admin-category.html"><span>Genres</span></a></li>
                                <li><a class="nav-link" href="admin-add-category.html"><span>Add Genre</span></a></li>
                                <li><a class="nav-link" href="/zestreact/appnew/music/edit-genre"><span>Edit Genre</span></a>
                                </li>
                            </ul>
                        </li>

                        <li class="songs nav-parent " data-toggle="collapse">
                            <a href="#song" class="iq-waves-effect" data-toggle="collapse" aria-expanded="false"><span
                           class="ripple rippleEffect"></span><i
                           class="ri-disc-line iq-arrow-left"></i><span>Song</span><i
                           class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                            <ul id="song" class="nav iq-submenu collapse" data-parent="#iq-sidebar-toggle">

                                <li><a class="nav-link" href="admin-song.html"><span>Song</span></a></li>
                                <li><a class="nav-link" href="admin-add-song.html"><span>Add Song</span></a></li>
                                <li><a class="nav-link" href="/zestreact/appnew/music/edit-song"><span>Edit Song</span></a></li>
                                
	                        </ul>
                        </li>


						<li>
                            <a href="#setting" class="iq-waves-effect" data-toggle="collapse" aria-expanded="false"><span

                           class="ripple rippleEffect"></span><i class="ri-settings-2-line" ></i><span>Settings</span><i
                           class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                            <ul id="setting" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                                <li><a href="${pageContext.request.contextPath }/admin/setting/index">General</a></li>
                                <li><a href="${pageContext.request.contextPath }/admin/aboutus/index">About</a></li>
                            </ul>
                        </li>
                        <sec:authorize access="hasRole('ROLE_MANAGER')">
							<li>
	                            <a href="${pageContext.request.contextPath }/admin/manageAdmin" class="iq-waves-effect">
	                            	<i class="ri-folder-user-line iq-arrow-left"></i><span>Manager Admin</span>
	                            </a>
	                        </li>
						</sec:authorize>
                      	


                    </ul>
                </nav>
            </div>
        </div>
        <!-- TOP Nav Bar -->
        <div class="iq-top-navbar">
            <div class="iq-navbar-custom">
                <nav class="navbar navbar-expand-lg navbar-light p-0">
                    <div class="iq-menu-bt d-flex align-items-center">
                        <div class="wrapper-menu">
                            <div class="main-circle"><i class="las la-bars"></i></div>
                        </div>
                        <div class="iq-navbar-logo d-flex justify-content-between">
                            <a href="index.html" class="header-logo">
                                <img src="${pageContext.request.contextPath }/resources/admin/images/logo.png" class="img-fluid rounded-normal" alt="">
                                <div class="pt-2 pl-2 logo-title">
                                    <span class="text-primary text-uppercase">Muzik</span>
                                </div>
                            </a>
                        </div>
                    </div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-label="Toggle navigation">
                  <i class="ri-menu-3-line"></i>
               </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <!-- <ul class="list-unstyled iq-menu-top d-flex justify-content-between mb-0 p-0">
                            <li class="active"><a href="index.html">Home</a></li>
                            <li><a href="latest.html">Latest</a></li>
                            <li><a href="albums.html">Albums</a></li>
                        </ul> -->
                        <ul class="navbar-nav ml-auto navbar-list">
                            <li class="nav-item nav-icon">
                                <div class="iq-search-bar">
                                    <form action="#" class="searchbox">
                                        <input type="text" class="text search-input" placeholder="Search Here..">
                                        <a class="search-link" href="#"><i class="ri-search-line text-black"></i></a>
                                        <a class="search-audio" href="#"><i class="las la-microphone text-black"></i></a>
                                    </form>
                                </div>
                            </li>
                            <li class="nav-item nav-icon search-content">
                                <a href="#" class="search-toggle iq-waves-effect text-gray rounded"><span
                              class="ripple rippleEffect "></span>
                           <i class="ri-search-line text-black"></i>
                        </a>
                                <form action="#" class="search-box p-0">
                                    <input type="text" class="text search-input" placeholder="Type here to search...">
                                    <a class="search-link" href="#"><i class="ri-search-line text-black"></i></a>
                                    <a class="search-audio" href="#"><i class="las la-microphone text-black"></i></a>
                                </form>
                            </li>
                            <li class="nav-item nav-icon">
                                <a href="#" class="search-toggle iq-waves-effect text-black rounded">
                                    <i class="las la-cog"></i>
                                    <span class=" dots"></span>
                                </a>
                            </li>
                            <li class="nav-item nav-icon">
                                <a href="#" class="search-toggle iq-waves-effect text-black rounded">
                                    <i class="ri-mail-line"></i>
                                    <span class="massage-icon dots badge badge-primary">5</span>
                                </a>
                                <div class="iq-sub-dropdown">
                                    <div class="iq-card shadow-none m-0">
                                        <div class="iq-card-body p-0 ">
                                            <div class="bg-primary p-3">
                                                <h5 class="mb-0 text-white">All Messages<small class="badge  badge-light float-right pt-1">5</small></h5>
                                            </div>
                                            <a href="#" class="iq-sub-card">
                                                <div class="media align-items-center">
                                                    <div class="">
                                                        <img class="avatar-40 rounded" src="${pageContext.request.contextPath }/resources/admin/images/user/01.jpg" alt="">
                                                    </div>
                                                    <div class="media-body ml-3">
                                                        <h6 class="mb-0 ">Bni Emma Watson</h6>
                                                        <small class="float-left font-size-12">13 Jun</small>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="iq-sub-card">
                                                <div class="media align-items-center">
                                                    <div class="">
                                                        <img class="avatar-40 rounded" src="${pageContext.request.contextPath }/resources/admin/images/user/02.jpg" alt="">
                                                    </div>
                                                    <div class="media-body ml-3">
                                                        <h6 class="mb-0 ">Lorem Ipsum Watson</h6>
                                                        <small class="float-left font-size-12">20 Apr</small>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="iq-sub-card">
                                                <div class="media align-items-center">
                                                    <div class="">
                                                        <img class="avatar-40 rounded" src="${pageContext.request.contextPath }/resources/admin/images/user/03.jpg" alt="">
                                                    </div>
                                                    <div class="media-body ml-3">
                                                        <h6 class="mb-0 ">Why do we use it?</h6>
                                                        <small class="float-left font-size-12">30 Jun</small>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="iq-sub-card">
                                                <div class="media align-items-center">
                                                    <div class="">
                                                        <img class="avatar-40 rounded" src="${pageContext.request.contextPath }/resources/admin/images/user/04.jpg" alt="">
                                                    </div>
                                                    <div class="media-body ml-3">
                                                        <h6 class="mb-0 ">Variations Passages</h6>
                                                        <small class="float-left font-size-12">12 Sep</small>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="iq-sub-card">
                                                <div class="media align-items-center">
                                                    <div class="">
                                                        <img class="avatar-40 rounded" src="${pageContext.request.contextPath }/resources/admin/images/user/05.jpg" alt="">
                                                    </div>
                                                    <div class="media-body ml-3">
                                                        <h6 class="mb-0 ">Lorem Ipsum generators</h6>
                                                        <small class="float-left font-size-12">5 Dec</small>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item nav-icon">
                                <a href="#" class="search-toggle iq-waves-effect text-black rounded">
                                    <i class="ri-notification-line block"></i>
                                    <span class="notice-icon dots badge badge-primary">+</span>
                                </a>
                                <div class="iq-sub-dropdown">
                                    <div class="iq-card shadow-none m-0">
                                        <div class="iq-card-body p-0">
                                            <div class="bg-primary p-3">
                                                <h5 class="mb-0 text-white">All Notifications<small class="badge  badge-light float-right pt-1">4</small></h5>
                                            </div>
                                            <a href="#" class="iq-sub-card">
                                                <div class="media align-items-center">
                                                    <div class="">
                                                        <img class="avatar-40 rounded img-fluid" src="${pageContext.request.contextPath }/resources/admin/images/user/01.jpg" alt="">
                                                    </div>
                                                    <div class="media-body ml-3">
                                                        <h6 class="mb-0 ">Emma Watson Barry</h6>
                                                        <small class="float-right">Just Now</small>
                                                        <p class="mb-0">95 MB</p>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="iq-sub-card">
                                                <div class="media align-items-center">
                                                    <div class="">
                                                        <img class="avatar-40 rounded img-fluid" src="${pageContext.request.contextPath }/resources/admin/images/user/02.jpg" alt="">
                                                    </div>
                                                    <div class="media-body ml-3">
                                                        <h6 class="mb-0 ">New customer is join</h6>
                                                        <small class="float-right">5 days ago</small>
                                                        <p class="mb-0">Cyst Barry</p>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="iq-sub-card">
                                                <div class="media align-items-center">
                                                    <div class="">
                                                        <img class="avatar-40 rounded img-fluid" src="${pageContext.request.contextPath }/resources/admin/images/user/03.jpg" alt="">
                                                    </div>
                                                    <div class="media-body ml-3">
                                                        <h6 class="mb-0 ">Two customer is left</h6>
                                                        <small class="float-right">2 days ago</small>
                                                        <p class="mb-0">Cyst Barry</p>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="iq-sub-card">
                                                <div class="media align-items-center">
                                                    <div class="">
                                                        <img class="avatar-40 rounded img-fluid" src="${pageContext.request.contextPath }/resources/admin/images/user/04.jpg" alt="">
                                                    </div>
                                                    <div class="media-body ml-3">
                                                        <h6 class="mb-0 ">New Mail from Fenny</h6>
                                                        <small class="float-right">3 days ago</small>
                                                        <p class="mb-0">Cyst Barry</p>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <t:profile/>
                        
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!-- TOP Nav Bar END -->
        <!-- Page Content  -->
        <div id="content-page" class="content-page">
            <div class="container-fluid">
              	<jsp:invoke fragment="content"></jsp:invoke>
            </div>
        </div>
    </div>
   
    <!-- Footer END -->
    <!-- color-customizer -->
    <div class="iq-colorbox color-fix">
        <!-- <div class="buy-button"> <a class="color-full" href="#"><i class="fa fa-spinner fa-spin"></i></a> </div> -->
        <div id="right-sidebar-scrollbar" class="iq-colorbox-inner">
            <div class="clearfix color-picker">
                <h3 class="iq-font-black">music Awesome Color</h3>
                <p>This color combo available inside whole template. You can change on your wish, Even you can create your own with limitless possibilities! </p>
                <ul class="iq-colorselect clearfix">
                    <li class="color-1 iq-colormark" data-style="color-1"></li>
                    <li class="color-2" data-style="iq-color-2"></li>
                    <li class="color-3" data-style="iq-color-3"></li>
                    <li class="color-4" data-style="iq-color-4"></li>
                    <li class="color-5" data-style="iq-color-5"></li>
                    <li class="color-6" data-style="iq-color-6"></li>
                    <li class="color-7" data-style="iq-color-7"></li>
                    <li class="color-8" data-style="iq-color-8"></li>
                    <li class="color-9" data-style="iq-color-9"></li>
                    <li class="color-10" data-style="iq-color-10"></li>
                    <li class="color-11" data-style="iq-color-11"></li>
                    <li class="color-12" data-style="iq-color-12"></li>
                    <li class="color-13" data-style="iq-color-13"></li>
                    <li class="color-14" data-style="iq-color-14"></li>
                    <li class="color-15" data-style="iq-color-15"></li>
                    <li class="color-16" data-style="iq-color-16"></li>
                    <li class="color-17" data-style="iq-color-17"></li>
                    <li class="color-18" data-style="iq-color-18"></li>
                    <li class="color-19" data-style="iq-color-19"></li>
                    <li class="color-20" data-style="iq-color-20"></li>
                </ul>
                <a target="_blank" class="btn btn-primary d-block mt-3" href="../../../themeforest.net/item/muzik-music-streaming-admin-template/27967164.html">Purchase Now</a>
            </div>
        </div>
    </div>
    <!-- color-customizer END -->
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    
    <script src="${pageContext.request.contextPath }/resources/admin/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/admin/js/bootstrap.min.js"></script>
    <!-- Appear JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/jquery.appear.js"></script>
    <!-- Datatable JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/admin/js/dataTables.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/admin/js/popper.min.js"></script>
    <!-- Countdown JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/countdown.min.js"></script>
    <!-- Counterup JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/admin/js/jquery.counterup.min.js"></script>
    <!-- Wow JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/wow.min.js"></script>
    <!-- Apexcharts JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/apexcharts.js"></script>
    <!-- Slick JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/slick.min.js"></script>
    <!-- Select2 JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/select2.min.js"></script>
    <!-- Owl Carousel JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/owl.carousel.min.js"></script>
    <!-- Magnific Popup JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/jquery.magnific-popup.min.js"></script>
    <!-- Smooth Scrollbar JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/smooth-scrollbar.js"></script>
    <!-- lottie JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/lottie.js"></script>
    <!-- am core JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/core.js"></script>
    <!-- am charts JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/charts.js"></script>
    <!-- am animated JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/animated.js"></script>
    <!-- am kelly JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/kelly.js"></script>
    <!-- am maps JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/maps.js"></script>
    <!-- am worldLow JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/worldLow.js"></script>
    <!-- Raphael-min JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/raphael-min.js"></script>
    <!-- Morris JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/morris.js"></script>
    <!-- Morris min JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/morris.min.js"></script>
    <!-- Flatpicker Js -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/flatpickr.js"></script>
    <!-- Style Customizer -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/style-customizer.js"></script>
    <!-- Chart Custom JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/chart-custom.js"></script>
    <!-- Music js -->
    <%-- <script src="${pageContext.request.contextPath }/resources/admin/js/music-player.js"></script> --%>
    <!-- Music-player js -->
    <%-- <script src="${pageContext.request.contextPath }/resources/admin/js/music-player-dashboard.js"></script> --%>
    <!-- Custom JavaScript -->
    <script src="${pageContext.request.contextPath }/resources/admin/js/custom.js"></script>
    <script defer type="module" src="${pageContext.request.contextPath }/resources/user/js/alert_custom.js"></script>
    <!-- Sweetalert -->
    <script src="${pageContext.request.contextPath }/resources/user/css/sweetalert2/dist/sweetalert2.all.min.js"></script>
    <!-- JQuery  -->
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
</body>

<!-- Mirrored from templates.iqonic.design/muzik/html/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 15 Nov 2021 05:03:36 GMT -->

</html>
