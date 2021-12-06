<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="t" uri="http://mytags.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<mt:adminTemplate title="Playlist">
	<jsp:attribute name="content">

            <div class="row row--grid">
				<div class="col-12">
					<div class="tab-content">
						<div class="tab-pane fade show active" id="playlist-tab" role="tabpanel">
							<div class="row row--grid">
								<div class="col-12">
									<div class="iq-card">
                     					<div class="iq-card-header d-flex justify-content-between">
                        					<div class="iq-header-title">
                           						<h4 class="card-title">Tracks</h4>
                        					</div>
                     				 	</div>
				                     <div class="iq-card-body">
				                        <div class="table-responsive">
				                           <table id="table-track" class="data-tables table table-striped table-bordered" style="width:100%">
				                              <thead>
				                                 <tr>
				                                    <th style="width: 4%; height: 50px;">No</th>
				                                    <th style="width: 13%; height: 50px;">Thumnail</th>
				                                    <th style="width: 16%; height: 50px;">Title</th>
				                                    <th style="width: 13%; height: 50px;">Artists</th>
				                                    <th style="width: 11%; height: 50px;">Publish date</th>
				                                    <th style="width: 8%; height: 50px;">Liked</th>
				                                    <th style="width: 8%; height: 50px;">Listens</th>
				                                    <th style="width: 9%; height: 50px;">Genre</th>
				                                    <th style="width: 5%; height: 50px;">timer</th>
				                                    <th style="width: 6%; height: 50px;">Status</th>
				                                    <th style="width: 7%; height: 50px;">Action</th>
				                                 </tr>
				                              </thead>
				                              <tbody id="playlists-body">
				                              	 <c:forEach var="track" items="${tracks }" varStatus="i">
					                                 <tr  style="height: 180px;">
					                                    <td class="text-center">${i.index + 1 }</td>
					                                    <td>
					                                       <img src="${pageContext.request.contextPath }/uploads/images/track/${track.thumbnail }" class="img-responsive avatar-150 rounded" alt="" width="200" height="200">
					                                    </td>
					                                    <td >
					                                    	<c:if test="${track.premium == true}"><span class="icon-border"><i class="las la-crown crown-icon flex-column"></i></span></c:if> 
					                                    	${track.title }
					                                    </td>
					                                    <td class="text-center">
					                                    	<c:forEach var="account" items="${track.accounts }">
					                                    		<span>${account.nickname }</span>
					                                    		<br>   
					                                    	</c:forEach>
					                                    </td>
					                                    <td class="text-center"><fmt:formatDate value="${track.publishDate }" type="date" pattern="dd/MM/yyyy"/></td>
					                                    <td class="text-center">${track.likes } <i class="fas fa-heart clr-red"></i></td>
					                                    <td class="text-center">${track.listens } <i class="fas fa-headphones-alt"></i></td>
					                                    <td class="text-center">${track.genres.name }</td>
					                                    <td class="text-center"><t:trackTime totalSeconds="${track.duration }"/></td>
					                                    <td class="text-center">
					                                    	<c:if test="${track.statusId == 1 }"><button id="status-btn" type="button" class="badge iq-bg-info toggle-track-status" data-id="${track.id}">Public</button></c:if>
					                                    	<c:if test="${track.statusId == 2 }"><button type="button" class="badge iq-bg-primary">Pending</button></c:if>
					                                    	<c:if test="${track.statusId == 3 }"><button id="status-btn" type="button" class="badge iq-bg-danger toggle-track-status" data-id="${track.id}">Hidden</button></c:if>
					                                    </td>
					                                    <td>
					                                        <div class="dropleft check-action text-center">
															  <a class="bg-primary dropdown-toggle toggle-show-playlist" type="button" id="dropdownMenu1-1" title="Add to playlist"
															    data-toggle="dropdown" data-id="${track.id }">
															    <i class="ri-add-fill"></i>
															  </a>
															  <!--Menu-->
															  <div class="dropdown-menu dropdown-primary show-playlist-body scrollable-menu" style="width: auto; " id="your-custom-id">
															     <!-- Show menu by call ajax -->
															  </div>
															</div>
					                                        <div class="flex align-items-center text-center list-user-action">
					                                            <a class="bg-primary" data-toggle="tooltip" data-placement="top" title="Edit"
					                                          	   href="${pageContext.request.contextPath }/admin/manage-track/edit?id=${track.id }">
					                                          	   <i class="ri-pencil-line"></i>
					                                            </a>
					                                            <a class="bg-primary delete-btn" type="button" data-toggle="tooltip" data-placement="top" title="Delete" 
					                                          	    data-id="${track.id }">
					                                          	   <i class="ri-delete-bin-line"></i>
					                                            </a>
					                                            <a class="bg-primary toggle-view-lyric" type="button" data-placement="top" title="View lyrics"
					                                          	   data-toggle="modal" data-target="#viewLyricsModalLong" data-id="${track.id }">
					                                          	   <i class="ri-bill-line"></i>
					                                            </a>
						                                        <c:if test="${track.statusId == 2 }">
							                                       <a class="bg-danger toggle-view-lyric" type="button" data-placement="top" title="Check for public track"
						                                          	   href="${pageContext.request.contextPath }/admin/manage-track/checkin?id=${track.id }">
						                                          	   <i class="ri-check-double-fill"></i>
					                                            	</a>
						                                        </c:if>
														   </div>
					                                    </td>
					                                 </tr>
				                                 </c:forEach>
				                              </tbody>
				                           </table>
				                        </div>
				                     </div>
				                  </div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>	
			
