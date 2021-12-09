<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="t" uri="http://mytags.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:adminTemplate title="Manage Package">
	<jsp:attribute name="content">

            <div class="row row--grid">
				<div class="col-12">					

					<!-- content tabs -->
					<div class="tab-content">
						<!-- Package Tab -->
						<div class="tab-pane fade show active" id="playlist-tab" role="tabpanel">
							<div class="row row--grid">
								<div class="col-12">
									<div class="iq-card">
                     					<div class="iq-card-header d-flex justify-content-between">
                        					<div class="iq-header-title">
                           						<h4 class="card-title">Advertisement</h4>
                        					</div>       
                        					<div class="iq-card-header-toolbar d-flex align-items-center">
					                           <a href="${pageContext.request.contextPath }/admin/advertisement/add" class="btn btn-primary">Add New Advertisement</a>
					                        </div>                					
                     				 	</div>
				                     <div class="iq-card-body">
				                        <div class="table-responsive">
				                           <table class="data-tables table table-striped table-bordered" style="width:100%">
				                              <thead>
				                                 <tr>
				                                    <th style="height: 50px;">No</th>
				                                    <th style="height: 50px;">Thumbnail</th>
				                                    <th style="height: 50px;">Title</th>
				                                    <th style="height: 50px;">Duration</th>
				                                    <th style="height: 50px;">Status</th>
				                                    <th style="height: 50px;">Description</th>
				                                    <th style="height: 50px;">Action</th>
				                                 </tr>
				                              </thead>
				                              <tbody id="playlists-body">
				                              	 <c:forEach var="advertisement" items="${advertisements}" varStatus="i">
					                                 <tr style="height: 100px;" class="contact-row" data-id="${advertisement.id }">
					                                    <td class="text-center">${i.index + 1 }</td>
					                                    <td>
					                                       <img src="${pageContext.request.contextPath }/uploads/images/advertisement/${advertisement.thumbnail }" class="img-responsive avatar-150 rounded" alt="" width="200" height="200">
					                                    </td>
					                                    <td>${advertisement.title }</td>
					                                    <td>${advertisement.duration }s</td>
					                                    <td class="text-center contact-status">
					                                    	<c:if test="${advertisement.status == true }"><a id="status-btn" class="badge iq-bg-info toggle-advertisement-status" data-id="${advertisement.id }">Active</a>
					                                    	</c:if>
					                                    	<c:if test="${advertisement.status == false }"><a id="status-btn" class="badge iq-bg-danger toggle-advertisement-status" data-id="${advertisement.id }">Inactive</a>
					                                    	</c:if>
					                                    </td>					                                    
					                                    <td>
					                                    	<p class="mb-0 hidden-text">${advertisement.description }</p>
					                                    </td>
					                                    <td>
					                                       <div class="flex align-items-center text-center list-user-action">
					                                          <a class="bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit" 
					                                          	href="${pageContext.request.contextPath }/admin/advertisement/edit?id=${advertisement.id }">
					                                          	<i class="ri-pencil-line"></i>
					                                          </a>
					                                          <a class="bg-primary delete-package-btn" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete" 
					                                          	data-id="${advertisement.id}">
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
						<!-- end Package Tab -->									
						
					</div>
					
					
					<!-- end content tabs -->
				</div>
			</div>	

<script type="module">


			import modal, { swalAlert, redirectAlert, singleAlert, confirmAlert, redirectAlertURLCustom} from '${pageContext.request.contextPath }/resources/user/js/notification.js';

		$('.delete-package-btn').each(function(index){
		    $(this).on("click", function(){
		        var id = $(this).data("id")
		        confirmAlert(
		function(){
			$.ajax({
            	type: 'GET',
            	data: {
                	id: id
            	},
            	url: '${pageContext.request.contextPath }/admin/advertisement/delete',
            	success: function (response) {
					var url = ''
                    if(response == "OK"){
                        swalAlert(modal.MODAL_CONTENT.delete_success)
						url = '${pageContext.request.contextPath }/admin/advertisement'
						window.location.replace(url);
                    }
                    if(response == "ERROR"){
                        swalAlert(modal.MODAL_CONTENT.delete_error)
                    }                    
                    if(response == "MUST_HAVE_ONE"){
                        swalAlert(modal.MODAL_CONTENT.must_have_one)
                    }                    
            	}
        	})
			
		}, modal.MODAL_CONTENT.confirm_delete_dialog)
    		});
		});
	</script>
	
	<script>
	$('.toggle-advertisement-status').each(function (index) {
	    $(this).on("click", function () {
	        var id = $(this).data("id")
	        var self = $(this);
	        $.ajax({
	            type: 'GET',
	            data: {
	                id: id
	            },
	            url: '${pageContext.request.contextPath}/admin/advertisement/edit-status',
	            success: function (status) {
	                if (status) {
	                	$('.toggle-advertisement-status').each(function (index) {
							$(this).text('Inactive')
							$(this).addClass('iq-bg-danger')
							$(this).removeClass('iq-bg-info')
		                })
	                    self.text('Active')
	                    self.addClass('iq-bg-info')
	                    self.removeClass('iq-bg-danger')
	                }
	                if(!status) {
	                    self.text('Inactive')
	                    self.addClass('iq-bg-danger')
	                    self.removeClass('iq-bg-info')
	                }

	            }
	        });
	    });
	});
	</script>

	</jsp:attribute>
</mt:adminTemplate>