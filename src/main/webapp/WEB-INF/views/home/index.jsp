<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="t" uri="http://mytags.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<mt:userTemplate title="home">
	<jsp:attribute name="content">
	
			<!-- slider banner -->
			<t:banner/>
			<!-- end slider banner -->

			<!-- new releases -->
			<t:newReleases/>
			<!-- end new releases -->

			<!-- events -->
			<t:upcommingAlbumn/>
			<!-- end events -->

			<!-- artists -->
			<t:popularArtists/>
			<!-- end artists -->
			
			<!-- weekyly chart -->
			<t:weeklyChart/>
			<!-- end weekly chart -->
	
	</jsp:attribute>
</mt:userTemplate>