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
                           <h4 class="card-title">Singer Lists</h4>
                        </div>
                        <div class="iq-card-header-toolbar d-flex align-items-center">
                           <a href="${pageContext.request.contextPath }/admin/artist/artistRequest" style="margin-right: 20px" class="btn btn-primary">Request Artist</a>
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
                              <tbody>
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
                                          <a class="bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit" href="admin-add-category.html"><i class="ri-pencil-line"></i></a>
                                          <a class="bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete" href="#"><i class="ri-delete-bin-line"></i></a>
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
         
	</jsp:attribute>
</mt:adminTemplate>