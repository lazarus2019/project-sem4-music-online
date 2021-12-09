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
                           <span class="iq-icon" data-toggle="tooltip" data-placement="bottom" title="Number of Artist"><i class="ri-information-fill"></i></span>
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
                           <span class="iq-icon" data-toggle="tooltip" data-placement="bottom" title="Number of Track"><i class="ri-information-fill"></i></span>
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
                           <span class="iq-icon" data-toggle="tooltip" data-placement="bottom" title="Number of User"><i class="ri-information-fill"></i></span>
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
                           <span class="iq-icon" data-toggle="tooltip" data-placement="bottom" title="Number of Package"><i class="ri-information-fill"></i></span>
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
                           <a href="${pageContext.request.contextPath }/admin/artist" type="button" class="btn btn-outline-primary">View All</a>
                        </div>
                     </div>
                     <div class="iq-card-body">
                        <ul class="list-inline p-0 m-0">
                           <c:forEach var="bestArtist" items="${bestArtists }">
	                           <li class="d-flex mb-3 align-items-center p-3 sell-list border border-primary rounded">
	                              <div class="user-img img-fluid">
	                                 <img src="${pageContext.request.contextPath }/uploads/images/artist/${bestArtist.image }" alt="story-img" class="img-fluid rounded-circle avatar-40">
	                              </div>
	                              <div class="media-support-info ml-3">
	                                 <h6>${bestArtist.nickname }</h6>
	                                 <p class="mb-0 font-size-12"><fmt:formatDate value="${bestArtist.birthday }" type="date" pattern="MMM-dd-yyyy"/></p>
	                              </div>
	                              <div class="iq-card-header-toolbar d-flex align-items-center">
	                                 <div class="badge badge-pill badge-primary">${bestArtist.follower } <i class="ri-user-follow-line"></i></div>
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
                  <div class="iq-card">
                    <div class="iq-card-body">
                        <div class="d-flex align-items-top justify-content-between">
                           <div class="media align-items-center">
                               <div class="music-icon-2 text-center text-danger">
                                   <i class="fa fa-smile-o"></i>
                               </div>
                               <div class="iq-card-text pl-3">
                                   <h5>Pro Premium</h5>
                                   <div class="d-block line-height">
                                       <span class="font-size-11 text-info">
                                          $100
                                       </span>                                             
                                    </div>
                               </div>
                           </div>
                           <p class="mb-1">55% (month)</p>
                        </div>
                    </div>
                </div>
                <div class="iq-card">
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
               </div>
               <div class="iq-card mb-0">
                  <div class="iq-card-body p-2">
                     <div id="menu-chart-package"></div>
                  </div>
               </div>
                <!-- end Package -->
            </div>
               <div class="col-lg-4">
                  <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                     <div class="iq-card-body">
                        <h2 class="mb-0"><span class="counter" style="visibility: visible;">3450</span></h2>
                        <p class="mb-0">Music Followers</p>
                        <h6 class="mb-4"><span class="text-success mr-2">20%</span>Positive reviews</h6>
                        <a href="javascript:void();" class="btn btn-danger d-block mt-5 mb-4"> Add Song</a>
                        <div class="mt-2">
                           <div class="d-flex align-items-center justify-content-between">
                              <p class="mt-1 mb-2">Songs</p>
                              <h4 class="counter" style="visibility: visible;">81</h4> 
                           </div>
                           <div class="iq-progress-bar-linear d-inline-block w-100">
                              <div class="iq-progress-bar bg-primary-light iq-progress-bar-icon">
                                 <span class="bg-primary" data-percent="50"></span>
                              </div>
                           </div>
                        </div>
                        <div class="mt-2">
                           <div class="d-flex align-items-center justify-content-between">
                              <p class="mt-1 mb-2">Albems</p>
                              <h4 class="counter" style="visibility: visible;">124</h4> 
                           </div>
                           <div class="iq-progress-bar-linear d-inline-block w-100">
                              <div class="iq-progress-bar bg-success-light iq-progress-bar-icon">
                                 <span class="bg-success" data-percent="50"></span>
                              </div>
                           </div>
                        </div>
                        <div class="mt-2">
                           <div class="d-flex align-items-center justify-content-between">
                              <p class="mt-1 mb-2">Videos</p>
                              <h4 class="counter" style="visibility: visible;">74</h4> 
                           </div>
                           <div class="iq-progress-bar-linear d-inline-block w-100">
                              <div class="iq-progress-bar bg-danger-light iq-progress-bar-icon">
                                 <span class="bg-danger" data-percent="50"></span>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
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
                                 <!-- <tr>
                                    <td>2</td>
                                    <td>Harry Styles</td>
                                    <td>
                                       <div class="media align-items-center">
                                          <img src="images/user/02.jpg" class="img-fluid avatar-35 rounded" alt="image">
                                          <div class="media-body ml-3">
                                             <p class="mb-0">Cliff Hanger</p>
                                          </div>
                                       </div>
                                    </td>
                                    <td>45.00 Mb</td>
                                    <td>20/08/2020</td>
                                    <td>
                                       <div class="d-block line-height">
                                          <span class="font-size-11 text-warning">
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star-half-o"></i>
                                          </span>                                             
                                       </div>
                                    </td>
                                    <td>
                                       <span class="badge badge-danger">Pending</span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>3</td>
                                    <td>Die From A..</td>
                                    <td>
                                       <div class="media align-items-center">
                                          <img src="images/user/03.jpg" class="img-fluid avatar-35 rounded" alt="image">
                                          <div class="media-body ml-3">
                                             <p class="mb-0">Terry Aki</p>
                                          </div>
                                       </div>
                                    </td>
                                    <td>26.08 Mb</td>
                                    <td>20/08/2020</td>
                                    <td>
                                       <div class="d-block line-height">
                                          <span class="font-size-11 text-warning">
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star-half-o"></i>                                             
                                             <i class="fa fa-star-half-o"></i>
                                          </span>                                             
                                       </div>
                                    </td>
                                    <td>
                                       <span class="badge badge-success">Success</span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>4</td>
                                    <td>Life's A Mess</td>
                                    <td>
                                       <div class="media align-items-center">
                                          <img src="images/user/04.jpg" class="img-fluid avatar-35 rounded" alt="image">
                                          <div class="media-body ml-3">
                                             <p class="mb-0">Rock lai</p>
                                          </div>
                                       </div>
                                    </td>
                                    <td>15.04 Mb</td>
                                    <td>20/08/2020</td>
                                    <td>
                                       <div class="d-block line-height">
                                          <span class="font-size-11 text-warning">
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                          </span>                                             
                                       </div>
                                    </td>
                                    <td>
                                       <span class="badge badge-danger">Pending</span>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td>5</td>
                                    <td>Rags2Riches</td>
                                    <td>
                                       <div class="media align-items-center">
                                          <img src="images/user/05.jpg" class="img-fluid avatar-35 rounded" alt="image">
                                          <div class="media-body ml-3">
                                             <p class="mb-0">Anna Mull</p>
                                          </div>
                                       </div>
                                    </td>
                                    <td>10.03 Mb</td>
                                    <td>20/08/2020</td>
                                    <td>
                                       <div class="d-block line-height">
                                          <span class="font-size-11 text-warning">
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                             <i class="fa fa-star"></i>
                                          </span>                                             
                                       </div>
                                    </td>
                                    <td>
                                       <span class="badge badge-success">Success</span>
                                    </td>
                                 </tr> -->
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
if(jQuery('#menu-chart-package').length){
    var options = {
      series: [{
      name: 'Package',
      type: 'column',
      data: [23, 11, 22, 27, 13, 22, 37, 21, 44, 22, 30, 50]
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
    labels: ['01/01/2003', '02/01/2003', '03/01/2003', '04/01/2003', '05/01/2003', '06/01/2003', '07/01/2003',
      '08/01/2003', '09/01/2003', '10/01/2003', '11/01/2003', '12/01/2003'
    ],
    markers: {
      size: 0
    },
    xaxis: {
      type: 'datetime'
    }
    };
    var chart = new ApexCharts(document.querySelector("#menu-chart-package"), options);
    chart.render();
}

if(jQuery('#progress-chart').length){
	var arrays = ["track 11", "track 2", "track 3", "track 4", "track 5", "track 6", "track 7", "track 8", "track 9", "track 10"];
	var options = {
		    series: [{
		        name: "track",
		        data: [21, 22, 10, 28, 16, 21, 13, 30, 25, 31]
		    }, {
		        name: "album",
		        data: [21, 22, 10, 28, 16, 21, 13, 30, 25, 31]
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
		        categories: [
		            ['John', 'Doe'],
		            ['Joe', 'Smith'],
		            ['Jake', 'Williams'],
		            ['Amber', 'Harley'],
		            ['Peter', 'Brown'],
		            ['Mary', 'Evans'],
		            ['David', 'Wilson'],
		            ['Lily', 'Roberts'],
		            ['Dan', 'Ariely'],
		            ['John', 'Toland'],
		        ],
		        labels: {
		            style: {
		                fontSize: '15px'
		            }
		        }
		    },
		    yaxis: {
		        title: {
		            text: '(Likes)'
		        }
		    },
		    tooltip: {
		        y: {
		            formatter: function (val) {
		                return val + " likes"
		            }
		        }
		    }
		};

		var chart = new ApexCharts(document.querySelector("#progress-chart"), options);
		chart.render();
}


</script>
	</jsp:attribute>
</mt:adminTemplate>