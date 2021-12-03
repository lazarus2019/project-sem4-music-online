<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="t" uri="http://mytags.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<mt:userTemplate title="Manage Album">
	<jsp:attribute name="content">
	
		<section class="row row--grid">
				<!-- title -->
				<div class="col-12">
					<div class="main__title">
						<h2>Your Albums</h2>
						<a href="${pageContext.request.contextPath }/playlist/add" class="btn-add-new-track btn-glow">Add New Album</a>
					</div>
				</div>
				<!-- end title -->
				<div class="col-12">
                    <div class="main__filter">
						<form action="#" class="header__search">
							<input type="text" placeholder="Search..." class="mr-5">
							<button type="button"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M21.71,20.29,18,16.61A9,9,0,1,0,16.61,18l3.68,3.68a1,1,0,0,0,1.42,0A1,1,0,0,0,21.71,20.29ZM11,18a7,7,0,1,1,7-7A7,7,0,0,1,11,18Z"></path></svg></button>
						</form>			

						<div class="slider-radio">
							<input type="radio" name="publish" id="all" checked="checked" value="all"><label for="all" style="">All</label>
							<input type="radio" name="publish" id="publish" value="publish"><label for="publish" style="">Publish</label>
							<input type="radio" name="publish" id="unpublish" value="unpublish"><label for="unpublish">Unpublish</label>
						<div class="sliding-piece" style="position: absolute; transition: width 0.2s ease 0s, height 0.2s ease 0s, top 0.2s ease 0s, left 0.2s ease 0s; opacity: 0; left: 5px; top: 5px; width: 88.75px; height: 30px;"></div></div>
					</div>
                </div>

							<c:forEach var="album" items="${albums }">
							<div class="col-12 col-sm-6 col-lg-4">
								<div class="event" data-bg="${pageContext.request.contextPath }/uploads/images/playlist/${album.thumbnail }">
									<span class="event__date"><fmt:formatDate value="${album.publishDate }" type="date" pattern="MMM-dd-yyyy"/></span>
									<h3 class="event__title">
										<a href="${pageContext.request.contextPath }/playlist/edit/${album.id}">${album.title }</a>
									</h3>
									<p class="event__address" style="max-height: 54px">${album.description }</p>
									<c:if test="${album.statusId == 3 }">
										<p class="unPublish-status"><i class="las la-eye-slash mr-2 white__icon"></i></p>
									</c:if>
									<button class="btn-dropdown-album-menu-artist">
										<i class="las la-braille audio__icon"></i>
										<div class="dropdown-album-menu-artist">
											<a href="${pageContext.request.contextPath }/playlist/edit/${album.id}" class="dropdown-song-link-menu">
												<i class="las la-edit small__icon"></i>
												<span>Edit Album</span>
											</a>
											<a class="dropdown-song-link-menu favorite-link" data-favorite="true">
												<i class="las la-heart"></i>
												<span>Add To Library</span>
											</a>
											<a class="dropdown-song-link-menu share-link" href="${pageContext.request.contextPath }/playlist/${album.id}">
												<i class="las la-share small__icon"></i>
												<span>Share</span>
											</a>											
										</div>
									</button>
								</div>
							</div>
							</c:forEach>
			</section>
			
	</jsp:attribute>

</mt:userTemplate>
