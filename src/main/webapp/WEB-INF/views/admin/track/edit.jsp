<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<mt:adminTemplate title="Edit Track">
	<jsp:attribute name="content">
			<div class="row">
               <div class="col-sm-12">
                  <div class="iq-card">
                     <div class="iq-card-header d-flex justify-content-between">
                           <div class="iq-header-title">
                              <h4 class="card-title">Edit Track</h4>
                           </div>
                        </div>
                        <div class="iq-card-body">
                           <s:form method="post" action="${pageContext.request.contextPath }/admin/manage-track/edit" 
                           modelAttribute="track" enctype="multipart/form-data">
                           <div class="form-group">
                              <label id="title">Title:</label>
                              <s:input path="title" class="form-control" id="title"></s:input>
                           </div>
                           <div class="form-group">
                              <label id="genre">Genre:</label>
                                 <s:select path="genres" class="form-control" id="genre" >
	                                 <s:options items="${genres }" itemValue="id" itemLabel="name"/>
                                 </s:select>
                           </div>
                           <div class="custom-control custom-checkbox checkbox-icon custom-control-inline">
                              <s:checkbox path="isPremium" class="custom-control-input" id="customCheck-30"></s:checkbox>
                              <label class="custom-control-label" for="customCheck-30"><i class="las la-crown yellow__icon"></i>Is premium</label>
                           </div>
                           <div class="form-group">
                              <label id="lyrics">Lyrics:</label>
                              <s:textarea path="lyrics" class="form-control" id="lyrics"></s:textarea>
                           </div>
                           <div class="form-group">
                              <label>Thumbnail:</label>
                              <div class="file-upload-wrapper">
							  <input type="file" name="photo">
							</div>
                              
                              <br>
                              <span>
                              	<img src="${pageContext.request.contextPath }/uploads/images/track/${thumbnail }" class="img-responsive rounded "  alt="thumbnail" width="300" height="300">
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
	</jsp:attribute>
</mt:adminTemplate>