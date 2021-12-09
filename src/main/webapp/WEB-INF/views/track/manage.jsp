<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:userTemplate title="Your Track">
	<jsp:attribute name="content">
			
			<section class="row row--grid">
				<!-- title -->
				<div class="col-12">
					<div class="main__title">
						<h2>Your Tracks</h2>

						<a href="${pageContext.request.contextPath }/track/add" class="btn-add-new-track btn-glow">Add New Track</a>
					</div>
				</div>
				<!-- end title -->
				
				<div class="col-12">
                    <div class="main__filter">
						<form action="#" class="header__search">
							<input type="text" placeholder="Search..." class="mr-5" id="search_keyword" oninput="searchTrackInManage()">
							<button type="button"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M21.71,20.29,18,16.61A9,9,0,1,0,16.61,18l3.68,3.68a1,1,0,0,0,1.42,0A1,1,0,0,0,21.71,20.29ZM11,18a7,7,0,1,1,7-7A7,7,0,0,1,11,18Z"></path></svg></button>
						</form>			

						<div class="slider-radio">
							<input type="radio" name="publish" id="all" checked="checked" value="all" onchange="searchTrackInManage()"><label for="all" style="">All</label>
							<input type="radio" name="publish" id="publish" value="1" onchange="searchTrackInManage()"><label for="publish" style="">Publish</label>
							<input type="radio" name="publish" id="pending" value="2" onchange="searchTrackInManage()"><label for="pending">Pending</label>
							<input type="radio" name="publish" id="hidden" value="3" onchange="searchTrackInManage()"><label for="hidden">Hidden</label>
						<div class="sliding-piece" style="position: absolute; transition: width 0.2s ease 0s, height 0.2s ease 0s, top 0.2s ease 0s, left 0.2s ease 0s; opacity: 0; left: 5px; top: 5px; width: 88.75px; height: 30px;"></div></div>
					</div>
                </div>

				<section class="row row--grid section-manage-track">
				<c:forEach var="track" items="${tracks }">
				<div class="col-6 col-sm-4 col-lg-2">
					<div class="album">
						<button class="btn-dropdown-album-menu-artist top-45 right-15">
								<i class="las la-braille audio__icon"></i>
								<div class="dropdown-album-menu-artist">
									<a href="${pageContext.request.contextPath }/track/edit/${track.id}" class="dropdown-song-link-menu">
												<i class="las la-edit small__icon"></i>
												<span>Edit Track</span>
									</a>
									<a class="dropdown-song-link-menu favorite-link"
										data-favorite="true">
										<i class="las la-heart"></i>
										<span>Favorite</span>
									</a>
									<a class="dropdown-song-link-menu">
										<i class="las la-plus small__icon"></i>
										<span>Add to Playlist</span>
									</a>																		
								</div>
							</button>
						<div class="album__cover">
							<img
								src="${pageContext.request.contextPath }/uploads/images/track/${track.thumbnail}"
								alt="${track.thumbnail}">
							<a data-id="${track.id }" onclick="getTrackById(this)" class="artist-edit-track" style="cursor: pointer">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
									<path
										d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z"></path>
								</svg>
							</a>
							<span class="album__stat">
								<span><i class="las la-thumbs-up"></i> ${track.likes }</span>
								<span><svg xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 24 24">
										<path
											d="M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z" />
									</svg> ${track.listens}</span>
							</span>							
						</div>
						<div class="album__title">
							<h3>
								<a href="${pageContext.request.contextPath }/track/edit/${track.id}">${track.title }</a>
							</h3>
							
						</div>
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

			function searchTrackInManage(){
				let option = getPublishOption()
				let keyword = getKeywordValue()
					$.ajax({
			            type: 'GET',
			            data: {
			            	option: option,
			            	keyword: keyword
			            },
			            url: '${pageContext.request.contextPath }/track/searchTrackInManage',
			            success: function (tracks) {
			                if(tracks){
				                var htmls = ""
					            for(let i = 0; i < tracks.length; i++){
					            		htmls += "<div class='col-6 col-sm-4 col-lg-2'><div class='album'>"
					            		htmls += "<button class='btn-dropdown-album-menu-artist top-45 right-15'><i class='las la-braille audio__icon'></i><div class='dropdown-album-menu-artist'><a href='${pageContext.request.contextPath}/track/edit/"+ tracks[i].id +"' class='dropdown-song-link-menu'><i class='las la-edit small__icon'></i><span>Edit Track</span></a><a class='dropdown-song-link-menu favorite-link'data-favorite='true'><i class='las la-heart'></i><span>Favorite</span></a><a class='dropdown-song-link-menu'><i class='las la-plus small__icon'></i><span>Add to Playlist</span></a></div></button><div class='album__cover'>"
					            		htmls += "<img src='${pageContext.request.contextPath }/uploads/images/track/"+tracks[i].thumbnail+"'>"
					            		htmls += "<a data-id='"+tracks[i].id +"' onclick='getTrackById(this)' class='artist-edit-track' style='cursor: pointer'>"
					            		htmls += "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'><path d='M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z'></path></svg></a>"
					            		htmls += "<span class='album__stat'><span><i class='las la-thumbs-up'></i> "+tracks[i].likes +"</span><span><svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'><path	d='M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z' />"
					            		htmls += "</svg> "+tracks[i].listens+"</span></span>"
					            		htmls += "</div><div class='album__title'><h3><a href='${pageContext.request.contextPath }/track/edit/"+ tracks[i].id +"'>"+tracks[i].title +"</a></h3></div></div></div>"
						        }

				                $('.section-manage-track').html(htmls)
			                }
			            }
			        })
			}
		</script>
	</jsp:attribute>
</mt:userTemplate>
