<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="t" uri="http://mytags.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:adminTemplate title="Artist">
	<jsp:attribute name="content">
		            <div class="row">
               <div class="col-sm-12">
                  <div class="iq-card">
                     <div class="iq-card-header d-flex justify-content-between">
                        <div class="iq-header-title">
                           <h4 class="card-title">Request Singer Lists</h4>
                        </div>
                        <div class="iq-card-header-toolbar d-flex align-items-center">
                           <a href="${pageContext.request.contextPath }/admin/artist/addNewArtist" class="btn btn-primary">Add New Artist</a>
                        </div>
                     </div>
                     <div class="iq-card-body">
                        <div class="table-responsive">
                           <table class="data-tables table table-striped table-bordered" style="width:100%">
                              <thead>
                                 <tr>
                                    <th style="width: 5%;">No.</th>
                                    <th style="width: 5%;">Profile</th>
                                    <th style="width: 15%;">Singer Name</th>
                                    <th style="width: 15%;">Email</th>
                                    <th style="width: 15%;">Country</th>
                                    <th style="width: 35%;">Description</th>                                    
                                    <th style="width: 10%;">Action</th>
                                 </tr>
                              </thead>
                              <tbody id="tableAccountRequest">
                              	<c:forEach var="artist" items="${artists }" varStatus="i">
                                 <tr>
                                    <td>${i.index + 1 } </td>
                                    <td>
                                       <img src="${pageContext.request.contextPath }/uploads/images/artist/${artist.image}" class="img-fluid avatar-50 rounded" alt="author-profile">
                                    </td>
                                    <td>${artist.nickname }</td>
                                    <td>${artist.email }</td>
                                    <td>${artist.country.countryName }</td>
                                    <td>
                                       <p class="mb-0">${artist.description }</p>
                                    </td>
                                    <td>
                                       <div class="flex align-items-center list-user-action">
                                          <a class="bg-primary" data-toggle="tooltip" data-placement="top" id="acceptArtist" onclick="acceptArtist(this)" title="" data-id="${artist.id}" data-original-title="Accept" ><i class="ri-check-line"></i></a>
                                          <a class="bg-primary" data-toggle="tooltip" data-placement="top" id="rejectArtist" onclick="rejectArtist(this)" title="" data-id="${artist.id}" data-original-title="Reject" ><i class="ri-close-fill"></i></a>
                                       	
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
         	function acceptArtist(e){
         		var id = $(e).data("id")
		        var self = $(e);
		        console.log("id : " + id) 
		        $.ajax({
			         
		            type: 'GET',
		            data: {
			            id: id
			        },
		            url: '${pageContext.request.contextPath}/ajaxArtist/acceptArtist',
		            success: function (data, status) {
			            console.log(data.length)
			            console.log(status) ;
		            	if(status) {
           					Swal.fire(
           						  'Congratulations!',
           						  'Your are an artist from now!',
           						  'success'
           						)
               			}
           				else {
           					Swal.fire({
           					  icon: 'error',
           					  title: 'Oops...',
           					  text: 'Something went wrong!'
           					}) 
               			} 
						var result = "" ; 
						for (var i = 0; i < data.length; i++) {
							result += '<tr> ' ; 
							result += '<td> ' + ( i + 1 ) + '</td>' ;
							result += '<td>  <img src="${pageContext.request.contextPath }/uploads/images/artist/' + data[i].image + '" class="img-fluid avatar-50 rounded" alt="author-profile"> </td>'
                            result += '<td>'+ data[i].nickname +'</td>' ; 
                            result += '<td>'+ data[i].email +'</td>' ;   
                            result += '<td>' + data[i].country+ '</td>' ;
                            result += '<td> <p class="mb-0">' +data[i].description+ '</p> </td>' ;
                            result += '<td>  <div class="flex align-items-center list-user-action">' ; 
                            result += '<a class="bg-primary" data-toggle="tooltip" data-placement="top" id="acceptArtist" onclick="acceptArtist(this)" title="" data-id="'+data[i].id+'" data-original-title="Accept" ><i class="ri-check-line"></i></a>' ; 
                            result += '<a class="bg-primary" data-toggle="tooltip" data-placement="top" id="rejectArtist" onclick="rejectArtist(this)" title="" data-id="'+data[i].id+'" data-original-title="Reject" ><i class="ri-close-fill"></i></a>' ; 
                            result += '</div> </td>  </tr>' ;							
						}
						$("#tableAccountRequest").html(result) ;


               			
		            },
		        })  
			}	

         	function rejectArtist(e){
         		var id = $(e).data("id")
		        var self = $(e);
		        console.log("id : " + id) 
		        $.ajax({
			         
		            type: 'GET',
		            data: {
			            id: id
			        },
		            url: '${pageContext.request.contextPath}/ajaxArtist/rejectArtist',
		            success: function (data) {
			            console.log(data) ;
		            	if(data) {
           					Swal.fire({
           							icon: 'error',
                 					  title: 'Oops...',
                 					  text: 'Your just reject him request :(('
                   			
           					})
               			}
           				else {
           					Swal.fire({
           					  icon: 'error',
           					  title: 'Oops...',
           					  text: 'Something went wrong!'
           					}) 
               			} 

		            	var result = "" ; 
						for (var i = 0; i < data.length; i++) {
							result += '<tr> ' ; 
							result += '<td> ' + ( i + 1 ) + '</td>' ;
							result += '<td>  <img src="${pageContext.request.contextPath }/uploads/images/artist/' + data[i].image + '" class="img-fluid avatar-50 rounded" alt="author-profile"> </td>'
                            result += '<td>'+ data[i].nickname +'</td>' ; 
                            result += '<td>'+ data[i].email +'</td>' ;   
                            result += '<td>' + data[i].country+ '</td>' ;
                            result += '<td> <p class="mb-0">' +data[i].description+ '</p> </td>' ;
                            result += '<td>  <div class="flex align-items-center list-user-action">' ; 
                            result += '<a class="bg-primary" data-toggle="tooltip" data-placement="top" id="acceptArtist" onclick="acceptArtist(this)" title="" data-id="'+data[i].id+'" data-original-title="Accept" ><i class="ri-check-line"></i></a>' ; 
                            result += '<a class="bg-primary" data-toggle="tooltip" data-placement="top" id="rejectArtist" onclick="rejectArtist(this)" title="" data-id="'+data[i].id+'" data-original-title="Reject" ><i class="ri-close-fill"></i></a>' ; 
                            result += '</div> </td>  </tr>' ;							
						}
						$("#tableAccountRequest").html(result) ;

		            }
		        })  
			}	
         	
    				
         	</script>
         
	</jsp:attribute>
</mt:adminTemplate>