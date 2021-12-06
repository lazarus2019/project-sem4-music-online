<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="t" uri="http://mytags.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:adminTemplate title="Manage Package">
	<jsp:attribute name="content">

            <div class="row row--grid">
				<div class="col-12">	
				
					<div class="Playlist">
						<!-- tabs nav -->
						<ul class="nav nav-tabs profile__tabs" id="profile__tabs" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#playlist-tab" role="tab" aria-controls="playlist-tab" aria-selected="true">Package</a>
							</li>

							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#album-tab" role="tab" aria-controls="album-tab" aria-selected="false">History</a>
							</li>

						</ul>
						<!-- end tabs nav -->					
					</div>			

					<!-- content tabs -->
					<div class="tab-content">
						<!-- Package Tab -->
						<div class="tab-pane fade show active" id="playlist-tab" role="tabpanel">
							<div class="row row--grid">
								<div class="col-12">
									<div class="iq-card">
                     					<div class="iq-card-header d-flex justify-content-between">
                        					<div class="iq-header-title">
                           						<h4 class="card-title">Package</h4>
                        					</div>       
                        					<div class="iq-card-header-toolbar d-flex align-items-center">
					                           <a href="${pageContext.request.contextPath }/admin/package/add" class="btn btn-primary">Add New Package</a>
					                        </div>                					
                     				 	</div>
				                     <div class="iq-card-body">
				                        <div class="table-responsive">
				                           <table class="data-tables table table-striped table-bordered" style="width:100%">
				                              <thead>
				                                 <tr>
				                                    <th style="height: 50px;">No</th>
				                                    <th style="height: 50px;">Name</th>
				                                    <th style="height: 50px;">Price</th>
				                                    <th style="height: 50px;">Duration</th>
				                                    <th style="height: 50px;">Status</th>
				                                    <th style="height: 50px;">Amount</th>
				                                    <th style="height: 50px;">Description</th>
				                                    <th style="height: 50px;">Action</th>
				                                 </tr>
				                              </thead>
				                              <tbody id="playlists-body">
				                              	 <c:forEach var="pack" items="${packages}" varStatus="i">
					                                 <tr style="height: 100px;" class="contact-row" data-id="${pack.id }">
					                                    <td class="text-center">${i.index + 1 }</td>
					                                    <td>${pack.name }</td>
					                                    <td>$${pack.price }</td>
					                                    <td>${pack.duration }&nbsp;
					                                    	<c:if test="${pack.duration > 1}">
					                                    		months
					                                    	</c:if>
					                                    	<c:if test="${pack.duration <= 1}">
					                                    		month
					                                    	</c:if>
					                                    </td>
					                                    <td class="text-center contact-status">
					                                    	<c:if test="${pack.status == true }"><a id="status-btn" class="badge iq-bg-info">Publish</a>
					                                    	</c:if>
					                                    	<c:if test="${pack.status == false }"><a id="status-btn" class="badge iq-bg-danger">Hiden</a>
					                                    	</c:if>
					                                    </td>
					                                    <td>
					                                    	<p class="mb-0 text-primary">${pack.amountAccount } <i class="ri-user-follow-line"></i></p>
					                                    </td>
					                                    <td>
					                                    	<p class="mb-0 hidden-text">${pack.description }</p>
					                                    </td>
					                                    <td>
					                                       <div class="flex align-items-center text-center list-user-action">
					                                          <a class="bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit" 
					                                          	href="${pageContext.request.contextPath }/admin/package/edit?id=${pack.id }">
					                                          	<i class="ri-pencil-line"></i>
					                                          </a>
					                                          <a class="bg-primary delete-package-btn" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete" 
					                                          	data-id="${pack.id}">
					                                          	<i class="ri-delete-bin-line"></i>
					                                          </a>
					                                          <a class="bg-primary toggle-view-tracks" data-toggle="modal" type="button" data-target=".bd-example-modal-lg" title="View users"
					                                          	 data-id="${pack.id}" data-name="${pack.name }" onclick="getAccountsSign(this)">
					                                          	<i class="ri-list-unordered"></i>
					                                          </a>
					                                       </div>
					                                    </td>
					                                 </tr>
				                                 </c:forEach>
				                              </tbody>
				                           </table>
				                        </div>
				                     </div>
				                  </div>
								</div>
							</div>
						</div>
						<!-- end Package Tab -->
										
						<!-- Album Tab -->
						<div class="tab-pane fade" id="album-tab" role="tabpanel">
							<div class="row row--grid">
								<div class="col-12">
									<div class="iq-card">
                     					<div class="iq-card-header d-flex justify-content-between">
                        					<div class="iq-header-title">
                           						<h4 class="card-title">History Sign In Package</h4>
                        					</div>
                        					<div class="iq-card-header-toolbar d-flex align-items-center">	
                        						<a href="${pageContext.request.contextPath }/admin/package/add" class="btn btn-primary">Export to Excel</a>				                           
					                        </div>
                     					</div>
				                     <div class="iq-card-body">
				                     <p>
				                     <c:set var="total" value="0"></c:set>
				                     <c:forEach var="packageInfo" items="${packageInfos }">
				                     	<c:set var="total" value="${total + packageInfo.servicePackage.price}"></c:set>
				                     </c:forEach>
				                     $${total }
				                     </p>
				                        <div class="table-responsive">				                    
				                           <table class="data-tables table table-striped table-bordered" style="width:100%">
				                              <thead>
				                                 <tr>
				                                    <th>No</th>
				                                    <th>Package name</th>
				                                    <th>Package Price</th>
				                                    <th>Nickname</th>
				                                    <th>Purchase Date</th>
				                                    <th>Expiration Date</th>
				                                 </tr>
				                              </thead>
				                              <tbody id="albums-body">  
				                              	<c:forEach var="packageInfo" items="${packageInfos }" varStatus="i">
				                              		<tr>
				                              		<td class="text-center">${i.index + 1 }</td>
				                              		<td>${packageInfo.servicePackage.name }</td>
				                              		<td>$${packageInfo.servicePackage.price }</td>
				                              		<td>${packageInfo.account.nickname }</td>
				                              		<td>${packageInfo.purchaseDate }</td>
				                              		<td>${packageInfo.expirationDate }</td>
				                              		</tr>
				                              	</c:forEach>
				                              </tbody>
				                           </table>
				                        </div>
				                     </div>
				                  </div>
								</div>
							</div>
						</div>
						<!-- end Album Tab -->
					</div>
					
					
					<!-- end content tabs -->
				</div>
			</div>	

