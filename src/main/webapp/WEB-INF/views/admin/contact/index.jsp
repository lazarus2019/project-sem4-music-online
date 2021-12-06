<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="t" uri="http://mytags.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<mt:adminTemplate title="Mailbox">
	<jsp:attribute name="content">

            <div class="row row--grid">
				<div class="col-12">				

					<!-- content tabs -->
					<div class="tab-content">
						<!-- Playlist Tab -->
						<div class="tab-pane fade show active" id="playlist-tab" role="tabpanel">
							<div class="row row--grid">
								<div class="col-12">
									<div class="iq-card">
                     					<div class="iq-card-header d-flex justify-content-between">
                        					<div class="iq-header-title">
                           						<h4 class="card-title">Mailbox</h4>
                        					</div>
                        					<div class="iq-card-header-toolbar d-flex align-items-center">
					                           Unread:&nbsp<strong class="text-primary amount-unread-mailbox">${amountMailbox }
					                           <c:if test="${amountMailbox > 1 }">
					                           			mails</strong>
					                           </c:if>
					                           <c:if test="${amountMailbox <= 1 }">
					                           			mail</strong>
					                           </c:if>
					                        </div>
                     				 	</div>
				                     <div class="iq-card-body">
				                        <div class="table-responsive">
				                           <table class="data-tables table table-striped table-bordered" style="width:100%">
				                              <thead>
				                                 <tr>
				                                    <th style="height: 50px;">No</th>
				                                    <th style="height: 50px;">Time</th>
				                                    <th style="height: 50px;">Fullname</th>
				                                    <th style="height: 50px;">Email</th>
				                                    <%-- <th style="height: 50px;">Phone</th> --%>
				                                    <th style="height: 50px;">Status</th>
				                                    <th style="height: 50px;">Content</th>
				                                    <th style="height: 50px;">Action</th>
				                                 </tr>
				                              </thead>
				                              <tbody id="playlists-body">
				                              	 <c:forEach var="contact" items="${contacts}" varStatus="i">
					                                 <tr style="height: 100px;" class="contact-row" data-id="${contact.id }">
					                                    <td class="text-center">${i.index + 1 }</td>					                                    
					                                    <td>00:00 AM/PM DD/MM/YYYY</td>
					                                    <td>${contact.fullname }</td>
					                                    <td class="text-center">${contact.email }</td>
					                                    <%-- <td>${contact.phoneNumber }</td> --%>					                                    
					                                    <td class="text-center contact-status">
					                                    	<c:if test="${contact.isRead == true }"><a id="status-btn" class="badge iq-bg-info">Read</a>
					                                    	</c:if>
					                                    	<c:if test="${contact.isRead == false }"><a id="status-btn" class="badge iq-bg-danger">Unread</a>
					                                    	</c:if>
					                                    </td>
					                                    <td>
					                                    	<p class="mb-0 hidden-text">${contact.content }</p>
					                                    </td>
					                                    <td>
					                                       <div class="flex align-items-center text-center list-user-action">
					                                          <a class="bg-primary toggle-read-mailbox" data-toggle="modal" type="button" data-target=".bd-example-modal-lg" title="Read mailbox"
					                                          	 data-id="${contact.id}">
					                                          	<i class="ri-eye-fill"></i>
					                                          </a>
					                                          <a class="bg-primary delete-contact-btn" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete" data-id="${contact.id }">
					                                          	<i class="ri-delete-bin-line"></i>
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
						<!-- end Playlist Tab -->				
					</div>
					<!-- end content tabs -->
				</div>
			</div>	

<!-- View Mailbox Modal -->	
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg view-tracks-modal modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">
        	From: <span class="sender"></span>
        	<
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<strong>Content:</strong>
      	<p class="mailbox-content"></p>
      	<hr>
      	<div class="contact-box-info d-flex justify-content-between">
      		<p class="contact-p">Email: <strong class="contact-info contact-email" onclick="copyToClipBoard(this)" style="cursor: copy;"></strong></p>
      		<p class="contact-p">Phone: <strong class="contact-info contact-phone" onclick="copyToClipBoard(this)" style="cursor: copy;"></strong></p>
      	</div>
      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#replyMailboxModal" onclick="showReplyModal()">Reply</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Reply mailbox Modal -->
