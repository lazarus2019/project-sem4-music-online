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


            <section class="row row--grid">
                <!-- title -->
                <div class="col-12">
                    <div class="main__title">
                        <h2>All Genres</h2>
                    </div>
                </div>
                <!-- end title -->

				<c:forEach var="genres" items="${genresAll }">
	
                <!-- video post -->
                
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="post">
                        <a href="${pageContext.request.contextPath }/track/id/${genres.id}" class="post__img">
                            <img src="${pageContext.request.contextPath }/resources/user/img/posts/${genres.thumbnail }" alt="">
                        </a>

						<!-- 
                        <a href="http://www.youtube.com/watch?v=0O2aH4XLbto" class="post__video open-video">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path
                                    d="M16,10.27,11,7.38A2,2,0,0,0,8,9.11v5.78a2,2,0,0,0,1,1.73,2,2,0,0,0,2,0l5-2.89a2,2,0,0,0,0-3.46ZM15,12l-5,2.89V9.11L15,12ZM12,2A10,10,0,1,0,22,12,10,10,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8,8,0,0,1,12,20Z">
                                </path>
                            </svg> Watch backstage
                        </a>
                        -->

                        <div class="post__content">
                            <a href="${pageContext.request.contextPath }/track/index/${genres.id}" class="post__category">${genres.name }</a>         
                        </div>
                    </div>
                </div>
                <!-- end video post -->
                
                </c:forEach>
                
            </section>

        </div>
    </main>
    <!-- end main content -->
		
	</jsp:attribute>
</mt:userTemplate>