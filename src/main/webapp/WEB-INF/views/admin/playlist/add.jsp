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
                           <h4 class="card-title">Add new playlist</h4>
                        </div>
                     </div>
                     <div class="iq-card-body">
                        <s:form method="post" action="${pageContext.request.contextPath }/admin/playlist/add" modelAttribute="playlist" enctype="multipart/form-data">
                           <div class="form-group">
                              <label for="title">Title:</label>
                              <input type="text" class="form-control" id="title" name="title" required="required">
                           </div>
                           
                           <div class="form-group">
                              <label>Playlist Category:</label>
                              <select class="form-control" id="exampleFormControlSelect1" name="playlistCategory.id">
                              	 <c:forEach var="playlistCategory" items="${playlistCategories }">
	                                 <option value="${playlistCategory.id }">${playlistCategory.name }</option>
                              	 </c:forEach>
                              </select>
                           </div>
                           <div class="form-group">
                              <label>Description:</label>
                              <textarea class="form-control" rows="4" name="description" required="required"></textarea>
                           </div>
                           <div class="form-group">
                              <label for="inputGenres" >Thumbnail:</label>
                              <input class="file-upload" id="inputGenres" type="file" name="photo" onchange="previewChangeAccountImage(this)" required="required">
                              <br>
                              <img src="" id="thumbnail" class="img-responsive rounded " width="300" height="300">
                           </div>
                           <button type="submit" class="btn btn-primary">Submit</button>
                           <button type="reset" class="btn btn-danger">Reset</button>
                        </s:form>
                     </div>
                  </div>
               </div>
            </div>
            
     <script>
	     function previewChangeAccountImage(e) {
	  	    const img = document.getElementById("thumbnail") || null
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
