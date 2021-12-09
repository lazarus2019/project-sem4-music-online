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
                           <h4 class="card-title">Manage Genres</h4>
                        </div>
                        <div class="iq-card-header-toolbar d-flex align-items-center">
                        	 <a href="${pageContext.request.contextPath }/admin/genres/add" class="btn btn-primary">Add New Genres</a>
                        </div>
                        
                     </div>
                     <div class="iq-card-body">
                        <div class="table-responsive">
                           <table class="data-tables table table-striped table-bordered" style="width: 100%">
                              <thead>
                                 <tr>
                                    <th style="width: 4%;">No.</th>
                                    <th style="width: 5%;">Thumbnail</th>
                                    <th style="width: 15%;">Name</th>
                                    <th style="width: 10%;">Action</th>
                                 </tr>
                              </thead>
                              <tbody>
                              	<c:forEach var="gen"
												items="${genres }" varStatus="i">
                                 <tr>
                                    <td>${i.index + 1 } </td>
                                    <td>
                                       <img
														src="${pageContext.request.contextPath }/uploads/images/genres/${gen.thumbnail}"
														class="img-fluid avatar-50 rounded" alt="genres-thumbnail">
                                    </td>
                                    <td>${gen.name }</td>
                                    <td>
                                    <div class="flex align-items-center text-center list-user-action">
                                    	<a class="bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit" 
					                        href="${pageContext.request.contextPath }/admin/genres/edit?id=${gen.id }">
                                        	 <i class="ri-pencil-line"></i>
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
		
		
		<script>
		function delete_genres(e) {
		    var id = $(e).data("id");
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
		                    id: id
		                },
		                url: '${pageContext.request.contextPath}/admin/genres/delete-genres',
		                success: function (tracks) {
		                    if (tracks.length <= 0) {
		                        result += "<h4>There are no songs in this playlist yet</h4>";
		                    }
		                    Swal.fire({
		                        icon: 'success',
		                        title: 'Deleted!',
		                        text: 'Your data/change have been saved',
		                        showConfirmButton: false,
		                        timer: 1500
		                    });
		                    var result = "";
		                    for (var i = 0; i < tracks.length; i++) {
		                        result += "<div class='d-flex justify-content-between align-items-center p-3'>";
		                        result += "<div class='d-flex flex-row align-items-center'> <i class='fa fa-music color'></i> <small class='ml-2' style='font-size: larger;'>" + tracks[i].title + "</small> </div>";
		                        result += "<div class='d-flex flex-row'>";
		                        if (tracks[i].statusId == 1) {
		                            result += "<i class='fa fa-check color mr-15'></i>";
		                        } else if (tracks[i].statusId == 2) {
		                            result += "<i class='ri-upload-2-fill mr-15'></i>";
		                        } else if (tracks[i].statusId == 3) {
		                            result += "<i class='fas fa-times mr-15'></i>";
		                        }
		                        result += "<button class='delete-action center-item'><i class='ri-delete-bin-line' onclick='delete_track(this)' data-id='" + tracks[i].id + "'></i></button>"
		                        result += "</div>";
		                        result += "</div>";
		                    }
		                    $('.track-card').html(result);
		                }
		            });
		        }
		    })
		}
		</script>
	</jsp:attribute>
</mt:adminTemplate>