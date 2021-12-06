<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="t" uri="http://mytags.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:userTemplate title="Add New Album">
	<jsp:attribute name="content">
	
	    <!-- FORM -->
            <form action="${pageContext.request.contextPath }/playlist/add" modelAttribute="playlist" method="POST" enctype="multipart/form-data">
                <div class="row row--grid">
                    <div class="col-6">
                        <div class="step non-hidden">
                            <div class="add-edit-track-form">
                                <h3 class="clr-white">Album Info</h3>
                                <div class="form-heading clr-white">Album Title:</div>
                                <div class="sign__group">
                                    <input type="text" class="sign__input" placeholder="Title" name="title">
                                </div>
                                <div class="grid-box grid-split-2 mb-1">
                                    <div class="grid-box-item">
                                        <div class="flex-box justify-content-between align-items-center mb-2">
                                            <div class="form-heading clr-white">Your Tracks</div>
                                            <a href="${pageContext.request.contextPath }/track/add" target="_blank" class="form-btn" style="text-decoration: none !important">Upload Track</a>
                                        </div>

                                        <div class="border-dash-box mb-3 p-3 flex-box flex-column all-track-container" style="height: 361.406px">
                                         <div class="flex-box justify-content-between align-items-center mb-2">
                                            <input type="text" class="form-search-track sign__input"
                                                placeholder="Enter keyword" oninput="createSearchFunc(this, 'form-track-container', 'form-track-box', 'p')">
                                                <button type="button" class="circle-icon-lg ml-2" onclick="reloadTracks()"><i class="las la-sync"></i></button>
                                         </div>
                                            <div class="form-track-container mt-2 pr-2" style="height: 100%; overflow-x: hidden;">                                                                  
                         
                                                <c:forEach items="${tracks}" var="track">
	                                                <div class="form-track-box" data-id="${track.id }"><p class="clr-white mb-0" >${track.title }</p>
		                                                <input type="checkbox" name="tracks" value="${track.id }" id="track-${track.id }" style="display: none">
	                                                    <div class="form-track-box-option">
		                                                    <c:if test="${track.status.id == 2 }">
			                                                    <i class="las la-exclamation-circle mr-2 orange__icon"></i>
		                                                    </c:if>
		                                                    <c:if test="${track.status.id == 3 }">
			                                                    <i class="las la-eye-slash mr-2 blue__icon"></i>
		                                                    </c:if>
		                                                    <c:if test="${track.isPremium }">
			                                                    <i class="las la-crown yellow__icon mr-2"></i>
		                                                    </c:if>
		                                                    <label for="track-${track.id }" class="form-track-option clr-green" onclick="chooseTrack(this, ${track.id})"><i
		                                                    class="las la-check"></i></label>
	                                                    </div>		                                                                                               
	                                                </div>
			                             		</c:forEach>
			                             		
                                            </div>
                                        </div>
                                    </div>
                                    <div class="grid-box-item">
                                        <div class="flex-box justify-content-between align-items-center mb-2">
                                            <div class="form-heading clr-white">Choose Tracks</div>
                                        </div>
                                        <div
                                            class="border-dash-box mb-3 p-3 flex-box flex-column all-choose-track-container">
                                            <div class="form-choose-track-container mt-2 pr-2"
                                                style="height: 361.406px; overflow-x: hidden;">                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <button class="sign__btn" type="submit">Release Album</button>
                            </div>
                        </div>
                    </div>

                    <div class="col-6">
                        <div class="step non-hidden">
                            <div class="add-edit-track-form">
                                <h3 class="clr-white">Album Assets</h3>
                                <div class="grid-box grid-split-2 mb-1">
                                    <div class="grid-box-item">
                                        <div class="flex-box justify-content-between align-items-center mb-2">
                                            <div class="form-heading clr-white">Description (separate line with /n)
                                            </div>
                                        </div>
                                        <textarea type="text" class="form__textarea" placeholder="Enter Description"
                                            name="description" style="height: 361.406px"></textarea>
                                    </div>
                                    <div class="grid-box-item">
                                        <div class="flex-box justify-content-between align-items-center mb-2">
                                            <div class="form-heading clr-white">Album Thumbnail (square)</div>
                                            <input type="file" name="thumbnailAlbum" id="thumbnailAlbum"
                                                style="display: none;" accept="image/png, image/jpg, image/jpeg"
                                                onchange="previewUpload(this)">
                                            <label for="thumbnailAlbum" class="form-btn">Upload Thumbnail</label>
                                        </div>
                                        <div class="border-dash-box form__thumbnail-track">
                                            <img src="" alt="">
                                            <p>Your thumbnail will be here!</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-heading clr-white">Other options:</div>
                                <div class="border-dash-box-padding">
                                    <div class="flex-box align-items-center mb-2">
                                        <div class="form-heading clr-white mr-2">Publish Date: </div>
                                        <div class="public-date-box">
                                            <input type="date" class="sign__input" name="albumDate" value="" required>
                                        </div>                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
		
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
		
			function reloadTracks(){
				const trackIdsChecked = []; // Array string id
				$('input[name="tracks"]:checked').each(function(){
					trackIdsChecked.push($(this).val())
				})
				
				var id = getAccId('acc_id');
				 if(id != null){
					$.ajax({
		            	type: 'GET',
		            	data: {
		                	id: parseInt(id)		                	
		            	},
		            	url: '${pageContext.request.contextPath }/playlist/reloadTracks',
		            	success: function (tracks) {
			            	if(tracks){
			            		var htmls = ""
					            	
				            		let flag = false
				            		for(let i = 0; i < tracks.length; i++){
				            		    for(let j = 0; j < trackIdsChecked.length; j++){				            		    
				            		        if(parseInt(trackIdsChecked[j]) === tracks[i].id){
				            		            flag = true
				            		            break
				            		        } 
				            		    }
				            		    if(!flag){
				            		        let status = ""
				            		        if(tracks[i].statusId == 2){
				            		            status = "<i class='las la-exclamation-circle mr-2 orange__icon'></i>"
				            		        }
				            		        if(tracks[i].statusId == 3){
				            		            status = "<i class='las la-eye-slash mr-2 blue__icon'></i>"
				            		        }
				            		    
				            		        let premium = ""
				            		        if(tracks[i].premium){
				            		            premium = "<i class='las la-crown yellow__icon mr-2'></i>"
				            		        }
				            		    
				            		        htmls += "<div class='form-track-box' data-id='"+ tracks[i].id +"'>"
				            		        htmls += "<p class='clr-white mb-0'>"+ tracks[i].title +"</p>"
				            		        htmls += "<input type='checkbox' name='tracks' value='"+ tracks[i].id +"' id='track-"+ tracks[i].id +"' style='display: none'>"
				            		        htmls += "<div class='form-track-box-option'>" + status + premium    
				            		        htmls += "<label for='track-"+ tracks[i].id +"' class='form-track-option clr-green' onclick='chooseTrack(this, "+ tracks[i].id +")'><i class='las la-check'></i></label>"
				            		        htmls += "</div></div>"
				            		    }

				            		    flag = false
				            		}
				            		$('.form-track-container').html(htmls)			
				            }		        
		            	}
		        	})
				}			
			}
		</script>
	</jsp:attribute>

</mt:userTemplate>

	    <script>
        setMinForAllDateInput()
    </script>