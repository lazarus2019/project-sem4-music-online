<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="t" uri="http://mytags.com" %>

<mt:adminTemplate title="Edit Track">
	<jsp:attribute name="content">
			<div class="row">
               <div class="col-sm-12">
                  <div class="iq-card">
                     <div class="iq-card-header d-flex justify-content-between">
                           <div class="iq-header-title">
                              <h4 class="card-title">Check in Track</h4>
                           </div>
                        </div>
                        <div class="iq-card-body">
                           <s:form method="post" action="${pageContext.request.contextPath }/admin/manage-track/checkin" 
	                           modelAttribute="track" enctype="multipart/form-data">
	                           <div class="form-group">
	                              <label id="title">Title:</label>
	                              <input class="form-control" id="title" value="${track.title }" readonly="readonly">
	                           </div>
	                           <div class="form-group">
	                              <label id="publishDate">Publish date:</label>
	                              <input class="form-control" id="publishDate" value="<fmt:formatDate value="${track.publishDate }" type="date" pattern="MM/dd/yyyy"/>" readonly="readonly">
	                           </div>
	                           <div class="form-group">
	                              <label id="duration">Timer:</label>
	                              <input class="form-control" id="duration" value="<t:trackTime totalSeconds="${track.duration }"/>" readonly="readonly">
	                           </div>
	                           <div class="form-group">
	                              <label id="genre">Genre:</label>
	                              <input class="form-control" id="genre" value="${track.genres.name }" readonly="readonly">
	                           </div>
	                           <div class="form-group">
	                              <label id="lyrics">Lyrics:</label>
	                              <textarea class="form-control" id="lyrics" readonly="readonly">${track.lyrics }</textarea>
	                           </div>
	                           <div class="custom-control custom-checkbox checkbox-icon custom-control-inline">
	                              <s:checkbox path="isPremium" class="custom-control-input" id="customCheck-30"></s:checkbox>
	                              <label class="custom-control-label" for="customCheck-30"><i class="las la-crown yellow__icon"></i>Is premium</label>
	                           </div>
	                           <div class="form-group">
	                           	  <label id="thumbnail">Thumbnail:</label>
	                           	  <br>
	                              <img src="${pageContext.request.contextPath }/uploads/images/track/${thumbnail }" id="thumbnail" class="img-responsive rounded "  alt="thumbnail" width="300" height="300">
	                           </div>
	                           <br>
	                           <button type="submit" class="btn btn-primary">Check in</button>
	                           <s:hidden path="id"></s:hidden>
	                        </s:form>
                        </div>
                  </div>
               </div>
            </div>	  
	</jsp:attribute>
</mt:adminTemplate>