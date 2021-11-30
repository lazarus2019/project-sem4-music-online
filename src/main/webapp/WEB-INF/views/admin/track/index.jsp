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
				                           <table class="data-tables table table-striped table-bordered" style="width:100%">
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
					                                    	<c:forEach var="account" items="${track.account }">
					                                    		<span>${account.nickname }</span>
					                                    		<br>   
					                                    	</c:forEach>
					                                    </td>
					                                    <td class="text-center"><fmt:formatDate value="${track.publishDate }" type="date" pattern="MM/dd/yyyy"/></td>
					                                    <td class="text-center">${track.likes } <i class="fas fa-heart clr-red"></i></td>
					                                    <td class="text-center">${track.listens } <i class="fas fa-headphones-alt"></i></i></td>
					                                    <td class="text-center">${track.genres.name }</td>
					                                    <td class="text-center"><t:trackTime totalSeconds="${track.duration }"/></td>
					                                    <td class="text-center">
					                                    	<c:if test="${track.statusId == 1 }"><a id="status-btn" class="badge iq-bg-info toggle-track-status" data-id="${track.id}">Public</a></c:if>
					                                    	<c:if test="${track.statusId == 2 }"><a class="badge iq-bg-danger">Pending</a></c:if>
					                                    	<c:if test="${track.statusId == 3 }"><a id="status-btn" class="badge iq-bg-danger toggle-track-status" data-id="${track.id}">Hidden</a></c:if>
					                                    </td>
					                                    <td>
					                                       <div class="flex align-items-center text-center list-user-action">
					                                          <a class="bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit" 
					                                          	href="${pageContext.request.contextPath }/admin/manage-track/edit?id=${track.id }">
					                                          	<i class="ri-pencil-line"></i>
					                                          </a>
					                                          <a class="bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete" 
					                                          	href="${pageContext.request.contextPath }/admin/manage-track/delete?id=${track.id }">
					                                          	<i class="ri-delete-bin-line"></i>
					                                          </a>
					                                          <a class="bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="View lyrics" 
					                                          	href="${pageContext.request.contextPath }/admin/playlist/delete?id=${playlist.id }">
					                                          	<i class="ri-bill-line"></i>
					                                          </a>
					                                          <a class="bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Add to Playlist" 
					                                          	href="${pageContext.request.contextPath }/admin/playlist/add-to-playlist?id=${playlist.id }">
					                                          	<i class="ri-add-fill"></i>
					                                          </a>
					                                       </div>
					                                       <c:if test="${track.statusId == 2 }">
						                                       <div class="flex align-items-center text-center check-action">
						                                       	  <a class="bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Check for public track" 
						                                          	 href="${pageContext.request.contextPath }/admin/playlist/delete?id=${playlist.id }">
						                                          	 <i class="ri-share-forward-2-fill"></i>
						                                          </a>
						                                       </div>
					                                       </c:if>
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
			                } else if (status == 3) {
			                	self.text('Hidden'); 
			                }
			            
			        }
        		});
    		});
		});
	})
	
</script>
	</jsp:attribute>
</mt:adminTemplate>
