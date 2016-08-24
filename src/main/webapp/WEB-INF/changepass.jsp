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
<script src="<c:url value="/resources/js/jquery-1.9.1.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery-ui.js" />"></script>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"
	type="text/css" />
<link rel="shortcut icon" type="image/icon"
	href="<c:url value="/resources/images/favicon.ico"/>" />
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
						<a href="#"></a>
					</div>
					<div id="mainnavi">
						<ul>
							<li>
								<ul class="navline" id="nav1line">
									<li><a href="home.html">Plasmids</a></li>
									<li><a href="addplasmid.html">Insert Plasmid</a></li>
									<li><a href="deleteplasmid.html">Delete Plasmid</a></li>
									<li><a href="printout.html">Printout</a></li>
									<li><a href="label.html">Label</a></li>
									<li><a href="map.html">Map</a></li>
									<li><a href="changepass.html" class="current">Change Password</a></li>
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
					<div id="col1">
						<ul>
							<li class="first selected" data-id="4812">
								<div>
									<a href="http://www.mpibpc.mpg.de/fischle/" target="_blank"
										title="Zur Website des Instituts">Chromatin Biochemistry</a>
								</div>
								<ul>
									<li class="first" data-id="49331">
										<div>
											<a target="_blank"
												href="http://www.mpibpc.mpg.de/316354/Research">Research</a>
										</div>
									</li>
									<li class="" data-id="4949">
										<div>
											<a target="_blank"
												href="http://www.mpibpc.mpg.de/316691/People">People</a>
										</div>
									</li>
									<li class="" data-id="4930">
										<div>
											<a target="_blank"
												href="http://www.mpibpc.mpg.de/101631/publications">Publications
											</a>
										</div>
									</li>
									<li class="" data-id="4914">
										<div>
											<a target="_blank"
												href="http://www.mpibpc.mpg.de/316988/Collaborations">Collaborations
											</a>
										</div>
									</li>
									<li class="" data-id="4969">
										<div>
											<a target="_blank"
												href="http://www.mpibpc.mpg.de/317195/Funding">Funding</a>
										</div>
									</li>
									<li class="" data-id="9332741">
										<div>
											<a target="_blank"
												href="http://www.mpibpc.mpg.de/317754/Links">Links</a>
										</div>
									</li>
									<li class="" data-id="4995">
										<div>
											<a target="_blank"
												href="http://www.mpibpc.mpg.de/317807/Gallery">Gallery</a>
										</div>
									</li>
									<li class="" data-id="5003">
										<div>
											<a target="_blank"
												href="http://www.mpibpc.mpg.de/101620/jobs">Open
												Positions</a>
										</div>
									</li>

								</ul>
							</li>
						</ul>
					</div>
					<div id="col2">
						<div class="clearfix" id="col2_content">
							<div class="col2_box_teaser group_ext no_print">
								<h3>Kontakt</h3>
								<div class="dotted_line"></div>
								<div class="line_bottom">
									<div class="p_ext with_image">
										<div class="float_left">
											<img alt="Profile_image" class="profile_image"
												src="<c:url value="/resources/images/fische.jpg"/>">
										</div>
										<div class="p_txt">
											<p class="first">Dr.Wolfgang Fischle</p>
											<div class="position">Max Planck Research Group Leader</div>
											<div class="phone_numbers">
												<span class="text">Telefon:</span><span>+49 551
													201-1340</span><span class="text">Fax:</span><span>+49 551
													201-1337</span>
											</div>
											<div class="mail">
												<span class="text">E-Mail:</span><a
													href="mailto:wfischl@gwdg.de" title="wfischl@gwdg.de">wfischl@gwdg.de</a>
											</div>
											<p>
												<span class="link_like_text"></span>
											</p>
											<p>
												<a class="external" href="http://www.mpibpc.mpg.de/fischle/"
													target="_blank" title="Zur Website des Instituts">Website</a>
											</p>
											<div class="further_info"></div>
										</div>
									</div>
								</div>								
							</div>
							<div id="col2_footer_end"></div>
						</div>
					</div>
					<div class="" id="col3">
						<h2>Login</h2>
						<div id="col3_content">
							<div class="col3_box_contentpage">
								<div class="content" align="center">

									<br> <br> <br> <br>
									<form method="post" action="changepasssub.html"
										onsubmit="return check(this)">
										<div align="center">
											<div align="left" style="height: 335px; width: 700px;">
												<b>Current Password:</b>&nbsp; <input type="Password"
													placeholder="Current Password" name="txtcurrpass"
													style="width: 170px" required="required">&nbsp;&nbsp;
												<c:if test="${ passchange == false}">
													<font color="red">Current Password is incorrect.</font>
												</c:if>
												<br> <br> <b>New Password:</b>&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;<input type="Password"
													placeholder="New Password" name="txtnewpass"
													style="width: 170px;" required="required"> <br>
												<br> <b>Confirm Password:</b> <input type="password"
													placeholder="Confirm Password" name="txtconfpass"
													style="width: 170px;" required="required">&nbsp;
												<c:if test="${passmatch == false}">
													<font color="red"> is Not matching with new
														Password.</font>
												</c:if>
												<br> <br>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="submit" value="Save" id="submit"
													style="background-color: #2C5463; color: white; font-size: 20px;">
												<br> <br>
												<c:if test="${passchange == true}">
													<font color="green"> Password is Successfully
														changed.</font>
												</c:if>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>

					</div>
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