
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>Max-Planck-Institut für biophysikalische Chemie |
	Max-Planck-Campus | MPIDS</title>
<meta name="keywords">
<meta name="description">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value="/resources/css/tooltip.css" />"
	rel="stylesheet" type="text/css" />
<script src="<c:url value="/resources/js/jquery-1.9.1.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery-ui.js" />"></script>
<link rel="shortcut icon" type="image/icon"
	href="<c:url value="/resources/images/favicon.ico"/>" />

<script type="text/javascript"
	src="<c:url value="/resources/jspd/jquery-ui-1.8.17.custom.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/jspd/jspdf.debug.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/jspd/basic.js"/>"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$('#submit').hover(function() {
			$(this).css('background', '#95A9B1');
		}, function() {
			$(this).css('background', '#2C5463');
		});
	});
</script>
</head>

<body>
	<a name="top"></a>
	<div id="bg_mainframe">

		<div class="p_m1"></div>
		<div class="p_m2">
			<div class="page">
				<div id="header"
					style="background-image: <c:url value="/resources/images/logo.jpg" /> ">
					<div id="header_logo">
						<a href="home.html"></a>
					</div>
					<div id="mainnavi">
						<ul>
							<li>
								<ul class="navline" id="nav1line">
									<li><a href="home.html">Plasmids</a></li>
									<li><a href="addplasmid.html">Insert Plasmid</a></li>
									<li><a href="deleteplasmid.html">Delete Plasmid</a></li>
									<li><a href="printout.html" >Printout</a></li>
									<li><a href="label.html">Label</a></li>
									<li><a href="map.html" class="current">Map</a></li>
									<li><a href="changepass.html">Change Password</a></li>
									<li class="last"><a href="logout.html">Logout</a></li>
								</ul>
								<div class="clear"></div>
							</li>
						</ul>
					</div>
				</div>
				<div class="clearfix" id="main">
					<div class="welcome"
						style="margin: 10px; text-align: right; clear: both;">
						<strong>Welcome, </strong> <font style="color: #0D4D7B; font-weight: bold;" >${user} </font>
					</div>
					<div align="center">
						<form method="post" action="mapdownload.html"
							onsubmit="return check(this)">
							<h4 style="margin: 10px 50px;">Please enter Plasmid Nr to
								Download Map file.</h4>
							Plasmid Nr.:<input type="number" placeholder="Nr." name="txtnr"
								style="width: 150px" required="required">
							<div class="clear"></div>

							<br> <br> <input type="submit"
								value="Download" id="submit"
								style="background-color: #2C5463; color: white; font-size: 20px;">
							<br> <br>

							<c:if test="${number == false }">
								<font style="color: red;">This Plasmid Nr ${n} is not
									available in Database.</font>
							</c:if>
							<c:if test="${format == false }">
								<font style="color: red;">Please insert only Number. </font>
							</c:if>
							<c:if test="${mapavailable == false }">
								<font style="color: red;">Map file is not available for
									Plasmid Nr ${n} .</font>
							</c:if>
							<c:if test="${mapavailable == true }">
								<font style="color: green;">Please Click on below link
									for Download Map file! </font>
								<br>
								 <a href="mapdownloadfinal.html" class="button">Download File</a> 
							</c:if>
						</form>
						<br>
						
						<form method="post" action="mapupload.html"
							modelAttribute="uploadForm" enctype="multipart/form-data">

							<h4 style="margin: 10px 50px;">Please enter Plasmid Nr to
								Upload Map file.</h4>
								Plasmid Nr.:<input type="number" placeholder="Nr." name="txtnr"
								style="width: 150px" required="required">
								<br><br>
							Map File: <input name="files" type="file" accept="text/*"
								required="required" /> <br> <br><br>
							<input type="submit" value="Upload" id="submit"
								style="background-color: #2C5463; color: white; font-size: 20px;">
							<br> <br>
							<c:if test="${numberup == false }">
								<font style="color: red;">This Plasmid Nr ${n} is not
									available in Database.</font>
							</c:if>
							<c:if test="${formatup == false }">
								<font style="color: red;">Please insert only Number. </font>
							</c:if>
							<c:if test="${add == true }">
								<font style="color: green;">File was Uploaded with Nr ${n}
								 Successfully.</font>
							</c:if>
							<c:if test="${fileavailable == true }">
								<font style="color: red;">Nr. ${n} Map File was already Uploaded.</font>
							</c:if>
							<c:if test="${type == false }">
								<font style="color: red;">${file} is not correct file
									format.<br> Please upload only text file format.
								</font>
							</c:if>
						</form>
					</div>
					<br> <br> <br>
					<div class="clear" id="footer">
						<a class="footer_link" href="http://www.mpg.de/" target="_blank">Powered by
							Max-Planck Institute Biophysical Chemistry </a> <a
							href="http://www.mpibpc.mpg.de/9452686/employee_page?c=324305&employee_id=38648"
							target="_blank" class="footer_link">Designed by Amit Pethani</a>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>