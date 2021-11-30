<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="t" uri="http://mytags.com"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<mt:userTemplate title="Add New Track">
	<jsp:attribute name="content">
	
	<!-- FORM -->
            <form action="${pageContext.request.contextPath }/track/add" modelAttribute="track" method="POST" enctype="multipart/form-data">
                <div class="row row--grid">
                    <div class="col-6">
                        <div class="step non-hidden">
                            <div class="add-edit-track-form">
                                <h3 class="clr-white">Track Info</h3>
                                <div class="form-heading clr-white">Track Title:</div>
                                <div class="sign__group">
                                    <input type="text"
									class="sign__input" placeholder="Title" name="title">
                                </div>
                                <div class="form-heading clr-white">Feature Artists:</div>
                                <div class="sign__group">
                                   <select
									class="js-example-basic-multiple sign__input select__form" name="artist[]"
									multiple="multiple">
										<c:forEach items="${artists}" var="artist">
                             					<option value="${artist.id }">${artist.nickname }</option>
                             			</c:forEach>
									</select>
                                </div>
                                <div class="form-heading clr-white">Genres:</div>
                                <div class="sign__group">
                                    <select name="genres" id="genres"
									class="sign__input select__form" data-dropdown>
                                        <option value="">Select genres</option>
                             			<c:forEach items="${genres}" var="genre">
                             					<option value="${genre.id }">${genre.name }</option>
                             			</c:forEach>
                                    </select>

                                </div>
                                <div
								class="flex-box justify-content-between align-items-center mb-2">
                                    <div class="form-heading clr-white">Lyrics (separate line with /n)</div>
                                    <input type="file" name="lyricsTrack"
									id="lyricsTrack" style="display: none;" accept="text/plain" onchange="callFile(this)">
                                    <label for="lyricsTrack"
									class="form-btn">Import Lyrics</label>
                                </div>
                                <div class="sign__group">
                                    <textarea type="text"
									class="form__textarea" placeholder="Track Lyrics" id="lyrics-textarea" name="lyrics"></textarea>
                                </div>
                                

                                <button class="sign__btn" type="submit">Release Track</button>
                            </div>
                        </div>
                    </div>

                    <div class="col-6">
                        <div class="step non-hidden">
                            <div class="add-edit-track-form">
                                <h3 class="clr-white">Track Assets</h3>
                                <div class="grid-box grid-split-2 mb-1">
                                    <div class="grid-box-item">
                                        <div
										class="flex-box justify-content-between align-items-center mb-2">
                                            <div
											class="form-heading clr-white">Your Track</div>
                                            <input type="file"
											name="audioTrack" id="audioTrack" style="display: none;"
											accept=".mp3,audio/*" onchange="uploadTrack(this)">
                                            <label for="audioTrack"
											class="form-btn">Upload Audio</label>
											<input type="hidden" name="duration" id="duration">
                                        </div>
                                        <div
										class="audio-upload-progress">
                                            <p class="audio-upload-bar">
                                                <span
												class="audio-upload-range"></span>
                                            </p>
                                        </div>
                                        <div
										class="border-dash-box mb-3 p-3">
                                            <div class="sign__group">
                                                <div
												class="form-heading clr-white">File name: </div>
                                                <input type="text"
												disabled readonly class="sign__input file-name-upload"
												placeholder="File name">
                                            </div>
                                            <div class="sign__group">
                                                <div
												class="form-heading clr-white">Duration: </div>
                                                <input type="text"
												disabled readonly class="sign__input file-duration-upload"
												placeholder="00:00">
                                            </div>
                                            <div class="sign__group">
                                                <div
												class="form-heading clr-white">Size: </div>
                                                <input type="text"
												disabled readonly class="sign__input file-size-upload"
												placeholder="0MB">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="grid-box-item">
                                        <div
										class="flex-box justify-content-between align-items-center mb-2">
                                            <div
											class="form-heading clr-white">Track Thumbnail (square)</div>
                                            <input type="file"
											name="thumbnailTrack" id="thumbnailTrack"
											style="display: none;"
											accept="image/png, image/jpg, image/jpeg"
											onchange="previewUpload(this)">
                                            <label for="thumbnailTrack"
											class="form-btn">Upload Thumbnail</label>
                                        </div>
                                        <div
										class="border-dash-box form__thumbnail-track">
                                            <img src="" alt="">
                                            <p>Your thumbnail will be here!</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-heading clr-white">Other options:</div>
                                <div class="border-dash-box-padding">
                                    <div
									class="flex-box align-items-center mb-2">
                                        <div
										class="sign__group sign__group--checkbox mb-0">
                                            <input id="isPremium"
											name="isPremium" type="checkbox" checked="checked">
                                            <label for="isPremium">Is Premium <i class="las la-crown yellow__icon"></i></label>
                                        </div>
                                       <!--  <div class="public-date-box">
                                            <input type="date"
											class="sign__input" placeholder="Password" name="publishDate"
											value="">
                                        </div> -->
                                        <div
										class="sign__group sign__group--checkbox mb-0">
                                            <input id="isHidden"
											name="isHidden" type="checkbox" checked="checked">
                                            <label for="isHidden">Is Hidden</label>
                                        </div>
                                    </div>
                                    <div class="form-heading clr-white">Add to Albums:</div>
                                    <div
									class="flex-box align-items-start flex-wrap flex-4">
									<c:forEach items="${albums }" var="album">
									    <div class="sign__group sign__group--checkbox mb-1">
                                            <input id="album-artist-${album.id }"
											name="albums" type="checkbox">
                                            <label for="album-artist-${album.id }">${album.title }</label>
                                        </div>
									</c:forEach>                                  
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
		
	</jsp:attribute>

</mt:userTemplate>
