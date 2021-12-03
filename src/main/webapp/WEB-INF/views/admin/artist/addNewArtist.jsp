<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="t" uri="http://mytags.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:adminTemplate title="Add New Artist">
	<jsp:attribute name="content">
		                      <div class="row">
               <div class="col-sm-12">
                  <div class="iq-card">
                     <div class="iq-card-header d-flex justify-content-between">
                        <div class="iq-header-title">
                           <h4 class="card-title">Add Singer</h4>
                        </div>
                     </div>
                     <div class="iq-card-body">
                        <form action="https://templates.iqonic.design/muzik/html/admin-singer.html">
                           <div class="form-group">
                              <label>Singer Name:</label>
                              <input type="text" class="form-control">
                           </div>
                           <div class="form-group">
                              <label>Singer Profile:</label>
                              <div class="custom-file">
                                 <input type="file" class="custom-file-input" id="customFile">
                                 <label class="custom-file-label" for="customFile">Choose file</label>
                              </div>
                           </div>
                           <div class="form-group">
                              <label>Singer Email:</label>
                              <input type="email" class="form-control">
                           </div>
                           <div class="form-group">
                              <label>Singer Description:</label>
                              <textarea class="form-control" rows="4"></textarea>
                           </div>
                           <button type="submit" class="btn btn-primary">Submit</button>
                           <button type="reset" class="btn btn-danger">Reset</button>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
      
         
	</jsp:attribute>
</mt:adminTemplate>