<!-- View History Account Sign in Modal -->	
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg view-tracks-modal modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">
        	[<span class="package-name"></span>]&nbsp;List account sign in
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="iq-card-header d-flex justify-content-between mb-2 text-primary">
            <div class="iq-header-title">
                  Amount: <span class="package-amount"></span> users
            </div>
            <div class="iq-card-header-toolbar d-flex align-items-center">	
                 Total: $<span class="package-total"></span>	
			</div>
      </div>

      	<table class="data-tables table table-striped table-bordered" id="table-accounts" style="width:100%">
				                              <thead>
				                                 <tr>
				                                    <th>No</th>
				                                    <th>Nickname</th>
				                                    <th>Purchase Date</th>
				                                    <th>Expiration Date</th>
				                                 </tr>
				                              </thead>
				                              <tbody class="list-accounts-body">  
				                              	
				                              </tbody>
	    </table>
      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script type="module">


			import modal, { swalAlert, redirectAlert, singleAlert, confirmAlert, redirectAlertURLCustom} from '${pageContext.request.contextPath }/resources/user/js/notification.js';

		$('.delete-package-btn').each(function(index){
		    $(this).on("click", function(){
		        var id = $(this).data("id")
		        confirmAlert(
		function(){
			$.ajax({
            	type: 'GET',
            	data: {
                	id: id
            	},
            	url: '${pageContext.request.contextPath }/admin/package/delete',
            	success: function (response) {
					var url = ''
                    if(response == "OK"){
                        swalAlert(modal.MODAL_CONTENT.delete_success)
						url = '${pageContext.request.contextPath }/admin/package'
						window.location.replace(url);
                    }
                    if(response == "ERROR"){
                        swalAlert(modal.MODAL_CONTENT.delete_error)
                    }
                    if(response == "NOT_ALLOW"){
                        url = '${pageContext.request.contextPath }/home'
                        redirectAlertURLCustom(modal.MODAL_CONTENT.not_allow, url)
                    }
                    if(response == "MUST_SIGN_IN"){
                        url = '${pageContext.request.contextPath }/login/login'
                        redirectAlertURLCustom(modal.MODAL_CONTENT.must_sign_in, url)
                    }
            	}
        	})
			
		}, modal.MODAL_CONTENT.confirm_delete_dialog)
    		});
		});
	</script>

<script defer>
	function getAccountsSign(e){
		var id = $(e).data("id")
		var name = $(e).data("name")
		$.ajax({
	    	type: 'GET',
	        data: {
	            id: id
	        },
	        url: '${pageContext.request.contextPath}/admin/package/getAccountsSign',
	        success: function (packageInfos) {
		        if(packageInfos){
			        if(packageInfos.length > 0){
				        let htmls = ""
				        for(let i = 0; i < packageInfos.length; i++){
				        	htmls += "<tr>"
				        	htmls += "<td>"+ (i+1) +"</td>"
				        	htmls += "<td>"+ packageInfos[i].account_nickname +"</td>"
				        	htmls += "<td>"+ packageInfos[i].purchase_date +"</td>"
				        	htmls += "<td>"+ packageInfos[i].expiration_date +"</td>"
				        	htmls += "</tr>"
							
					   	}
				        $('.package-total').text(packageInfos[0].price * packageInfos.length)
					   	$('.package-amount').text(packageInfos.length)
					   	$('.list-accounts-body').html(htmls)
				    }else{
				    	 $('.package-total').text("0")
						 $('.package-amount').text("0")
						 $('.list-accounts-body').html("")
					}
				   	$('.package-name').text(name)				   	
			    }
			   console.log(packageInfos)
	        }
		}); 
	}
</script>
	</jsp:attribute>
</mt:adminTemplate>