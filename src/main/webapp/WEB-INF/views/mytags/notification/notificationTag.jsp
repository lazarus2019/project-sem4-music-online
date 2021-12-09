<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.demo.helpers.CalculateDateTimeHelper"%>
<%@ taglib prefix="t" uri="http://mytags.com" %>

<div class="header__action header__action--note">
	<a href="#" class="header__action-btn"><span class="icon-x7"><i class="far fa-bell clr-white"></i></span></a>
	<div class="header__drop">
		<c:if test="${newNotifications.size() != 0 || readNotifications.size() != 0 || not empty accountId }">
			<a href="${pageContext.request.contextPath }/notification/index" class="header__all">View all</a>

			<c:forEach var="newNotification" items="${newNotifications }">
				<div class="header__note header__note--succ">
					<p><button><i class="far fa-circle clr-blue"></i></button> <a href="${pageContext.request.contextPath }/notification/index">${newNotification.message }</a></p>
					<span><t:timeAgo pastDate="${newNotification.date }"/></span>
				</div>
			</c:forEach>
			<c:forEach var="readNotification" items="${readNotifications }">
				<div class="header__note header__note--succ">
					<p><button><i class="far fa-check-circle clr-green"></i></button> <a href="${pageContext.request.contextPath }/notification/index">${readNotification.message }</a></p>
					<span><t:timeAgo pastDate="${readNotification.date }"/></span>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${newNotifications.size() == 0 && readNotifications.size() == 0 || empty accountId }">
			<p class="header__all">Have no notification!</p>
		</c:if>
	</div>
</div>