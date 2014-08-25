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
    
    <script type="text/javascript" src="validation/formValidation.js"></script>
    
    <script type="text/javascript" language="javascript" src="js/ajax_functions.js"></script>
    <script src="js/tiny-mce/jquery.tinymce.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            setupTinyMCE();
            setupProgressbar('progress-bar');
            setDatePicker('date-picker');
            setupDialogBox('dialog', 'opener');
            $('input[type="checkbox"]').fancybutton();
            $('input[type="radio"]').fancybutton();
        });
    </script>
    <!-- /TinyMCE -->
    
    <script src="js/setup.js" type="text/javascript"></script>
  <script type="text/javascript">

        $(document).ready(function () {
            setupLeftMenu();
			setSidebarHeight();
        });
    </script>

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
                <h2>የሪፖርት ግብአት ፎርም/ቅፅ</h2>                	
                <div class="block" style="height:430px;background:#eee">
                	 <div>
 						<%
 							String saveStatus = request.getParameter("saveStatus");
 							if(saveStatus != null)
 								out.print(saveStatus);
 						%>
 					</div>
        			 <form method="post" action="saveappealtogovbodyandcontinue.jsp" onsubmit="return validateAppealToGovBodyForm();">
        			 	<table border="1" width="100%" class="form">
        			 		<tr style="background:lightyellow">
        			 			<td style="font-size:14pt;float:center;font-weight:bolder">4. ለመንግስት አካል /ለተቋሙ/የበላይ ኃላፊ በዓመቱ የቀረቡ  አቤቱታዎችን በተመለከተ:</td>
        			 		</tr>
        			 		<tr>
        			 			<td>
        			 				<table border="1" width="100%">
        			 						<tr>
	       			 							<td style="font-size:11pt" width="36%"><label>4.1 አቤቱታዎቹ ብዛት :</label></td>
	       			 							<td>
	       			 								<input type="text" class="medium" name="txtnumberofappeal" id="txtnumberofappeal"/> 
	       			 							</td>
	       			 						</tr>       			 						
					 						<tr>
	       			 							<td style="font-size:11pt"><label>4.2 ውሳኔ የተሰጣቸው አቤቱታዎች ብዛት :</label></td>
	       			 							<td>
	       			 								<input type="text" class="medium" name="txtnumberofresolvedappeals" id="txtnumberofresolvedappeals"/> 
	       			 							</td>
	       			 						</tr>
	       			 						<tr>
	       			 							<td style="font-size:11pt"><label>4.3 ሙሉ በሙሉ ተቀባይነት ያገኙ አቤቱታዎች ብዛት :</label></td>
	       			 							<td>
	       			 								<input type="text" class="medium" name="txtnumberoffullyacceptedappealsbygovtorganization" id="txtnumberoffullyacceptedappealsbygovtorganization"/> 
	       			 							</td>
	       			 						</tr>
	       			 						<tr>
	       			 							<td style="font-size:11pt"><label>4.4 በከፊል ተቀባይነት ያገኙ አቤቱታዎች ብዛት :</label></td>
	       			 							<td>
	       			 								<input type="text" class="medium" name="txtnumberofpartiallyacceptedappealsbygovtorganization" id="txtnumberofpartiallyacceptedappealsbygovtorganization"/> 
	       			 							</td>
	       			 						</tr>
	       			 						<tr>
	       			 							<td style="font-size:11pt"><label>4.5 ሙሉ በሙሉ ውድቅ የተደረጉ አቤቱታዎች ብዛት :</label></td>
	       			 							<td>
	       			 								<input type="text" class="medium" name="txtnumberoffullyrejectedappealsbygovtorganization" id="txtnumberoffullyrejectedappealsbygovtorganization"/> 
	       			 							</td>
	       			 						</tr>        			 						
        			 						<tr>
        			 							<td></td>
        			 							<td>
        			 								<input type="submit" value="መዝግብና ቀጥል" class="btn btn-blue"/>
        			 								<input type="reset" value="አፅዳ" class="btn btn-blue"/>
        			 							</td>
        			 						</tr>
        			 				</table>        			 				
        			 			</td>
        			 		</tr>
        			 	</table><!-- up to here -->
        			 	       			 	
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
</html>
