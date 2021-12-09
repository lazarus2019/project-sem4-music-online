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
                        <s:form method="post" action="${pageContext.request.contextPath }/admin/playlist/edit" 
                           modelAttribute="playlist" enctype="multipart/form-data">
                           <div class="form-group">
                              <label id="title">Title:</label>
                              <s:input path="title" class="form-control" id="title"></s:input>
                           </div>
                           <div class="form-group">
                              <label id="category">Playlist Category:</label>
                              <c:if test="${categoryId == 3 }">
                                 <input type="text" class="form-control" readonly="readonly" value="Album">
                              </c:if>
                              <c:if test="${categoryId != 3 }">
                              	    <s:select path="playlistCategory" class="form-control" id="category" >
	                                   <s:options items="${playlistCategories }" itemValue="id" itemLabel="name"/>
                                 	</s:select>
                              </c:if>
                           </div>
                           <div class="form-group">
                              <label id="description">Description:</label>
                              <s:textarea path="description" class="form-control" id="description"></s:textarea>
                           </div>
                           <div class="form-group">
                              <label>Thumbnail:</label>
                              <input type="file" name="photo" onchange="previewChangeAccountImage(this)">
                              <br>
                              <span>
                              	<img src="${pageContext.request.contextPath }/uploads/images/playlist/${thumbnail }" id="thumbnail" class="img-responsive rounded "  alt="thumbnail" width="300" height="300">
                              </span>
                              <!-- <div class="custom-file">
                                 <input type="file" class="custom-file-input" id="customFile"  name="photo">
                                 <label class="custom-file-label" for="customFile"></label>
                              </div> -->
                           </div>
                           <button type="submit" class="btn btn-primary">Submit</button>
                           <button type="reset" class="btn btn-danger">Reset</button>
                           <s:hidden path="id"></s:hidden>
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