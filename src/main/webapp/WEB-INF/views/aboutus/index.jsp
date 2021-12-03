<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:userTemplate title="AboutUs">
	<jsp:attribute name="content">
	<!-- NTanh -->
	<!-- main content -->
	<main class="main">
		<div class="container-fluid">
			<div class="row row--grid">
				<!-- breadcrumb -->
				<div class="col-12">
					<ul class="breadcrumb">
						<li class="breadcrumb__item"><a
								href="${pageContext.request.contextPath }/home">Home</a></li>
						<li class="breadcrumb__item breadcrumb__item--active">About</li>
					</ul>
				</div>
				<!-- end breadcrumb -->

				<!-- title -->
				<c:forEach var="about" items="${aboutus }">
				<div class="col-12">
					<div class="main__title">
						
						
						
						<h1>${about.title }</h1>

						<p>${about.content } </p>
						
						
					</div>
				</div>
				</c:forEach>
				<!-- end title -->
			
				<!-- <div class="col-12 col-md-6 col-lg-4 order-md-3 order-lg-3">
					<div class="plan plan--purple">
						<h3 class="plan__title">Premium</h3>
						<span class="plan__price">$39.99<span> /month</span></span>
						<ul class="plan__list">
							<li class="green"><svg xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 24 24">
										<path
											d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z" /></svg> Volna Originals</li>
							<li class="green"><svg xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 24 24">
										<path
											d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z" /></svg> Switch plans or cancel anytime</li>
							<li class="green"><svg xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 24 24">
										<path
											d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z" /></svg> Stream 65+ top Live</li>
							<li class="green"><svg xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 24 24">
										<path
											d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z" /></svg> Music channels</li>
						</ul>
						<button class="plan__btn" type="button">Select plan</button>
					</div> 
				</div>-->
			</div>
		</div>
	</main>
	<!-- end main content -->
		
	</jsp:attribute>
</mt:userTemplate>