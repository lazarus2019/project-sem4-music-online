<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="t" uri="http://mytags.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>

<mt:adminTemplate title="Add New Admin">
	<jsp:attribute name="content">
		 <div class="row">
		                    
		         <s:form class="row" action="${pageContext.request.contextPath }/admin/manageAdmin/addNewAdmin" method="POST" modelAttribute="accountNew" enctype="multipart/form-data">
                  <div class="col-lg-3">
                     <div class="iq-card">
                        <div class="iq-card-header d-flex justify-content-between">
                           <div class="iq-header-title">
                              <h4 class="card-title">Profile Admin</h4>
                           </div>
                        </div>
                        <div class="iq-card-body">
                           
                              <div class="form-group">
                                 <div class="add-img-user profile-img-edit">
                                    <img class="rounded-circle img-fluid" id="imageArtist"  src="${pageContext.request.contextPath}/resources/admin/images/user/11.png" alt="profile-pic">
                                    <div class="p-image">
                                       <a href="javascript:void();" class="upload-button btn iq-bg-primary">File Upload</a>
                                       <input class="file-upload"  onchange="previewChangeAccountImage(this)" name="imageArtist" type="file" accept="image/*">
                                    </div>
                                 </div>
                                 <div class="img-extension mt-3">
                                    <div class="d-inline-block align-items-center">
                                       <span>Only</span>
                                       <a href="javascript:void();">.jpg</a>
                                       <a href="javascript:void();">.png</a>
                                       <a href="javascript:void();">.jpeg</a>
                                       <span>allowed</span>
                                    </div>
                                 </div>
                              </div>                           
                        </div>   
                     </div>
                  </div>
                  <div class="col-lg-9">
                     <div class="iq-card">
                        <div class="iq-card-header d-flex justify-content-between">
                           <div class="iq-header-title">
                              <h4 class="card-title">New Admin Information</h4>
                           </div>
                        </div>
                        <div class="iq-card-body">
                           <div class="new-user-info">
                                 <div class="row">
                                    <div class="form-group col-md-6">
                                       <label for="fname">First Name:</label>
                                       <s:input type="text" class="form-control" path="firstname" required="required"  id="fname" placeholder="First Name"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                       <label for="lname">Last Name:</label>
                                       <s:input type="text" class="form-control" path="lastname" required="required" id="lname" placeholder="Last Name"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                       <label for="email">Email:</label>
                                       <s:input type="email" path="email" class="form-control" required="required" id="email" placeholder="Email"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                       <label for="pass">Password:</label>
                                       <s:input type="password" path="password" class="form-control" required="required" id="pass" placeholder="Password"/>
                                    </div>
                                    
                                 </div>
                                 
                                 <button type="submit" class="btn btn-primary">Add New Admin</button>
                             
                           </div>
                        </div>
                     </div>
                  </div>
              	 </s:form>
               
               </div>
      			<script>
         function previewChangeAccountImage(e) {
     	    const img = document.getElementById("imageArtist") || null
     	    const file = e.files[0];
     	    if (file) {
     	        const reader = new FileReader();
     	        reader.onload = function() {
     	            const result = reader.result;
     	            if (img) {
     	                img.src = result
     	            }
     	        }

     	        reader.readAsDataURL(file);
     	    }
     	}
         </script>
         
	</jsp:attribute>
</mt:adminTemplate>