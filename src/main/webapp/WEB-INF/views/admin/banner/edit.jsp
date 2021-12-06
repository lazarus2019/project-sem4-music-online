<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<mt:adminTemplate title="About">
	<jsp:attribute name="content">
			<div class="row">
               <div class="col-sm-12">
                  <div class="iq-card">
                     <div class="iq-card-header d-flex justify-content-between">
                        <div class="iq-header-title">
                           <h4 class="card-title">Edit Banner</h4>
                        </div>
                     </div>
                     <div class="iq-card-body">
                        <s:form method="post" action="${pageContext.request.contextPath }/admin/banner/edit" modelAttribute="banner" enctype="multipart/form-data">
                           <div class="form-group">
                              <label>Title:</label>
                              <s:input class="form-control" path="title"></s:input>
                           </div>
                           <div class="form-group">
                              <s:textarea class="form-control" rows="5" path="description"></s:textarea>
                           </div>
                           <div class="form-group">
                              <label>Thumbnail:</label>
                              <input type="file" name="photo">
                              <br>
                              <span>
                              	<img src="${pageContext.request.contextPath }/uploads/images/banner/${image }" class="img-responsive rounded "  alt="thumbnail" width="600" height="300">
                              </span>
                              <!-- <div class="custom-file">
                                 <input type="file" class="custom-file-input" id="customFile"  name="photo">
                                 <label class="custom-file-label" for="customFile"></label>
                              </div> -->
                           </div>
                           <button type="submit" class="btn btn-primary">Submit</button>
                           <button type="reset" class="btn btn-danger">Reset</button>
                           <s:hidden path="id" />
                        </s:form>
                     </div>
                  </div>
               </div>
            </div>	  
	</jsp:attribute>
</mt:adminTemplate>