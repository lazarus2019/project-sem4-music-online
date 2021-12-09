<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:userTemplate title="Genres">
	<jsp:attribute name="content">
	
	<!-- NTanh -->
	<!-- main content -->
	<main class="main">
		<div class="container-fluid">
			<!-- artists -->
			<div class="row row--grid">
				<!-- breadcrumb -->
				<div class="col-12">
					<ul class="breadcrumb">
						<li class="breadcrumb__item"><a href="index.html">Home</a></li>
						<li class="breadcrumb__item breadcrumb__item--active">Artists</li>
					</ul>
				</div>
				<!-- end breadcrumb -->

				<!-- title -->
				<div class="col-12">
					<div class="main__title main__title--page">
						<h1>Artists</h1>
					</div>
				</div>
				<!-- end title -->
			</div>

			<div class="row row--grid">
				<div class="col-12">
					<div class="main__filter">
						<form action="${pageContext.request.contextPath }/artist/search" class="main__filter-search" method="get">
							<input type="text" name="keyword" placeholder="Search...">
							<button type="submit">
									<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
										<path
											d="M21.71,20.29,18,16.61A9,9,0,1,0,16.61,18l3.68,3.68a1,1,0,0,0,1.42,0A1,1,0,0,0,21.71,20.29ZM11,18a7,7,0,1,1,7-7A7,7,0,0,1,11,18Z" /></svg>
								</button>
						</form>

						<div class="main__filter-wrap">
							

							
						</div>

						<div class="slider-radio">
							
						</div>
					</div>

					<div class="row row--grid">
						<c:forEach var="as" items="${arti }">
					
							<div class="col-6 col-sm-4 col-md-3 col-xl-2">
								<a href="${pageContext.request.contextPath }/artist/id/${as.id}" class="artist">
									<div class="artist__cover">
										<img src="${pageContext.request.contextPath }/uploads/images/artist/${as.image}"
													alt="">
									</div>
									<h3 class="artist__title">${as.nickname }</h3>
									
								</a>
							</div>

						</c:forEach>

						
					</div>

				</div>
			</div>
			<!-- end artists -->

		</div>
	</main>
	<!-- end main content -->
		
    
	</jsp:attribute>
</mt:userTemplate>