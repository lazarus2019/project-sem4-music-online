<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://mytags.com"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<li class="line-height pt-3"><a href="#"
	class="search-toggle iq-waves-effect d-flex align-items-center"> <img
		src="${pageContext.request.contextPath }/uploads/images/artist/${accountSignined.image}"
		class="img-fluid rounded-circle" alt="user">
</a>
	<div class="iq-sub-dropdown iq-user-dropdown">
		<div class="iq-card shadow-none m-0">
			<div class="iq-card-body p-0 ">
				<div class="bg-primary p-3">
					<h5 class="mb-0 text-white line-height">Hello ${accountSignined.firstname} ${accountSignined.lastname}</h5>
					<span class="text-white font-size-12">${role}</span>
				</div>
				<a href="${pageContext.request.contextPath }/admin/profile" class="iq-sub-card iq-bg-primary-hover">
					<div class="media align-items-center">
						<div class="rounded iq-card-icon iq-bg-primary">
							<i class="ri-file-user-line"></i>
						</div>
						<div class="media-body ml-3">
							<h6 class="mb-0 ">My Profile</h6>
							<p class="mb-0 font-size-12">View personal profile details.</p>
						</div>
					</div>
				</a> 
				<div class="d-inline-block w-100 text-center p-3">
					<a class="bg-primary iq-sign-btn"
						href="${pageContext.request.contextPath }/user/login/logout"
						role="button">Sign out<i class="ri-login-box-line ml-2"></i></a>
				</div>
			</div>
		</div>
	</div></li>

