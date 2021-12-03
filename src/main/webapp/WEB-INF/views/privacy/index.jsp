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
						<li class="breadcrumb__item"><a href="index.html">Home</a></li>
						<li class="breadcrumb__item breadcrumb__item--active">Privacy policy</li>
					</ul>
				</div>
				<!-- end breadcrumb -->

				<!-- title -->
				<div class="col-12">
					<div class="main__title">
						<h1>Privacy policy</h1>
						<p>${priva[0].description }</p>
					</div>
				</div>
				<!-- end title -->
			</div>

			<!-- partners -->
			<div class="row">
				<div class="col-12">
					<div class="partners owl-carousel">
						<a href="#" class="partners__img">
							<img src="img/partners/3docean-light-background.png" alt="">
						</a>

						<a href="#" class="partners__img">
							<img src="img/partners/activeden-light-background.png" alt="">
						</a>

						<a href="#" class="partners__img">
							<img src="img/partners/audiojungle-light-background.png" alt="">
						</a>

						<a href="#" class="partners__img">
							<img src="img/partners/codecanyon-light-background.png" alt="">
						</a>

						<a href="#" class="partners__img">
							<img src="img/partners/photodune-light-background.png" alt="">
						</a>

						<a href="#" class="partners__img">
							<img src="img/partners/themeforest-light-background.png" alt="">
						</a>
					</div>
				</div>
			</div>
			<!-- end partners -->
		</div>
	</main>
	<!-- end main content -->

		
	</jsp:attribute>
</mt:userTemplate>