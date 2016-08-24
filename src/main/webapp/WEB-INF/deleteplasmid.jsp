
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
<script src="<c:url value="/resources/js/jquery-ui.js" />"></script>
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
									<li><a href="deleteplasmid.html" class="current">Delete
											Plasmid</a></li>
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
					<br>
					<div align="center">
						<h4 style="margin: 10px 50px;">Available Plasmid detail
							inserted by You.</h4>
							<div class="clear"></div>
							<c:if test="${number == false }">
								<font style="color: red;">This Plasmid Nr is not
									available in Database or it is not added by you.</font>
							</c:if>
							<c:if test="${format == false }">
								<font style="color: red;">Please insert only Number. </font>
							</c:if>
							<c:if test="${delete == true }">
								<font style="color: green;">Plasmid Nr ${n} 's data was
									deleted succesfully from database! </font>
							</c:if>
						<br><br>
						<table id="example" class="display compact cell-border hover"
							cellspacing="0" width="100%" style="background-color: white;">
							<thead>
								<tr>
									<th>Plasmid Nr.</th>
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
									<th>Box Nr.</th>

								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>Plasmid Nr.</th>
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
									<th>Box Nr.</th>

								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="main" items="${data}">
									<tr>
										<td style="font-weight: bold; font-size: medium;">${main.nr}</td>
										<td>${main.experimentor}</td>
										<td>${main.plasmidname}</td>
										<td>${main.supplier}</td>
										<td>${main.cloningsites}</td>
										<td>${main.insertaa }</td>
										<td>${main.donororganism}</td>
										<td>${main.resistance}</td>
										<td>${main.amresistance}</td>
										<td>${main.tags}</td>
										<td>${main.promoter}</td>
										<td>${main.begin}</td>
										<td>${main.end}</td>
										<td>${main.comment}</td>
										<td>${main.purity}</td>
										<td>${main.map}</td>
										<td>${main.parentalvector}</td>
										<td>${main.disposed}</td>
										<td>${main.vektorbackbone}</td>
										<td>${main.boxnr}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<br> <br>
						<form method="post" action="deleteplasmid.html">
							<h4 style="margin: 10px 50px;">Please enter Plasmid Nr to
								Delete Plasmid detail.</h4>
							<div align="center">
								Plasmid Nr.:<input type="number" placeholder="Nr." name="txtnr"
									style="width: 150px" required="required">
							</div>
							
							<br> <br> <input type="submit" value="Delete"
								id="submit"
								style="background-color: #2C5463; color: white; font-size: 20px;">

						</form>

					</div>
					<br> <br> <br>
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