<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="t" uri="http://mytags.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

            <li class="nav-item nav-icon">
                                <a href="#" class="search-toggle iq-waves-effect text-black rounded">
                                    <i class="ri-mail-line"></i>
	                            	<c:if test="${amountUnReadMail > 0 }">
	                                    <span class="massage-icon dots badge badge-primary">${amountUnReadMail }</span>
	                            	</c:if>
                                </a>
                                <div class="iq-sub-dropdown">
                                    <div class="iq-card shadow-none m-0">
                                        <div class="iq-card-body p-0 ">
                                            <div class="bg-primary p-3">
                                                <h5 class="mb-0 text-white">New Messages<small class="badge  badge-light float-right pt-1">${amountUnReadMail }</small></h5>
                                            </div>
                                            <c:if test="${amountUnReadMail > 0 }">
	                                            <c:forEach items="${topUnreadMailbox }" var="mailbox">
		                                            <a class="iq-sub-card">
		                                                <div class="media align-items-center">
		                                                    <div class="media-body ml-3">
		                                                        <h6 class="mb-0 ">${mailbox.fullname }</h6>
		                                                        <small class="float-left font-size-12">13 Jun</small>
		                                                    </div>
		                                                </div>
		                                            </a>                                            
	                                            </c:forEach>
                                            </c:if>
                                            <c:if test="${amountUnReadMail == 0 }">
	                                            <p>No mail yet!</p>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </li>