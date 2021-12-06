<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="t" uri="http://mytags.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:userTemplate title="Record Chart">
	<jsp:attribute name="content">
		<!-- weekly chart -->
		<t:weeklyChart/>
		<!-- end weekly chart -->
		
		<!-- top chart -->
		<div class="top__list">
				<div class="chart__header">
					<h3 class="top__list__header text-primary">Top ${topCount } Tracks</h3>
				</div>
					
				<ul class="main__list main__list--playlist main__list--dashbox">
					<c:forEach var="topTrack" items="${topTracks }" varStatus="i">
                        <li class="single-item single-item-chart item">
                            <a data-playlist data-title="1. Got What I Got" data-artist="Jason Aldean"
								data-img="${pageContext.request.contextPath }/resources/user/img/covers/cover3.jpg"
								href="../blast2.0/audio/12071151_epic-cinematic-trailer_by_audiopizza_preview.mp3"
								class="single-item__cover">
					        <img src="${pageContext.request.contextPath }/uploads/images/track/${topTrack.thumbnail }" alt="">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
                            </svg>
                            <!-- play track icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z" />
                            </svg>
                            </a>
                            <div class="single-item__title">
                                <h4>
                                	<a href="#">
                                		${i.index + 1 }. ${topTrack.title }
                                		<c:if test="${topTrack.premium == true }"><i class="las la-crown crown-icon flex-column yellow__icon"></i></c:if>
                                	</a>
                                </h4>
                                <c:forEach var="nickname" items="${topTrack.artistNicknames }">
                                    <span><a href="#">${nickname}</a></span> 
                                </c:forEach>
                            </div>
                            <span class="single-item__time"><t:trackTime totalSeconds="${topTrack.duration }"/></span>
                            <a href="#" class="single-item__add">
                                <!-- add to play list icon -->
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                    <path d="M19,11H13V5a1,1,0,0,0-2,0v6H5a1,1,0,0,0,0,2h6v6a1,1,0,0,0,2,0V13h6a1,1,0,0,0,0-2Z" />
                                </svg>
                            </a>
                            <a href="#" class="single-item__export">
                            <!-- download track icon -->
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                    <path d="M21,14a1,1,0,0,0-1,1v4a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1V15a1,1,0,0,0-2,0v4a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V15A1,1,0,0,0,21,14Zm-9.71,1.71a1,1,0,0,0,.33.21.94.94,0,0,0,.76,0,1,1,0,0,0,.33-.21l4-4a1,1,0,0,0-1.42-1.42L13,12.59V3a1,1,0,0,0-2,0v9.59l-2.29-2.3a1,1,0,1,0-1.42,1.42Z" />
                                </svg>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
        </div>
		<!-- end top chart -->
	</jsp:attribute>
</mt:userTemplate>