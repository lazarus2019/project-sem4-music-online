<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<mt:adminTemplate title="Edit">
	<jsp:attribute name="content">
		 <div class="row">
               <div class="col-sm-12">
                  <div class="iq-card">
                     <div class="iq-card-header d-flex justify-content-between">
                        <div class="iq-header-title">
                           <h4 class="card-title">Edit </h4>
                        </div>
                     </div>
                     <div class="iq-card-body">
                        <s:form method="post" action="${pageContext.request.contextPath }/admin/advertisement/edit" modelAttribute="advertisement" enctype="multipart/form-data">
                        <div class="row">
                        	<div class="col-6">
                           <div class="form-group">
                              <label>Title:</label>
                              <s:input class="form-control" path="title"/>
                           </div>                       
                           <div class="form-group">
                              <label>Description:</label>
                              <s:textarea class="form-control" rows="4" path="description"></s:textarea>
                           </div>
                           </div>
                           <div class="col-6">
		                       	<div class="row">
			                       	<div class="col-6">
			                           <div class="form-group">
			                              <label for="fileThumbnail" style="cursor: pointer">Upload thumbnail (square)</label>
			                              <input type="file" class="form-control" id="fileThumbnail" name="fileThumbnail" accept="image/png, image/jpg, image/jpeg" onchange="previewImage(this)" style="display:none">
										  <img width="100%" height="auto" src="${pageContext.request.contextPath }/uploads/images/advertisement/${thumbnail}" class="fileThumbnail" style="border: 1px solid #eee; border-radius: 5px">                         
			                           </div>    
			                            </div>     
			                            <div class="col-6">               
			                           <div class="form-group d-flex justify-content-between">
			                              <label for="audioFile">Your audio</label>
			                              <audio src="${pageContext.request.contextPath }/uploads/audio/advertisement/${audio}" id="audioAds"></audio>
			                              <div class="audio-controller">
			                              	<i class="ri-play-circle-fill h3" style="cursor: pointer" onclick="playAudio(true)"></i>
			                              	<i class="ri-pause-circle-fill h3" style="cursor: pointer; display: none" onclick="playAudio(false)"></i>
			                              </div>
			                           </div>                      
			                           </div>     
                            </div>  
                             </div>  
                              </div>     
                           <s:hidden path="id"></s:hidden>
	                           <button type="submit" class="btn btn-primary">Submit</button>
	                           <button type="reset" class="btn btn-danger">Reset</button>
                        </s:form>
                     </div>
                  </div>
               </div>
            </div>           
  
            <script>
            let audio = document.querySelector("#audioAds")
            const playBtn = document.querySelector(".ri-play-circle-fill")
            const pauseBtn = document.querySelector(".ri-pause-circle-fill")
				function playAudio(status){
					if(status){
						playBtn.style.display = "none"
						pauseBtn.style.display = "block"
						audio.play()
					}else{
						playBtn.style.display = "block"
						pauseBtn.style.display = "none"
						audio.pause()						
					}
				}
            
	            function previewImage(e) {
	        	    const img = document.querySelector(".fileThumbnail") || null
	        	    const file = e.files[0];
	        	    if (file) {
	        	        const reader = new FileReader();
	        	        reader.onload = function() {
	        	            const result = reader.result;
	        	            if (img) {
	        	                img.src = result        	                
	        	            }
	        	        }
	
	        	        reader.readAsDataURL(file);
	        	    }
	        	}
            </script>
	</jsp:attribute>
</mt:adminTemplate>	