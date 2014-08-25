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
  
    
    <script type="text/javascript" src="validation/gfv.js"></script>
    
    <script src="js/tiny-mce/jquery.tinymce.js" type="text/javascript"></script>
    
    <!-- now comes the importing section for amharic typing javascript -->
    <script src="js/amharictyping.js" type="text/javascript"></script>

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
        <%@include file="sidebarmenu_branch.jsp" %>
        <div class="grid_10">
            <div class="box round first">
                <h2>Admin Tool/አድሚኒስትሬተር መገልገያዎች &gt Branch/ቅርንጫፍ | [<a href="showaddbranchform.jsp">Add/ጨምር</a>] . [<a href="showlistofbranchs.jsp">View/ዘርዝር</a>] . [<a href="showlistofbranchforedit.jsp">Edit/አስተካክል</a>] . [<a href="showlistofbranchfordelete.jsp">Delete/አስወግድ]</a></h2>
                	
	                <div class="block" style="height:450px;background:#eee">
	            	     <form method="post" action="savebranch.jsp">
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
                        		<td align="right" width="30%"><label><font color="red">*</font>Branch Name/የቅርንጫፍ ሥም ፡ </label></td>
                        		<td>
                        			<input type="text" class="medium" name="txtbranchname" id="txtbranchname"
                        			validate="not_empty" msg="<font color='red'>Enter branch name</font>"/>
                        		</td>
                        	</tr>
                        	<tr>
	                            <td style="vertical-align: top; padding-top: 9px;" align="right">
	                                <label>Branch Description/የቅርንጫፍ ገለፃ ፡ </label>
	                            </td>
	                            <td>
	                                <!-- <textarea name="wysiwyg" id="wysiwyg" rows="5" cols="67"></textarea> -->
	                                <textarea class="tinymce" id="wysiwyg" name="wysiwyg" style="width:100%" rows="10"></textarea>
	                            </td>
	                        </tr>
	                        <tr>
                        		<td align="right" width="30%"><label><font color="red">*</font>Region/ክልል ፡ </label></td>
                        		<td>
                        			<select name="slctregion" id="slctregion" style="width:40%"
                        			validate="not_empty" msg="<font color='red'>Select region</font>">
                        				<option value="" selected="selected">--Select/ይምረጡ--</option>
                        				<%
                        					List<Region> regionList = Region.getAllRegions();
                        					Iterator<Region> regionItr = regionList.iterator();
                        					while(regionItr.hasNext()){
                        						Region region = regionItr.next();
                        						%>
                        						<option value="<%=region.getId() %>"><%=region.getRegionName() %></option>
                        						<%
                        					}//end while loop
                        				%>
                        			</select>
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
     $(document).ready(function () { 
    	 	 var typingLang = <%=typingLang%>
    	 	 if(typingLang !== 'Amharic')
         	setupTinyMCE();
         
         
         $('#txtbranchname').keypress(function(e){
        	 	var typingLang = <%=typingLang%>
     	 	if(typingLang === 'Amharic'){
     	 		return handleAmharicNetscape(e,this);
     	 	}
         });
         
         $('textarea').keypress(function(e){
        	 	var typingLang = <%=typingLang%>
        	 	if(typingLang === 'Amharic'){
        	 		return handleAmharicNetscape(e,this);
        	 	}
         });
         
         $('#btnSave').click(function(){
        	 	var branchName = $('#txtbranchname').val();
        	 	var regionId = $('#slctregion').val();
        	 	
        	 	if(branchName === ""){
        	 		alert("Enter the branch name.\nየቅርንጫፍ ሥም ያሥገቡ!");
        	 		return false;
        	 	}else if(regionId === ""){
        	 		alert("Select region.\nክልል ይምረጡ!");
        	 		return false;
        	 	}else{
        	 		return true;
        	 	}
         });
         
     });//end document.ready function...
 </script>
</html>
