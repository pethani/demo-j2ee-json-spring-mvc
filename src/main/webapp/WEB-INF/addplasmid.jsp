
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
</head>
<script type="text/javascript">
	$(document).ready(function() {

		$('#submit').hover(function() {
			$(this).css('background', '#95A9B1');
		}, function() {
			$(this).css('background', '#2C5463');
		});
		
		$('#example').dataTable();
	}); 
	
</script>

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
									<li><a href="addplasmid.html" class="current">Insert
											Plasmid</a></li>
									<li><a href="deleteplasmid.html">Delete Plasmid</a></li>
									<li><a href="printout.html">Printout</a></li>
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
						<strong>Welcome, </strong> <font
							style="color: #0D4D7B; font-weight: bold;">${user} </font>
					</div>
					<div align="center">
						<form method="post" action="addplasmid.html"
							modelAttribute="uploadForm" enctype="multipart/form-data">

							<h4 style="margin: 10px 50px;">Please insert appropriate
								value in text filed.</h4>
							<div align="center">
								<br>
								<c:if test="${add == true }">
									<font style="color: green;">Data was inserted with Nr.
										number ${nrold}.</font>
									<br>
								</c:if>

								<c:if test="${type == false }">
									<font style="color: red;">${file} is not correct file
										format.<br> Please upload only text file format.
									</font>
									<br>
								</c:if>
								<br><br>
								<sup><font style="color: red; font-size: small;" >* field are mandatory</font></sup>
								<br>
								<table style="width: 50%;">
									<tr>
										<td>Plasmid Nr.:</td>
										<td><label><b>${nr}</b></label> <input type="text"
											hidden="true" name="txtnr" value="${nr}"></td>
									</tr>
									<tr>
										<td>Box Nr.:</td>
										<td><label><b>${boxnr}</b></label> <input type="text"
											hidden="true" name="txtboxnr" value="${boxnr}"></td>
									</tr>
									<tr>
										<td>Experimentor:</td>
										<td><label><b>${name}</b></label> <input type="text"
											hidden="true" name="txtexperimentor" value="${name}">
										</td>
									</tr>
									<tr>
										<td>Plasmid Name<sup><font style="color: red; font-size: small;" >*</font></sup>:</td>
										<td><input type="text" placeholder="Plasmid name"
											name="txtplasmidname" style="width: 230px"
											required="required"></td>
									</tr>
									<tr>
										<td>Supplier<sup><font style="color: red; font-size: small;" >*</font></sup>:</td>
										<td><input type="text" placeholder="Supplier"
											name="txtsupplier" style="width: 230px" required="required"></td>
									</tr>
									<tr>
										<td>Cloning Sites<sup><font style="color: red; font-size: small;" >*</font></sup>:</td>
										<td><input type="text" placeholder="Cloning Sites"
											name="txtcloningsites" style="width: 230px"
											required="required"></td>
									</tr>
									<tr>
										<td>Insert<sup><font style="color: red; font-size: small;" >*</font></sup>:</td>
										<td><input type="text" placeholder="Insert"
											name="txtinsert" style="width: 230px" required="required">
										</td>
									</tr>
									<tr>
										<td>Donor Organism<sup><font style="color: red; font-size: small;" >*</font></sup>:</td>
										<td><input type="text" placeholder="Donor Organism"
											name="txtdonororganism" style="width: 230px"
											required="required"></td>
									</tr>
									<tr>
										<td>Resistence<sup><font style="color: red; font-size: small;" >*</font></sup>:</td>
										<td><input type="text" placeholder="Resistence"
											name="txtresistence" style="width: 230px" required="required">
										</td>
									</tr>
									<tr>
										<td>Resistence(mam)<sup><font style="color: red; font-size: small;" >*</font></sup>:</td>
										<td><input type="text" placeholder="Resistence(mam)"
											name="txtresistencemam" style="width: 230px"
											required="required"></td>
									</tr>
									<tr>
										<td>Tags<sup>*</sup>:</td>
										<td><input type="text" placeholder="Tags" name="txttags"
											style="width: 230px" required="required"></td>
									</tr>
									<tr>
										<td>Promoter<sup><font style="color: red; font-size: small;" >*</font></sup>:</td>
										<td><input type="text" placeholder="Promoter"
											name="txtpromoter" style="width: 230px" required="required"></td>
									</tr>
									<tr>
										<td>Begin<sup><font style="color: red; font-size: small;" >*</font></sup>:</td>
										<td><input type="date" name="txtbegin"
											style="width: 230px" required="required"></td>
									</tr>
									<tr>
										<td>End<sup><font style="color: red; font-size: small;" >*</font></sup>:</td>
										<td><input type="date" name="txtend" style="width: 230px"
											required="required"></td>
									</tr>
									<tr>
										<td>Comment<sup><font style="color: red; font-size: small;" >*</font></sup>:</td>
										<td><input type="text" placeholder="Comment"
											name="txtcomment" style="width: 230px" required="required"></td>
									</tr>
									<tr>
										<td>Purity<sup><font style="color: red; font-size: small;" >*</font></sup>:</td>
										<td><input type="text" placeholder="Purity"
											name="txtpurity" style="width: 230px" required="required"></td>
									</tr>
									<tr>
										<td>Map:</td>
										<td><input name="files" type="file" accept="text/*" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><label
												title="if file is not available then add it later by map tab">??</label></b>

										</td>
									</tr>
									<tr>
										<td>Parental Vector<sup><font style="color: red; font-size: small;" >*</font></sup>:</td>
										<td><input type="text" placeholder="Parental Vector"
											name="txtparentalvector" style="width: 230px"
											required="required"></td>
									</tr>
									<tr>
										<td>Disposed<sup><font style="color: red; font-size: small;" >*</font></sup>:</td>
										<td><input type="text" placeholder="Disposed"
											name="txtdisposed" style="width: 230px" required="required">
										</td>
									</tr>
									<tr>
										<td>Vector Backbone<sup><font style="color: red; font-size: small;" >*</font></sup>:</td>
										<td><input type="text" placeholder="Vector Backbone"
											name="txtvectorbackbone" style="width: 230px"
											required="required"></td>
									</tr>

									<tr>
										<td>Host organism:</td>
										<td><select id="hostorg" name="txthostorganism"
											style="width: 230px">
												<option value='' disabled selected style='display: none;'>Please
													Choose</option>
												<option value="E. Coli BL21 (DE3) RIL">E. Coli BL21 (DE3) RIL</option>
												<option value="E. Coli DH5A"> E. Coli DH5A</option>
												<option value="E. Coli Nova Blue"> E. Coli Nova Blue</option>
												<option value="E. Coli Stable 2"> E. Coli Stable 2</option>
												<option value="E. Coli XL-1 Blue">E. Coli XL-1 Blue</option>

										</select> <input type="text" placeholder="Host organism" hidden="true"
											name="txthostorganism2" style="width: 230px"></td>
									</tr>

									<tr>
										<td>Full clone name:</td>
										<td><input type="text" placeholder="Full clone name"
											name="txtfullclonename" style="width: 230px">&nbsp;<b><label
												title=" Host organism_Vector backbone_Insert name">??</label></b>
										</td>
									</tr>

									<tr>
										<td>Special incidents:</td>
										<td><input type="text" placeholder="Special incidents"
											name="txtspecialincidents" style="width: 230px" value="keine">
										</td>
									</tr>

									<tr>
										<td>Safety level:</td>
										<td><input type="text" placeholder="Safety level"
											name="txtsafetylevel" style="width: 230px"
											value="Spender RG1, Empfaenger RG1"></td>
									</tr>

								</table>
								<br>

							</div>
							<div class="clear"></div>
							<input type="submit" value="Insert" id="submit"
								style="background-color: #2C5463; color: white; font-size: 20px;">
							Press here to insert Data! <br>

						</form>
						<br> <br> <br>
					</div>
					<div class="clear" id="footer">
						<a class="footer_link" href="http://www.mpg.de/" target="_blank">Powered
							by Max-Planck Institute Biophysical Chemistry </a> <a
							href="http://www.mpibpc.mpg.de/9452686/employee_page?c=324305&employee_id=38648"
							target="_blank" class="footer_link">Designed by Amit Pethani</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="p_m3"></div>
	<div class="print_cont">http://www.mpibpc.mpg.de/4949/mpids</div>

</body>
</html>