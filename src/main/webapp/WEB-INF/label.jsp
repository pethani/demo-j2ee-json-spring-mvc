
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
		doc.setFontSize(13);
		doc.setFontType("normal");
		var count = document.getElementById("datasize").value;
		var st = 10, nd = 15, dr = 20, th = 25;
		var i = 0;
		var temp;
		while (i < count) {

			/* doc.text(10, st, 'Label:-'); */
			doc.text(40, st, document.getElementById("nr" + i).value);
			doc.text(40, nd, document.getElementById("pasmidname" + i).value);
			doc.text(40, dr, document.getElementById("resi" + i).value);
			
			st = st + 30;
			nd = nd + 30;
			dr = dr + 30;
			if (dr >= 330)
			{
			  doc.addPage();
			  st = 10;
			  nd = 15;
			  dr = 20;
			}
			i++;
		}
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
									<li><a href="printout.html">Printout</a></li>
									<li><a href="label.html" class="current">Label</a></li>
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
					<form method="post" action="alllabel.html"
							onsubmit="return check(this)">
							
						<br><br>	
					<input type="submit" value="Print All"
								id="submit"
								style="background-color: #2C5463; color: white; font-size: 20px;">
							<br> <br>
					<c:if test="${pdfall == true }">
							<font style="color: green;">Please Click on below link for
								open pdf file! </font>
							<br>
							<br>
							<a href="javascript:demoFromHTML()" class="button">PDF
								All-Plasmid Label</a>
						</c:if>
					
					</form>
					<br>
					OR
					<br>
					
						<form method="post" action="label.html"
							onsubmit="return check(this)">
							<h4 style="margin: 10px 50px;">Please enter Nr. number to
								Printout Plasmid detail.</h4>
							<div align="center">
								
								<br>Plasmid Nrs.:<input type="text" placeholder="Nr." name="txtnr"
									style="width: 200px" required="required"> <br> <font
									style="color: green; size: 5px;">please separate Plasmid Nr by "," . Ex. 134,89,1</font>
							</div>
							<div class="clear"></div>
							<br> <br> <br> <input type="submit" value="Search"
								id="submit"
								style="background-color: #2C5463; color: white; font-size: 20px;">
							<br> <br>
						</form>
						<c:if test="${number == false }">
							<font style="color: red;">This Plasmid Nr is not available
								in Database.</font>
						</c:if>
						<c:if test="${format == false }">
							<font style="color: red;">Please insert only Number,which
								is separated by ",". <br>Example:178,342,987
							</font>
						</c:if>
						<c:if test="${pdf == true }">
							<font style="color: green;">Please Click on below link for
								open pdf file! </font>
							<br>
							<br>
							<a href="javascript:demoFromHTML()" class="button">PDF
								Plasmid Label</a>
						</c:if>
					</div>

					<c:set var="count" value="0" scope="page" />
					<input type="text" id="datasize" hidden="true" value="${size}">
					<c:forEach var="ans" items="${plasmidall}">
						<input type="text" id="nr${count}" hidden="true" value="${ans.nr}">
						<input type="text" id="pasmidname${count}" hidden="true"
							value="${ans.plasmidname}">
						<input type="text" id="resi${count}" hidden="true"
							value="${ans.resistance}">
						
						<c:set var="count" value="${count + 1}" scope="page" />
					</c:forEach>
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
		<div class="p_m3"></div>
	</div>



</body>
</html>