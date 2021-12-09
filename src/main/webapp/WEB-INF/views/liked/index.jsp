<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:userTemplate title="Liked">
	<jsp:attribute name="content">
	<!-- NTanh -->
   	<!-- main content -->
	<main class="main">
		<div class="container-fluid">

			<!-- releases -->
			<section class="row row--grid">
				<!-- title -->
				<div class="col-12">
					<div class="main__title">
						<h2>Liked Song</h2>
					</div>
				</div>
				<!-- end title -->

               	<!-- <div class="col-12">
                    <form action="#" class="header__search">
                        <input type="text"
								placeholder="Artist, track or podcast">
                        <button type="button">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path
										d="M21.71,20.29,18,16.61A9,9,0,1,0,16.61,18l3.68,3.68a1,1,0,0,0,1.42,0A1,1,0,0,0,21.71,20.29ZM11,18a7,7,0,1,1,7-7A7,7,0,0,1,11,18Z"></path>
                            </svg>
							</button>
                        <button type="button" class="close">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path
										d="M13.41,12l6.3-6.29a1,1,0,1,0-1.42-1.42L12,10.59,5.71,4.29A1,1,0,0,0,4.29,5.71L10.59,12l-6.3,6.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l6.29,6.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z"></path>
                            </svg>
							</button>
                        <div class="result-layout">
        
                        </div>
                    </form>
                </div>
				 -->
				<c:forEach var="bs" items="${lik }">
				<div class="col-6 col-sm-4 col-lg-2">
					<div class="album">
						<div class="album__cover">
							<img
										src="${pageContext.request.contextPath }/uploads/images/events/${bs.thumbnail }"
										alt="" width="120" height="160">
							<a onclick="getTrackById(this)" data-id="${bs.id}" ><svg
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
									<path
												d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z" />
								</svg></a>
							<span class="album__stat">
								<span><i class="las la-thumbs-up"></i> ${bs.likes }</span>
								<!-- <span><svg xmlns="http://www.w3.org/2000/svg"
												viewBox="0 0 24 24">
										<path
													d="M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z" />
									</svg></span> -->
							</span>
						</div>
						<div class="album__title">
							<h3>
								<a href="${pageContext.request.contextPath }/">${bs.title }</a>
							</h3>
						</div>
					</div>
				</div>
				</c:forEach>

			</section>
			<!-- end releases -->
	
		</div>
	</main>
	<!-- end main content -->
		
	</jsp:attribute>
</mt:userTemplate>