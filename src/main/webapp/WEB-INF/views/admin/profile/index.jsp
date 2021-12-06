<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="t" uri="http://mytags.com" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<mt:adminTemplate title="Profile">
	<jsp:attribute name="content">
		 <div class="row">
                  <div class="col-lg-12">
                     <div class="iq-card">
                        <div class="iq-card-body p-0">
                           <div class="iq-edit-list">
                              <ul class="iq-edit-profile d-flex nav nav-pills">
                                 <li class="col-md-3 p-0">
                                    <a class="nav-link active" data-toggle="pill" href="#personal-information">
                                    Personal Information
                                    </a>
                                 </li>
                                 <li class="col-md-3 p-0">
                                    <a class="nav-link" data-toggle="pill" href="#chang-pwd">
                                    Change Password
                                    </a>
                                 </li>
                                
                              </ul>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-12">
                     <div class="iq-edit-list-data">
                        <div class="tab-content">
                        	<c:set var="class1" value="${tab4 == true ? 'tab-pane fade':'tab-pane fade active show' } "></c:set>
                           <div class="${class1 }" id="personal-information" role="tabpanel">
                              <div class="iq-card">
                                 <div class="iq-card-header d-flex justify-content-between">
                                    <div class="iq-header-title">
                                       <h4 class="card-title">Personal Information</h4>
                                    </div>
                                 </div>
                                 <div class="iq-card-body">
                                    <s:form class="iq-card-body" action="${pageContext.request.contextPath }/admin/profile/updateProfile" method="POST" modelAttribute="accountSignined" enctype="multipart/form-data">
                                       <div class="form-group row align-items-center">
                                          <div class="col-md-12">
                                             <div class="profile-img-edit">
                                                <img class="rounded-circle img-fluid" id="photoAccount"  src="${pageContext.request.contextPath }/uploads/images/artist/${accountSignined.image}" alt="profile-pic">
                                                <div class="p-image">
                                                   <i class="ri-pencil-line upload-button"></i>
                                                   <input onchange="previewChangeAccountImage(this)" class="file-upload" name="photoAccount" type="file" accept="image/*"/>
                                                </div>
                                             </div>
                                          </div>
                                       </div>
                                       <div class=" row align-items-center">
                                          <div class="form-group col-sm-6">
                                             <label for="fname">First Name:</label>
                                             <s:input type="text" path="firstname" class="form-control" id="fname" />
                                          </div>
                                          <div class="form-group col-sm-6">
                                             <label for="lname">Last Name:</label>
                                             <s:input type="text" path="lastname" class="form-control" id="lname" />
                                          </div>

                                          <div class="form-group col-sm-6">
                                             <label for="cname">Gender:</label>
                                       		 <s:select path="gender" class="form-control" id="cname" items="${genders}" >    </s:select>
                                          </div>
                                          <div class="form-group col-sm-6">
                                             <label for="dob">Date Of Birth:</label>
                                             <s:input path="birthday" class="form-control" id="birthdayPicker" />
                                          </div>
                                          
                                          <div class="form-group col-sm-12">
                                             <label>Country:</label>
                                             <s:select path="country" class="form-control" id="cname" items="${countries}" itemLabel="countryName" itemValue="id" >    </s:select>
                                          </div>
                                          
                                          <div class="form-group col-sm-12">
                                             <label>Description:</label>
                                             <s:textarea path="description" class="form-control" name="address" rows="5" style="line-height: 22px;"/>
                                          </div>
                                       </div>
                                       <button type="submit" class="btn btn-primary mr-2">Submit</button>
                                       <button type="reset" class="btn iq-bg-danger">Cancel</button>
                                    </s:form>
                                 </div>
                              </div>
                           </div>
                           
                           <c:set var="class2" value="${tab4 == true ? 'tab-pane fade active show':'tab-pane fade' } "></c:set>
                           <div class="${class2}" id="chang-pwd" role="tabpanel">
                              <div class="iq-card">
                                 <div class="iq-card-header d-flex justify-content-between">
                                    <div class="iq-header-title">
                                       <h4 class="card-title">Change Password</h4>
                                    </div>
                                 </div>
                                 <div class="iq-card-body">
                                    <form action="${pageContext.request.contextPath }/admin/profile/updateAccountPasswordFromSetting"
											method="POST" name="changePassword"
											oninput='confirmpass.setCustomValidity(confirmpass.value != newpass.value ? "Confirm Passwords do not match." : "")'>
                                       <div class="form-group">
                                          <label for="cpass">Current Password:</label>
                                          <a href="javascripe:void();" class="float-right">Forgot Password</a>
                                          <input id="oldpass" type="password" name="oldpass" class="form-control"
															required="required">
										<span class="text-danger"> ${msgPassInvalid }</span>
                                       </div>
                                       <div class="form-group">
                                          <label for="newpass">New Password:</label>
                                          <input id="newpass" type="password" name="newpass" class="form-control"
															required="required">
                                       </div>
                                       <div class="form-group">
                                          <label for="confirmpass">Verify Password:</label>
                                          <input id="confirmpass" type="password" name="confirmpass"
															class="form-control" required="required">
                                       </div>
                                       <button type="submit" class="btn btn-primary mr-2">Submit</button>
                                    </form>
                                 </div>
                              </div>
                           </div>

                        </div>
                     </div>
                  </div>
               </div>
            <script>
            $( document ).ready(function() {
         	    console.log( "ready!" );
    			$( function() {
    				 $("#birthdayPicker").datepicker();
    			} );
         	    
         	}); 
         function previewChangeAccountImage(e) {
     	    const img = document.getElementById("photoAccount") || null
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