<div class="modal fade" id="replyMailboxModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Reply to <span class="reply-to-mailbox"></span></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">To:</label>
            <input type="text" class="form-control recipient-name" id="recipient-name" readonly>
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Message:</label>
            <textarea class="form-control message-text" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary reply-mailbox">Send</button>
      </div>
    </div>
  </div>
</div>


		<script type="module">


			import modal, { swalAlert, redirectAlert, singleAlert, confirmAlert, redirectAlertURLCustom} from '${pageContext.request.contextPath }/resources/user/js/notification.js';

		$('.delete-contact-btn').each(function(index){
		    $(this).on("click", function(){
		        var id = $(this).data("id")
		        confirmAlert(
		function(){
			$.ajax({
            	type: 'GET',
            	data: {
                	id: id
            	},
            	url: '${pageContext.request.contextPath }/admin/contact/delete',
            	success: function (response) {
					var url = ''
                    if(response == "OK"){
                        swalAlert(modal.MODAL_CONTENT.delete_success)
						url = '${pageContext.request.contextPath }/admin/contact'
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

		$('.reply-mailbox').click(function(){
			var email = $('.recipient-name').val();
			var content = $('.message-text').val();
    		console.log(email, content)
			$.ajax({
    		type: 'GET',
        	data: {
          	  email: email,
			  content: content
       	 	},
        	url: '${pageContext.request.contextPath}/admin/contact/sendMail',
        	success: function (status) {
		    		if(status){
						swalAlert(modal.MODAL_CONTENT.send_mail_success)
					}else{
						swalAlert(modal.MODAL_CONTENT.send_mail_error)
					}
	        	}	
			}); 
		})

		</script>
			
<script>
function copyToClipBoard(e){
	navigator.clipboard.writeText(e.textContent);
}

function showReplyModal(){
	let sender = document.querySelector('.sender').textContent
	let email = document.querySelector('.contact-email').textContent
	document.querySelector('.reply-to-mailbox').textContent = sender
	document.querySelector('#recipient-name').value = email
}

$('.toggle-read-mailbox').click(function(){
	var id = $(this).data("id");
    $.ajax({
    	type: 'GET',
        data: {
            id: id
        },
        url: '${pageContext.request.contextPath}/admin/contact/findById',
        success: function (mailbox) {
		    $('.modal-title .sender').text(mailbox.fullname)
		    $('.modal-body .mailbox-content').text(mailbox.content)
		    $('.contact-box-info .contact-email').text(mailbox.email)
		    $('.modal-body .contact-phone').text(mailbox.phoneNumber)
        	checkReadMailbox(id)
        }
	}); 
});

function getPerfectText(text){	
	return text.replace(/^\s+|\s+$/gm,'');
}

function checkReadMailbox(id){
    $.ajax({
    	type: 'GET',
        data: {
            id: id
        },
        url: '${pageContext.request.contextPath}/admin/contact/checkReadMailbox',
        success: function (status) {            	
				if(status){
					var htmls = "<a id='status-btn' class='badge iq-bg-info'>Read</a>"
					$(".contact-row[data-id='"+ id +"'] .contact-status").html(htmls)
					var amountText = $('.amount-unread-mailbox').text()
	            	var amountInt = parseInt(getPerfectText(amountText).split('\n')[0])
	            	amountInt--
	            	if(amountInt > 1){
	                	amountText = amountInt + " mails"
	            	}
	            	if(amountInt <= 1){
	                	amountText = amountInt + " mail"
	                }
	            	$('.amount-unread-mailbox').text(amountText)					
				}
        },
        error: function(){
            console.log("ERROR checkReadMailbox")
        }
	}); 
}
	
</script>

	</jsp:attribute>
</mt:adminTemplate>