<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>ORT3.0</title>
   <link rel="stylesheet" type="text/css" href="css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/text.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/grid.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/layout.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/nav.css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" type="text/css" href="css/ie6.css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" type="text/css" href="css/ie.css" media="screen" /><![endif]-->
    <!-- BEGIN: load jquery -->
    
    <!-- for the data-table -->
    <link rel="stylesheet" href="jquery_for_form/jquery-ui.css"/>
    <script src="jquery_for_form/jquery-1.9.1.js.js"></script>
    <script src="jquery_for_form/jquery-ui.js.js"></script>
    <link rel="stylesheet" href='css/datatablecss.css'/>
    <script src="media/js/jquery.dataTables.js" type="text/javascript"></script>
    
    <script>
	    $(document).ready(function(){
	        $('#datatables').dataTable({
	            "sPaginationType":"full_numbers",
	            "aaSorting":[[2, "desc"]],
	            "bJQueryUI":true
	        });
	    });
	</script>
	
	<style>
        *{
            font-family: arial;
        }
    </style>    
    <!-- end data table -->

</head>
<body>
	<%
		response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
		response.addHeader("Pragma", "no-cache"); 
		response.addDateHeader ("Expires", 0);
		
		Account at = (Account)session.getAttribute("account");
		
		if(session.getAttribute("account") == null){
			response.sendRedirect("index.jsp");
			return;
		}
	%>
    <div class="container_12">
        <%@include file="userhomeheader.jsp" %>
        <div class="clear">
        </div>
        <%@include file="dashboard.jsp" %>
        <div class="clear">
        </div>
        <%@include file="sidebarmenu_umbudsmanreportingoffice.jsp" %>
        <div class="grid_10">
            <div class="box round first">
                <h2>Admin Tool/አድሚኒስትሬተር መገልገያዎች &gt Umbudsman Reporting Office/እንባ ጠባቂ ሪፖርት አቅራቢ ክፍል | [<a href="showaddumbudsmanreportingoffice.jsp">Add/ጨምር</a>] . [<a href="showlistofumbudsmanreportingoffices.jsp">View/ዘርዝር</a>] . [<a href="showlistofumbudsmanreportingofficeforedit.jsp">Edit/አስተካክል</a>] . [<a href="showlistofumbudsmanreportingofficefordelete.jsp">Delete/አስወግድ]</a></h2>
                	
	             <div class="block">
	                	<%@include file="showlistofombudsmanreportingofficesdatatable.jsp" %>	            	              
	            	</div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="clear">
    </div>
    <%@include file="footer.jsp" %>
    </div>
</body>
</html>
