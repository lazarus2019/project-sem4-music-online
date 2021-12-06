<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="t" uri="http://mytags.com"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:adminTemplate title="Artist">
	<jsp:attribute name="content">
			<div class="row row--grid"> 
				<div class="col-12">
					<div class="Playlist">
						<!-- tabs nav -->
						<ul class="nav nav-tabs profile__tabs" id="profile__tabs"
						role="tablist">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#artist-tab"
							role="tab" aria-controls="artist-tab" aria-selected="true">Artist</a>
							</li>

							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#user-tab"
							role="tab" aria-controls="user-tab" aria-selected="false">User</a>
							</li>

						</ul>
						<!-- end tabs nav -->					
					</div>
				</div>
			
			</div> 
		<div class="tab-content">
		<div class="tab-pane fade show active" id="artist-tab" role="tabpanel">
		    <div class="row row--grid">
               <div class="col-12">
                  <div class="iq-card">
                     <div
								class="iq-card-header d-flex justify-content-between">
                        <div class="iq-header-title">
                           <h4 class="card-title">Singer Lists</h4>
                        </div>
                        <div
									class="iq-card-header-toolbar d-flex align-items-center">
                           <a
										href="${pageContext.request.contextPath }/admin/artist/artistRequest"
										style="margin-right: 20px" class="btn btn-primary">Request Artist</a>
                           <a
										href="${pageContext.request.contextPath }/admin/artist/addNewArtist"
										class="btn btn-primary">Add New Artist</a>
                        </div>
                        
                     </div>
                     <div class="iq-card-body">
                        <div class="table-responsive">
                           <table
										class="data-tables table table-striped table-bordered"
										style="width: 100%">
                              <thead>
                                 <tr>
                                    <th style="width: 5%;">No.</th>
                                    <th style="width: 5%;">Profile</th>
                                    <th style="width: 15%;">Singer Name</th>
                                    <th style="width: 12%;">Email</th>
                                    <th style="width: 8%">Birthday</th>
                                    <th style="width: 15%;">Country</th>
                                    <th style="width: 29%;">Description</th>
                                    <th style="width: 3%;">Status</th>
                                    <th style="width: 9%;">Join Date</th>
                                 </tr>
                              </thead>
                              <tbody>
                              	<c:forEach var="artist"
												items="${artists }" varStatus="i">
                                 <tr>
                                    <td>${i.index + 1 } </td>
                                    <td>
                                       <img
														src="${pageContext.request.contextPath }/uploads/images/artist/${artist.image}"
														class="img-fluid avatar-50 rounded" alt="author-profile">
                                    </td>
                                    <td>${artist.nickname }</td>
                                    <td>${artist.email }</td>
                                    <td>${artist.birthday }</td>
                                    <td>${artist.country.countryName }</td>
                                    <td>
                                       <p class="mb-0">${artist.description }</p>
                                    </td>
                                    <td class="text-center ">
					                   <c:if test="${artist.isActive == true }"><a class="badge iq-bg-info toggle-artist-active" data-id="${artist.id}">Active</a></c:if>
					                   <c:if test="${artist.isActive == false}"><a class="badge iq-bg-danger toggle-artist-active" data-id="${artist.id}">Block</a></c:if>
					                </td>
                                    <td>${artist.joinDate }</td>
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
		<div class="tab-pane fade" id="user-tab" role="tabpanel">
		    <div class="row row--grid">
               <div class="col-12">
                  <div class="iq-card">
                     <div
								class="iq-card-header d-flex justify-content-between">
                        <div class="iq-header-title">
                           <h4 class="card-title">User Lists</h4>
                        </div>

                        
                     </div>
                     <div class="iq-card-body">
                        <div class="table-responsive">
                           <table
										class="data-tables table table-striped table-bordered"
										style="width: 100%">
                              <thead>
                                 <tr>
                                    <th style="width: 5%;">No.</th>
                                    <th style="width: 5%;">Profile</th>
                                    <th style="width: 15%;">NickName</th>
                                    <th style="width: 12%;">Email</th>
                                    <th style="width: 8%">Birthday</th>
                                    <th style="width: 15%;">Country</th>
                                    <th style="width: 29%;">Description</th>
                                    <th style="width: 3%;">Status</th>
                                    <th style="width: 9%;">Join Date</th>
                                 </tr>
                              </thead>
                              <tbody>
                              	<c:forEach var="user"
												items="${users }" varStatus="i">
                                 <tr>
                                    <td>${i.index + 1 } </td>
                                    <td>
                                       <img
														src="${pageContext.request.contextPath }/uploads/images/artist/${user.image}"
														class="img-fluid avatar-50 rounded" alt="author-profile">
                                    </td>
                                    <td>${user.nickname }</td>
                                    <td>${user.email }</td>
                                    <td>${user.birthday }</td>
                                    <td>${user.country.countryName }</td>
                                    <td>
                                       <p class="mb-0">${user.description }</p>
                                    </td>
                                    <td class="text-center ">
					                   <c:if test="${user.isActive == true }"><a class="badge iq-bg-info toggle-artist-active" data-id="${user.id}">Active</a></c:if>
					                   <c:if test="${user.isActive == false}"><a class="badge iq-bg-danger toggle-artist-active" data-id="${user.id}">Block</a></c:if>
					                </td>
                                    <td>${user.joinDate }</td>
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
		
		
		<script>
		$(document).ready(function(){
			$('.toggle-artist-active').each(function(index){
			    $(this).on("click", function(){
			        var id = $(this).data("id")
			        var self = $(this);
				    $.ajax({
				    	type: 'GET',
				        data: {
				            id: id
				        },
				        url: '${pageContext.request.contextPath}/admin/artist/edit-status',
				        success: function (status) {
				                if (status == true) {
				                	self.text('Active');
				                	self.addClass('iq-bg-info')
				                	self.removeClass('iq-bg-danger')
				                } else{
				                	self.text('Block') 
				                	self.addClass('iq-bg-danger')
				                	self.removeClass('iq-bg-info')
				                }
				            }
	        		});
	    		});
			});
		}) ;
		</script>
	</jsp:attribute>
</mt:adminTemplate>