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
    <script src="js/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery-ui/jquery.ui.core.min.js"></script>
    <script src="js/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.ui.accordion.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.effects.core.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.effects.slide.min.js" type="text/javascript"></script>
    <!-- END: load jquery -->
    <!-- BEGIN: load jqplot -->
    <link rel="stylesheet" type="text/css" href="css/jquery.jqplot.min.css" />
    <!--[if lt IE 9]><script language="javascript" type="text/javascript" src="js/jqPlot/excanvas.min.js"></script><![endif]-->
    <script language="javascript" type="text/javascript" src="js/jqPlot/jquery.jqplot.min.js"></script>
    <script type="text/javascript" src="js/jqPlot/plugins/jqplot.canvasTextRenderer.min.js"></script>
    <script type="text/javascript" src="js/jqPlot/plugins/jqplot.canvasAxisLabelRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.barRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.pieRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.categoryAxisRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.highlighter.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.pointLabels.min.js"></script>
    <script type="text/javascript" src="js/jqPlot/plugins/jqplot.donutRenderer.min.js"></script>
    <script type="text/javascript" src="js/jqPlot/plugins/jqplot.bubbleRenderer.min.js"></script>
    <!-- END: load jqplot -->
    <script src="js/setup.js" type="text/javascript"></script>
    <script type="text/javascript" src="ajax_functions/ajax_functions.js"></script>
  	<script type="text/javascript">
        $(document).ready(function () {
            setupLeftMenu();
          	setSidebarHeight();
          	//alert('hop');          	
        });
    </script>
    
    <script type="text/javascript" src="ajax_functions/ajax_functions.js"></script>

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
        <%@include file="reportinputform_sidebarmenu.jsp" %>
        <div class="grid_10">
            <div class="box round first">
                <h2>የሪፖርት ግብአት ፎርም/ቅፅ </a></h2>
                	
	                <div class="block" style="height:450px;background:#fff">
	            	     <form>
	            	     	<table border="0" width="100%" class="form">
	            	     		<tr>
	            	     			<td style="width:30%"><label>የመንግሥት መሥሪያ ቤቱን/ተቋም ምረጥ፡</label></td>
	            	     			<td>
	            	     				<select name="slctgovtorganization" id="slctgovtorganization" style="width:100%">
	            	     					<%
	            	     					Account loggerAccount = (Account)session.getAttribute("account");
	            	     					User loggerUser = User.getUser(loggerAccount.getUserId());
	            	     					PublicRelationOfficer publicRelationOfficer = PublicRelationOfficer.getpPublicRelationOfficer(loggerUser.getPrId());
	            	     					if(!loggerUser.getUserType().equalsIgnoreCase("administrator")&& publicRelationOfficer.equals(loggerUser)){
	            	     					%>
	            	     					<option value="" selected="selected">--ምረጥ--</option>
	            	     					<%
	            	     						List<GovernmentSectorOrganization> govtOrganizationList = GovernmentSectorOrganization.getAllGovernmentSectorOrganizations();
	            	     						Iterator<GovernmentSectorOrganization> govtOrganizationItr = govtOrganizationList.iterator();
	            	     						while(govtOrganizationItr.hasNext()){
	            	     							GovernmentSectorOrganization gOrganization = govtOrganizationItr.next();
	            	     							%>
	            	     							<option value="<%=gOrganization.getId() %>"><%=gOrganization.getOrganizationName() %></option>
	            	     							<%
	            	     						}//end while loop
	            	     					%>
	            	     					<%
	            	     					}else{
	            	     						//show only the govt organization for the logged in user.
	            	     						//PublicRelationOfficer //publicRelationOfficer = PublicRelationOfficer.getpPublicRelationOfficer(loggerUser.getPrId());
	            	     						GovernmentSectorOrganization governmentSectorOrganization = GovernmentSectorOrganization.getGovernmentSectorOrganization(publicRelationOfficer.getGovernmentSectorOrganizationId());
           	     								%>
           	     								<option value="<%=governmentSectorOrganization.getId() %>" selected="selected"><%=governmentSectorOrganization.getOrganizationName() %></option>
           	     								<%
	            	     					}
	            	     					%>
	            	     				</select>
	            	     			</td>
	            	     			<td align="center">
	            	     				<input type="button" value="አሣይ" id="btnshow" class="btn btn-blue"/>
	            	     				<input type="reset" value="አፅዳ" class="btn btn-blue"/>
	            	     			</td>
	            	     		</tr>
	            	     	</table>
	            	     </form> 
	            	     <hr/> 
	            	     <div id="reportInputFormListDiv" style="width: 100%; height: 80%; overflow-y: scroll;"></div>         
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
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnshow').click(function(){
			var orgId = $('#slctgovtorganization').val();
			if(orgId != ""){
				$('#reportInputFormListDiv').load("showlistofreportinputformsforthisorganization.jsp?orgId=" + orgId);
			}
		});
	});
</script>
</html>
