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

            <!-- custom playlist -->
            <section class="row row--grid">
                <!-- title -->
                <div class="col-12">
                    <div class="main__title">
                        <h2>Your Playlist</h2>

                    </div>
                </div>
                <!-- end title -->

                <div class="col-12">
                    <div class="main__carousel-wrap">
                        <div
								class="main__carousel main__carousel--events owl-carousel"
								id="events">
                            <div class="event"
									data-bg="${pageContext.request.contextPath }/uploads/images/events/event1.jpg">
                                <a href="#modal-ticket"
										class="event__ticket open-modal"><svg
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path
												d="M9,10a1,1,0,0,0-1,1v2a1,1,0,0,0,2,0V11A1,1,0,0,0,9,10Zm12,1a1,1,0,0,0,1-1V6a1,1,0,0,0-1-1H3A1,1,0,0,0,2,6v4a1,1,0,0,0,1,1,1,1,0,0,1,0,2,1,1,0,0,0-1,1v4a1,1,0,0,0,1,1H21a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1,1,1,0,0,1,0-2ZM20,9.18a3,3,0,0,0,0,5.64V17H10a1,1,0,0,0-2,0H4V14.82A3,3,0,0,0,4,9.18V7H8a1,1,0,0,0,2,0H20Z" />
                                    </svg> Buy ticket</a>
                                <span class="event__date">March 14, 2021</span>
                                <span class="event__time">8:00 pm</span>
                                <h3 class="event__title">
										<a href="event.html">Sorry Babushka</a>
									</h3>
                                <p class="event__address">1 East Plumb Branch St.Saint Petersburg, FL 33702</p>
                            </div>

                            <div class="event"
									data-bg="${pageContext.request.contextPath }/uploads/images/events/event2.jpg">
                                <a href="#modal-ticket"
										class="event__ticket open-modal"><svg
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path
												d="M9,10a1,1,0,0,0-1,1v2a1,1,0,0,0,2,0V11A1,1,0,0,0,9,10Zm12,1a1,1,0,0,0,1-1V6a1,1,0,0,0-1-1H3A1,1,0,0,0,2,6v4a1,1,0,0,0,1,1,1,1,0,0,1,0,2,1,1,0,0,0-1,1v4a1,1,0,0,0,1,1H21a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1,1,1,0,0,1,0-2ZM20,9.18a3,3,0,0,0,0,5.64V17H10a1,1,0,0,0-2,0H4V14.82A3,3,0,0,0,4,9.18V7H8a1,1,0,0,0,2,0H20Z" />
                                    </svg> Buy ticket</a>
                                <span class="event__date">March 16, 2021</span>
                                <span class="event__time">7:00 pm</span>
                                <h3 class="event__title">
										<a href="event.html">Big Daddy</a>
									</h3>
                                <p class="event__address">71 Pilgrim Avenue Chevy Chase, MD 20815</p>
                            </div>

                            <div class="event"
									data-bg="${pageContext.request.contextPath }/uploads/images/events/event3.jpg">
                                <span class="event__out">Sold out</span>
                                <span class="event__date">March 23, 2021</span>
                                <span class="event__time">9:30 pm</span>
                                <h3 class="event__title">
										<a href="event.html">Rocky Pub</a>
									</h3>
                                <p class="event__address">514 S. Magnolia St. Orlando, FL 32806</p>
                            </div>

                            <div class="event"
									data-bg="${pageContext.request.contextPath }/uploads/images/events/event4.jpg">
                                <a href="#modal-ticket"
										class="event__ticket open-modal"><svg
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path
												d="M9,10a1,1,0,0,0-1,1v2a1,1,0,0,0,2,0V11A1,1,0,0,0,9,10Zm12,1a1,1,0,0,0,1-1V6a1,1,0,0,0-1-1H3A1,1,0,0,0,2,6v4a1,1,0,0,0,1,1,1,1,0,0,1,0,2,1,1,0,0,0-1,1v4a1,1,0,0,0,1,1H21a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1,1,1,0,0,1,0-2ZM20,9.18a3,3,0,0,0,0,5.64V17H10a1,1,0,0,0-2,0H4V14.82A3,3,0,0,0,4,9.18V7H8a1,1,0,0,0,2,0H20Z" />
                                    </svg> Buy ticket</a>
                                <span class="event__date">March 30, 2021</span>
                                <span class="event__time">6:00 pm</span>
                                <h3 class="event__title">
										<a href="event.html">Big Club</a>
									</h3>
                                <p class="event__address">123 6th St. Melbourne, FL 32904</p>
                            </div>

                            <div class="event"
									data-bg="${pageContext.request.contextPath }/uploads/images/events/event5.jpg">
                                <span class="event__out">Sold out</span>
                                <span class="event__date">March 30, 2021</span>
                                <span class="event__time">10:00 pm</span>
                                <h3 class="event__title">
										<a href="event.html">Big Daddy</a>
									</h3>
                                <p class="event__address">71 Pilgrim Avenue Chevy Chase, MD 20815</p>
                            </div>

                            <div class="event"
									data-bg="${pageContext.request.contextPath }/uploads/images/events/event6.jpg">
                                <a href="#modal-ticket"
										class="event__ticket open-modal"><svg
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path
												d="M9,10a1,1,0,0,0-1,1v2a1,1,0,0,0,2,0V11A1,1,0,0,0,9,10Zm12,1a1,1,0,0,0,1-1V6a1,1,0,0,0-1-1H3A1,1,0,0,0,2,6v4a1,1,0,0,0,1,1,1,1,0,0,1,0,2,1,1,0,0,0-1,1v4a1,1,0,0,0,1,1H21a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1,1,1,0,0,1,0-2ZM20,9.18a3,3,0,0,0,0,5.64V17H10a1,1,0,0,0-2,0H4V14.82A3,3,0,0,0,4,9.18V7H8a1,1,0,0,0,2,0H20Z" />
                                    </svg> Buy ticket</a>
                                <span class="event__date">March 31, 2021</span>
                                <span class="event__time">6:30 pm</span>
                                <h3 class="event__title">
										<a href="event.html">Rocky Pub</a>
									</h3>
                                <p class="event__address">514 S. Magnolia St. Orlando, FL 32806</p>
                            </div>
                        </div>

                        <button class="main__nav main__nav--prev"
								data-nav="#events" type="button">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path
										d="M17,11H9.41l3.3-3.29a1,1,0,1,0-1.42-1.42l-5,5a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l5,5a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L9.41,13H17a1,1,0,0,0,0-2Z" />
                            </svg>
							</button>
                        <button class="main__nav main__nav--next"
								data-nav="#events" type="button">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path
										d="M17.92,11.62a1,1,0,0,0-.21-.33l-5-5a1,1,0,0,0-1.42,1.42L14.59,11H7a1,1,0,0,0,0,2h7.59l-3.3,3.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l5-5a1,1,0,0,0,.21-.33A1,1,0,0,0,17.92,11.62Z" />
                            </svg>
							</button>
                    </div>
                </div>
            </section>
            <!-- end custom playlist -->

        </div>
    </main>
    <!-- end main content -->
    
   
   
	</jsp:attribute>
</mt:userTemplate>