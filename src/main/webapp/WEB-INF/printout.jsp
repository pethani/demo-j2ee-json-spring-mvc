
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


<script>
	function demoFromHTML() {
		var doc = new jsPDF('p', 'mm', [ 330, 210 ]);
		doc.setFontType("bold");
		doc.setFontSize(13);
		doc.text(50, 10, 'Aufzeichnungen zu gentechnischen Arbeiten für ');
		doc.text(60, 15, 'Forschungszwecke nach §2 GenT AufzV');
		doc.setFontType("normal");
		doc.text(10, 35, 'Betreber:');
		doc.text(80, 35, 'Max-Planck-Institut für biophysikalische Chemie.');
		doc.text(80, 40, 'Am Fassberg 11');
		doc.text(80, 45, '37077 Göttingen');
		doc.text(10, 55, 'Projektleiter:');
		doc.text(80, 55, 'Dr. Wolfgang Fischle, Tel.:1340');
		doc.text(80, 60, 'AG Chromatin Biochemie');
		doc.text(80, 65, 'Turm V 1.OG');
		doc.text(80, 70, 'Raum 101-102 and 112-115');
		doc.text(10, 80, 'BBS:');
		doc.text(80, 80, 'Dr. Ulrich Nauber, Tel.:0551/201-1590');
		doc.text(10, 90, 'Aktenzeichen/Zeitpunkt');
		doc.text(80, 90, 'S2 Labor: 40611/0214/502       08.09.06');
		doc.text(10, 95, 'der Anmeldung:');
		doc.text(80, 95, 'Projekt:  40611/0214/603       08.09.06');
		doc
				.text(
						0,
						100,
						'--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------');
		doc.text(10, 110, 'Sicherheitsstufe:');
		doc.text(80, 110, 'S1');
		doc.text(10, 130, 'Plasmid Nummer:');
		doc.text(80, 130, document.getElementById("pasmidnr").value);
		doc.text(10, 140, 'Projekttitle:');
		doc.text(10, 155, 'Zweck des Experiments:');
		doc.text(10, 170, 'Plasmid Name:');
		doc.text(80, 170, document.getElementById("pasmidname").value);
		doc.text(10, 180, 'Ausgangsorganismen: ');
		doc.text(80, 180, document.getElementById("donororg").value);
		doc.text(10, 190, 'Empfänger und sicherheits-');
		doc.text(10, 195, 'relevante Merkmale:');
		doc.text(80, 195, document.getElementById("hostorganism").value);
		doc.text(10, 205, 'Bezeichnung und sicherheits-');
		doc.text(10, 210, 'relevante Merkmale des GVO:');
		doc.text(80, 210, document.getElementById("fullclonename").value);
		doc.text(10, 220, 'Vorkommnisse nach');
		doc.text(10, 225, '2 Abs. 1 Satz 11 GenT AufzV:');
		doc.text(80, 225, document.getElementById("specialincidents").value);
		doc.text(10, 235, 'Risikobewertung gem.');
		doc.text(10, 240, '6 Abs. 1 Satz 2 GenTG:');
		doc.text(80, 240, document.getElementById("safetylevel").value);
		doc.text(10, 250, 'Experimentor:');
		doc.text(80, 250, document.getElementById("experimentor").value);
		doc.text(10, 260, 'Begin der Arbeiten:');
		doc.text(80, 260, document.getElementById("begindate").value);
		doc.text(10, 270, 'Ende der Arbeiten:');
		doc.text(80, 270, document.getElementById("enddate").value);
		doc.text(10, 280, 'Lagerung: ');
		doc.text(80, 280, document.getElementById("dispos").value);
		doc.text(10, 290, 'Entsorgt:');
		doc.text(10, 305, 'Unterschriften:');
		doc.text(10, 320, 'Experimentator');
		doc.text(60, 320, 'Datum');
		doc.text(110, 320, 'Projektleiter');
		doc.text(160, 320, 'Datum');
		 doc.output('dataurlnewwindow');
		/* doc.save('plasmiddetail.pdf'); */
	}
</script>
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
									<li><a href="printout.html" class="current">Printout</a></li>
									<li><a href="label.html">Label</a></li>
									<li><a href="map.html">Map</a></li>
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
						<form method="post" action="printout.html"
							onsubmit="return check(this)">
							<h4 style="margin: 10px 50px;">Please enter Plasmid Nr to
								Printout Plasmid detail.</h4>
							<div align="center">
								Plasmid Nr.:<input type="number" placeholder="Nr." name="txtnr"
									style="width: 150px" required="required">
							</div>
							<div class="clear"></div>

							<br> <br> <br> <br> <input type="submit"
								value="Search" id="submit"
								style="background-color: #2C5463; color: white; font-size: 20px;">
							<br> <br>
						</form>
						<c:if test="${number == false }">
							<font style="color: red;">This Plasmid Nr is not available
								in Database.</font>
						</c:if>
						<c:if test="${format == false }">
							<font style="color: red;">Please insert only Number. </font>
						</c:if>
						<c:if test="${pdf == true }">
							<font style="color: green;">Please Click on below link for
								pdf file! </font>
							<br>
							<br>
							<a href="javascript:demoFromHTML()" class="button">PDF
								Plasmid Detail</a>
						</c:if>
					</div>

					<input type="text" id="pasmidnr" hidden="true" value="${n}">
					<input type="text" id="pasmidname" hidden="true" value="${pla}">
					<input type="text" id="donororg" hidden="true" value="${don}">
					<input type="text" id="begindate" hidden="true" value="${beg}">
					<input type="text" id="enddate" hidden="true" value="${en}">
					<input type="text" id="experimentor" hidden="true" value="${exnam}">
					<input type="text" id="dispos" hidden="true" value="${dis}">
					<input type="text" id="hostorganism" hidden="true" value="${hostorganism}">
					<input type="text" id="fullclonename" hidden="true" value="${fullclonename}">
					<input type="text" id="specialincidents" hidden="true" value="${specialincidents}">
					<input type="text" id="safetylevel" hidden="true" value="${safetylevel}">

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