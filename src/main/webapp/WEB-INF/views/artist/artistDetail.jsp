<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://mytags.com"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>


<mt:userTemplate title="Artist">
	<jsp:attribute name="content">
	
	<!-- NTanh -->
	<!-- main content -->
    <main class="main">
        <div class="container-fluid">
            <div class="row row--grid">
                <!-- breadcrumb -->
                
                <!-- end breadcrumb -->

                <div class="col-12 flex-fill mt-2">
                    <div class="row row--grid">
                        <div class="col-6 flex-box">
                            <div class="artist__avatar mr-4">
                                <img src="${pageContext.request.contextPath }/uploads/images/artist/${arti.image}"
										alt="">
                                <div class="follow-artist">
                                    <button
											class="circle-icon-lg bg-clr-red">
                                        <i class="las la-heart"></i>
                                    </button>
                                </div>
                            </div>
                            <div
									class="artist__intro flex-box flex-column justify-content-start mt-4">
                                <h3 class="text-large">${arti.nickname }</h3>
                                <p class="nickname">${arti.countryname }</p>
                                <p class="follower clr-blue">
										<i class="las la-users audio__icon"></i>${arti.follower } k followers</p>
                                <button
										class="btn-artist-play-all btn-glow">PLAY ALL</button>
                            </div>
                        </div>
                        <div class="col-6">
                            <h3 class="text-large">Information</h3>
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
                            	<c:forEach var="bs" items="${trac }">
                                <li class="list-track-item">
                                    <div class="track-left">
                                        <div class="track-image mr-3">
                                            <img src="${pageContext.request.contextPath }/uploads/images/track/${bs.thumbnail}"
														alt="">
                                        </div>
                                        <div class="track-content">
                                            <h3>${bs.title }</h3>
                                            <p></p>
                                        </div>
                                    </div>
                                    <div class="track-right">
                                        <!-- <button class="circle-icon-sm bg-clr-red mr-3">
                                            <i class="las la-heart"></i>
                                        </button> -->
                                         <c:if test="${bs.isPremium == true}">
	                                        <button class="circle-icon-sm bg-clr-yellow mr-3 only-premium">
	                                            <i class="las la-crown"></i>
	                                        </button>
                                         </c:if>
                                        <div class="duration-track">${bs.likes } k <i
														class="las la-heart"></i>
												</div>
                                        <button class="btn-song-menu">
                                            <i class="las la-braille audio__icon"></i>
                                            <div class="song__menu-list">
                                            	<%-- <button class="dropdown-item" >Favorite</button> --%>
                                                <a onclick="add_to_liked(this)" data-id="${bs.id }" class="dropdown-song-link-menu favorite-link " data-favorite="true">
                                                    <i class="las la-heart"></i>
                                                    <span>Favorite</span>
                                                </a>
                                                
                                                <!-- Start add playlist -->
                                                <a class="dropdown-song-link-menu dropleft check-action text-center">
                                                    <a class="bg-primary dropdown-toggle toggle-show-playlist" type="button" id="dropdownMenu1-1" title="Add to playlist" data-toggle="dropdown" data-id="${bs.id }">
														<i class="ri-add-fill"></i>
													</a>
													<!--Menu-->
                                                    <div class="dropdown-primary show-playlist-body scrollable-menu" style="top: 60px;width: auto;position: absolute;right: 180px;background: #fff; box-shadow: 0 2px 6px 2px rgb(34 38 41 / 15%); padding: 10px; border-radius: 15px;" id="your-custom-id">
														<!-- Show menu by call ajax -->
													</div>
                                                </a>
                                                <!-- END add playlist -->
                                                 
                                            </div>
                                        </button>
                                    </div>
                                </li>
                                </c:forEach>
                               
                            </ul>
                        </div>
                        <div class="artist__tab-box ml-3" id="track">
                            <div class="track-control">
                                <h4>Albums</h4>
                               
                            </div>
                            <ul class="list__tracks">
                            	<c:forEach var="bf" items="${album }">
                            	
                            	
                                <li class="list-track-item">
                                    <div class="track-left">
                                        <div class="track-image mr-3">
                                            <img
														src="${pageContext.request.contextPath }/uploads/images/track/${bf.thumbnail}"
														alt="">
                                        </div>
                                        <div class="track-content">
                                            <h3>${bf.title }</h3>
                                            <p></p>
                                        </div>
                                    </div>
                                    <div class="track-right">
                                      <!--   <button
													class="circle-icon-sm bg-clr-red mr-3">
                                            <i class="las la-heart"></i>
                                        </button> -->
            	                        
                                        <div class="duration-track">${bf.likes } k <i
														class="las la-heart"></i>
												</div>
                                        <button class="btn-song-menu">
                                            <i
														class="las la-braille audio__icon"></i>
                                            <div class="song__menu-list">
                                                <a class="dropdown-song-link-menu favorite-link" data-favorite="true">
                                                    <i class="las la-heart"></i>
                                                    <span>Favorite</span>
                                                </a>
                                                <a class="dropdown-song-link-menu">
                                                    <!-- <i class="las la-plus small__icon"></i> -->
                                                    <%-- <span>Add to Playlist</span> --%>
                                                    <a class="bg-primary dropdown-toggle toggle-show-playlist" type="button" id="dropdownMenu1-1" title="Add to playlist" data-toggle="dropdown" data-id="${bf.id }">
														<i class="ri-add-fill"></i>
													</a>
													<!--Menu-->
                                                    <div class="dropdown-primary show-playlist-body scrollable-menu" style="width: auto;" id="your-custom-id">
														<!-- Show menu by call ajax -->
													</div>
                                                </a>
                                              
                                            </div>
                                             <div class="dropleft check-action text-center">
												
												
											</div>
                                        </button>
                                    </div>
                                </li>
                            </c:forEach>
                            </ul>
                        </div>

                    </div>

                </div>

                <!-- Recent Listen -->
               <!--  <section class="row row--grid">
                    title
                    <div class="col-12">
                        <div class="main__title">
                            <h2>New Release Tracks</h2>
                        </div>
                    </div>
                    end title

                    <div class="col-6 col-sm-4 col-lg-2">
                        <div class="album">
                            <div class="album__cover">
                                <img src="img/covers/cover6.jpg" alt="">
                                <a href="release.html"><svg
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path
												d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
                                    </svg></a>
                                <span class="album__stat">
                                    <span><svg
												xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path
													d="M3.71,16.29a1,1,0,0,0-.33-.21,1,1,0,0,0-.76,0,1,1,0,0,0-.33.21,1,1,0,0,0-.21.33,1,1,0,0,0,.21,1.09,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1,1,0,0,0,.21-1.09A1,1,0,0,0,3.71,16.29ZM7,8H21a1,1,0,0,0,0-2H7A1,1,0,0,0,7,8ZM3.71,11.29a1,1,0,0,0-1.09-.21,1.15,1.15,0,0,0-.33.21,1,1,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1,1,0,0,0,3.71,11.29ZM21,11H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2ZM3.71,6.29a1,1,0,0,0-.33-.21,1,1,0,0,0-1.09.21,1.15,1.15,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21,1,1,0,0,0,1.09-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1.15,1.15,0,0,0,3.71,6.29ZM21,16H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2Z" />
                                        </svg> 14</span>
                                    <span><svg
												xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path
													d="M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z" />
                                        </svg> 9 045</span>
                                </span>
                            </div>
                            <div class="album__title">
                                <h3>
										<a href="release.html">Supalonely</a>
									</h3>
                                <span><a href="artist.html">BENEE Featuring</a></span>
                            </div>
                        </div>
                    </div>

                    <div class="col-6 col-sm-4 col-lg-2">
                        <div class="album">
                            <div class="album__cover">
                                <img src="img/covers/cover7.jpg" alt="">
                                <a href="release.html"><svg
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path
												d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
                                    </svg></a>
                                <span class="album__stat">
                                    <span><svg
												xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path
													d="M3.71,16.29a1,1,0,0,0-.33-.21,1,1,0,0,0-.76,0,1,1,0,0,0-.33.21,1,1,0,0,0-.21.33,1,1,0,0,0,.21,1.09,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1,1,0,0,0,.21-1.09A1,1,0,0,0,3.71,16.29ZM7,8H21a1,1,0,0,0,0-2H7A1,1,0,0,0,7,8ZM3.71,11.29a1,1,0,0,0-1.09-.21,1.15,1.15,0,0,0-.33.21,1,1,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1,1,0,0,0,3.71,11.29ZM21,11H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2ZM3.71,6.29a1,1,0,0,0-.33-.21,1,1,0,0,0-1.09.21,1.15,1.15,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21,1,1,0,0,0,1.09-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1.15,1.15,0,0,0,3.71,6.29ZM21,16H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2Z" />
                                        </svg> 16</span>
                                    <span><svg
												xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path
													d="M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z" />
                                        </svg> 500k</span>
                                </span>
                            </div>
                            <div class="album__title">
                                <h3>
										<a href="release.html">Girls In The Hood</a>
									</h3>
                                <span><a href="artist.html">Megan Thee</a></span>
                            </div>
                        </div>
                    </div>

                </section>
                -->
                <!-- end releases -->
            </div>
    
		
		</main>
    <!-- end main content -->
