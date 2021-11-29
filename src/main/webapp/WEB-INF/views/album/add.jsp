<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="t" uri="http://mytags.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:userTemplate title="Add New Album">
	<jsp:attribute name="content">
	
	    <!-- FORM -->
            <form action="">
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
                                            <a href="add-edit_track.html" class="form-btn">Upload Track</a>
                                        </div>

                                        <div class="border-dash-box mb-3 p-3 flex-box flex-column all-track-container" style="height: 361.406px">
                                            <input type="text" class="form-search-track sign__input"
                                                placeholder="Enter keyword" oninput="createSearchFunc(this, 'form-track-container', 'form-track-box', 'p')">
                                            <div class="form-track-container mt-2 pr-2" style="height: 100%;">                                            
                                                <div class="form-track-box" data-id="">
                                                    <p>Betrayal</p>
                                                    <div class="form-track-box-option">
                                                        <a href="">
                                                            <button class="form-track-option clr-green"><i
                                                                    class="las la-check"></i></button>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="form-track-box" data-id="">
                                                    <p>End of the Road</p>
                                                    <div class="form-track-box-option">
                                                        <a href="">
                                                            <button class="form-track-option clr-green"><i
                                                                    class="las la-check"></i></button>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="form-track-box" data-id="">
                                                    <p>734</p>
                                                    <div class="form-track-box-option">
                                                        <a href="">
                                                            <button class="form-track-option clr-green"><i
                                                                    class="las la-check"></i></button>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="form-track-box" data-id="">
                                                    <p>I'll Be Fine</p>
                                                    <div class="form-track-box-option">
                                                        <a href="">
                                                            <button class="form-track-option clr-green"><i
                                                                    class="las la-check"></i></button>
                                                        </a>
                                                    </div>
                                                </div>
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
                                                style="height: 361.406px">
                                                <div class="form-track-box" data-id="">
                                                    <p>Intro</p>
                                                    <div class="form-track-box-option">
                                                        <a href="">
                                                            <button class="form-track-option clr-red"><i
                                                                    class="las la-times"></i></button>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="form-track-box" data-id="">
                                                    <p>Lean wit Me</p>
                                                    <div class="form-track-box-option">
                                                        <a href="">
                                                            <button class="form-track-option clr-red"><i
                                                                    class="las la-times"></i></button>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="form-track-box" data-id="">
                                                    <p>Lucid Dreams</p>
                                                    <div class="form-track-box-option">
                                                        <a href="">
                                                            <button class="form-track-option clr-red"><i
                                                                    class="las la-times"></i></button>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="form-track-box" data-id="">
                                                    <p>All Girls Are the Same</p>
                                                    <div class="form-track-box-option">
                                                        <a href="">
                                                            <button class="form-track-option clr-red"><i
                                                                    class="las la-times"></i></button>
                                                        </a>
                                                    </div>
                                                </div>
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
                                            name="artist" style="height: 361.406px"></textarea>
                                    </div>
                                    <div class="grid-box-item">
                                        <div class="flex-box justify-content-between align-items-center mb-2">
                                            <div class="form-heading clr-white">Album Thumbnail (square)</div>
                                            <input type="file" name="thumbnailTrack" id="thumbnailTrack"
                                                style="display: none;" accept="image/png, image/jpg, image/jpeg"
                                                onchange="previewUpload(this)">
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
                                            <input type="date" class="sign__input" placeholder="Password"
                                                name="publishDate" value="">
                                        </div>
                                        <div class="sign__group sign__group--checkbox mb-0">
                                            <input id="isHidden" name="isHidden" type="checkbox" checked="checked">
                                            <label for="isHidden">Is Hidden</label>
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

	    <script>
        setMinForAllDateInput()
    </script>