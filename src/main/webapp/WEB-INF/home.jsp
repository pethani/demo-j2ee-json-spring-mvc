
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
<script src="<c:url value="/resources/js/jquery-latest.js" />"></script>
<link rel="shortcut icon" type="image/icon"
	href="<c:url value="/resources/images/favicon.ico"/>" />

<link href="<c:url value="/resources/css/dataTables.colReorder.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/jquery.dataTables.css" />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/css/dataTables.colVis.css" />"
	rel="stylesheet" type="text/css" />
	
<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/jquery.dataTables.js" />"></script>
<script src="<c:url value="/resources/js/dataTables.colVis.js" />"></script>


<script type="text/javascript">
	$(document).ready(function() {

		//submit button hover
		$('#submit').hover(function() {
			$(this).css('background', '#95A9B1');
		}, function() {
			$(this).css('background', '#2C5463');
		});
		
		 // Setup - add a text input to each footer cell
	    $('#example tfoot th').each( function () {
	        var title = $('#example thead th').eq( $(this).index() ).text();
	        $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
	    } );
	 
	    // DataTable
	    var table = $('#example').DataTable({
	        dom: 'C<"clear">lfrtip',
	        columnDefs: [
	            { visible: false, targets: 4 },
	            { visible: false, targets: 12 },
	            { visible: false, targets: 13},
	            { visible: false, targets: 14 },
	            { visible: false, targets: 15 },
	            { visible: false, targets: 16 },
	            { visible: false, targets: 17 },
	            { visible: false, targets: 18 }
	        ],
	        colVis: {
	            restore: "Restore",
	            showAll: "Show all",
	            showNone: "Show none"
	        }
	    });
	    
	    //Row selection (multiple rows)
	    $('#example tbody').on( 'click', 'tr', function () {
	        $(this).toggleClass('selected');
	    } );
	 
	    $('#button').click( function () {
	        alert( table.rows('.selected').data().length +' row(s) selected' );
	    } );
		
	    //for Show / hide columns dynamically
	    $('a.toggle-vis').on( 'click', function (e) {
	        e.preventDefault();
	 
	        // Get the column API object
	        var column = table.column( $(this).attr('data-column') );
	 
	        // Toggle the visibility
	        column.visible( ! column.visible() );
	    } );
	    
	    // Apply the search
	    table.columns().eq( 0 ).each( function ( colIdx ) {
	        $( 'input', table.column( colIdx ).footer() ).on( 'keyup change', function () {
	            table
	                .column( colIdx )
	                .search( this.value )
	                .draw();
	        } );
	    } );
	}); 
	
</script>
<style type="text/css">
tfoot input {
	width: 100%;
	padding: 3px;
	box-sizing: border-box;
}
</style>

</head>
<body>
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
									<li><a href="home.html" class="current">Plasmids</a></li>
									<li><a href="addplasmid.html">Insert Plasmid</a></li>
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
<%-- 
						<form method="post" action="search.html">
							<h4 style="margin: 10px 50px;">Here you can search base on
								different parameter.</h4>
							<div class="select_box">
								<div>Plasmid Nr:</div>
								<div>
									<input type="number" placeholder="Nr." name="txtnr"
										value="${n}" style="width: 150px">
								</div>

								<div>Experimentor:</div>
								<div>
									<input type="text" placeholder="Experimentor" value="${exp}"
										class="text_style" name="txtexperimentor" style="width: 150px">
								</div>
								<div>Plasmid Name:</div>
								<div>
									<input type="text" placeholder="Plasmid Name" value="${plas}"
										name="txtplasmidname" style="width: 150px">
								</div>
								<p class="clear"></p>
								<div>Insert:</div>
								<div>
									<input type="text" placeholder="Insert" name="txtinsert"
										value="${in}" style="width: 150px">
								</div>
								<div>Donor Organism:</div>
								<div>
									<input type="text" placeholder="Donor Organism" name="txtdonor"
										value="${don}" style="width: 150px">
								</div>

								<div>Tags:</div>
								<div>
									<input type="text" placeholder="Tags" name="txttags"
										value="${tag}" style="width: 150px">
								</div>
							</div>
							<br> <input type="submit" value="Search" id="submit"
								style="background-color: #2C5463; color: white; font-size: 20px;">
							<br> <br>
						</form>

						<br> <br> <br> --%> 
						<h4 style="margin: 10px 50px;">Available Plasmids Database</h4> <br>
						<br>
						<font style="color: green;">Column specific search option is available at the bottom of table</font><br>
						<table id="example" class="display compact cell-border hover"
							cellspacing="0" width="100%" style="background-color: white;">

							<thead>
								<tr>
									<th>Plasmid Nr.</th>
									<th>Box Nr.</th>
									<th>Experimentor</th>
									<th>Plasmid Name</th>
									<th>Supplier</th>
									<th>Cloning Sites</th>
									<th>Insert</th>
									<th>Donor Organism</th>
									<th>Resistance</th>
									<th>Resistance(mam)</th>
									<th>Tags</th>
									<th>Promoter</th>
									<th>Begin</th>
									<th>End</th>
									<th>Comment</th>
									<th>Purity</th>
									<th>Map</th>
									<th>Parental Vector</th>
									<th>Disposed</th>
									<th>Vector Backbone</th>


								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Plasmid Nr.</th>
									<th>Box Nr.</th>
									<th>Experimentor</th>
									<th>Plasmid Name</th>
									<th>Supplier</th>
									<th>Cloning Sites</th>
									<th>Insert</th>
									<th>Donor Organism</th>
									<th>Resistance</th>
									<th>Resistance(mam)</th>
									<th>Tags</th>
									<th>Promoter</th>
									<th>Begin</th>
									<th>End</th>
									<th>Comment</th>
									<th>Purity</th>
									<th>Map</th>
									<th>Parental Vector</th>
									<th>Disposed</th>
									<th>Vector Backbone</th>


								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="main" items="${data}">
									<tr>
										<td style="font-weight: bold; font-size: medium;">${main.nr}</td>
										<td >${main.boxnr}</td>
										<td title="${main.experimentor}">${main.experimentor}</td>
										<td title="${main.plasmidname}">${main.plasmidname}</td>
										<td title="${main.supplier}">${main.supplier}</td>
										<td title="${main.cloningsites}">${main.cloningsites}</td>
										<td title="${main.insertaa}">${main.insertaa}</td>
										<td title="${main.donororganism}">${main.donororganism}</td>
										<td title="${main.resistance}">${main.resistance}</td>
										<td title="${main.amresistance}">${main.amresistance}</td>
										<td title="${main.tags}">${main.tags}</td>
										<td title="${main.promoter}">${main.promoter}</td>
										<td>${main.begin}</td>
										<td>${main.end}</td>
										<td title="${main.comment}">${main.comment}</td>
										<td title="${main.purity}">${main.purity}</td>
										<td title="${main.map}">${main.map}</td>
										<td title="${main.parentalvector}">${main.parentalvector}</td>
										<td title="${main.disposed}">${main.disposed}</td>
										<td title="${main.vektorbackbone}">${main.vektorbackbone}</td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<br> <br> <br> <br>
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
</body>
</html>