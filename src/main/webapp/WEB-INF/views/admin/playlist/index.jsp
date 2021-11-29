<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="t" uri="http://mytags.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<mt:adminTemplate title="Playlist">
	<jsp:attribute name="content">

            <div class="row row--grid">
				<div class="col-12">
					<div class="Playlist">
						<!-- tabs nav -->
						<ul class="nav nav-tabs profile__tabs" id="profile__tabs" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#playlist-tab" role="tab" aria-controls="playlist-tab" aria-selected="true">Playlist</a>
							</li>

							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#album-tab" role="tab" aria-controls="album-tab" aria-selected="false">Album</a>
							</li>

						</ul>
						<!-- end tabs nav -->					
					</div>

					<!-- content tabs -->
					<div class="tab-content">
						<!-- Playlist Tab -->
						<div class="tab-pane fade show active" id="playlist-tab" role="tabpanel">
							<div class="row row--grid">
								<div class="col-12">
									<div class="iq-card">
                     					<div class="iq-card-header d-flex justify-content-between">
                        					<div class="iq-header-title">
                           						<h4 class="card-title">Playlist</h4>
                        					</div>
                        					<div class="iq-card-header-toolbar d-flex align-items-center">
					                           <a href="${pageContext.request.contextPath }/admin/aboutus/add" class="btn btn-primary">Add New Playlist</a>
					                        </div>
                     				 	</div>
				                     <div class="iq-card-body">
				                        <div class="table-responsive">
				                           <table class="data-tables table table-striped table-bordered" style="width:100%">
				                              <thead>
				                                 <tr>
				                                    <th style="width: 5%; height: 50px;">No</th>
				                                    <th style="width: 15%; height: 50px;">Thumnail</th>
				                                    <th style="width: 15%; height: 50px;">Title</th>
				                                    <th style="width: 8%; height: 50px;">Publish date</th>
				                                    <th style="width: 9%; height: 50px;">Liked</th>
				                                    <th style="width: 10%; height: 50px;">Playlist category</th>
				                                    <th style="width: 4%; height: 50px;">Status</th>
				                                    <th style="width: 29%; height: 50px;">Description</th>
				                                    <th style="width: 5%; height: 50px;">Action</th>
				                                 </tr>
				                              </thead>
				                              <tbody id="playlists-body">
				                              	 <c:forEach var="playlist" items="${playlists }" varStatus="i">
					                                 <tr  style="height: 180px;">
					                                    <td class="text-center">${i.index + 1 }</td>
					                                    <td>
					                                       <img src="${pageContext.request.contextPath }/uploads/images/playlist/${playlist.thumbnail }" class="img-responsive avatar-150 rounded" alt="" width="200" height="200">
					                                    </td>
					                                    <td>${playlist.title }</td>
					                                    <td class="text-center"><fmt:formatDate value="${playlist.publishDate }" type="date" pattern="MM/dd/yyyy"/></td>
					                                    <td>${playlist.likes } <i class="fas fa-heart clr-red"></i></td>
					                                    <td class="text-center"><fmt:formatDate value="${playlist.lastUpdated }" type="date" pattern="MM/dd/yyyy"/></td>
					                                    <td class="text-center">
					                                    	<c:if test="${playlist.status.id == 1 }"><a id="status-btn" class="badge iq-bg-info toggle-playlist-status" data-id="${playlist.id}">Public</a>
					                                    	</c:if>
					                                    	<c:if test="${playlist.status.id == 3 }"><a id="status-btn" class="badge iq-bg-danger toggle-playlist-status" data-id="${playlist.id}">Hidden</a>
					                                    	</c:if>
					                                    </td>
					                                    <td>
					                                    	<p class="mb-0">${playlist.description }</p>
					                                    </td>
					                                    <td>
					                                       <div class="flex align-items-center text-center list-user-action">
					                                          <a class="bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit" 
					                                          	href="${pageContext.request.contextPath }/admin/playlist/edit?id=${playlist.id }">
					                                          	<i class="ri-pencil-line"></i>
					                                          </a>
					                                          <a class="bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete" 
					                                          	href="${pageContext.request.contextPath }/admin/playlist/delete?id=${playlist.id }">
					                                          	<i class="ri-delete-bin-line"></i>
					                                          </a>
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
						<!-- end Playlist Tab -->
				
						<!-- Album Tab -->
						<div class="tab-pane fade" id="album-tab" role="tabpanel">
							<div class="row row--grid">
								<div class="col-12">
									<div class="iq-card">
                     					<div class="iq-card-header d-flex justify-content-between">
                        					<div class="iq-header-title">
                           						<h4 class="card-title">Album of Artists</h4>
                        					</div>
                        					<div class="iq-card-header-toolbar d-flex align-items-center">
					                           
					                        </div>
                     					</div>
				                     <div class="iq-card-body">
				                        <div class="table-responsive">
				                           <table class=" table table-striped table-bordered" style="width:100%">
				                              <thead>
				                                 <tr>
				                                    <th style="width: 3%;">No</th>
				                                    <th style="width: 15%;">Thumbnail</th>
				                                    <th style="width: 15%;">Title</th>
				                                    <th style="width: 14%;">Artist</th>
				                                    <th style="width: 8%;">Publish date</th>
				                                    <th style="width: 10%;">Liked</th>
				                                    <th style="width: 3%;">Status</th>
				                                    <th style="width: 27%;">Description</th>
				                                    <th style="width: 5%;">Action</th>

				                                 </tr>
				                              </thead>
				                              <tbody id="albums-body">  
				                              	<c:forEach var="album" items="${albums }" varStatus="i">
					                                 <tr>
					                                    <td class="text-center">${i.index + 1 }</td>
					                                    <td>
					                                       <img src="${pageContext.request.contextPath }/uploads/images/playlist/${album.thumbnail }" class="img-responsive avatar-150 rounded" alt="">
					                                    </td>
					                                    <td>${album.title }</td>
					                                    <td>
					                                    	<c:forEach var="account" items="${album.accounts }">
					                                    		<span>${account.nickname }</span>
					                                    	</c:forEach>
					                                    </td>
					                                    <td class="text-center"><fmt:formatDate value="${album.publishDate }" type="date" pattern="MM/dd/yyyy"/></td>
					                                    <td>${album.likes } <i class="fas fa-heart clr-red"></i></td>
					                                    <td class="text-center ">
					                                    	<c:if test="${album.status == 1 }"><a class="badge iq-bg-info toggle-album-status" data-id="${album.id}">Public</a></c:if>
					                                    	<c:if test="${album.status == 3 }"><a class="badge iq-bg-danger toggle-album-status" data-id="${album.id}">Hidden</a></c:if>
					                                    </td>
					                                    <td>
					                                       <p class="mb-0">${album.description }</p>
					                                    </td>
					                                    <td>
					                                       <div class="flex align-items-center text-center list-user-action">
					                                          <a class="bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit" 
					                                          	href="${pageContext.request.contextPath }/admin/playlist/edit?id=${album.id }">
					                                          	<i class="ri-pencil-line"></i>
					                                          </a>
					                                          <a class="bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete" 
					                                          	href="${pageContext.request.contextPath }/admin/playlist/delete?id=${album.id }">
					                                          	<i class="ri-delete-bin-line"></i>
					                                          </a>
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
						<!-- end Album Tab -->
					</div>
					<!-- end content tabs -->
				</div>
			</div>	
			
