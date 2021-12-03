<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<<<<<<< HEAD
<<<<<<< HEAD
<%@ taglib prefix="t" uri="http://mytags.com"  %>
=======
<%@ taglib prefix="t" uri="http://mytags.com" %>
>>>>>>> origin/NTanh_Branch
=======
<%@ taglib prefix="t" uri="http://mytags.com"  %>
>>>>>>> origin/Thu_Branch3
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:userTemplate title="Edit Track">
	<jsp:attribute name="content">
	
	<!-- FORM -->
            <form action="">
                <div class="row row--grid">
                    <div class="col-6">
                        <div class="step non-hidden">
                            <div class="add-edit-track-form">
                                <h3 class="clr-white">Track Info</h3>
                                <div class="form-heading clr-white">Track Title:</div>
                                <div class="sign__group">
                                    <input type="text" class="sign__input" placeholder="Title" name="title">
                                </div>
                                <div class="form-heading clr-white">Feature Artists:</div>
                                <div class="sign__group">
                                    <input type="text" class="sign__input" placeholder="Search Artist" name="artist">
                                </div>
                                <div class="form-heading clr-white">Genres:</div>
                                <div class="sign__group">
                                    <select name="genres" id="genres" class="sign__input select__form" data-dropdown>
                                        <option value="">Select genres</option>
                                        <option value="1">Romantic</option>
                                        <option value="2">Rock</option>
                                        <option value="3">Old</option>
                                        <option value="4">Sports</option>
                                        <option value="5">Remix</option>
                                        <option value="6">Sufi</option>
                                        <option value="7">Electronic Dance</option>
                                    </select>
                                </div>
                                <div class="flex-box justify-content-between align-items-center mb-2">
                                    <div class="form-heading clr-white">Lyrics (separate line with /n)</div>
                                    <input type="file" name="lyricTrack" id="lyricTrack" style="display: none;"
                                        accept="text/plain">
                                    <label for="lyricTrack" class="form-btn">Import Lyrics</label>
                                </div>
                                <div class="sign__group">
                                    <textarea type="text" class="form__textarea" placeholder="Track Lyrics"
                                        name="artist"></textarea>
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
                                        <div class="flex-box justify-content-between align-items-center mb-2">
                                            <div class="form-heading clr-white">Your Track</div>
                                            <input type="file" name="audioTrack" id="audioTrack" style="display: none;"
                                                accept=".mp3,audio/*" onchange="uploadTrack(this)">
                                            <label for="audioTrack" class="form-btn">Upload Audio</label>
                                        </div>
                                        <div class="audio-upload-progress">
                                            <p class="audio-upload-bar">
                                                <span class="audio-upload-range"></span>
                                            </p>
                                        </div>
                                        <div class="border-dash-box mb-3 p-3">
                                            <div class="sign__group">
                                                <div class="form-heading clr-white">File name: </div>
                                                <input type="text" disabled readonly class="sign__input file-name-upload"
                                                    placeholder="File name">
                                            </div>
                                            <div class="sign__group">
                                                <div class="form-heading clr-white">Duration: </div>
                                                <input type="text" disabled readonly class="sign__input file-duration-upload"
                                                    placeholder="00:00">
                                            </div>
                                            <div class="sign__group">
                                                <div class="form-heading clr-white">Size: </div>
                                                <input type="text" disabled readonly class="sign__input file-size-upload"
                                                    placeholder="0MB">
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
                                            <img src="" alt="">
                                            <p>Your thumbnail will be here!</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-heading clr-white">Other options:</div>
                                <div class="border-dash-box-padding">
                                    <div class="flex-box align-items-center mb-2">
                                        <div class="sign__group sign__group--checkbox mb-0">
                                            <input id="isPremium" name="isPremium" type="checkbox" checked="checked">
                                            <label for="isPremium">Is Premium</label>
                                        </div>
                                        <div class="public-date-box">
                                            <input type="date" class="sign__input" placeholder="Password" name="publishDate"
                                                value="">
                                        </div>
                                        <div class="sign__group sign__group--checkbox mb-0">
                                            <input id="isHidden" name="isHidden" type="checkbox" checked="checked">
                                            <label for="isHidden">Is Hidden</label>
                                        </div>
                                    </div>
                                    <div class="form-heading clr-white">Add to Albums:</div>
                                    <div class="flex-box align-items-start flex-wrap flex-4">
                                        <div class="sign__group sign__group--checkbox mb-1">
                                            <input id="isPremium" name="isPremium" type="checkbox" checked="checked">
                                            <label for="isPremium">Goodbye & Good Riddance</label>
                                        </div>
                                        <div class="sign__group sign__group--checkbox mb-1">
                                            <input id="isPremium" name="isPremium" type="checkbox" checked="checked">
                                            <label for="isPremium">Death Race for Love</label>
                                        </div>
                                        <div class="sign__group sign__group--checkbox mb-1">
                                            <input id="isPremium" name="isPremium" type="checkbox" checked="checked">
                                            <label for="isPremium">Legends Never Die</label>
                                        </div>
                                        <div class="sign__group sign__group--checkbox mb-1">
                                            <input id="isPremium" name="isPremium" type="checkbox" checked="checked">
                                            <label for="isPremium">Fighting Demons</label>
                                        </div>                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
		
	</jsp:attribute>
</mt:userTemplate>