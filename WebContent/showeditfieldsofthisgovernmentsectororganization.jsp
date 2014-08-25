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
                <h2>አድሚኒስትሬተር መገልገያዎች &gt የመንግሥት ተቋም | [<a href="showaddgovernmentsectororganizationform.jsp">ጨምር</a>] . [<a href="showlistofgovernmentsectororganizations.jsp">ዘርዝር</a>] . [<a href="showlistofgovernmentsectororganizationforedit.jsp">አስተካክል</a>] . [<a href="showlistofgovernmentsectororganizationfordelete.jsp">አስወግድ]</a></h2>
                	<%
                		int sectorOrganizationId = Integer.parseInt(request.getParameter("sectorOrganizationId"));
                		GovernmentSectorOrganization governmentSectorOrganization = GovernmentSectorOrganization.getGovernmentSectorOrganization(sectorOrganizationId);
                	%>
	                <div class="block" style="height:600px;background:#fff">
	            	      <form method="post" action="updategovernmentsectororganization.jsp" onsubmit="return Validate(this);">
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
                        		<td align="right" width="30%"><label>የተቋሙ ሥም ፡ </label></td>
                        		<td>
                        			<input type="hidden" name="hiddenid" id="hiddenid" value="<%=sectorOrganizationId %>"/>
                        			<input type="text" class="medium" name="txtorganizationname" id="txtorganizationname" value="<%=governmentSectorOrganization.getOrganizationName() %>"
                        			validate="not_empty" msg="<font color='red'>Enter organization name</font>"/>
                        		</td>
                        	</tr>
                        	<tr>
	                            <td style="vertical-align: top; padding-top: 9px;" align="right">
	                                <label>ገለፃ ፡ </label>
	                            </td>
	                            <td>
	                                <!-- <textarea name="wysiwyg" id="wysiwyg" rows="5" cols="67"></textarea> -->
	                                <textarea class="tinymce" id="wysiwyg" name="wysiwyg" style="width:100%" rows="10"><%=governmentSectorOrganization.getDescription() %></textarea>
	                            </td>
	                        </tr>
	                        <tr>
                        		<td align="right" width="30%"><label>የዘርፍ ምድብ ፡ </label></td>
                        		<td>
                        			<select name="slctsectorcategory" id="slctsectorcategory" style="width:40%"
                        			validate="not_empty" msg="<font color='red'>Select sector category</font>">
                        				<option value="" selected="selected">--ይምረጡ--</option>
                        				<%
                        					List<SectorCategory> sectorCategoryList = SectorCategory.getAllSectorCategories();
                        					Iterator<SectorCategory> sectorCategoryItr = sectorCategoryList.iterator();
                        					while(sectorCategoryItr.hasNext()){
                        						SectorCategory sectorCategory = sectorCategoryItr.next();
                        						if(governmentSectorOrganization.getSectorCategoryId() == sectorCategory.getId()){
                        						%>
                        						<option value="<%=sectorCategory.getId() %>" selected="selected"><%=sectorCategory.getSectorName() %></option>
                        						<%
                        						}else{
                        							%>
                        							<option value="<%=sectorCategory.getId() %>"><%=sectorCategory.getSectorName() %></option>
                        							<%
                        						}
                        					}//end while loop
                        				%>
                        			</select>
                        		</td>
                        	</tr>
                        	<tr>
                        		<td align="right" width="30%"><label>የቢሮ ስልክ ፡ </label></td>
                        		<td>
                        			<input type="text" class="medium" name="txtofficephone" id="txtofficephone" value="<%=governmentSectorOrganization.getOfficePhone() %>"
                        			validate="phone" msg="<font color='red'>Enter valid office phone number</font>"/>
                        		</td>
                        	</tr>
                        	<tr>
                        		<td align="right" width="30%"><label>ፋክስ ፡ </label></td>
                        		<td>
                        			<input type="text" class="medium" name="txtfax" id="txtfax" value="<%=governmentSectorOrganization.getFax() %>"/>
                        		</td>
                        	</tr>
                        	<tr>
                        		<td align="right" width="30%"><label>ክልል ፡ </label></td>
                        		<td>
                        			<select name="slctregion" id="slctregion" style="width:40%"
                        			validate="not_empty" msg="<font color='red'>Select region</font>" onchange="showAllZonesOfThisRegion(this.value);">
                        				<option value="" selected="selected">--ይምረጡ--</option>
                        				<%
                        					List<Region> regionList = Region.getAllRegions();
                        					Iterator<Region> regionItr = regionList.iterator();
                        					while(regionItr.hasNext()){
                        						Region region = regionItr.next();
                        						if(governmentSectorOrganization.getRegionId() == region.getId()){
                        						%>
                        						<option value="<%=region.getId() %>" selected="selected"><%=region.getRegionName() %></option>
                        						<%
                        						}else{
                        							%>
                        							<option value="<%=region.getId() %>"><%=region.getRegionName() %></option>
                        							<%
                        						}
                        					}//end while loop
                        				%>
                        			</select>
                        		</td>
                        	</tr>
                        	<tr>
                        		<td align="right" width="30%"><label>ዞን ፡ </label></td>
                        		<td>
                        			<div id="zoneDiv">
	                        			<select name="slctzone" id="slctzone" style="width:40%" onchange="showAllWoredasOfThisZone(this.value);">
											<option value="" selected="selected">--Select--</option>
											<%
												List<Zone> zoneList = Zone.getAllZones();
												Iterator<Zone> zoneItr = zoneList.iterator();
												while(zoneItr.hasNext()){
													Zone zone = zoneItr.next();
													if(governmentSectorOrganization.getZoneId() == zone.getId()){
													%>
													<option value="<%=zone.getId() %>" selected="selected"><%=zone.getZoneName() %></option>
													<%
													}else{
														%>
														<option value="<%=zone.getId() %>"><%=zone.getZoneName() %></option>
														<%
													}
												}//end while loop
											%>
										</select>
									</div>
                        		</td>
                        	</tr>
                        	<tr>
                        		<td align="right" width="30%"><label>ወረዳ ፡ </label></td>
                        		<td>
                        			<div id="woredaDiv">
	                        			<select name="slctworeda" id="slctworeda" style="width:40%" onchange="showAllKebelesOfThisWoreda(this.value);">
											<option value="" selected="selected">--Select--</option>
											<%
												List<Woreda> woredaList = Woreda.getAllWoredas();
												Iterator<Woreda> woredaItr = woredaList.iterator();
												while(woredaItr.hasNext()){
													Woreda woreda = woredaItr.next();
													if(governmentSectorOrganization.getWoredaId() == woreda.getId()){
													%>
													<option value="<%=woreda.getId() %>" selected="selected"><%=woreda.getWoredaName() %></option>
													<%
													}else{
														%>
														<option value="<%=woreda.getId() %>"><%=woreda.getWoredaName() %></option>
														<%
													}
												}//end while loop
											%>
										</select>
									</div>
                        		</td>
                        	</tr>
                        	<tr>
                        		<td align="right" width="30%"><label>ቀበሌ ፡ </label></td>
                        		<td>
                        			<div id="kebeleDiv">
                        				<select name="slctkebele" id="slctkebele" style="width:40%">
											<option value="" selected="selected">--Select--</option>
											<%
												List<Kebele> kebeleList = Kebele.getAllKebeles();
												Iterator<Kebele> kebeleItr = kebeleList.iterator();
												while(kebeleItr.hasNext()){
													Kebele kebele = kebeleItr.next();
													if(governmentSectorOrganization.getKebeleId() == kebele.getId()){
													%>
													<option value="<%=kebele.getId() %>" selected="selected"><%=kebele.getKebeleName() %></option>
													<%
													}else{
														%>
														<option value="<%=kebele.getId() %>"><%=kebele.getKebeleName() %></option>
														<%
													}
												}//end while loop
											%>
										</select>
                        			</div>
                        		</td>
                        	</tr>
	                        <tr>
	                        	<td></td>
	                        	<td>
	                        		<button class="btn btn-blue">Update/አድስ</button>
									<button class="btn btn-blue" type="reset">Undo/ወደ ቀድሞ ይዘት መልስ</button>
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
   
     });//end document.ready function...
 </script>
</html>
