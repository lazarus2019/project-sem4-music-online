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
										<i class="las la-users audio__icon"></i>${arti.follower } followers</p>
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
                            	<c:if test="${bs.status.id == 1 }">
                            		<li class="list-track-item">
                                    <div class="track-left" onclick="getTrackById(this)" data-id="${bs.id}">
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
                            	</c:if>
                                
                                </c:forEach>
                               
                            </ul>
                        </div>
                        <div class="artist__tab-box ml-3" id="track">
                            <div class="track-control">
                                <h4>Albums</h4>
                               
                            </div>
                            <ul class="list__tracks">
                            	<c:forEach var="bf" items="${album }">
                            	
                            	<c:if test="${bf.playlistCategory.id == 3 && bf.status.id == 1 }">
	                                <li class="list-track-item">
	                                    <div class="track-left" data-id="${bf.id}" onclick="getListTrackByAlbumId(this)">
	                                        <div class="track-image mr-3">
	                                            <img src="${pageContext.request.contextPath }/uploads/images/playlist/${bf.thumbnail}"
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
	                                            <i class="las la-braille audio__icon"></i>
	                                            <div class="song__menu-list">
	                                                 <a onclick="add_to_liked(this)" data-id="${bf.id }" class="dropdown-song-link-menu favorite-link " data-favorite="true">
	                                                    <i class="las la-heart"></i>
	                                                    <span>Favorite</span>
	                                                </a>
	                                                
	                                                <!-- Start add playlist -->
	                                                <a class="dropdown-song-link-menu dropleft check-action text-center">
	                                                    <a class="bg-primary dropdown-toggle toggle-show-playlist" type="button" id="dropdownMenu1-1" title="Add to playlist" data-toggle="dropdown" data-id="${bf.id }">
															<i class="ri-add-fill"></i>
														</a>
														<!--Menu-->
	                                                    <div class="dropdown-primary show-playlist-body scrollable-menu" style="top: 60px;width: auto;position: absolute;right: 180px;background: #fff; box-shadow: 0 2px 6px 2px rgb(34 38 41 / 15%); padding: 10px; border-radius: 15px;" id="your-custom-id">
															<!-- Show menu by call ajax -->
														</div>
	                                                </a>
	                                                <!-- END add playlist -->
	                                                 
	                                              
	                                            </div>
	                                             <div class="dropleft check-action text-center">
													
													
												</div>
	                                        </button>
	                                    </div>
	                                </li>
                            	</c:if>
                            </c:forEach>
                            </ul>
                        </div>

                    </div>

                </div>

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
