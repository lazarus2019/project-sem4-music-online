<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>


<mt:userTemplate title="Edit Track">
	<jsp:attribute name="content">
	
	<!-- FORM -->
            <s:form method="post" action="${pageContext.request.contextPath }/track/edit" modelAttribute="track" enctype="multipart/form-data">
                <div class="row row--grid">
                    <div class="col-6">
                        <div class="step non-hidden">
                            <div class="add-edit-track-form">
                                <h3 class="clr-white">Track Info</h3>
                                <div class="form-heading clr-white">Track Title:</div>
                                <div class="sign__group">
                                    <s:input path="title" class="sign__input" id="title" placeholder="Title"></s:input>
                                </div>
                                <div class="form-heading clr-white">Feature Artists:</div>
                                <div class="sign__group">                                
                                    <select
									class="js-example-basic-multiple sign__input select__form" name="artists"
									multiple="multiple">
										<c:forEach items="${artists}" var="artist">		
															<c:set var="sF" value=""/>
					                                        <c:if test="${not empty featArtistIds}">
														    	<c:forEach items="${featArtistIds }" var="featArtistId">
														    	
														    		<c:if test="${featArtistId == artist.id }">														    		
														    			<c:set var="sF" value="selected"/>
														    		</c:if>											    		

														    	</c:forEach>                                        
					                                        </c:if>								
											
											<option value="${artist.id }" ${sF }>${artist.nickname }</option>
                             			</c:forEach>
									</select>
                                </div>
                                <div class="form-heading clr-white">Genres:</div>
                                <div class="sign__group">
                                    <%-- <select name="genres.id" id="genres"
									class="sign__input select__form" data-dropdown required>
                                        <option value="">Select genres</option>
                             			<c:forEach items="${genres}" var="genre">
                             					<option value="${genre.id }">${genre.name }</option>
                             			</c:forEach>
                                    </select> --%>
                                    
                                    <s:select path="genres" class="sign__input select__form">
                             			<s:options items="${genres}" itemValue="id" itemLabel="name"/>  
                                    </s:select>
                                </div>
                               <div	class="flex-box justify-content-between align-items-center mb-2">
                                    <div class="form-heading clr-white">Lyrics (separate line with /n)</div>
                                    <input type="file" name="lyricsTrack"
									id="lyricsTrack" style="display: none;" accept="text/plain" onchange="callFile(this)">
                                    <label for="lyricsTrack" class="form-btn">Import Lyrics</label>
                                </div>
                                <div class="sign__group">
                                    <s:textarea type="text"
									class="form__textarea" placeholder="Track Lyrics" id="lyrics-textarea" path="lyrics"></s:textarea>
                                </div>
                                

                                <button class="sign__btn" type="submit">Update Track</button>
                                <s:hidden path="id"></s:hidden>
                            </div>
                        </div>
                    </div>

                    <div class="col-6">
                        <div class="step non-hidden">
                            <div class="add-edit-track-form">
                                <h3 class="clr-white">Track Assets</h3>
                                <div class="grid-box grid-split-2 mb-1">
                                    <div class="grid-box-item">
                                        <div class="flex-box justify-content-between align-items-center mb-2">
                                            <div class="form-heading clr-white">Other options:</div>  
                                            <jsp:useBean id="now" class="java.util.Date"/>
                                            <c:set var="clr" value=""></c:set>  
                                            <c:if test="${trackDate le now }">
                                            	<c:set var="clr" value="bg-clr-green"></c:set>
                                            </c:if>
                                            <c:if test="${trackDate gt now }">
                                            	<c:set var="clr" value="bg-clr-orange"></c:set>                                            	
                                            </c:if>
	                                            <div class="form-heading clr-white m-0 publish-date ${clr }">${trackDate }</div>                            
                                        </div>
                                       
                                        <div class="border-dash-box mb-3 p-3"  style="height: 361.406px;max-height:100%">
                                            <div class="flex-box align-items-center mb-2">
		                                        <div class="sign__group sign__group--checkbox mb-0">
		                                            <s:checkbox path="isPremium" id="checkbox-isPremium"></s:checkbox>
		                                            <label for="checkbox-isPremium" id="label-isPremium">Is Premium <i class="las la-crown yellow__icon"></i></label>
		                                        </div>                                       
		                                        <div class="sign__group sign__group--checkbox mb-0">
		                                        
		                                        <c:set var="isC" value=""/>
		                                        <c:if test="${statusId != 2 }">
		                                        
		                                        	<c:if test="${statusId == 3 }">
		                                        		<c:set var="isC" value="checked"/>
		                                        	</c:if>
		                                        	
		                                            <input id="isHidden" name="isHidden" type="checkbox" value="${statusId }" ${isC }>
		                                            <label for="isHidden">Is Hidden</label>
		                                        </c:if>
		                                        
		                                        </div>  
                                    		</div>
                                    <div class="flex-box align-items-center mb-2 justify-content-between">
	                                    <div class="form-heading clr-white">Add to Albums:</div>
	                                    <button type="button" class="circle-icon-lg ml-2" onclick="reloadAlbums()"><i class="las la-sync"></i></button>
                                    </div>
                                    <div class="flex-box align-items-start flex-wrap flex-6 album-container">
                                     <c:forEach items="${albums }" var="album">
                                        				<c:set var="s" value=""/>
					                                        <c:if test="${not empty albumOwnIds}">
														    	<c:forEach items="${albumOwnIds }" var="albumOwnId">
														    	
														    		<c:if test="${albumOwnId == album.id }">														    		
														    			<c:set var="s" value="checked"/>
														    		</c:if>											    		

														    	</c:forEach>                                        
					                                        </c:if>
										<div class="sign__group sign__group--checkbox mb-3 mr-1">
							            	 <input id="album-artist-${album.id }" name="albums" type="checkbox" value="${album.id }" ${s }>							    	
					                         <label for="album-artist-${album.id }">${album.title }</label>
	        	                        </div>
									</c:forEach>                                   
                                    </div>
                                        </div>
                                    </div>
                                    <div class="grid-box-item">
                                        <div class="flex-box justify-content-between align-items-center mb-2">
                                            <div class="form-heading clr-white">Track Thumbnail (square)</div>
                                            <input type="file" name="thumbnailTrack" id="thumbnailTrack"
                                                style="display: none;" accept="image/png, image/jpg, image/jpeg" onchange="previewUpload(this)">
                                            <label for="thumbnailTrack" class="form-btn">Upload Thumbnail</label>
                                        </div>
                                        <div class="border-dash-box form__thumbnail-track">
                                            <img src="${pageContext.request.contextPath }/uploads/images/track/${thumbnail }" alt="" style="display: block;">
                                            <p style="display: none">Your thumbnail will be here!</p>
                                        </div>
                                    </div>
                                </div>                                
                          		<button type="button" class="delete_form__btn" data-id="${trackId }">Delete Track</button>
                            </div>
                        </div>
                    </div>
                </div>
            </s:form>
            
            <script>
				function getAccId(name){
				    var nameEQ = name + "=";
				    var ca = document.cookie.split(';');
				    for (var i = 0; i < ca.length; i++) {
				        var c = ca[i];
				        while (c.charAt(0) == ' ') c = c.substring(1, c.length);
				        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
				    }
				    return null;
				}
		
				function reloadAlbums(){
				    const albumIdsChecked = []; // Array string id
				    $('input[name="albums"]:checked').each(function(){
				        albumIdsChecked.push($(this).val())
				    })
				    
				    var id = getAccId('acc_id');
				     if(id != null){
				        $.ajax({
				            type: 'GET',
				            data: {
				                id: parseInt(id)				                
				            },
				            url: '${pageContext.request.contextPath }/track/reloadAlbums',
				            success: function (albums) {
					            console.log(albums)
				                
				                var htmls = ""
				                    
				                    let flag = false
				                    for(let i = 0; i < albums.length; i++){
				                        let checked = ""
				                        for(let j = 0; j < albumIdsChecked.length; j++){				            		    
				                            if(parseInt(albumIdsChecked[j]) === albums[i].id){
				                                flag = true
				                                break
				                            } 
				                        }
				                       
				                        if(!flag){
				                            checked = "" 
				                        }
				                        if(flag){
				                            checked = "checked"
				                        }

				                        htmls += "<div class='sign__group sign__group--checkbox mb-3 mr-1'>"
				                        htmls += "<input id='album-artist-"+ albums[i].id +"' name='albums' type='checkbox' value='"+ albums[i].id +"' "+ checked +">" 
				                        htmls += "<label for='album-artist-"+ albums[i].id +"'>"+ albums[i].title +"</label>"
				                        htmls += "</div>" 

				                        flag = false
				                    }
				                    $('.album-container').html(htmls)				        
				                }
				           
				        })
				    }			
				}
		</script>
		
		<script type="module" defer>
		import modal, { swalAlert, redirectAlert, singleAlert, confirmAlert, redirectAlertURLCustom} from '${pageContext.request.contextPath }/resources/user/js/notification.js';

		$(".delete_form__btn").click(function(){
			confirmAlert(deleteTrack, modal.MODAL_CONTENT.confirm_delete_dialog)
		})
	

		function deleteTrack(){
			var id = $(".delete_form__btn").data("id")
			$.ajax({
            	type: 'GET',
            	data: {
                	id: id
            	},
            	url: '${pageContext.request.contextPath }/track/delete',
            	success: function (response) {
					var url = ''
                    if(response == "OK"){
                        url = '${pageContext.request.contextPath }/track/manage'
                        redirectAlertURLCustom(modal.MODAL_CONTENT.redirect_track_manage, url)
                    }
                    if(response == "ERROR"){
                        swalAlert(modal.MODAL_CONTENT.delete_error)
                    }
                    if(response == "NOT_ALLOW"){
                        url = '${pageContext.request.contextPath }/home'
                        redirectAlertURLCustom(modal.MODAL_CONTENT.not_allow, url)
                    }
                    if(response == "MUST_SIGN_IN"){
                        url = '${pageContext.request.contextPath }/login/login'
                        redirectAlertURLCustom(modal.MODAL_CONTENT.must_sign_in, url)
                    }
            	}
        	})
			
		}
		</script>
	</jsp:attribute>
</mt:userTemplate>
