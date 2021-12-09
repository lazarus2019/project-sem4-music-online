<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:userTemplate title="Contact">
	<jsp:attribute name="content">
	<!-- NTanh -->
	<!-- main content -->
	<main class="main">
		<div class="container-fluid">
			<div class="row row--grid">
				<!-- breadcrumb -->
				<div class="col-12">
					<ul class="breadcrumb">
						<li class="breadcrumb__item"><a href="${pageContext.request.contextPath }/home">Home</a></li>
						<li class="breadcrumb__item breadcrumb__item--active">Contacts</li>
					</ul>
				</div>
				<!-- end breadcrumb -->

				<!-- title -->
				<div class="col-12">
					<div class="main__title main__title--page">
						<h1>Contact</h1>
					</div>
				</div>
				<!-- end title -->
			</div>

			<div class="row row--grid">
				<div class="col-12 col-lg-7 col-xl-8">
					<form class="sign__form sign__form--contacts" method="POST" action="${pageContext.request.contextPath }/contact/save" >
						<div class="row">
							<div class="col-12 col-md-6">
								<div class="sign__group">
									<input type="text" name="fullname" class="sign__input" placeholder="Name" required="required">
								</div>
							</div>

							<div class="col-12 col-md-6">
								<div class="sign__group">
									<input type="email" name="email" class="sign__input" placeholder="Email" required="required">
								</div>
							</div>

							<div class="col-12">
								<div class="sign__group">
									<input type="text" name="phoneNumber" class="sign__input" placeholder="Phone" required="required">
								</div>
							</div>

							<div class="col-12">
								<div class="sign__group">
									<textarea name="content" required="required" class="sign__textarea" placeholder="Type your message"></textarea>
								</div>
							</div>

							<div class="col-12 col-xl-3">
								<button type="submit" class="sign__btn">Send</button>
							</div>
						</div>
					</form>	
				</div>

				
			</div>

			
		</div>
	</main>
	<!-- end main content -->

		
	</jsp:attribute>
</mt:userTemplate>