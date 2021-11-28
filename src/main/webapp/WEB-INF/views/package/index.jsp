<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="t" uri="http://mytags.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:userTemplate title="Notification">
	<jsp:attribute name="content">
		<!-- banner slider -->
		<t:banner/>
		<!-- end banner slider -->
	
						<!-- package -->
						<div class="row row--grid">
							<c:forEach var="pack" items="${packages }">
								<div class="col-12 col-md-6 col-lg-4 order-md-2 order-lg-1">
									<div class="plan plan--green">
										<h3 class="plan__title">${pack.name }</h3>
										<span class="plan__price">$${pack.price }<span> / ${pack.duration } month</span></span>
										<ul class="plan__list">
											<li class="green"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z"/></svg> Music Originals</li>
											<li class="green"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z"/></svg> Basic Featured</li>
											<c:if test="${pack.price == 0 }">
												<li class="red"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z"/></svg> Unlimited Listening Music</li>
												<li class="red"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z"/></svg> Unlimited Downloading Music</li>
												<li class="red"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z"/></svg> Listening Music Without Advertisements</li>
											</c:if>
											<c:if test="${pack.price > 0 }">
												<li class="green"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z"/></svg> Unlimited Listening Music</li>
												<li class="green"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z"/></svg> Unlimited Downloading Music</li>
												<li class="green"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z"/></svg> Listening Music Without Advertisements</li>
											</c:if>
										</ul>
										
										
										<form method="post" action="${postUrl }">
											<input type="hidden" name="upload" value="1" />
											<input type="hidden" name="return" value="${returnUrl }" />
											<input type="hidden" name="cmd" value="_cart" />
											<input type="hidden" name="business" value="${business }" />
					
											
											<input type="hidden" name="item_number_1" value="${pack.id }">
											<input type="hidden" name="item_name_1" value="${pack.name }"> 
											<input type="hidden" name="amount_1" value="${pack.price }"> 
											<input type="hidden" name="quantity_1" value="1">
											
											<button class="plan__btn" type="submit">Buy Now!</button>
										</form>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- end package -->
	</jsp:attribute>
</mt:userTemplate>