
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>


<mt:userTemplate title="Profile">
	<jsp:attribute name="content">
        <div class="container-fluid">
            <div class="row row--grid">
                <div class="col-12">
                    <div class="main__title main__title--page">
                        <h1>Profile</h1>
                    </div>
                </div>
                <!-- end title -->
            </div>

				<div class="col-12 col-md-12">
                     <div class="iq-card">
                        <div class="iq-card-body profile-page">
                           <div class="profile-header">
                              <div class="cover-container text-center ">
                              	<c:if test="${empty accountSignined.image}">
                                 <img id="photoAccount"
									src="${pageContext.request.contextPath }/resources/admin/images/user/1.jpg"
									alt="profile-bg" class="rounded-circle img-fluid">
								</c:if>	
                              	<c:if test="${not empty accountSignined.image}">
                                 <img id="photoAccount"
									src="${pageContext.request.contextPath }/uploads/images/artist/${accountSignined.image}"
									alt="profile-bg" class="rounded-circle img-fluid">
								</c:if>	
								
                                   	<input class="file-upload" id="fileupload" name="fileupload" onchange="previewChangeAccountImage(this)" type="file" accept="image/*">
                                   	<label  for="fileupload">
                                   		<i class="ri-pencil-line upload-button"></i>
                                   	</label> 
                                 <div class="profile-detail mt-3">
                                    <h3>${accountSignined.nickname }</h3>
                                    <p>${accountSignined.description }</p>
                                 </div>
                                 <!-- <div class="iq-social d-inline-block align-items-center">
                                    <ul class="list-inline d-flex p-0 mb-0 align-items-center">
                                       <li>
                                          <a href="#" class="avatar-40 rounded-circle bg-primary mr-2 facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                       </li>
                                       <li>
                                          <a href="#" class="avatar-40 rounded-circle bg-primary mr-2 twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                       </li>
                                       <li>
                                          <a href="#" class="avatar-40 rounded-circle bg-primary mr-2 youtube"><i class="fa fa-youtube-play" aria-hidden="true"></i></a>
                                       </li>
                                       <li >
                                          <a href="#" class="avatar-40 rounded-circle bg-primary pinterest"><i class="fa fa-pinterest-p" aria-hidden="true"></i></a>
                                       </li>
                                    </ul>
                                 </div>
                              -->
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="iq-card">
                        <div
						class="iq-card-header d-flex justify-content-between align-items-center mb-0">
                           <div class="iq-header-title">
                              <h4 class="card-title mb-0">Personal Details</h4>
                           </div>
                        </div>
                        <div class="iq-card-body">
                           <ul class="list-inline p-0 mb-0">
                              <li>
                                 <div
									class="d-flex align-items-center justify-content-between mb-3">
                                    <h6>Birthday</h6>
                                    <p class="mb-0">
										<fmt:formatDate pattern="dd-MM-yyyy"
											value="${accountSignined.birthday }" />
									</p>
                                 </div>
                              </li>
                              <li>
                                 <div
									class="d-flex align-items-center justify-content-between mb-3">
                                    <h6>Gender</h6>
                                    <p class="mb-0"> 
                                    	<c:if
											test="${accountSignined.gender == null }">Not selected yet</c:if> 
                                    		${accountSignined.gender }</p>
                                 </div>
                              </li>

                              <li>
                                 <div
									class="d-flex align-items-center justify-content-between mb-3">
                                    <h6>Email</h6>
                                    <p class="mb-0"> 
                                    	<c:if
											test="${accountSignined.email == null }">Not selected yet</c:if> 
                                    		${accountSignined.email }</p>
                                 </div>
                              </li>
                              <li>
                                 <div
									class="d-flex align-items-center justify-content-between mb-3">
                                    <h6>Join Date</h6>
                                    <p class="mb-0">
										<fmt:formatDate pattern="dd-MM-yyyy"
											value="${accountSignined.joinDate }" />
									</p>
                                 </div>
                              </li>
                              <li>
                                 <div
									class="d-flex align-items-center justify-content-between mb-3">
                                    <h6>Country</h6>
                                    <p class="mb-0"> 
                                    	<c:if
											test="${accountSignined.country == null }">Not selected yet</c:if> 
                                    		${accountSignined.country.countryName }</p>
                                 </div>
                              </li>
                              <li>
                                 <div
									class="d-flex align-items-center justify-content-between mb-3">
                                    <h6>Follower</h6>
                                    <p class="mb-0">
										<c:if test="${accountSignined.follower == null }">Not selected yet</c:if> 
                                    		${accountSignined.follower }</p>
                                 </div>
                              </li>
                              <li>
                              	<div
									class="d-flex align-items-center justify-content-between mb-3">
                                    <h6>Package Plan</h6>
                                    <p class="mb-0"> ${accountPackage.servicePackage.name } Plan </p>
                                 </div>
                              </li>
                              <c:if test="${accountPackage.servicePackage.name != 'Basic' }">
                              <li>
                              	<div
									class="d-flex align-items-center justify-content-between mb-3">
                                    <h6>Expiration Date </h6>
                                    <p class="mb-0"> <fmt:formatDate pattern="dd-MM-yyyy"	value="${accountPackage.expirationDate }" />  </p>
                                 </div>
                             </li>
                              </c:if>
                                         	
                              
                              <c:if test="${accountSignined.isRequest == false && accountSignined.isArtist == false}"> 
                              <li>
                                 <div
									class="d-flex align-items-center justify-content-between mb-3">
                                    <h6>Request Becoming Artist </h6>  
                                    <button
										class=" hero__btn hero__btn--green" id="buttonRequest"
										onclick="preSendRequest()"> Send Request </button>
                                 </div>
                              </li>
                              </c:if>
                           </ul>
                        </div>
                     </div>
                     
                  </div>

				<div class="row row--grid">
                <div class="col-12">
                    <div class="profile">
                        <div class="profile__user">
                            <div class="profile__avatar">
                                <img
									src="${pageContext.request.contextPath }/uploads/images/artist/${accountSignined.image}"
									alt="">
                            </div>
                            <div class="profile__meta">
                                <h3>${accountSignined.lastname}  ${accountSignined.firstname}</h3>
                            </div>
                        </div>
                        <!-- tabs nav -->
                        <ul class="nav nav-tabs profile__tabs"
							id="profile__tabs" role="tablist">
                           

                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab"
								href="#tab-2" role="tab" aria-controls="tab-2"
								aria-selected="false">Orders</a>
                            </li>


                            <li class="nav-item">
                            	<c:set var="classtab4"
									value="${tab4 == true  ? 'nav-link active' : 'nav-link'}"></c:set>
                                <a class="${ classtab4}"
								data-toggle="tab" href="#tab-4" role="tab" aria-controls="tab-4"
								aria-selected="false">Settings</a>
                            </li>
                        </ul>
                        <!-- end tabs nav -->

                        <button class="profile__logout" type="button">
							<span>Sign out</span>
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
								<path
									d="M4,12a1,1,0,0,0,1,1h7.59l-2.3,2.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l4-4a1,1,0,0,0,.21-.33,1,1,0,0,0,0-.76,1,1,0,0,0-.21-.33l-4-4a1,1,0,1,0-1.42,1.42L12.59,11H5A1,1,0,0,0,4,12ZM17,2H7A3,3,0,0,0,4,5V8A1,1,0,0,0,6,8V5A1,1,0,0,1,7,4H17a1,1,0,0,1,1,1V19a1,1,0,0,1-1,1H7a1,1,0,0,1-1-1V16a1,1,0,0,0-2,0v3a3,3,0,0,0,3,3H17a3,3,0,0,0,3-3V5A3,3,0,0,0,17,2Z" /></svg>
						</button>
                    </div>

                    <!-- content tabs -->
                    <div class="tab-content">

                        <div class="tab-pane fade" id="tab-2"
							role="tabpanel">
                            <div class="row row--grid">
                                <div class="col-12">
                                    <div class="dashbox">
                                        <div class="dashbox__table-wrap">
                                            <div
												class="dashbox__table-scroll">
                                                <table
													class="main__table">
                                                    <thead>
                                                        <tr>
                                                            <th></th>
                                                            <th><a
																href="#">No. <svg xmlns="http://www.w3.org/2000/svg"
																		viewBox="0 0 24 24">
																		<path
																			d="M9.71,10.21,12,7.91l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Zm4.58,4.58L12,17.09l-2.29-2.3a1,1,0,0,0-1.42,1.42l3,3a1,1,0,0,0,1.42,0l3-3a1,1,0,0,0-1.42-1.42Z" /></svg></a></th>
                                                            <th><a
																href="#" class="active">Title <svg
																		xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
																		<path
																			d="M17,13.41,12.71,9.17a1,1,0,0,0-1.42,0L7.05,13.41a1,1,0,0,0,0,1.42,1,1,0,0,0,1.41,0L12,11.29l3.54,3.54a1,1,0,0,0,.7.29,1,1,0,0,0,.71-.29A1,1,0,0,0,17,13.41Z" /></svg></a></th>
                                                            <th><a
																href="#" class="active">Date <svg
																		xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
																		<path
																			d="M17,9.17a1,1,0,0,0-1.41,0L12,12.71,8.46,9.17a1,1,0,0,0-1.41,0,1,1,0,0,0,0,1.42l4.24,4.24a1,1,0,0,0,1.42,0L17,10.59A1,1,0,0,0,17,9.17Z" /></svg></a></th>
                                                            <th><a
																href="#">Total <svg
																		xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
																		<path
																			d="M9.71,10.21,12,7.91l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Zm4.58,4.58L12,17.09l-2.29-2.3a1,1,0,0,0-1.42,1.42l3,3a1,1,0,0,0,1.42,0l3-3a1,1,0,0,0-1.42-1.42Z" /></svg></a></th>
                                                            <th><a
																href="#">Status <svg
																		xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
																		<path
																			d="M9.71,10.21,12,7.91l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Zm4.58,4.58L12,17.09l-2.29-2.3a1,1,0,0,0-1.42,1.42l3,3a1,1,0,0,0,1.42,0l3-3a1,1,0,0,0-1.42-1.42Z" /></svg></a></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach
															var="order" items="${accountOrder}" varStatus="loop">
                                                        <tr>
                                                            <td>
                                                                <div
																		class="main__table-text ">${loop.index + 1}</div>
                                                            </td>
                                                            <td>
                                                                <div
																		class="main__table-img">
                                                                    <img
																			src="${pageContext.request.contextPath }/resources/user/img/store/item3.jpg"
																			alt="">
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div
																		class="main__table-text">
																		<a href="#">${order.servicePackage.name  }</a>
																	</div>
                                                            </td>
                                                            <td>
                                                                <div
																		class="main__table-text">
																		<fmt:formatDate pattern="dd-MM-yyyy"
																			value="${order.purchaseDate }" />
																	</div>
                                                            </td>
                                                            <td>
                                                                <div
																		class="main__table-text main__table-text--price">$ ${order.servicePackage.price}</div>
                                                            </td>
                                                            <td>
                                                                <div
																		class="main__table-text main__table-text--green">
																		<svg xmlns="http://www.w3.org/2000/svg"
																			viewBox="0 0 24 24">
																			<path
																				d="M14.72,8.79l-4.29,4.3L8.78,11.44a1,1,0,1,0-1.41,1.41l2.35,2.36a1,1,0,0,0,.71.29,1,1,0,0,0,.7-.29l5-5a1,1,0,0,0,0-1.42A1,1,0,0,0,14.72,8.79ZM12,2A10,10,0,1,0,22,12,10,10,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8,8,0,0,1,12,20Z" /></svg>                                                                    Delivered</div>
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

                       

						<c:set var="tabpane4"
							value="${tab4 == true  ? 'tab-pane fade show active' : 'tab-pane fade'}"></c:set>
                        <div class="${tabpane4 }" id="tab-4"
							role="tabpanel">
                            <div class="row row--grid">
                                <c:set var="auth" value="FACEBOOK" />
                                <!-- details form -->
                                <c:set var="classProfile"
									value="${accountSignined.authProvider != auth ? 'col-12 col-lg-6' : 'col-12 col-lg-12'} " />
                                <div class="${classProfile} ">
                                    <s:form
										action="${pageContext.request.contextPath }/profile/updateAccountFromSetting"
										class="sign__form sign__form--profile" method="POST"
										modelAttribute="accountUpdate">
                                        <div class="row">
                                            <div class="col-12">
                                                <h4 class="sign__title">Profile details</h4>
                                            </div>
											<c:if test="${accountSignined.authProvider != auth }">
                                            <div
													class="col-12 col-md-6 col-lg-12 col-xl-6">
                                                <div class="sign__group">
                                                    <s:label
															path="username" class="sign__label">Username</s:label>
                                                    <input value ="${accountUpdate.username }" class="sign__input" required="required" readonly/>
                                                </div>
                                            </div> 
                                            </c:if>
                                            
                                            <div
												class="col-12 col-md-6 col-lg-12 col-xl-6">
                                                <div class="sign__group">
                                                     <s:label
														path="nickname" class="sign__label">Nickname</s:label>
                                                    <s:input
														path="nickname" class="sign__input" />
                                                </div>
                                            </div> 
                                            
                                            <c:if
												test="${accountSignined.authProvider != auth }">
                                            <div
													class="col-12 col-md-6 col-lg-12 col-xl-6">
                                                <div class="sign__group">
                                                     <s:label
															path="firstname" class="sign__label">First name</s:label>
                                                    <s:input
															path="firstname" class="sign__input" required="required" />
                                                </div>
                                            </div> 
                                            
                                            
                                            <div
													class="col-12 col-md-6 col-lg-12 col-xl-6">
                                                <div class="sign__group">
                                                    <s:label
															path="lastname" class="sign__label">Last name</s:label>
                                                    <s:input
															path="lastname" class="sign__input" required="required" />
                                                </div>
                                            </div>  
											<div class="col-12 col-md-6 col-lg-12 col-xl-6">
                                                <div class="sign__group">
                                                	<s:label path="email"
															class="sign__label">Email</s:label>
                                                    <input value ="${accountUpdate.email }" class="sign__input" required="required" readonly/>
                                                </div>
                                            </div>
                                            </c:if>
                                            <div
												class="col-12 col-md-6 col-lg-12 col-xl-6">
                                                <div class="sign__group">
                                                    <s:label
														path="birthday" class="sign__label">Birthday</s:label>
                                                    <s:input
														path="birthday" id="birthdayPicker" class="sign__input" required="required"/>
                                                </div>
                                            </div>
                                            
                                            <div
												class="col-12 col-md-6 col-lg-12 col-xl-6">
                                                <div class="sign__group">
                                                    <s:label
														path="gender" class="sign__label">Gender</s:label>
                                                    <s:select
														path="gender" class="sign__input" items="${gender}" >    </s:select>
                                                </div>
                                            </div>
                                            
                                            <div
												class="col-12 col-md-6 col-lg-12 col-xl-6">
                                                <div class="sign__group">
                                                    <s:label
														path="country" class="sign__label">Country</s:label>
                                                    <s:select
														path="country" class="sign__input" items="${countries}"
														itemLabel="countryName" itemValue="id">    </s:select>
                                                </div>
                                            </div>
                                            <div
												class="col-12 col-md-6 col-lg-12 col-xl-12">
                                                <div class="sign__group">
                                                    <s:label
														path="description" class="sign__label">Description</s:label>
                                                    <s:textarea
														path="description" cols="10" rows="20" class="sign__input" />
                                                    
                                                </div>
                                            </div>      
                                            <div class="col-12">
                                            	<input type="submit"
													class="sign__btn" value="Save" />
                                            </div>
                                        </div>
                                    </s:form>
                                
                                
                                </div>
                                <!-- end details form -->

                                <!-- password form -->
                                <c:if
									test="${accountSignined.authProvider != auth }">
                                <div class="col-12 col-lg-6">
                                    <form
											action="${pageContext.request.contextPath }/profile/updateAccountPasswordFromSetting"
											method="POST" name="changePassword"
											oninput='confirmpass.setCustomValidity(confirmpass.value != newpass.value ? "Confirm Passwords do not match." : "")'
											class="sign__form sign__form--profile">
                                        <div class="row">
                                            <div class="col-12">
                                                <h4 class="sign__title">Change password</h4>
                                            </div>
                                            <div
													class="col-6 col-md-6 col-lg-12 col-xl-6">
                                                <div class="sign__group">
                                                    <label
															class="sign__label" for="oldpass">Old password</label>                                                    
                                                    <input id="oldpass"
															type="password" name="oldpass" class="sign__input"
															required="required">
                                                    <small
															id="passwordHelp" class="text-danger">${msgPassInvalid }</small>
                                                </div>
                                            </div>

                                            <div
													class="col-12 col-md-6 col-lg-12 col-xl-6">
                                                <div class="sign__group">
                                                    <label
															class="sign__label" for="newpass">New password</label>
                                                    <input id="newpass"
															type="password" name="newpass" class="sign__input"
															required="required">
                                                </div>
                                            </div>

                                            <div
													class="col-12 col-md-6 col-lg-12 col-xl-6">
                                                <div class="sign__group">
                                                    <label
															class="sign__label" for="confirmpass">Confirm new password</label>
                                                    <input
															id="confirmpass" type="password" name="confirmpass"
															class="sign__input" required="required">
                                                </div>
                                            </div>

                                          

                                            <div class="col-12">
                                            <input type="submit"
														value="Change" id="changePasswordSubmit" class="sign__btn" />
                                            </div>
                                        </div>
                                    </form>
                                </div>
                               </c:if>
                               	
                                <!-- end password form -->
                            </div>
                        </div>
                    </div>
                    <!-- end content tabs -->
                </div>
            </div>
        </div>
        
        
        <div id="modal-info2"
			class="zoom-anim-dialog mfp-hide modal modal--info">
		<span class="modal__icon modal__icon--green">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
				<path
						d="M14.72,8.79l-4.29,4.3L8.78,11.44a1,1,0,1,0-1.41,1.41l2.35,2.36a1,1,0,0,0,.71.29,1,1,0,0,0,.7-.29l5-5a1,1,0,0,0,0-1.42A1,1,0,0,0,14.72,8.79ZM12,2A10,10,0,1,0,22,12,10,10,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8,8,0,0,1,12,20Z">
				</path>
			</svg>
		</span>

		<button class="modal__close" type="button">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
				<path
						d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z" />
			</svg>
			</button>

		<h4 class="sign__title">Payment #51 was successful!</h4>

		<div class="sign__group sign__group--row">
			<label class="sign__label">Total cost:</label>
			<span class="sign__value">$18.00</span>
		</div>

		<div class="sign__group sign__group--row">
			<label class="sign__label">Payment method: <b>Paypal</b></label>

			<span class="sign__text sign__text--small">There are many variations of passages of Lorem Ipsum available,
				but the majority have suffered alteration in some form, by injected humour, or randomised words which
				don't look even slightly believable.</span>
		</div>
	</div>
       	<link rel="stylesheet"
			href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  		<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
         <script>  
         async function uploadFile() {
             let formData = new FormData(); 
             formData.append("file", fileupload.files[0]);
             let response = await fetch('${pageContext.request.contextPath}/profile/updateImageAccount11', {
               method: "POST", 
               body: formData
             }); 

             if (response.status == 200) {
            	 Swal.fire('Saved!', '', 'success');
             }
             else {
            	 Swal.fire({
                     icon: 'error',
                     title: 'Oops...',
                     text: 'Something went wrong!'
                 })
                }
           }

         function previewChangeAccountImage(e) {
        	    const img = document.getElementById("fileupload") || null
        	    const file = e.files[0];
        	    if (file) {
        	        const reader = new FileReader();
        	        reader.onload = function() {
        	            const result = reader.result;
        	            if (img) {
        	                img.src = result
        	                Swal.fire({
        	                    title: 'Do you want to save the changes?',
        	                    imageUrl: result,
        	                    imageWidth: 200,
        	                    imageHeight: 200,
        	                    showDenyButton: true,
        	                    //showCancelButton: true,
        	                    confirmButtonText: 'Save',
        	                    denyButtonText: `Don't save`,
        	                }).then((result) => {
        	                    /* Read more about isConfirmed, isDenied below */
        	                    if (result.isConfirmed) {
        	                        console.log(file);
        	                        uploadFile();

        	                    } else if (result.isDenied) {
        	                        Swal.fire('Changes are not saved', '', 'info')
        	                    }
        	                })
        	            }
        	        }

        	        reader.readAsDataURL(file);
        	    }
        	}

         
         
         $( document ).ready(function() {
        	    console.log( "ready!" );

  			$( function() {
   				 $("#birthdayPicker").datepicker();
  			} );
        	    
        });  



        
        	


  			function toggleRequestForm11() {
				console.log("aaaaa") ;
				var toggle = $('input#toggle').val() ; 
				var element = document.getElementById("tab-5");
				if( toggle == 'true' ) {
					document.getElementById("toggle").value = "false";
					element.classList.add("display-none");
					element.classList.remove("display-block");

				}
				else { 
					Swal.fire('Any fool can use a computer')
					document.getElementById("toggle").value = "true";
					element.classList.add("display-block");
					element.classList.remove("display-none");
				}
				
  	  	  	}


  			function preSendRequest(){
		         $.ajax({
		            type: 'GET',
		            url: '${pageContext.request.contextPath}/profile/preSendRequest',
		            success: function (status) {
			            var stt = status  ;	
			            console.log(status + "  ahaha") ;
		                if( status) {
							 $.ajax({
			                    type: 'GET',
			                    url: '${pageContext.request.contextPath}/profile/sendRequest',
			                    success: function (status2) {
				                    console.log(status2 + "  hmmm");
			           				 if(status2) {
			           					Swal.fire(
			           						  'Congratulations!',
			           						  'Your request has been submitted successfully!',
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
			                    	}
			                	});  
			            }
		                else {
		                	Swal.fire({
		                		  
		                		  
		                		  text: '',
		                		  
		                		})
		                		let timerInterval
							Swal.fire({
								icon: 'error',
								title: 'Oops...',
 								html: '<b>You must fill in your personal information before submitting your request!</b>',
  								timer: 3000, 
  								showConfirmButton: false,
  								didOpen: () => {
    								timerInterval = setInterval(() => {
      								b.textContent = Swal.getTimerLeft()
    								}, 100)
  								},
 								 willClose: () => {
    								clearInterval(timerInterval)
  								},
 								footer: '<a class="${ classtab4}" data-toggle="tab" href="#tab-4" role="tab"  aria-controls="tab-4" aria-selected="false"><h3>Fill Your Infomation</h3></a>'
							})
		                	
		                	//Swal.fire('You must enter all your infomation')
			           }
		            },
		        }) 
			}	
			
			/*  function formPasswordSubmit() {
				if(checkPass() ){
					console.log("abc") ; 
					return true;
				}
				else {
					console.log("xyz")
					return false;
				}
			}; */
  	  		
  		</script>
	</jsp:attribute>

</mt:userTemplate>