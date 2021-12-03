<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:adminTemplate title="General">
	<jsp:attribute name="content">
		  <div class="row">
               <div class="col-sm-12">
                  <div class="iq-card">
                     <div class="iq-card-header d-flex justify-content-between">
                         <div class="iq-header-title">
                           <h4 class="card-title">About Us</h4>
                         </div>
	                     <div class="iq-card-header-toolbar d-flex align-items-center">
						     <a href="${pageContext.request.contextPath }/admin/aboutus/add" class="btn btn-primary">Add more Info</a>
						 </div>
                     </div>
                     <div class="iq-card-body">
                     	  <div>
	                           <div class="form-group">
	                              <input type="text" class="form-control" readonly="readonly" value="">
	                           </div>
	                           <div class="form-group">
	                              <textarea class="form-control" rows="5" name="description"></textarea>
	                           </div>
	                       </div>
                     	  <div>
	                           <div class="form-group">
	                              <input type="text" class="form-control" readonly="readonly" value="">
	                           </div>
	                           <div class="form-group">
	                              <textarea class="form-control" rows="5" name="description"></textarea>
	                           </div>
	                       </div>
                     	  <div>
	                           <div class="form-group">
	                              <input type="text" class="form-control" readonly="readonly" value="">
	                           </div>
	                           <div class="form-group">
	                              <textarea class="form-control" rows="5" name="description"></textarea>
	                           </div>
	                       </div>
                     </div>
                  </div>
               </div>
            </div>	  
	</jsp:attribute>
</mt:adminTemplate>