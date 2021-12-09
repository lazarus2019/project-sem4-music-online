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
							<input type="text" placeholder="Search..." class="mr-5" id="search_keyword" oninput="searchAlbumInManage()">
							<button type="button"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M21.71,20.29,18,16.61A9,9,0,1,0,16.61,18l3.68,3.68a1,1,0,0,0,1.42,0A1,1,0,0,0,21.71,20.29ZM11,18a7,7,0,1,1,7-7A7,7,0,0,1,11,18Z"></path></svg></button>
						</form>			

						<div class="slider-radio">
							<input type="radio" name="publish" id="all" checked="checked" value="all" onchange="searchAlbumInManage()"><label for="all" style="">All</label>
							<input type="radio" name="publish" id="publish" value="1" onchange="searchAlbumInManage()"><label for="publish" style="">Publish</label>
							<input type="radio" name="publish" id="unpublish" value="3" onchange="searchAlbumInManage()"><label for="unpublish">Hidden</label>
						<div class="sliding-piece" style="position: absolute; transition: width 0.2s ease 0s, height 0.2s ease 0s, top 0.2s ease 0s, left 0.2s ease 0s; opacity: 0; left: 5px; top: 5px; width: 88.75px; height: 30px;"></div></div>
					</div>
                </div>
							<section class="row row--grid section-manage-album">
							<c:forEach var="album" items="${albums }">
							<div class="col-12 col-sm-6 col-lg-4">
								<div class="event" data-bg="${pageContext.request.contextPath }/uploads/images/playlist/${album.thumbnail }">
									<span class="event__date">${album.publishDate }</span>
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
											<a class="dropdown-song-link-menu" data-id="${album.id}" onclick="getListTrackByAlbumId(this)">
												<i class="las la-play small__icon"></i>
												<span>Play album</span>
											</a>
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
			</section>
			
			<script>
			    function getPublishOption(){
			        var selector = document.querySelector('input[name="publish"]:checked'); 
			        return selector.value;
			    }
			    
			    function getKeywordValue(){
			        var keywordEl = document.querySelector('#search_keyword');
			        return keywordEl.value.replace(/^\s+|\s+$/gm,'');
			    }
			    
			     function searchAlbumInManage(){
			        let option = getPublishOption()
			        let keyword = getKeywordValue()
			            $.ajax({
			                type: 'GET',
			                data: {
			                    option: option,
			                    keyword: keyword
			                },
			                url: '${pageContext.request.contextPath }/playlist/searchAlbumInManage',
			                success: function (albums) {
			                    if(albums){
			                        var htmls = ""
			                        for(let i = 0; i < albums.length; i++){
			                            let status = ""
			                            if(albums[i].statusId == 3){
			                               status = "<p class='unPublish-status'><i class='las la-eye-slash mr-2 white__icon'></i></p>"
			                            }
			    
			                            htmls += "<div class='col-12 col-sm-6 col-lg-4'>"
			                            htmls += "<div class='event' data-bg='${pageContext.request.contextPath }/uploads/images/playlist/"+ albums[i].thumbnail  +"'>"
			                            htmls += "<span class='event__date'>"+ albums[i].publishDate +"</span>"
			                            htmls += "<h3 class='event__title'><a href='${pageContext.request.contextPath }/playlist/edit/"+ albums[i].id +"'>"+ albums[i].title +"</a></h3>"
			                            htmls += "<p class='event__address' style='max-height: 54px'>"+ albums[i].description +"</p>"
			                            htmls += status
			                            htmls += "<button class='btn-dropdown-album-menu-artist'><i class='las la-braille audio__icon'></i><div class='dropdown-album-menu-artist'>"
			                            htmls += "<a class='dropdown-song-link-menu' data-id='"+albums[i].id +"' onclick='getListTrackByAlbumId(this)'><i class='las la-play small__icon'></i><span>Play this album</span></a><a href='${pageContext.request.contextPath }/playlist/edit/"+ albums[i].id +"' class='dropdown-song-link-menu'>"
			                            htmls += "<i class='las la-edit small__icon'></i><span>Edit Album</span></a><a class='dropdown-song-link-menu favorite-link' data-favorite='true'><i class='las la-heart'></i><span>Add To Library</span></a>"
			                            htmls += "<a class='dropdown-song-link-menu share-link' href='${pageContext.request.contextPath }/playlist/"+ albums[i].id +"'>"
			                            htmls += "<i class='las la-share small__icon'></i><span>Share</span></a></div></button></div></div>" 		
			                        }
			    
			                        $('.section-manage-album').html(htmls)
			                    }
			                }
			            })
			    } 
		</script>
	</jsp:attribute>
</mt:userTemplate>
