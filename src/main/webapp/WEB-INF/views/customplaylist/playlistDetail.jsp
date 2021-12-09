<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:userTemplate title="Genres">
	<jsp:attribute name="content">
	<!-- NTanh -->
    <!-- main content -->
    			<div class="col-12">
				<div class="release">
					<div class="release__content">
						<div class="release__cover">
							<img src="${pageContext.request.contextPath }/uploads/images/playlist/${playlist.thumbnail}" alt="">
						</div>

						<div class="release__stat">
							<span><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
									<path
										d="M21.65,2.24a1,1,0,0,0-.8-.23l-13,2A1,1,0,0,0,7,5V15.35A3.45,3.45,0,0,0,5.5,15,3.5,3.5,0,1,0,9,18.5V10.86L20,9.17v4.18A3.45,3.45,0,0,0,18.5,13,3.5,3.5,0,1,0,22,16.5V3A1,1,0,0,0,21.65,2.24ZM5.5,20A1.5,1.5,0,1,1,7,18.5,1.5,1.5,0,0,1,5.5,20Zm13-2A1.5,1.5,0,1,1,20,16.5,1.5,1.5,0,0,1,18.5,18ZM20,7.14,9,8.83v-3L20,4.17Z" />
								</svg> ${playlist.tracksSize } Tracks</span>
							<input type="hidden" value="${playlist.id }" id="playlistId">

						</div>

						<h4 class="release__title">${playlist.title }</h4>
						<div class="playlist__action">
							<button >
								<a class="dropdown-song-link" href="${pageContext.request.contextPath }/customPlaylist/delete/${playlist.id}">
										<i class="las la-trash small__icon"></i>
										<span>Delete</span>
								</a>
								
							</button>
						</div>
					</div>

					<div class="release__list">
						<ul class="main__list main__list--playlist main__list--dashbox" id="listtrackdata">
						<c:if test="${playlist.tracksSize == 0 }" > 
							<h4 class="release__title">There are no songs in this playlist yet</h4>
						</c:if>
						<c:forEach var="track" items="${tracks }" varStatus="i">
							<li class="single-item">
								<a data-playlist data-title="${i.index } ${track.title}" data-artist="Jason Aldean"
									data-img="${pageContext.request.contextPath }/uploads/images/track/${track.thumbnail}"
									onclick="getTrackById(this)" data-id="${track.id}"
									class="single-item__cover">
									<img src="${pageContext.request.contextPath }/uploads/images/track/${track.thumbnail}" alt="">
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
									<h4><a href="#">${i.index + 1 } .  ${track.title}</a></h4>
									<span>
										<c:forEach var="artist" items="${track.artists }" varStatus="i"> 
											<a href="artist.html">
												${artist } 
												<c:if test="${(i.index + 1 ) != track.artistLength && i.index != 0}"> , </c:if>
											</a>
										</c:forEach>
									</span>
								</div>
								<button class="single-item__export">
									<i class="ri-add-fill" data-id="${track.id }"></i>
								</button>
								<button class="single-item__export">
									<i class="ri-delete-bin-line" onclick="delete_track(this)" data-id="${track.id }"></i>
								</button>
								<span class="single-item__time">2:58</span>
							</li>
						</c:forEach>
							

						
						</ul>
					</div>
				</div>
			</div>
   
   	<script>
   	function delete_track(e) {
   	    var id = $(e).data("id");
   	 	var playlistId = $('#playlistId').val();
   	 	console.log("Play id : " + playlistId) ;
   	    Swal.fire({
   	        icon: 'warning',
   	        title: 'Are you sure?',
   	        text: "You won't be able to revert this!",
   	        showCancelButton: true,
   	        confirmButtonColor: '#3085d6',
   	        cancelButtonColor: '#d33',
   	        confirmButtonText: 'Yes, delete it!'
   	    }).then((result) => {
   	        if (result.isConfirmed) {
   	            $.ajax({
   	                type: 'GET',
   	                data: {
   	                	id: id,
   	                    playlistId: playlistId 
   	                    
   	                },
   	                url: '${pageContext.request.contextPath}/customPlaylist/delete-track',
   	                success: function (tracks) {
   	                     var result = "";
   	                    if (tracks.length <= 0) {
   	                        result += "<h4 class='release__title'>There are no songs in this playlist yet</h4>";
   	                    } 
   	                    Swal.fire({
   	                        icon: 'success',
   	                        title: 'Deleted!',
   	                        text: 'Your data/change have been saved',
   	                        showConfirmButton: false,
   	                        timer: 1500
   	                    });
   	                    for (var i = 0; i < tracks.length; i++) {
   	                    	result += '<li class="single-item">' ;
   	                    	result += '<a data-playlist data-title=" ' + i + tracks[i].title+ '" data-artist="Jason Aldean"';
							result += 'data-img="${pageContext.request.contextPath }/uploads/images/track/'+ tracks[i].thumbnail + '"';
							result += 'onclick="getTrackById(this)" data-id="'+ tracks[i].id +'" class="single-item__cover">';
							result += '<img src="${pageContext.request.contextPath }/uploads/images/track/'+ tracks[i].thumbnail+'" alt="">';
							result += '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"> <path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" /> </svg>';	
							result += '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"> <path d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" /> </svg> </a>' ;
							result += '<div class="single-item__title">';
							result += '<h4><a href="#"> '+(i + 1 ) +'. '+ tracks[i].title+'</a></h4>' ;
							result += '<span>'
							for( var j = 0 ; j < tracks[i].artists ; j++) {
								result += '<a href="artist.html">';
								result += tracks[i].artists[j] ;
								if( j + 1 == track[i].artistLength) {
									result += ' , ' ;
								}
								result += '</a> ' ;
							}
							result += '</span> </div>' ;
							result += '<button class="single-item__export">' ; 
							result += '<i class="ri-add-fill" data-id="'+ tracks[i].id+'"></i> </button>'	;
							result += '<button class="single-item__export">';
							result += '<i class="ri-delete-bin-line" onclick="delete_track(this)" data-id="'+ tracks[i].id +'"></i> </button>';
							result += '<span class="single-item__time">2:58</span> </li>'
							
   	                    }
   	                    $('#listtrackdata').html(result); 
   	                }
   	            });
   	        }
   	    })
   	}
   	</script>
	</jsp:attribute>
</mt:userTemplate>