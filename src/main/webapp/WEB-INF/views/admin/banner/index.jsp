<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<mt:adminTemplate title="Aboutus">
	<jsp:attribute name="content">
		  <div class="row">
               <div class="col-sm-12">
                  <div class="iq-card">
                     <div class="iq-card-header d-flex justify-content-between">
                         <div class="iq-header-title">
                           <h4 class="card-title">Banners</h4> 
                         </div>
	                     <div class="iq-card-header-toolbar d-flex align-items-center">
						     <a href="${pageContext.request.contextPath }/admin/banner/add" class="btn btn-primary">Add new</a>
						 </div>
                     </div>
                     <div class="iq-card-body">
                     	 <c:forEach var="banner" items="${banners }">
                     	 	 <div>
		                           <div class="form-group">
		                           	   <div class="input-group">
			                               <input type="text" class="form-control active__status" readonly="readonly" value="${banner.title }">
			                               <div class="input-group-append" id="button-addon4">
										      <a class="btn btn-outline-primary " type="button" href="${pageContext.request.contextPath }/admin/banner/edit?id=${banner.id}"><i class="ri-pencil-line"></i></a>
										      <button class="btn btn-outline-primary delete-btn" type="button" data-id="${banner.id}"><i class="ri-delete-bin-line"></i></button>
										      <c:if test="${banner.status == true }">
										          <button class="badge iq-bg-info toggle-edit-status" type="button" data-id="${banner.id }">Public</button>
										   	  </c:if>
										      <c:if test="${banner.status == false }">
										          <button class="badge iq-bg-danger toggle-edit-status" type="button" data-id="${banner.id }">Hidden</button>
										   	  </c:if>
										   </div>
									   </div>
		                           </div>
		                           <div class="row">
			                           <div class="form-group col-md-6">
			                              <img src="${pageContext.request.contextPath }/uploads/images/banner/${banner.image }" class="rounded" width="650" height="240">
			                           </div>
			                           <div class="form-group col-md-6">
			                              <textarea class="form-control active__status" rows="5" readonly="readonly">${banner.description }</textarea>
			                           </div>
		                           </div>
		                      </div>
                     	 </c:forEach>
                     </div>
                  </div>
               </div>
            </div>	  
            
<script>
	$(document).ready(function(){
		$('.toggle-edit-status').each(function(index){
		    $(this).on("click", function(){
		        var id = $(this).data("id")
		        var self = $(this);
			    $.ajax({
			    	type: 'GET',
			        data: {
			            id: id
			        },
			        url: '${pageContext.request.contextPath}/admin/banner/edit-status',
			        success: function (status) {
			                if (status == true) {
			                	self.text('Public');
			                	self.addClass('iq-bg-info')
			                	self.removeClass('iq-bg-danger')
			                } else if (status == false) { 
			                	self.text('Hidden') 
			                	self.addClass('iq-bg-danger')
			                	self.removeClass('iq-bg-info')
			                }
			            
			        }
        		});
    		});
		}); 
	}); 
</script>   
<script type="module" defer>	
		import modal, { swalAlert, redirectAlert, singleAlert, confirmAlert, redirectAlertURLCustom, swalAlertWithoutButton } from '${pageContext.request.contextPath }/resources/user/js/notification.js';
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
		                    	url: '${pageContext.request.contextPath }/admin/banner/delete',
		                    	success: function (response) {
		                        	if (response) {
		                            	swalAlert(modal.MODAL_CONTENT.delete_success);
		                            	var url = '${pageContext.request.contextPath }/admin/banner';
		                            	window.location.replace(url);
		                        	}
		                        	if (!response) { 
										swalAlert(modal.MODAL_CONTENT.delete_error) 
									}
		                    	}
		                	})
		
		            	}, modal.MODAL_CONTENT.confirm_delete_dialog)
		    	})
			})
</script>           
	</jsp:attribute>
</mt:adminTemplate>