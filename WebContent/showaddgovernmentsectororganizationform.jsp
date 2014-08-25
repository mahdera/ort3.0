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
    
    <script type="text/javascript" src="ajax_functions/ajax_functions.js"></script>
    
    <script src="js/tiny-mce/jquery.tinymce.js" type="text/javascript"></script>
    
    
    <script src="js/setup.js" type="text/javascript"></script>
    
    <script type="text/javascript" src="validation/gfv.js"></script>
    
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
        <%@include file="sidebarmenu_governmentsectororganization.jsp" %>
        <div class="grid_10">
            <div class="box round first">
                <h2>Admin Tool/አድሚኒስትሬተር መገልገያዎች &gt Gov Organization/የመንግሥት ተቋም | [<a href="showaddgovernmentsectororganizationform.jsp">Add/ጨምር</a>] . [<a href="showlistofgovernmentsectororganizations.jsp">View/ዘርዝር</a>] . [<a href="showlistofgovernmentsectororganizationforedit.jsp">Edit/አስተካክል</a>] . [<a href="showlistofgovernmentsectororganizationfordelete.jsp">Delete/አስወግድ]</a></h2>
                	
	                <div class="block" style="height:600px;background:#fff">
	            	      <form method="post" action="savegovernmentsectororganization.jsp">
                		<table border="1" width="100%">
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
                        		<td align="right" width="30%"><label><font color="red">*</font>Organization Name/የተቋሙ ሥም ፡ </label></td>
                        		<td>
                        			<input type="text" class="medium" name="txtorganizationname" id="txtorganizationname"
                        			validate="not_empty" msg="<font color='red'>Enter organization name</font>"/>
                        		</td>
                        	</tr>
                        	<tr>
	                            <td style="vertical-align: top; padding-top: 9px;" align="right">
	                                <label>Description/ገለፃ ፡ </label>
	                            </td>
	                            <td>
	                                <!-- <textarea name="wysiwyg" id="wysiwyg" rows="5" cols="67"></textarea> -->
	                                <textarea class="tinymce" id="wysiwyg" name="wysiwyg" style="width:100%" rows="10"></textarea>
	                            </td>
	                        </tr>
	                        <tr>
                        		<td align="right" width="30%"><label><font color="red">*</font>Sector Category/የዘርፍ ምድብ ፡ </label></td>
                        		<td>
                        			<select name="slctsectorcategory" id="slctsectorcategory" style="width:100%"
                        			validate="not_empty" msg="<font color='red'>Select sector category</font>">
                        				<option value="" selected="selected">--Select/ይምረጡ--</option>
                        				<%
                        					List<SectorCategory> sectorCategoryList = SectorCategory.getAllSectorCategories();
                        					Iterator<SectorCategory> sectorCategoryItr = sectorCategoryList.iterator();
                        					while(sectorCategoryItr.hasNext()){
                        						SectorCategory sectorCategory = sectorCategoryItr.next();                        						
                        						%>
                        						<option value="<%=sectorCategory.getId() %>"><%=sectorCategory.getSectorName() %></option>
                        						<%
                        					}//end while loop
                        				%>
                        			</select>
                        		</td>
                        	</tr>
                        	<tr>
                        		<td align="right" width="30%"><label>Office Phone/የቢሮ ስልክ ፡ </label></td>
                        		<td>
                        			<input type="text" class="medium" name="txtofficephone" id="txtofficephone"
                        			validate="phone" msg="<font color='red'>Enter valid office phone number</font>"/>
                        		</td>
                        	</tr>
                        	<tr>
                        		<td align="right" width="30%"><label>Fax/ፋክስ ፡ </label></td>
                        		<td>
                        			<input type="text" class="medium" name="txtfax" id="txtfax"/>
                        		</td>
                        	</tr>
                        	<tr>
                        		<td align="right" width="30%"><label><font color="red">*</font>Region/ክልል ፡ </label></td>
                        		<td>
                        			<select name="slctregion" id="slctregion" style="width:100%"
                        			validate="not_empty" msg="<font color='red'>Select region</font>" onchange="showAllZonesOfThisRegion(this.value);">
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
                        		<td align="right" width="30%"><label>Zone/ዞን ፡ </label></td>
                        		<td>
                        			<div id="zoneDiv"></div>
                        		</td>
                        	</tr>
                        	<tr>
                        		<td align="right" width="30%"><label>Woreda/ወረዳ ፡ </label></td>
                        		<td>
                        			<div id="woredaDiv"></div>
                        		</td>
                        	</tr>
                        	<tr>
                        		<td align="right" width="30%"><label>Kebele/ቀበሌ ፡ </label></td>
                        		<td>
                        			<div id="kebeleDiv"></div>
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
         
         
         $('#txtorganizationname').keypress(function(e){
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
         
         $('#txtofficephone').keypress(function(e){
     	 	var typingLang = <%=typingLang%>
	  	 	if(typingLang === 'Amharic'){
	  	 		return handleAmharicNetscape(e,this);
	  	 	}
	      });
         
         $('#txtfax').keypress(function(e){
     	 	var typingLang = <%=typingLang%>
	  	 	if(typingLang === 'Amharic'){
	  	 		return handleAmharicNetscape(e,this);
	  	 	}
	      });
         
         $('#btnSave').click(function(){
        	 	var organizationName = $('#txtorganizationname').val();
        	 	var sectorCategoryId = $('#slctsectorcategory').val();
        	 	var regionId = $('#slctregion').val();
        	 	
        	 	if(organizationName === ""){
        	 		alert("Enter the organization name\nየተቋሙ ሥም አሥገባ!");
        	 		return false;
        	 	}else if(sectorCategoryId === ""){
        	 		alert("Select sector category\nየዘርፍ ምድብ ይምረጡ");
        	 		return false;
        	 	}else if(regionId === ""){
        	 		alert("Select region\nክልል ይምረጡ");
        	 		return false;
        	 	}else{
        	 		return true;
        	 	}
         });
   
     });//end document.ready function...
 </script>
</html>
