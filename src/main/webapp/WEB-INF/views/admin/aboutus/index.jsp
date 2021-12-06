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
                           <h4 class="card-title">About Us</h4>
                         </div>
	                     <div class="iq-card-header-toolbar d-flex align-items-center">
						     <a href="${pageContext.request.contextPath }/admin/aboutus/add" class="btn btn-primary">Add new</a>
						 </div>
                     </div>
                     <div class="iq-card-body">
                     	 <c:forEach var="about" items="${aboutus }">
                     	 	 <div>
		                           <div class="form-group">
		                           	   <div class="input-group">
			                               <input type="text" class="form-control" readonly="readonly" value="${about.title }">
			                               <div class="input-group-append" id="button-addon4">
										      <a class="btn btn-outline-primary" type="button" href="${pageContext.request.contextPath }/admin/aboutus/edit?id=${about.id}"><i class="ri-pencil-line"></i></a>
										      <button class="btn btn-outline-primary delete-btn" type="button" data-id="${about.id}"><i class="ri-delete-bin-line"></i></button>
										   </div>
									   </div>
		                           </div>
		                           <div class="form-group ">
		                              <textarea class="form-control" rows="5" readonly="readonly">${about.content }</textarea>
		                           </div>
		                      </div>
                     	 </c:forEach>
                     </div>
                  </div>
               </div>
            </div>	
         
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
		                    	url: '${pageContext.request.contextPath }/admin/aboutus/delete',
		                    	success: function (response) {
		                        	if (response) {
		                            	swalAlert(modal.MODAL_CONTENT.delete_success);
		                            	var url = '${pageContext.request.contextPath }/admin/aboutus';
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