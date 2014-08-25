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
    
    <script src="js/tiny-mce/jquery.tinymce.js" type="text/javascript"></script>
    
    
    <script src="js/setup.js" type="text/javascript"></script>
    <script type="text/javascript" src="validation/formValidation.js"></script>
    <script type="text/javascript" src="validation/gfv.js"></script>
    
  <!-- now comes the importing section for amharic typing javascript -->
    <script src="js/amharictyping.js" type="text/javascript"></script>
    
    <script type="text/javascript">
       function validatePublicRelationOfficerForm(){
    	   		if(document.getElementById("slctorganization").value == ""){
    	   			return false;
    	   		}else{
    	   			return true;
    	   		}
       }
    </script>
</head>
<body>
	<%
		response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
		response.addHeader("Pragma", "no-cache"); 
		response.addDateHeader ("Expires", 0);
		
		Account at = (Account)session.getAttribute("account");
		String typingLang = (String) session.getAttribute("typingLang");
		
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
        <%@include file="publicrelationofficer_sidebarmenu.jsp" %>
        <div class="grid_10">
            <div class="box round first">
                <h2>PR Head/የሕዝብ ግንኙነት ክፍል ሃላፊ &gt | [<a href="showaddpublicrelationofficerform.jsp">Add/ጨምር</a>] . [<a href="showlistofpublicrelationofficers.jsp">View/ዘርዝር</a>] . [<a href="showlistofpublicrelationofficerforedit.jsp">Edit/አስተካክል</a>] . [<a href="showlistofpublicrelationofficerfordelete.jsp">Delete/አስወግድ]</a></h2>
                	
	                <div class="block" style="height:450px;background:#fff">
	            	     <form method="post" action="savepublicrelationofficer.jsp" onsubmit="return validatePublicRelationOfficerForm();">
                		<table class="form" border="1" width="100%">
                			<tr>
                				<td colspan="2">
                					<div>
                						<%
                							String saveStatus = request.getParameter("saveStatus");
                							if(saveStatus != null)
                								out.print(saveStatus);
                						%>
                					</div>
                				</td>
                			</tr>
                        	<tr>
                        		<td align="right" style="width:30%"><label>Full Name/ሙሉ ሥም፡ </label></td>
                        		<td>
                        			<input type="text" class="medium" name="txtfullname" id="txtfullname" />
                        		</td>
                        	</tr>
                        	<tr>
                        		<td align="right" style="width:30%"><label>Mobile Phone/የሞባይል ስልክ፡ </label></td>
                        		<td>
                        			<input type="text" class="medium" name="txtmobilephone" id="txtmobilephone"/>
                        		</td>
                        	</tr>
                        	<tr>
                        		<td align="right" style="width:30%"><label>Email/ኢሜይል፡ </label></td>
                        		<td>
                        			<input type="text" class="medium" name="txtemail" id="txtemail"/>
                        		</td>
                        	</tr>
                        	<tr>
                        		<td align="right" style="width:30%"><label>POBox/ፖስታ ሳጥን ቁጥር፡ </label></td>
                        		<td>
                        			<input type="text" class="medium" name="txtpobox" id="txtpobox"/>
                        		</td>
                        	</tr>
                        	<tr>
                        		<td align="right" style="width:30%"><label>
                        			<font color="red">*</font> 
                        			Gov Sector Organization/የመንግሥት ዘርፍ መሥሪያ ቤት፡ </label>
                        		</td>
                        		<td>
                        			<select name="slctorganization" id="slctorganization" style="width:40%">
                        				<option value="" selected="selected">--Select/ምረጥ--</option>
                        				<%
                        					List<GovernmentSectorOrganization> governmentOrganizationList = GovernmentSectorOrganization.getAllGovernmentSectorOrganizations();
                        					Iterator<GovernmentSectorOrganization> governmentOrganizationItr = governmentOrganizationList.iterator();
                        					while(governmentOrganizationItr.hasNext()){
                        						GovernmentSectorOrganization sectorOrganization = governmentOrganizationItr.next();
                        						%>
                        						<option value="<%=sectorOrganization.getId() %>"><%=sectorOrganization.getOrganizationName() %></option>
                        						<%
                        					}//end while loop
                        				%>
                        			</select>
                        		</td>
                        	</tr>
	                        <tr>
	                        	<td></td>
	                        	<td>
	                        		<button class="btn btn-blue">Save/መዝግብ</button>
									<button class="btn btn-blue" type="reset">Clear/አፅዳ</button>
	                        	</td>
	                        </tr>
                        </table>
                	</form>                  
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
		$('#txtfullname').keypress(function(e){
	    	 	var typingLang = <%=typingLang%>
	 	 	if(typingLang === 'Amharic'){
	 	 		return handleAmharicNetscape(e,this);
	 	 	}
	     });	
		
	});//end document.ready function
</script>
</html>