<script>

	$(document).ready(function(){
		$('.toggle-playlist-status').each(function(index){
		    $(this).on("click", function(){
		        var id = $(this).data("id")
		        var self = $(this);
			    $.ajax({
			    	type: 'GET',
			        data: {
			            id: id
			        },
			        url: '${pageContext.request.contextPath}/admin/playlist/edit-status',
			        success: function (playlist) {
			            var status = "";
			                if (playlist.status == 1) {
			                	self.text('Public');
			                	/* self.attr('data-badge', 'iq-bg-info'); */
			                } else if (playlist.status == 3) {
			                	self.text('Hidden') 
			                	self.attr('data-badge', 'iq-bg-danger');
			                }
			            
			        }
        		});
    		});
		});

		$('.toggle-album-status').each(function(index){
		    $(this).on("click", function(){
		        var id = $(this).data("id")
		        var self = $(this);
		        console.log("test")
			    $.ajax({
			    	type: 'GET',
			        data: {
			            id: id
			        },
			        url: '${pageContext.request.contextPath}/admin/playlist/edit-status',
			        success: function (playlist) {
			            var status = "";
			            
			                if (playlist.status == 1) {
			                	self.text('Public');
			                } else if (playlist.status == 3) {
			                	self.text('Hidden') 
			                	self.attr('data-badge', 'iq-bg-danger');
			                } 
			            
			        }
        		}); 
    		});
		});
	})
	
</script>
	</jsp:attribute>
</mt:adminTemplate>
