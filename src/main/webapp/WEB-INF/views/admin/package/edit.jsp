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
                        <s:form method="post" action="${pageContext.request.contextPath }/admin/package/edit" 
                           modelAttribute="servicePackage" enctype="multipart/form-data">
                           <div class="form-group">
                              <label>Name:</label>
                              <s:input class="form-control" path="name"></s:input>
                           </div>                       
                           <div class="form-group">
                              <label>Price ($):</label>
                              <s:input class="form-control" path="price" step=".01" min="0"></s:input>
                           </div>                       
                           <div class="form-group">
                              <label>Duration (months):</label>
                              <s:input class="form-control" path="duration" min="1"></s:input>
                           </div>                       
                           <div class="form-group">
                              <label>Description:</label>
                              <s:textarea class="form-control" rows="4" path="description"></s:textarea>
                           </div>
                           <div class="custom-control custom-checkbox checkbox-icon custom-control-inline">
                              <s:checkbox path="status" class="custom-control-input" id="customCheck-30"></s:checkbox>
                              <label class="custom-control-label" for="customCheck-30"><i class="las la-check"></i>Is publish</label>
                           </div>
                           <div class="form-group mt-3">
	                           <s:hidden path="id"></s:hidden>
	                           <button type="submit" class="btn btn-primary">Update</button>
	                           <button type="reset" class="btn btn-danger">Reset</button>
                           </div>
                        </s:form>
                     </div>
                  </div>
               </div>
            </div>
	</jsp:attribute>
</mt:adminTemplate>	