<!-- Begin Script -->
<script defer>
$('.toggle-show-playlist').on("click", function(){
    var id = $(this).data("id");
    $.ajax({
    	type: 'GET',
        data: {
            id: id
        },
        url: '${pageContext.request.contextPath}/artist/show-playlist',
        success: function (playlists) {	
	        
	         var result = "<h5 class='text-center'>Add to playlist</h5>";
	        result += "<input class='form-control' type='text' onkeyup='search_playlist(this)' placeholder='Search playlist' aria-label='Search'>";
		    result += "<div class='show-btn'>";
	        for (var i = 0; i < playlists.length; i++){
				result += "<button class='dropdown-item' onclick='add_to_playlist(this)' data-id='" + playlists[i].id + "'>" + playlists[i].title + "</button>";
		    }
			result += "</div>";
		    $('.show-playlist-body').html(result);  
        }
	});
}); 

function search_playlist(e){
var keyword = $(e).val();
$.ajax({
	type: 'GET',
    data: {
    	keyword: keyword
    },
    url: '${pageContext.request.contextPath}/artist/search-playlist',
    success: function (playlists) {	
        var result = "";
        if(playlists.length == 0){
	        var text = "Have no result";
	        result += "<button class='dropdown-item'>" + text + "</button>";
        	$('.show-btn').html(result);
		}
        for (var i = 0; i < playlists.length; i++){
			result += "<button class='dropdown-item' onclick='add_to_playlist(this)' data-id='" + playlists[i].id + "'>" + playlists[i].title + "</button>";
        }
		$('.show-btn').html(result);
    } 
});
}

