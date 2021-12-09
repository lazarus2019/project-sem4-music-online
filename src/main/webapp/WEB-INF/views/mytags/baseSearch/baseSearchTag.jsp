<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

        <!-- search box -->
        <form action="#" class="header__search">
            <input type="text" placeholder="Artist, track or album" class="input-search" onfocus="showResultContainer()">
            <button type="button"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path
                        d="M21.71,20.29,18,16.61A9,9,0,1,0,16.61,18l3.68,3.68a1,1,0,0,0,1.42,0A1,1,0,0,0,21.71,20.29ZM11,18a7,7,0,1,1,7-7A7,7,0,0,1,11,18Z" />
                </svg></button>
            <button type="button" class="close"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path
                        d="M13.41,12l6.3-6.29a1,1,0,1,0-1.42-1.42L12,10.59,5.71,4.29A1,1,0,0,0,4.29,5.71L10.59,12l-6.3,6.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l6.29,6.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z" />
                </svg></button>
            <div class="result-layout-fixed-bg" onclick="hideResultContainer()"></div>
            <div class="result-layout">
                <div class="artists-result result-box">
                    <div class="result-title">
                        <h3>Artists</h3>
                        <a id="artist-result-all">View All</a>
                    </div>
                    <div class="result-content grid-tl-6 mt-3 mb-3" id="artist-container">

                        <c:forEach items="${ popularArtists}" var="artist" varStatus="i">
                            <c:if test="${i.index < 6 }">
                                <a href="${pageContext.request.contextPath}/artist/id/${artist.id}" class="artist-box"
                                    data-id="${artist.id }">
                                    <div class="artist-image-box">
                                        <img src="${pageContext.request.contextPath}/uploads/images/artists/${artist.image}"
                                            alt="">
                                    </div>
                                    <p class="artist-name">${artist.nickname }</p>
                                </a>
                            </c:if>
                        </c:forEach>

                    </div>
                </div>
                <div class="track-result result-box">
                    <div class="result-title">
                        <h3>Track</h3>
                        <a id="track-result-all">View All</a>
                    </div>
                    <div class="result-content grid-tl-3 mt-3 mb-3" id="track-container">

                        <c:forEach items="${ newReleaseTracks}" var="track" varStatus="i">
                            <c:if test="${i.index < 6 }">
                                <div class="track-box" data-id="${track.id }" onclick="getTrackById(this)">
                                    <div class="track-box-image">
                                        <img
                                            src="${pageContext.request.contextPath}/uploads/images/track/${track.thumbnail}" />
                                    </div>
                                    <div class="track-box-content">
                                        <p>${track.title }</p>
                                        <span>
                                        <c:forEach var="artist" items="${track.accounts }" varStatus="j">
		                                    <a href="${pageContext.request.contextPath }/artist/id/${artist.id }">${artist.nickname}</a>
		                                    <c:if test="${(j.index+1) < track.artistLength}">, </c:if>
		                                </c:forEach>                                        	
                                        
                                        </span>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>

                    </div>
                </div>
                <div class="albums-result result-box">
                    <div class="result-title">
                        <h3>Albums</h3>
                        <a id="album-result-all">View All</a>
                    </div>
                    <div class="result-content grid-tl-3 mt-3 mb-3" id="album-container">

                        <c:forEach items="${ upcomingAlbums}" var="album" varStatus="i">
                            <c:if test="${i.index < 6 }">
                                <div class="album-box">
                                    <div class="album-box-image">
                                        <img src="${pageContext.request.contextPath}/uploads/images/playlist/${album.thumbnail}"
                                            alt="">
                                    </div>
                                    <div class="album-box-content">
                                        <a href="${pageContext.request.contextPath}/customPlaylist/playlistDetail/${album.id}"><p>${album.title}</p></a>
                                        <span>                                       
                                            <a href="${pageContext.request.contextPath}/artist/id/${album.artistId}">J${album.artistNickName }</a>
                                        </span>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </form>
        