<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<mt:adminTemplate title="Add">
	<jsp:attribute name="content">
		 <div class="row">
               <div class="col-sm-12">
                  <div class="iq-card">
                     <div class="iq-card-header d-flex justify-content-between">
                        <div class="iq-header-title">
                           <h4 class="card-title">Add new advertisement</h4>
                        </div>
                     </div>
                     <div class="iq-card-body">
                        <s:form method="post" action="${pageContext.request.contextPath }/admin/advertisement/add" modelAttribute="advertisement" enctype="multipart/form-data">
                        <div class="row">
                        	<div class="col-6">
                        		<div class="form-group">
                              	<label>Title:</label>
                              <input type="text" class="form-control" name="title">
	                           </div>  
	                           <div class="form-group">
	                              <label>Description:</label>
	                              <textarea class="form-control" rows="4" name="description"></textarea>
	                           </div>  
                        	</div>
                        	<div class="col-6">
		                       	<div class="row">
			                       	<div class="col-6">
			                        	<div class="form-group">
			                              <label for="fileThumbnail" style="cursor: pointer">Upload thumbnail (square)</label>
			                              <input type="file" class="form-control" id="fileThumbnail" name="fileThumbnail" accept="image/png, image/jpg, image/jpeg" onchange="previewImage(this)" style="display:none">
										  <img width="100%" height="auto" class="fileThumbnail" style="border: 1px solid #eee; border-radius: 5px">   
										  </div>                       
			                          </div> 
			                          <div class="col-6">
			                          	<div class="form-group">
			                              <label for="adsAudio" style="cursor: pointer">Upload audio (<= 30s)</label>
			                              <input type="file" class="form-control adsAudio" id="adsAudio" accept=".mp3,audio/*" name="adsAudio" style="display:none">
			                              <div class="form-group">
			                              Duration: <input name="duration" value="0" readonly id="duration">
			                              </div>
			                           </div>  
			                          </div>                      
			                    </div>
                        	</div>                      	
                        </div>
                                                
                                                
                                                  
                           <div class="form-group mt-3">
	                           <button type="submit" class="btn btn-primary">Submit</button>
	                           <button type="reset" class="btn btn-danger">Reset</button>
                           </div>
                        </s:form>
                     </div>
                  </div>
               </div>
            </div>
            
            <script type="module" defer>
            import modal, { swalAlert, redirectAlert, singleAlert, confirmAlert, redirectAlertURLCustom} from '${pageContext.request.contextPath }/resources/user/js/notification.js';
   
			$('.adsAudio').change(function(){
            	const file = $(this).prop('files')[0];
            	const durationInput = document.querySelector('#duration')
            	computeLength(file)
            		.then((result) => {
            			let secondDuration = Number.parseInt(result.duration);
						let size = sizeToMB(result.file.size)
            			if(secondDuration > 30 || size > 10){
            				singleAlert('info', 'Duration alert', 'Duration must least than 30s and file size < 10MB')
                		}else{
	            			if(durationInput){durationInput.value = secondDuration}            			
                   		}
            		})
			})

            function computeLength(file) {
            	return new Promise((resolve) => {
            		var objectURL = URL.createObjectURL(file);
            		var mySound = new Audio([objectURL]);
            		mySound.addEventListener(
            			"canplaythrough",
            			() => {
            				URL.revokeObjectURL(objectURL);
            				resolve({
            					file,
            					duration: mySound.duration
            				});
            			},
            			false,
            		);
            	});
            }

function sizeToMB(size) {
	const mb = Math.round(size / (1024 * 1024) * 100) / 100
	return mb
}
            </script>
            
            <script>
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