function add_to_playlist(e){
var id = $(e).data("id");
$.ajax({
	type: 'GET',
    data: {
        id: id
    },
    url: '${pageContext.request.contextPath}/artist/add-to-playlist',
    success: function (flag) {
        if(flag){
        	Swal.fire({
        		  position: 'center',
        		  icon: 'success',
        		  title: 'Your work has been saved!',
        		  showConfirmButton: false,
        		  timer: 1500
        	});
	    }
	    if(!flag) {
	    	Swal.fire({
        		  position: 'center',
        		  icon: 'error',
        		  title: 'The track is already in this playlist!',
        		  showConfirmButton: false,
        		  timer: 2000
        	});
	    }
    }, error: function (e) {
		console.table(e)
	}
})
}

function add_to_liked(e){
	var id = $(e).data("id");
	$.ajax({
		type: 'GET',
	    data: {
	        id: id
	    },
	    url: '${pageContext.request.contextPath}/artist/add-to-liked',
	    success: function (flag) {
	        if(flag){
	        	Swal.fire({
	        		  position: 'center',
	        		  icon: 'success',
	        		  title: 'You add this song into favorites!',
	        		  showConfirmButton: false,
	        		  timer: 1500
	        	});
		    }
		    if(!flag) {
		    	Swal.fire({
		    		  position: 'center',
	        		  icon: 'success',
	        		  title: 'You removed this song from favorites!',
	        		  showConfirmButton: false,
	        		  timer: 1500
	        	});
		    }
	    }, error: function (e) {
			console.table(e)
		}
	})
}
</script>
<script type="module" defer>
	import modal, { swalAlert, redirectAlert, singleAlert, confirmAlert, redirectAlertURLCustom } from '${pageContext.request.contextPath }/resources/user/js/notification.js';
	$('.delete-btn').each(function (index) {
    	$(this).click(function () {
        	var id = $(this).data("id");
        	confirmAlert(
        	    function () {
        	        console.log("id: " + id);
         	       $.ajax({
         	           type: 'GET',
          	           data: {
             	           id: id
                    	},
                    	url: '${pageContext.request.contextPath }/artist/delete',
                    	success: function (response) {
                        	if (response) {
                            	swalAlert(modal.MODAL_CONTENT.delete_success);
                            	var url = '${pageContext.request.contextPath }/artist';
                            	window.location.replace(url);
                        	}
                        	if (!response) { 
								swalAlert(modal.MODAL_CONTENT.delete_error) 
							}
                    	}
                	})

            	},
            	modal.MODAL_CONTENT.confirm_delete_dialog)
    	})
	})
</script>

<!-- END Script -->

 	</jsp:attribute>
</mt:userTemplate>