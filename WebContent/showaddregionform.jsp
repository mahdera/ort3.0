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
  	<!-- now comes the importing section for amharic typing javascript -->
    <script src="js/amharictyping.js" type="text/javascript"></script>
    
    <script type="text/javascript" src="validation/gfv.js"></script>

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
        <%@include file="sidebarmenu_region.jsp" %>
        <div class="grid_10">
            <div class="box round first">
                <h2>Admin Tool/አድሚኒስትሬተር መገልገያዎች &gt Region/ክልል | [<a href="showaddregionform.jsp">Add/ጨምር</a>] . [<a href="showlistofregions.jsp">View/ዘርዝር</a>] . [<a href="showlistofregionforedit.jsp">Edit/አስተካክል</a>] . [<a href="showlistofregionfordelete.jsp">Delete/አስወግድ]</a></h2>
                	
	                <div class="block" style="height:450px;background:#fff">
	            	      <form method="post" action="saveregion.jsp" onsubmit="return Validate(this);">
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
                        		<td align="right" width="30%"><label><font color="red">*</font> Region Name/የክልል ሥም ፡ </label></td>
                        		<td>
                        			<input type="text" class="medium" name="txtregionname" id="txtregionname"
                        			validate="not_empty" msg="<font color='red'>Enter region name</font>"/>
                        		</td>
                        	</tr>                        	
	                        <tr>
	                        	<td></td>
	                        	<td>
	                        		<button class="btn btn-blue" id="btnSave">Save/መዝግብ</button>
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
		$('#txtregionname').keypress(function(e){
	    	 	var typingLang = <%=typingLang%>
	 	 	if(typingLang === 'Amharic'){
	 	 		return handleAmharicNetscape(e,this);
	 	 	}
	     });
		
		$('#btnSave').click(function(){
			var regionName = $('#txtregionname').val();
			if(regionName === ""){
				alert("Please enter region name!\nየክልል ሥም ያሥገቡ!");
				return false;
			}else{
				return true;
			}
		});
	});//end document.ready fucntion
</script>
</html>
