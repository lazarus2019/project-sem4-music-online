<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="t" uri="http://mytags.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:userTemplate title="Notification">
	<jsp:attribute name="content">
		<section class="content">
	      <div class="row">
	        <!-- /.col -->
	        <div class="col-md-9 m-0-auto">
	          <div class="card card-primary card-outline">
	            <div class="card-header notification">
	              <h3 class="card-title">Notifications</h3>
	            </div>
	            <!-- /.card-header -->
	            <c:if test="${empty notifications }">
	            	<table class="table table-hover table-striped">
		                <tbody>
				            <tr>
								<td class="mailbox-subject">Have no notification!</td>
						    </tr>
					    </tbody>
		            </table>
		        </c:if>
	            <c:if test="${not empty notifications }">
			       	<form method="get" action="${pageContext.request.contextPath }/notification/delete">
			            <div class="card-body p-0">
			              <div class="mailbox-controls">
			                <!-- Check all button -->
			                <button type="button" class="btn btn-default btn-sm checkbox-toggle">
								<i class="far fa-square"></i>
			                </button>
			                <div class="btn-group">
			                  <button type="submit" class="btn btn-default btn-sm">
			                    <i class="fas fa-trash-alt"></i>
			                  </button>
			                </div>
			                <!-- /.btn-group -->
			                <div class="float-right">
			                	<a type="button" class="mark-all-as-read">Mark all as read</a>
			                </div>
			                <!-- /.float-right -->
			              </div>
			              <div class="table-responsive mailbox-messages">
			                <table class="table table-hover table-striped">
			                  <tbody>
				                  	<c:forEach var="notification" items="${notifications }" varStatus="i">
				                  		<tr>
						                    <td>
						                      <div class="icheck-primary">
						                        <input type="checkbox" name="id" value="${notification.id }" id="check${i.index + 1}"> 
						                        <label for="check${i.index + 1}"></label>
						                      </div>
						                    </td>
						                    <td class="mailbox-subject">${notification.message }</td>
						                    <td class="mailbox-feedback"><a href="${pageContext.request.contextPath }/contact">Feedback</a></td>
						                    <td class="mailbox-date"><t:timeAgo pastDate="${notification.date }"/></td>
						                    <c:if test="${notification.isRead == true }">
						                    	<td><a type="button"><i class="far fa-check-circle clr-green"></i></a></td>
						                    </c:if>
						                    <c:if test="${notification.isRead == false }">
						                    	<td><a type="button" class="toggle-edit-status" data-id="${notification.id }"><i class="far fa-circle clr-blue"></i></a></td>
						                    </c:if>
					                	</tr>
				                  	</c:forEach>
			                  </tbody>
			                </table>
			                <!-- /.table -->
			              </div>
			              <!-- /.mail-box-messages -->
			            </div>
			       	</form>
		            <!-- /.card-body -->
		            
	          	</c:if>
	          </div>
	          <!-- /.card -->
	        </div>
	        <!-- /.col -->
	      </div>
	      <!-- /.row -->
	    </section>
		<!-- js file import -->
		<script src="${pageContext.request.contextPath }/resources/user/js/jquery.min.js"></script>
		
		<!-- jquery  -->
	<script>
		$(document).ready(function(){
			$('.toggle-edit-status').each(function (index) {
			    $(this).on("click", function () {
			        var id = $(this).data("id")
			        var self = $(this);
			        $.ajax({
			            type: 'GET',
			            data: {
			                id: id
			            },
			            url: '${pageContext.request.contextPath}/notification/edit-status',
			            success: function (status) {
			                if (status == true) {
			                    result = "<i class='far fa-check-circle clr-green'></i>";
			                    self.html(result);
			                } 
	
			            }
			        }); 
			    });
			});

			$('.mark-all-as-read').on("click", function () {
		        $.ajax({
		            type: 'GET',
		            url: '${pageContext.request.contextPath}/notification/mark-all-as-read',
		            success: function (status) {
		                if (status == true) {
		                    result = "<i class='far fa-check-circle clr-green'></i>";
		                    $('.toggle-edit-status').html(result);
		                } 

		            }
		        }); 
		    });	
		
		})
		
		$(function () {
		        //Enable check and uncheck all functionality
		        $('.checkbox-toggle').click(function () {
		            var clicks = $(this).data('clicks')
		            if (clicks) {
				        //Uncheck all checkboxes
				        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
				        $('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
			        } else {
				        //Check all checkboxes
				        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', true)
				        $('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
			        }
			        $(this).data('clicks', !clicks)
			    })
		})
	</script>
	</jsp:attribute>
</mt:userTemplate>
