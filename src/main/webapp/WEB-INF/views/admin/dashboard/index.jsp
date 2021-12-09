<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<mt:adminTemplate title="Dashboard">
	<jsp:attribute name="content">
        <div class="row">
		    <div class="col-sm-6 col-md-6 col-lg-3">
		        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
		            <div class="iq-card-body">
		                <div class="d-flex align-items-center justify-content-between">
		                    <h6>Artists</h6>
		                    <span class="iq-icon" data-toggle="tooltip" data-placement="bottom" title="Number of Artist"><i
		                            class="ri-information-fill"></i></span>
		                </div>
		                <div class="iq-customer-box d-flex align-items-center justify-content-between mt-3">
		                    <div class="iq-map text-primary font-size-32"><i class="ri-bar-chart-grouped-line"></i></div>
		                    <div class="d-flex align-items-center">
		                        <h2>${countArtist }</h2>
		                        <div class="rounded-circle iq-card-icon iq-bg-primary ml-3"> <i class="las la-user"></i></div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    <div class="col-sm-6 col-md-6 col-lg-3">
		        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
		            <div class="iq-card-body">
		                <div class="d-flex align-items-center justify-content-between">
		                    <h6>Tracks</h6>
		                    <span class="iq-icon" data-toggle="tooltip" data-placement="bottom" title="Number of Track"><i
		                            class="ri-information-fill"></i></span>
		                </div>
		                <div class="iq-customer-box d-flex align-items-center justify-content-between mt-3">
		                    <div class="iq-map text-success font-size-32"><i class="ri-bar-chart-grouped-line"></i></div>
		                    <div class="d-flex align-items-center">
		                        <h2>${countTrack }</h2>
		                        <div class="rounded-circle iq-card-icon iq-bg-success ml-3"><i class="fa fa-music"></i></div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    <div class="col-sm-6 col-md-6 col-lg-3">
		        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
		            <div class="iq-card-body">
		                <div class="d-flex align-items-center justify-content-between">
		                    <h6>Users</h6>
		                    <span class="iq-icon" data-toggle="tooltip" data-placement="bottom" title="Number of User"><i
		                            class="ri-information-fill"></i></span>
		                </div>
		                <div class="iq-customer-box d-flex align-items-center justify-content-between mt-3">
		                    <div class="iq-map text-danger font-size-32"><i class="ri-bar-chart-grouped-line"></i></div>
		                    <div class="d-flex align-items-center">
		                        <h2>${countUser }</h2>
		                        <div class="rounded-circle iq-card-icon iq-bg-danger ml-3"><i class="las la-user-tie"></i></div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    <div class="col-sm-6 col-md-6 col-lg-3">
		        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
		            <div class="iq-card-body">
		                <div class="d-flex align-items-center justify-content-between">
		                    <h6>Packages</h6>
		                    <span class="iq-icon" data-toggle="tooltip" data-placement="bottom" title="Number of Package"><i
		                            class="ri-information-fill"></i></span>
		                </div>
		                <div class="iq-customer-box d-flex align-items-center justify-content-between mt-3">
		                    <div class="iq-map text-info font-size-32"><i class="ri-bar-chart-grouped-line"></i></div>
		                    <div class="d-flex align-items-center">
		                        <h2>${countPackage }</h2>
		                        <div class="rounded-circle iq-card-icon iq-bg-info ml-3"><i class="ri-refund-line"></i></div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    <!-- Progress Chart -->
		    <div class="col-lg-12">
		        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
		            <div class="iq-card-body">
		                <div id="progress-chart"></div>
		            </div>
		        </div>
		    </div>
		    <!-- end Progress Chart -->
		
		    <!-- Best Artist -->
		    <div class="col-lg-4">
		        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
		            <div class="iq-card-header d-flex justify-content-between">
		                <div class="iq-header-title">
		                    <h4 class="card-title">Best artist</h4>
		                </div>
		                <div class="iq-card-header-toolbar d-flex align-items-center">
		                    <a href="${pageContext.request.contextPath }/admin/artist" type="button"
		                        class="btn btn-outline-primary">View All</a>
		                </div>
		            </div>
		            <div class="iq-card-body">
		                <ul class="list-inline p-0 m-0">
		                    <c:forEach var="bestArtist" items="${bestArtists }">
		                        <li class="d-flex mb-3 align-items-center p-3 sell-list border border-primary rounded">
		                            <div class="user-img img-fluid">
		                                <img src="${pageContext.request.contextPath }/uploads/images/artist/${bestArtist.image }"
		                                    alt="story-img" class="img-fluid rounded-circle avatar-40">
		                            </div>
		                            <div class="media-support-info ml-3">
		                                <h6>${bestArtist.nickname }</h6>
		                                <p class="mb-0 font-size-12">
		                                    <fmt:formatDate value="${bestArtist.birthday }" type="date" pattern="MMM-dd-yyyy" />
		                                </p>
		                            </div>
		                            <div class="iq-card-header-toolbar d-flex align-items-center">
		                                <div class="badge badge-pill badge-primary">${bestArtist.follower } <i
		                                        class="ri-user-follow-line"></i></div>
		                            </div>
		                        </li>
		                    </c:forEach>
		                </ul>
		            </div>
		        </div>
		    </div>
		    <!-- end Best Artist -->
		
		    <!-- Package  -->
		    <div class="col-lg-4">
		    	<c:forEach var="bestPackage" items="${bestPackages }">
		        <div class="iq-card">
		            <div class="iq-card-body">
		                <div class="d-flex align-items-top justify-content-between">
		                    <div class="media align-items-center">
		                        <div class="music-icon-2 text-center text-danger">
		                            <i class="fa fa-smile-o"></i>
		                        </div>
		                        <div class="iq-card-text pl-3">
		                            <h5>${bestPackage.name }</h5>
		                            <div class="d-block line-height">
		                                <span class="font-size-11 text-info">
		                                    $${bestPackage.price }
		                                </span>
		                            </div>
		                        </div>
		                    </div>
		                    <p class="mb-1">${bestPackage.average }% (${bestPackage.month })</p>
		                </div>
		            </div>
		        </div>
		        </c:forEach>
		        <!-- <div class="iq-card">
		            <div class="iq-card-body">
		                <div class="d-flex align-items-top justify-content-between">
		                    <div class="media align-items-center">
		                        <div class="music-icon-2 text-center text-danger">
		                            <i class="fa fa-smile-o"></i>
		                        </div>
		                        <div class="iq-card-text pl-3">
		                            <h5>Premium</h5>
		                            <div class="d-block line-height">
		                                <span class="font-size-11 text-info">
		                                    $59
		                                </span>
		                            </div>
		                        </div>
		                    </div>
		                    <p class="mb-1">25% (month)</p>
		                </div>
		            </div>
		        </div>
		        <div class="iq-card">
		            <div class="iq-card-body">
		                <div class="d-flex align-items-top justify-content-between">
		                    <div class="media align-items-center">
		                        <div class="music-icon-2 text-center text-danger">
		                            <i class="fa fa-meh-o"></i>
		                        </div>
		                        <div class="iq-card-text pl-3">
		                            <h5>Basic</h5>
		                            <div class="d-block line-height">
		                                <span class="font-size-11 text-info">
		                                    $9
		                                </span>
		                            </div>
		                        </div>
		                    </div>
		                    <p class="mb-1">20% (month)</p>
		                </div>
		            </div>
		        </div> -->
		        <div class="iq-card mb-0">
		            <div class="iq-card-body p-2">
		                <div id="menu-chart-package"></div>
		            </div>
		        </div>
		    </div>
		    <!-- end Package -->
		    <!-- Best Album -->
		    <div class="col-lg-4">
		        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
		            <div class="iq-card-header d-flex justify-content-between">
		                <div class="iq-header-title">
		                    <h4 class="card-title">Best album</h4>
		                </div>
		                <div class="iq-card-header-toolbar d-flex align-items-center">
		                    <a href="${pageContext.request.contextPath }/admin/playlist" type="button"
		                        class="btn btn-outline-primary">View All</a>
		                </div>
		            </div>
		            <div class="iq-card-body">
		                <ul class="list-inline p-0 m-0">
		                    <c:forEach var="bestAlbum" items="${bestAlbums }">
		                        <li class="d-flex mb-3 align-items-center p-3 sell-list border border-primary rounded">
		                            <div class="user-img img-fluid">
		                                <img src="${pageContext.request.contextPath }/uploads/images/playlist/${bestAlbum.thumbnail }"
		                                    alt="story-img" class="img-fluid rounded-circle avatar-40">
		                            </div>
		                            <div class="media-support-info ml-3">
		                                <h6>${bestAlbum.title }</h6>
		                                <c:forEach var="artist" items="${bestAlbum.accounts }">
		                                	<p class="mb-0 font-size-12">${artist.nickname }</p>
		                                </c:forEach>
		                            </div>
		                            <div class="iq-card-header-toolbar d-flex align-items-center">
		                                <div class="badge badge-pill badge-primary">${bestAlbum.likes } <i
		                                        class="ri-heart-line"></i></div>
		                            </div>
		                        </li>
		                    </c:forEach>
		                </ul>
		            </div>
		        </div>
		    </div>
		               <!-- end Best Album -->
		               <!-- best track -->
		               <div class="col-lg-12">
		                  <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
		                     <div class="iq-card-header d-flex justify-content-between">
		                        <div class="iq-header-title">
		                           <h4 class="card-title">Best track</h4>
		                        </div>
		                        <div class="iq-card-header-toolbar d-flex align-items-center">
		                           <a href="${pageContext.request.contextPath }/admin/manage-track" type="button" class="btn btn-outline-primary">View All</a>
		                        </div>
		                     </div>
		                     <div class="iq-card-body rec-pat">
		                        <div class="table-responsive">
		                           <table class="table table-striped mb-0 table-borderless">
		                              <thead>
		                                 <tr>
		                                    <th style="width: 5%;">No</th>
		                                    <th style="width: 30%;">title</th>
		                                    <th style="width: 25%;">Artist</th>
		                                    <th style="width: 14%;">Publish date</th>
		                                    <th style="width: 14%;">Listens</th>
		                                    <th style="width: 14%;">Genre</th>
		                                    <th style="width: 8%;">Status</th>
		                                 </tr>
		                              </thead>
		                              <tbody>
		                              	 <c:forEach var="bestTrack" items="${bestTracks }" varStatus="i">
			                                 <tr>
			                                    <td>${i.index + 1 }</td>
			                                    <td>
			                                       <div class="media align-items-center">
			                                          <img src="${pageConext.request.contextPath }/uploads/images/track/${bestTrack.thumbnail }" class="img-fluid avatar-35 rounded" alt="image">
			                                          <div class="media-body ml-3">
			                                             <p class="mb-0">
				                                             ${bestTrack.title }
			                                              	 <c:if test="${bestTrack.premium == true}"><span style="color: var(--iq-danger)"><i class="las la-crown"></i></span></c:if>
		                                              	 </p>
			                                          </div>
			                                       </div>
			                                    </td>
			                                    <td>
			                                    	<c:forEach var="artist" items="${bestTrack.accounts }">
			                                    		<span>${artist.nickname }</span>
			                                    	</c:forEach>
			                                    </td>
			                                    <td><fmt:formatDate value="${bestTrack.publishDate }" type="date" pattern="MM/dd/yyyy"/></td>
			                                    <td>${bestTrack.listens } <i class="fas fa-headphones-alt"></i></td>
			                                    <td>${bestTrack.genres.name }</td>
			                                    <td>
			                                    	<c:if test="${bestTrack.statusId == 1 }">
			                                    		<span class="badge badge-info">Public</span>
			                                    	</c:if>
			                                    	<c:if test="${bestTrack.statusId == 3 }">
			                                    		<span class="badge badge-danger">Hidden</span>
			                                    	</c:if>
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
		
            <!-- end best track -->
            
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script>
$(document).ready(function () {
	$.ajax({
		type: 'GET',
		url: '${pageContext.request.contextPath}/admin/dashboard/load-tracks-data',
		success: function(tracks){
			top10tracks = tracks;
			console.log("size: " + top10tracks.length);
			/*Track Chart*/
			if(jQuery('#progress-chart').length){
				var options = {
					    series: [{
						    name: "listen",
					        data: [{
					            x: tracks[0].title,
					            y: tracks[0].listens
					        }, {
					            x: tracks[1].title,
					            y: tracks[1].listens
					        }, {
					            x: tracks[2].title,
					            y: tracks[2].listens
					        }, {
					            x: tracks[3].title,
					            y: tracks[3].listens
					        }, {
					            x: tracks[4].title,
					            y: tracks[4].listens
					        }, {
					            x: tracks[5].title,
					            y: tracks[5].listens
					        }, {
					            x: tracks[6].title,
					            y: tracks[6].listens
					        }, {
					            x: tracks[7].title,
					            y: tracks[7].listens
					        }, {
					            x: tracks[8].title,
					            y: tracks[8].listens
					        }, {
					            x: tracks[9].title,
					            y: tracks[9].listens
					        }],
					    }],
					    chart: {
					        height: 350,
					        type: 'bar'
					    },
					    plotOptions: {
					        bar: {
					            columnWidth: '45%',
					            distributed: true,
					        }
					    },
					    dataLabels: {
					        enabled: false
					    },
					    legend: {
					        show: false
					    },
					    stroke: {
					        show: true,
					        width: 2,
					        colors: ['transparent']
					    },
					    xaxis: {
					        type: 'category',
					        labels: {
					            style: {
					                fontSize: '15px'
					            }
					        }
					    },
					    yaxis: {
					        title: {
					            text: 'Tracks',
					            style: {
					                fontSize:  '20px',
					                fontWeight:  'bold',
					                fontFamily:  undefined,
					                color:  '#263238'
					              },
					        }
					    },
					    tooltip: {
					        y: {
					        	formatter: function (val) {
					                return val + " listens"
					            }
					        }
					    }
					};

					var chart = new ApexCharts(document.querySelector("#progress-chart"), options);
					chart.render();
			}
		}
	})
	
	
	$.ajax({
		type: 'GET',
		url: '${pageContext.request.contextPath}/admin/dashboard/load-package-price',
		success: function(prices){
			if(jQuery('#menu-chart-package').length){
			    var options = {
			      series: [{
			      name: 'Total price',
			      type: 'column',
			      data: [prices[0], prices[1], prices[2], prices[3], prices[4], prices[5], prices[6], prices[7], prices[8], prices[9], prices[10], prices[11]]
			    }],
			    colors: ["#ff4545"],
			      chart: {
			      height: 90,
			      type: 'line',
			      stacked: false,
			      sparkline: {
			        enabled: true,
			      },
			      zoom: {
			        enabled: false
			      }
			    },
			    stroke: {
			      width: [0, 2, 5],
			      curve: 'smooth'
			    },
			    plotOptions: {
			      bar: {
			        columnWidth: '50%'
			      }
			    },
			    
			    fill: {
			      opacity: [0.85, 0.25, 1],
			      gradient: {
			        inverseColors: false,
			        shade: 'light',
			        type: "vertical",
			        opacityFrom: 0.85,
			        opacityTo: 0.55,
			        stops: [0, 100, 100, 100]
			      }
			    },
			    markers: {
			      size: 0
			    },
			    xaxis: {
			          categories: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', "December"],
			    },
			    tooltip: {
			        y: {
			        	formatter: function (val) {
			                return "$" + val 
			            }
			        }
			    }
			    };
			    var chart = new ApexCharts(document.querySelector("#menu-chart-package"), options);
			    chart.render();
			}
		}
	})
	
});
</script>
	</jsp:attribute>
</mt:adminTemplate>