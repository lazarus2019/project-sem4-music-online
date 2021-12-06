<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="t" uri="http://mytags.com"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:adminTemplate title="Artist">
	<jsp:attribute name="content">
		    <div class="row row--grid">
               <div class="col-12">
                  <div class="iq-card">
                     <div
								class="iq-card-header d-flex justify-content-between">
                        <div class="iq-header-title">
                           <h4 class="card-title">Manage Admin</h4>
                        </div>
                        <div class="iq-card-header-toolbar d-flex align-items-center">
                        	 <a href="${pageContext.request.contextPath }/admin/manageAdmin/addNewAdmin" class="btn btn-primary">Add New Admin</a>
                        </div>
                        
                     </div>
                     <div class="iq-card-body">
                        <div class="table-responsive">
                           <table class="data-tables table table-striped table-bordered" style="width: 100%">
                              <thead>
                                 <tr>
                                    <th style="width: 4%;">No.</th>
                                    <th style="width: 5%;">Profile</th>
                                    <th style="width: 15%;">Name</th>
                                    <th style="width: 12%;">Email</th>
                                    <th style="width: 8%">Birthday</th>
                                    <th style="width: 15%;">Country</th>
                                    <th style="width: 29%;">Description</th>
                                    <th style="width: 3%;">Status</th>
                                    <th style="width: 10%;">Join Date</th>
                                 </tr>
                              </thead>
                              <tbody>
                              	<c:forEach var="admin"
												items="${admins }" varStatus="i">
                                 <tr>
                                    <td>${i.index + 1 } </td>
                                    <td>
                                       <img
														src="${pageContext.request.contextPath }/uploads/images/artist/${admin.image}"
														class="img-fluid avatar-50 rounded" alt="author-profile">
                                    </td>
                                    <td>${admin.nickname }</td>
                                    <td>${admin.email }</td>
                                    <td>${admin.birthday }</td>
                                    <td>${admin.country.countryName }</td>
                                    <td>
                                       <p class="mb-0">${admin.description }</p>
                                    </td>
                                    <td class="text-center ">
					                   <c:if test="${admin.isActive == true }"><a class="badge iq-bg-info toggle-artist-active" data-id="${admin.id}">Active</a></c:if>
					                   <c:if test="${admin.isActive == false}"><a class="badge iq-bg-danger toggle-artist-active" data-id="${admin.id}">Block</a></c:if>
					                </td>
                                    <td>${admin.joinDate }</td>
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