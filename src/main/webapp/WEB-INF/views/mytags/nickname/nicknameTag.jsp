<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://mytags.com" %>

            <div class="header__action header__action--signin">
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <a class="header__action-btn" href="${pageContext.request.contextPath }/user/login/login">
                        <span>Sign in</span>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path
                                d="M20,12a1,1,0,0,0-1-1H11.41l2.3-2.29a1,1,0,1,0-1.42-1.42l-4,4a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l4,4a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L11.41,13H19A1,1,0,0,0,20,12ZM17,2H7A3,3,0,0,0,4,5V19a3,3,0,0,0,3,3H17a3,3,0,0,0,3-3V16a1,1,0,0,0-2,0v3a1,1,0,0,1-1,1H7a1,1,0,0,1-1-1V5A1,1,0,0,1,7,4H17a1,1,0,0,1,1,1V8a1,1,0,0,0,2,0V5A3,3,0,0,0,17,2Z" />
                        </svg>
                    </a>
                </c:if>
                <div class="header__action-btn">
                    <c:if test="${pageContext.request.userPrincipal.name  != null }">
                    
                        <span>${ accountSignined.nickname }</span>
    
                        <div class="user__box">
                        	<c:if test="${accountPackage.servicePackage.name != 'Basic' }">
                               <i class="las la-crown"></i> 
                            </c:if>
                            
                            <c:if test="${empty accountSignined.image}">
                            <img src="${pageContext.request.contextPath }/resources/admin/images/user/1.jpg"
									alt="profile-bg" class="user__avatar">
							</c:if>	
                            <c:if test="${not empty accountSignined.image}">
                            <img src="${pageContext.request.contextPath }/uploads/images/artist/${accountSignined.image}"
									alt="profile-bg" class="user__avatar">
							</c:if>	
                            <div class="dropdown__user-menu">
                                <a href="${pageContext.request.contextPath }/user/profile/index">
                                    <i class="lar la-user-circle"></i> Profile
                                </a>
                                <a href="${pageContext.request.contextPath }/track/manage">
                                    <i class="las la-music"></i> Your Tracks
                                </a>
                                <a href="${pageContext.request.contextPath }/playlist/manage">
                                    <i class="las la-record-vinyl"></i> Your Albums
                                </a>
                                <a href="${pageContext.request.contextPath }/package">
                                    <i class="las la-crown yellow__icon"></i> Upgrade to Premium <i
                                        class="las la-crown yellow__icon"></i>
                                </a>
                                <a href="#">
                                    <i class="las la-user-cog"></i> Settings
                                </a>
                                <a href="${pageContext.request.contextPath }/user/login/logout">
                                    <i class="las la-sign-out-alt"></i> Log out
                                </a>
                            </div>
                        </div>
                    </c:if>
                </div>
            
            
            </div>