<!-- Lyrics Modal  -->
<div class="modal fade" id="viewLyricsModalLong" tabindex="-1" role="dialog" aria-labelledby="viewLyricsModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title view-lyrics-title" id="viewLyricsModalLongTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body view-lyrics-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script>

	$(document).ready(function(){
		$('.toggle-track-status').each(function(index){
		    $(this).on("click", function(){
		        var id = $(this).data("id")
		        var self = $(this);
			    $.ajax({
			    	type: 'GET',
			        data: {
			            id: id
			        },
			        url: '${pageContext.request.contextPath}/admin/manage-track/edit-status',
			        success: function (status) {	
			                if (status == 1) {
			                	self.text('Public');
			                	self.addClass('iq-bg-info')
			                	self.removeClass('iq-bg-danger')
			                } else if (status == 3) {
			                	self.text('Hidden'); 
			                	self.addClass('iq-bg-danger')
			                	self.removeClass('iq-bg-info')
			                }
			            
			        }
        		});
    		});
		});
		
		$('.toggle-view-lyric').on("click", function(){
	        var id = $(this).data("id");
		    $.ajax({
		    	type: 'GET',
		        data: {
		            id: id
		        },
		        url: '${pageContext.request.contextPath}/admin/manage-track/view-lyric',
		        success: function (track) {	
		            $('.view-lyrics-title').html(track.title + ' lyric');
		            $('.view-lyrics-body').html(track.lyrics);
		        }
    		});
		}); 

		$('.toggle-show-playlist').on("click", function(){
	        var id = $(this).data("id");
		    $.ajax({
		    	type: 'GET',
		        data: {
		            id: id
		        },
		        url: '${pageContext.request.contextPath}/admin/manage-track/show-playlist',
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

	})
	
	function search_playlist(e){
		var keyword = $(e).val();
		$.ajax({
	    	type: 'GET',
	        data: {
	        	keyword: keyword
	        },
	        url: '${pageContext.request.contextPath}/admin/manage-track/search-playlist',
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
	        url: '${pageContext.request.contextPath}/admin/manage-track/add-to-playlist',
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
		});
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
                    	url: '${pageContext.request.contextPath }/admin/manage-track/delete',
                    	success: function (response) {
                        	if (response) {
                            	swalAlert(modal.MODAL_CONTENT.delete_success);
                            	var url = '${pageContext.request.contextPath }/admin/manage-track';
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
	</jsp:attribute>
</mt:adminTemplate>
