
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
                            	<c:set var="classtab1"
									value="${tab4 == true  ? 'nav-link' : 'nav-link active'}"></c:set>
                                <a class="${classtab1}"
								data-toggle="tab" href="#tab-1" role="tab" aria-controls="tab-1"
								aria-selected="true">Profile</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab"
								href="#tab-2" role="tab" aria-controls="tab-2"
								aria-selected="false">Orders</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab"
								href="#tab-3" role="tab" aria-controls="tab-3"
								aria-selected="false">Pricing plan</a>
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
                    	<c:set var="tabpane1"
							value="${tab4 == true  ? 'tab-pane fade' : 'tab-pane fade show active'}"></c:set>
                        <div class="${tabpane1 }" id="tab-1"
							role="tabpanel">
                            <div class="row row--grid">
                                <div class="col-12 col-lg-6 col-xl-3">
                                    <div class="stats">
                                        <span>My balance <a
											href="#modal-topup" class="open-modal">top up</a></span>
                                        <p>
											<b>$90.99</b>
										</p>
                                        <svg
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
											<path
												d="M6,11a1,1,0,1,0,1,1A1,1,0,0,0,6,11Zm12,0a1,1,0,1,0,1,1A1,1,0,0,0,18,11Zm2-6H4A3,3,0,0,0,1,8v8a3,3,0,0,0,3,3H20a3,3,0,0,0,3-3V8A3,3,0,0,0,20,5Zm1,11a1,1,0,0,1-1,1H4a1,1,0,0,1-1-1V8A1,1,0,0,1,4,7H20a1,1,0,0,1,1,1ZM12,9a3,3,0,1,0,3,3A3,3,0,0,0,12,9Zm0,4a1,1,0,1,1,1-1A1,1,0,0,1,12,13Z" /></svg>
                                    </div>
                                </div>

                                <div class="col-12 col-lg-6 col-xl-3">
                                    <div class="stats">
                                        <span>${accountPackage.servicePackage.name } Plan 
                                        	<c:if
												test="${accountPackage.servicePackage.name != 'Basic' }">
                                         		|  Expiration Date 
                                         	</c:if>
                                        </span>
                                        <p>
											<b>${accountPackage.servicePackage.price }</b>/month 
                                        	<c:if
												test="${accountPackage.servicePackage.name != 'Basic' }">
                                       			 |  <fmt:formatDate
													pattern="dd-MM-yyyy"
													value="${accountPackage.expirationDate }" />  
                                        	</c:if>
                                        </p>
                                        <svg
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
											<path
												d="M9,10a1,1,0,0,0-1,1v2a1,1,0,0,0,2,0V11A1,1,0,0,0,9,10Zm12,1a1,1,0,0,0,1-1V6a1,1,0,0,0-1-1H3A1,1,0,0,0,2,6v4a1,1,0,0,0,1,1,1,1,0,0,1,0,2,1,1,0,0,0-1,1v4a1,1,0,0,0,1,1H21a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1,1,1,0,0,1,0-2ZM20,9.18a3,3,0,0,0,0,5.64V17H10a1,1,0,0,0-2,0H4V14.82A3,3,0,0,0,4,9.18V7H8a1,1,0,0,0,2,0H20Z" /></svg>
                                    </div>
                                </div>

                                <div class="col-12 col-lg-6 col-xl-3">
                                    <div class="stats">
                                        <span>Minutes listened</span>
                                        <p>
											<b>407 021</b>
										</p>
                                        <svg
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
											<path
												d="M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z" /></svg>
                                    </div>
                                </div>

                                <div class="col-12 col-lg-6 col-xl-3">
                                    <div class="stats">
                                        <span>Promo code</span>

                                        <form action="#"
											class="stats__form">
                                            <input type="text"
												placeholder="__-__-__-__">
                                            <button type="button">send</button>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div class="row row--grid">
                                <!-- dashbox -->
                                <div class="col-12 col-lg-6">
                                    <div class="dashbox">
                                        <div class="dashbox__title">
                                            <h3>
												<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
													<path
														d="M19.05566,2h-14a3.00328,3.00328,0,0,0-3,3V19a3.00328,3.00328,0,0,0,3,3h14a3.00328,3.00328,0,0,0,3-3V5A3.00328,3.00328,0,0,0,19.05566,2Zm-14,2h14a1.001,1.001,0,0,1,1,1v8H17.59082a1.99687,1.99687,0,0,0-1.66406.89062L14.52051,16H9.59082L8.18457,13.89062A1.99687,1.99687,0,0,0,6.52051,13H4.05566V5A1.001,1.001,0,0,1,5.05566,4Zm14,16h-14a1.001,1.001,0,0,1-1-1V15H6.52051l1.40625,2.10938A1.99687,1.99687,0,0,0,9.59082,18h4.92969a1.99687,1.99687,0,0,0,1.66406-.89062L17.59082,15h2.46484v4A1.001,1.001,0,0,1,19.05566,20Z" /></svg>
                                            	Notifications <span>17</span>
                                            
                                            </h3>

                                            <div class="dashbox__wrap">
                                                <a
													class="dashbox__refresh" href="#"><svg
														xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M12,2A10,10,0,0,0,5.12,4.77V3a1,1,0,0,0-2,0V7.5a1,1,0,0,0,1,1H8.62a1,1,0,0,0,0-2H6.22A8,8,0,1,1,4,12a1,1,0,0,0-2,0A10,10,0,1,0,12,2Zm0,6a1,1,0,0,0-1,1v3a1,1,0,0,0,1,1h2a1,1,0,0,0,0-2H13V9A1,1,0,0,0,12,8Z" /></svg></a>
                                            </div>
                                        </div>

                                        <div class="dashbox__list-wrap">
                                            <div class="dashbox__scroll">
                                                <div
													class="dashbox__note dashbox__note--succ">
                                                    <svg
														xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M14.72,8.79l-4.29,4.3L8.78,11.44a1,1,0,1,0-1.41,1.41l2.35,2.36a1,1,0,0,0,.71.29,1,1,0,0,0,.7-.29l5-5a1,1,0,0,0,0-1.42A1,1,0,0,0,14.72,8.79ZM12,2A10,10,0,1,0,22,12,10,10,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8,8,0,0,1,12,20Z" /></svg>
                                                    <p>
														<a href="#modal-info2" class="open-modal">Payment #51</a> was successful!</p>
                                                    <span>1 hour ago</span>
                                                </div>
                                                <div
													class="dashbox__note dashbox__note--fail">
                                                    <svg
														xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M15.71,8.29a1,1,0,0,0-1.42,0L12,10.59,9.71,8.29A1,1,0,0,0,8.29,9.71L10.59,12l-2.3,2.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L13.41,12l2.3-2.29A1,1,0,0,0,15.71,8.29Zm3.36-3.36A10,10,0,1,0,4.93,19.07,10,10,0,1,0,19.07,4.93ZM17.66,17.66A8,8,0,1,1,20,12,7.95,7.95,0,0,1,17.66,17.66Z" /></svg>
                                                    <p>
														<a href="#modal-info3" class="open-modal">Payment #50</a> failed!</p>
                                                    <span>2 hours ago</span>
                                                </div>
                                                <div
													class="dashbox__note dashbox__note--info">
                                                    <svg
														xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20Zm0-8.5a1,1,0,0,0-1,1v3a1,1,0,0,0,2,0v-3A1,1,0,0,0,12,11.5Zm0-4a1.25,1.25,0,1,0,1.25,1.25A1.25,1.25,0,0,0,12,7.5Z" /></svg>
                                                    <p>
														<a href="#modal-info4" class="open-modal">Example</a> of notification.</p>
                                                    <span>2 hours ago</span>
                                                </div>
                                                <div
													class="dashbox__note dashbox__note--gift">
                                                    <svg
														xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M18,7h-.35A3.45,3.45,0,0,0,18,5.5a3.49,3.49,0,0,0-6-2.44A3.49,3.49,0,0,0,6,5.5,3.45,3.45,0,0,0,6.35,7H6a3,3,0,0,0-3,3v2a1,1,0,0,0,1,1H5v6a3,3,0,0,0,3,3h8a3,3,0,0,0,3-3V13h1a1,1,0,0,0,1-1V10A3,3,0,0,0,18,7ZM11,20H8a1,1,0,0,1-1-1V13h4Zm0-9H5V10A1,1,0,0,1,6,9h5Zm0-4H9.5A1.5,1.5,0,1,1,11,5.5Zm2-1.5A1.5,1.5,0,1,1,14.5,7H13ZM17,19a1,1,0,0,1-1,1H13V13h4Zm2-8H13V9h5a1,1,0,0,1,1,1Z" /></svg>
                                                    <p>
														<a href="#modal-info5" class="open-modal">You have received a gift!</a>
													</p>
                                                    <span>4 hours ago</span>
                                                </div>
                                                <div
													class="dashbox__note dashbox__note--gift">
                                                    <svg
														xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M18,7h-.35A3.45,3.45,0,0,0,18,5.5a3.49,3.49,0,0,0-6-2.44A3.49,3.49,0,0,0,6,5.5,3.45,3.45,0,0,0,6.35,7H6a3,3,0,0,0-3,3v2a1,1,0,0,0,1,1H5v6a3,3,0,0,0,3,3h8a3,3,0,0,0,3-3V13h1a1,1,0,0,0,1-1V10A3,3,0,0,0,18,7ZM11,20H8a1,1,0,0,1-1-1V13h4Zm0-9H5V10A1,1,0,0,1,6,9h5Zm0-4H9.5A1.5,1.5,0,1,1,11,5.5Zm2-1.5A1.5,1.5,0,1,1,14.5,7H13ZM17,19a1,1,0,0,1-1,1H13V13h4Zm2-8H13V9h5a1,1,0,0,1,1,1Z" /></svg>
                                                    <p>
														<a href="#modal-info5" class="open-modal">You have received a gift!</a>
													</p>
                                                    <span>5 hours ago</span>
                                                </div>

                                                <div
													class="dashbox__note dashbox__note--succ">
                                                    <svg
														xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M14.72,8.79l-4.29,4.3L8.78,11.44a1,1,0,1,0-1.41,1.41l2.35,2.36a1,1,0,0,0,.71.29,1,1,0,0,0,.7-.29l5-5a1,1,0,0,0,0-1.42A1,1,0,0,0,14.72,8.79ZM12,2A10,10,0,1,0,22,12,10,10,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8,8,0,0,1,12,20Z" /></svg>
                                                    <p>
														<a href="#modal-info2" class="open-modal">Payment #51</a> was successful!</p>
                                                    <span>1 hour ago</span>
                                                </div>
                                                <div
													class="dashbox__note dashbox__note--fail">
                                                    <svg
														xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M15.71,8.29a1,1,0,0,0-1.42,0L12,10.59,9.71,8.29A1,1,0,0,0,8.29,9.71L10.59,12l-2.3,2.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L13.41,12l2.3-2.29A1,1,0,0,0,15.71,8.29Zm3.36-3.36A10,10,0,1,0,4.93,19.07,10,10,0,1,0,19.07,4.93ZM17.66,17.66A8,8,0,1,1,20,12,7.95,7.95,0,0,1,17.66,17.66Z" /></svg>
                                                    <p>
														<a href="#modal-info3" class="open-modal">Payment #50</a> failed!</p>
                                                    <span>2 hours ago</span>
                                                </div>
                                                <div
													class="dashbox__note dashbox__note--info">
                                                    <svg
														xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20Zm0-8.5a1,1,0,0,0-1,1v3a1,1,0,0,0,2,0v-3A1,1,0,0,0,12,11.5Zm0-4a1.25,1.25,0,1,0,1.25,1.25A1.25,1.25,0,0,0,12,7.5Z" /></svg>
                                                    <p>
														<a href="#modal-info4" class="open-modal">Example</a> of notification.</p>
                                                    <span>2 hours ago</span>
                                                </div>
                                                <div
													class="dashbox__note dashbox__note--gift">
                                                    <svg
														xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M18,7h-.35A3.45,3.45,0,0,0,18,5.5a3.49,3.49,0,0,0-6-2.44A3.49,3.49,0,0,0,6,5.5,3.45,3.45,0,0,0,6.35,7H6a3,3,0,0,0-3,3v2a1,1,0,0,0,1,1H5v6a3,3,0,0,0,3,3h8a3,3,0,0,0,3-3V13h1a1,1,0,0,0,1-1V10A3,3,0,0,0,18,7ZM11,20H8a1,1,0,0,1-1-1V13h4Zm0-9H5V10A1,1,0,0,1,6,9h5Zm0-4H9.5A1.5,1.5,0,1,1,11,5.5Zm2-1.5A1.5,1.5,0,1,1,14.5,7H13ZM17,19a1,1,0,0,1-1,1H13V13h4Zm2-8H13V9h5a1,1,0,0,1,1,1Z" /></svg>
                                                    <p>
														<a href="#modal-info5" class="open-modal">You have received a gift!</a>
													</p>
                                                    <span>4 hours ago</span>
                                                </div>
                                                <div
													class="dashbox__note dashbox__note--gift">
                                                    <svg
														xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M18,7h-.35A3.45,3.45,0,0,0,18,5.5a3.49,3.49,0,0,0-6-2.44A3.49,3.49,0,0,0,6,5.5,3.45,3.45,0,0,0,6.35,7H6a3,3,0,0,0-3,3v2a1,1,0,0,0,1,1H5v6a3,3,0,0,0,3,3h8a3,3,0,0,0,3-3V13h1a1,1,0,0,0,1-1V10A3,3,0,0,0,18,7ZM11,20H8a1,1,0,0,1-1-1V13h4Zm0-9H5V10A1,1,0,0,1,6,9h5Zm0-4H9.5A1.5,1.5,0,1,1,11,5.5Zm2-1.5A1.5,1.5,0,1,1,14.5,7H13ZM17,19a1,1,0,0,1-1,1H13V13h4Zm2-8H13V9h5a1,1,0,0,1,1,1Z" /></svg>
                                                    <p>
														<a href="#modal-info5" class="open-modal">You have received a gift!</a>
													</p>
                                                    <span>5 hours ago</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end dashbox -->

                                <!-- dashbox -->
                                <div class="col-12 col-lg-6">
                                    <div class="dashbox">
                                        <div class="dashbox__title">
                                            <h3>
												<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
													<path
														d="M21.65,2.24a1,1,0,0,0-.8-.23l-13,2A1,1,0,0,0,7,5V15.35A3.45,3.45,0,0,0,5.5,15,3.5,3.5,0,1,0,9,18.5V10.86L20,9.17v4.18A3.45,3.45,0,0,0,18.5,13,3.5,3.5,0,1,0,22,16.5V3A1,1,0,0,0,21.65,2.24ZM5.5,20A1.5,1.5,0,1,1,7,18.5,1.5,1.5,0,0,1,5.5,20Zm13-2A1.5,1.5,0,1,1,20,16.5,1.5,1.5,0,0,1,18.5,18ZM20,7.14,9,8.83v-3L20,4.17Z" /></svg>                                                New items for you</h3>

                                            <div class="dashbox__wrap">
                                                <a
													class="dashbox__refresh" href="#"><svg
														xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
														<path
															d="M12,2A10,10,0,0,0,5.12,4.77V3a1,1,0,0,0-2,0V7.5a1,1,0,0,0,1,1H8.62a1,1,0,0,0,0-2H6.22A8,8,0,1,1,4,12a1,1,0,0,0-2,0A10,10,0,1,0,12,2Zm0,6a1,1,0,0,0-1,1v3a1,1,0,0,0,1,1h2a1,1,0,0,0,0-2H13V9A1,1,0,0,0,12,8Z" /></svg></a>
                                                <a class="dashbox__more"
													href="#">View All</a>
                                            </div>
                                        </div>

                                        <div class="dashbox__list-wrap">
                                            <ul
												class="main__list main__list--dashbox">
                                                <li class="single-item">
                                                    <a data-link
													data-title="Got What I Got" data-artist="Jason Aldean"
													data-img=""
													${pageContext.request.contextPath }/resources/user/img/covers/cover.svg" href="../blast2.0/audio/12071151_epic-cinematic-trailer_by_audiopizza_preview.mp3"
													class="single-item__cover">
                                                        <img src=""
														${pageContext.request.contextPath }/resources/user/img/covers/cover.svg" alt="">
                                                        <svg
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
															<path
																d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" /></svg>
                                                        <svg
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
															<path
																d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" /></svg>
                                                    </a>
                                                    <div
														class="single-item__title">
                                                        <h4>
															<a href="#">Got What I Got</a>
														</h4>
                                                        <span><a
															href="artist.html">Jason Aldean</a></span>
                                                    </div>
                                                    <a href="#"
													class="single-item__add">
                                                        <svg
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
															<path
																d="M19,11H13V5a1,1,0,0,0-2,0v6H5a1,1,0,0,0,0,2h6v6a1,1,0,0,0,2,0V13h6a1,1,0,0,0,0-2Z" /></svg>
                                                    </a>
                                                    <a href="#"
													class="single-item__export">
                                                        <svg
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
															<path
																d="M21,14a1,1,0,0,0-1,1v4a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1V15a1,1,0,0,0-2,0v4a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V15A1,1,0,0,0,21,14Zm-9.71,1.71a1,1,0,0,0,.33.21.94.94,0,0,0,.76,0,1,1,0,0,0,.33-.21l4-4a1,1,0,0,0-1.42-1.42L13,12.59V3a1,1,0,0,0-2,0v9.59l-2.29-2.3a1,1,0,1,0-1.42,1.42Z" /></svg>
                                                    </a>
                                                    <span
													class="single-item__time">2:58</span>
                                                </li>
                                                <li class="single-item">
                                                    <a data-link
													data-title="Supalonely" data-artist="BENEE Featuring"
													data-img=""
													${pageContext.request.contextPath }/resources/user/img/covers/cover7.jpg" href="../blast2.0/audio/9106709_epic-adventure-cinematic-trailer_by_audiopizza_preview.mp3"
													class="single-item__cover">
                                                        <img src=""
														${pageContext.request.contextPath }/resources/user/img/covers/cover7.jpg" alt="">
                                                        <svg
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
															<path
																d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" /></svg>
                                                        <svg
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
															<path
																d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" /></svg>
                                                    </a>
                                                    <div
														class="single-item__title">
                                                        <h4>
															<a href="#">Supalonely</a>
														</h4>
                                                        <span><a
															href="artist.html">BENEE Featuring</a></span>
                                                    </div>
                                                    <a href="#"
													class="single-item__add">
                                                        <svg
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
															<path
																d="M19,11H13V5a1,1,0,0,0-2,0v6H5a1,1,0,0,0,0,2h6v6a1,1,0,0,0,2,0V13h6a1,1,0,0,0,0-2Z" /></svg>
                                                    </a>
                                                    <a href="#"
													class="single-item__export">
                                                        <svg
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
															<path
																d="M21,14a1,1,0,0,0-1,1v4a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1V15a1,1,0,0,0-2,0v4a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V15A1,1,0,0,0,21,14Zm-9.71,1.71a1,1,0,0,0,.33.21.94.94,0,0,0,.76,0,1,1,0,0,0,.33-.21l4-4a1,1,0,0,0-1.42-1.42L13,12.59V3a1,1,0,0,0-2,0v9.59l-2.29-2.3a1,1,0,1,0-1.42,1.42Z" /></svg>
                                                    </a>
                                                    <span
													class="single-item__time">3:14</span>
                                                </li>
                                                <li class="single-item">
                                                    <a data-link
													data-title="Girls In The Hood" data-artist="Megan Thee"
													data-img=""
													${pageContext.request.contextPath }/resources/user/img/covers/cover8.jpg" href="../blast2.0/audio/10938456_inspiring-epic-motivational-cinematic-trailer_by_audiopizza_preview.mp3"
													class="single-item__cover">
                                                        <img src=""
														${pageContext.request.contextPath }/resources/user/img/covers/cover8.jpg" alt="">
                                                        <svg
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
															<path
																d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" /></svg>
                                                        <svg
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
															<path
																d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" /></svg>
                                                    </a>
                                                    <div
														class="single-item__title">
                                                        <h4>
															<a href="#">Girls In The Hood</a>
														</h4>
                                                        <span><a
															href="artist.html">Megan Thee</a></span>
                                                    </div>
                                                    <a href="#"
													class="single-item__add">
                                                        <svg
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
															<path
																d="M19,11H13V5a1,1,0,0,0-2,0v6H5a1,1,0,0,0,0,2h6v6a1,1,0,0,0,2,0V13h6a1,1,0,0,0,0-2Z" /></svg>
                                                    </a>
                                                    <a href="#"
													class="single-item__export">
                                                        <svg
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
															<path
																d="M21,14a1,1,0,0,0-1,1v4a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1V15a1,1,0,0,0-2,0v4a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V15A1,1,0,0,0,21,14Zm-9.71,1.71a1,1,0,0,0,.33.21.94.94,0,0,0,.76,0,1,1,0,0,0,.33-.21l4-4a1,1,0,0,0-1.42-1.42L13,12.59V3a1,1,0,0,0-2,0v9.59l-2.29-2.3a1,1,0,1,0-1.42,1.42Z" /></svg>
                                                    </a>
                                                    <span
													class="single-item__time">3:21</span>
                                                </li>
                                                <li class="single-item">
                                                    <a data-link
													data-title="Got It On Me" data-artist="Summer Walker"
													data-img=""
													${pageContext.request.contextPath }/resources/user/img/covers/cover9.jpg" href="../blast2.0/audio/16412111_upbeat-rock_by_audiopizza_preview.mp3"
													class="single-item__cover">
                                                        <img src=""
														${pageContext.request.contextPath }/resources/user/img/covers/cover9.jpg" alt="">
                                                        <svg
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
															<path
																d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" /></svg>
                                                        <svg
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
															<path
																d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" /></svg>
                                                    </a>
                                                    <div
														class="single-item__title">
                                                        <h4>
															<a href="#">Got It On Me</a>
														</h4>
                                                        <span><a
															href="artist.html">Summer Walker</a></span>
                                                    </div>
                                                    <a href="#"
													class="single-item__add">
                                                        <svg
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
															<path
																d="M19,11H13V5a1,1,0,0,0-2,0v6H5a1,1,0,0,0,0,2h6v6a1,1,0,0,0,2,0V13h6a1,1,0,0,0,0-2Z" /></svg>
                                                    </a>
                                                    <a href="#"
													class="single-item__export">
                                                        <svg
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
															<path
																d="M21,14a1,1,0,0,0-1,1v4a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1V15a1,1,0,0,0-2,0v4a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V15A1,1,0,0,0,21,14Zm-9.71,1.71a1,1,0,0,0,.33.21.94.94,0,0,0,.76,0,1,1,0,0,0,.33-.21l4-4a1,1,0,0,0-1.42-1.42L13,12.59V3a1,1,0,0,0-2,0v9.59l-2.29-2.3a1,1,0,1,0-1.42,1.42Z" /></svg>
                                                    </a>
                                                    <span
													class="single-item__time">3:12</span>
                                                </li>
                                                <li class="single-item">
                                                    <a data-link
													data-title="Righteous" data-artist="Juice WRLD" data-img=""
													${pageContext.request.contextPath }/resources/user/img/covers/cover10.jpg" href="../blast2.0/audio/19478377_ambient-pop_by_audiopizza_preview.mp3"
													class="single-item__cover">
                                                        <img src=""
														${pageContext.request.contextPath }/resources/user/img/covers/cover10.jpg" alt="">
                                                        <svg
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
															<path
																d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" /></svg>
                                                        <svg
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
															<path
																d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" /></svg>
                                                    </a>
                                                    <div
														class="single-item__title">
                                                        <h4>
															<a href="#">Righteous</a>
														</h4>
                                                        <span><a
															href="artist.html">Juice WRLD</a></span>
                                                    </div>
                                                    <a href="#"
													class="single-item__add">
                                                        <svg
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
															<path
																d="M19,11H13V5a1,1,0,0,0-2,0v6H5a1,1,0,0,0,0,2h6v6a1,1,0,0,0,2,0V13h6a1,1,0,0,0,0-2Z" /></svg>
                                                    </a>
                                                    <a href="#"
													class="single-item__export">
                                                        <svg
															xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
															<path
																d="M21,14a1,1,0,0,0-1,1v4a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1V15a1,1,0,0,0-2,0v4a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V15A1,1,0,0,0,21,14Zm-9.71,1.71a1,1,0,0,0,.33.21.94.94,0,0,0,.76,0,1,1,0,0,0,.33-.21l4-4a1,1,0,0,0-1.42-1.42L13,12.59V3a1,1,0,0,0-2,0v9.59l-2.29-2.3a1,1,0,1,0-1.42,1.42Z" /></svg>
                                                    </a>
                                                    <span
													class="single-item__time">5:04</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- end dashbox -->
                            </div>
                        </div>

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

                       
                        <div class="tab-pane fade" id="tab-3"
							role="tabpanel">
                            <div class="row row--grid">
                                <div
									class="col-12 col-md-6 col-lg-4 order-md-2 order-lg-1">
                                    <div class="plan plan--green">
                                        <h3 class="plan__title">Free</h3>
                                        <span class="plan__price">$0<span>/month</span></span>
                                        <ul class="plan__list">
                                            <li class="green"><svg
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
													<path
														d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z" /></svg> Volna
                                                Originals
                                            </li>
                                            <li class="green"><svg
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
													<path
														d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z" /></svg> Switch
                                                plans or cancel anytime</li>
                                            <li class="red"><svg
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
													<path
														d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z" /></svg>                                                Stream 65+ top Live</li>
                                            <li class="red"><svg
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
													<path
														d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z" /></svg>                                                Music channels</li>
                                        </ul>
                                        <button class="plan__btn"
											type="button">Select plan</button>
                                    </div>
                                </div>

                                <div
									class="col-12 col-lg-4 order-md-1 order-lg-2">
                                    <div class="plan plan--red">
                                        <h3 class="plan__title">Starter</h3>
                                        <span class="plan__price">$14.99<span>/month</span></span>
                                        <ul class="plan__list">
                                            <li class="green"><svg
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
													<path
														d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z" /></svg> Volna
                                                Originals
                                            </li>
                                            <li class="green"><svg
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
													<path
														d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z" /></svg> Switch
                                                plans or cancel anytime</li>
                                            <li class="green"><svg
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
													<path
														d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z" /></svg> Stream
                                                65+ top Live</li>
                                            <li class="red"><svg
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
													<path
														d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z" /></svg>                                                Music channels</li>
                                        </ul>
                                        <button class="plan__btn"
											type="button">Select plan</button>
                                    </div>
                                </div>

                                <div
									class="col-12 col-md-6 col-lg-4 order-md-3 order-lg-3">
                                    <div class="plan plan--purple">
                                        <h3 class="plan__title">Premium</h3>
                                        <span class="plan__price">$39.99<span>/month</span></span>
                                        <ul class="plan__list">
                                            <li class="green"><svg
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
													<path
														d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z" /></svg> Volna
                                                Originals
                                            </li>
                                            <li class="green"><svg
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
													<path
														d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z" /></svg> Switch
                                                plans or cancel anytime</li>
                                            <li class="green"><svg
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
													<path
														d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z" /></svg> Stream
                                                65+ top Live</li>
                                            <li class="green"><svg
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
													<path
														d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z" /></svg> Music
                                                channels
                                            </li>
                                        </ul>
                                        <button class="plan__btn"
											type="button">Select plan</button>
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
                                                    <s:input
															path="username" class="sign__input"  />
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
                                                    <s:input
															path="email" class="sign__input" required="required"/>
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