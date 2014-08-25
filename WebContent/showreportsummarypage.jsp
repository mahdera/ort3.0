<%@page import="java.nio.channels.Selector"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
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
    <link rel="stylesheet" media="print" type="text/css" href="css/print.css"/>
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
    <script src="sample/datetimepicker_css.js"></script>
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
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		String currentDate = dateFormat.format(cal.getTime());
		Date modificationDate = Date.valueOf(currentDate);
		StringTokenizer token = new StringTokenizer(currentDate,"-");
		String strYear = token.nextToken();	
		int year = Integer.parseInt(strYear);
	%>
    <div class="container_12">
        <%@include file="userhomeheader.jsp" %>
        <div class="clear">
        </div>
        <%@include file="dashboard.jsp" %>
        <div class="clear">
        </div>
        <%@include file="reportsidebar.jsp" %>
        <div class="grid_10">
            <div class="box round first">
                <h2>Report Display Page/ሪፖርት ማሳያ ገፅ</h2>                
                <div class="block" style="background:#fff"> 
                	
                	<form method="post" action="changeusername.jsp">
                		<table border="1" width="100%" class="form" style="background:#eee;left-padding:5px">
                			<tr>
                				<td colspan="4">
                					<div class='message info'><h5>Warning!</h5>
		            					<p>N.B. Fields identified by <font color="red">*</font> are required and hence can not be empty!</p>
		            				</div>
                				</td>
                			</tr>                 		
                			<tr>
                				<td align="left" style="width:20%">
                				<div id="regionDiv">
                        			<label><font color="red">*</font><strong>Region/ክልል:</strong></label><br/>
                        			<select name="slctregion" id="slctregion" style="width:100%"
                        			validate="not_empty"  color='red' onchange="showAllZonesOfThisRegion(this.value);">
                        				<option value="" selected="selected" >--Select/ይምረጡ--</option>
                        				<option value="all">ሁሉም ክልሎች</option>                        				
                        				<%
                        				  
                        					List<Region> regionList = Region.getAllRegions();
                        					Iterator<Region> regionItr = regionList.iterator();
                        					while(regionItr.hasNext()){
                        						//if(Selector.this.equals("ሁሉም ክልሎች")){
                        						Region region = regionItr.next();
                        						%>
                        						<option value="<%=region.getId() %>"><%=region.getRegionName() %></option>
                        						<%
                        					//}
                        					}//end while loop
                        				  
                        				%>
                        			</select>
                        			</div>
                        		</td>
                        		<td align="left" style="width:20%">
                        			<label><strong>Zone/ዞን:</strong></label><br/>
                        			<div id="zoneDiv"></div>
                        		</td>
                        		<td align="left" style="width:20%">
                        			<label><strong>Woreda/ወረዳ:</strong></label><br/>
                        			<div id="woredaDiv"></div>
                        		</td>
                        		<td align="left" style="width:20%">
                        			<label><strong>Kebele/ቀበሌ:</strong></label><br/>
                        			<div id="kebeleDiv"></div>
                        		</td>
                			</tr>             			
                			
                			<tr>                				
                			  <td style="width:15%" align="left">
                        			<label><font color="red">*</font><strong>Sector Category/የዘርፍ ምድብ፡</strong> </label><br/>
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
                				<td align="left" colspan="3">
                					<label><font color="red">*</font><strong>Report Type/የሪፖርቱ ዓይነት:</label></strong><br/>
                					<select name="slctreporttype" id="slctreporttype" style="width:100%">
                						<option value="" selected="selected">--Select--</option>
                						<option value="trainingandorganizingsummaryreport.jsp">Training and Organization Summary Report/ሥልጠና እና አደረጃጀት ማጠቃለያ ሪፖርት</option>
                						<option value="requesttoobtaininformationsummaryreport.jsp">Request to Obtain Information Summary Report/መረጃ ለማግኝት የቀረበ ጥያቄን ማስተናግድ የማጠቃለያ ሪፖርት</option>                						
                						<option value="appealstoorganizationheadsummaryreport.jsp">Appeal to Organization Head Summary Report/ለተቋሙ የበላይ ኃላፊ የቀረቡ አቤቱታዎች/ቅሬታዎች ማጠቃለያ ሪፖርት</option>
                						<option value="appealstomainombudsmansummaryreport.jsp">Appeal to Main Ombudsman Office/ለዋና ዕንባ ጠባቂ የቀረቡ አስተዳደራዊ ይግባኞች ማጠቃለያ ሪፖርት</option>
                						<option value="appealtocourtsummaryreport.jsp">Appeal to Court Summary Office/ለፍርድ ቤት የቀረቡ ይግባኞች ማጠቃለያ ሪፖርት</option>
                						<option value="classifiedinformationcategorysummaryreport.jsp">Classified Information Summary Report/የማይገለፁ መረጃዎች ምድብ ማጠቃለያ ሪፖርት</option>
                						<option value="rejectioncertificatesummaryreport.jsp">Rejection Certificate Summary Report/የክልከላ ሠርተፍኬት ማጠቃለያ ሪፖርት</option>
                						<option value="activitiesservedwithintheperiodspecifiedbyproclamationsummaryreport.jsp">Activities Performed by Time Period as per Proclamation/በአዋጁ በተቀመጠው የጊዜ ገደብ የተስተናገዱ ተግባራት ማጠቃለያ ሪፖርት</option>
                						<option value="activitiestakingmorethan30workingdayssummaryreport.jsp">Activities Taking Morethan 30 Days Summary Report/ከ 30 የሥራ ቀናት በላይ የወሰዱ ክንዋኔዎች ማጠቃለያ ሪፖርት</option>
                						<option value="urgentreplywithin10dayssummaryreport.jsp">Urgent Response within 10 Days Summary Report/አጣዳፊ ምላሽ በ 10 ቀን የተከናወኑ ማጠቃለያ ሪፖርት</option>
                						<option value="informationrightimplementationandadmincostsummaryreport.jsp">Information Right Implementation Summary Report/የመረጃ መብት ትግበራ አስተዳደራዊ ወጭዎች ማጠቃለያ ሪፖርት</option>
                						<option value="otherissuesthereportshouldincludesummaryreport.jsp">Other Issues Report Should Contain Summary Report/ሪፖርቱ ሊያካትታቸው የሚገቡ ሌሎች ጉዳዮች ማጠቃለያ ሪፖርት</option>
                						<option value="publishinginformationpapersummaryreport.jsp">Paper Publicaton Summary Report/አትሞ ስለማውጣት ማጠቃለያ ሪፖርት (በወረቀት)</option>
                						<option value="publishinginformationelectronicsummaryreport.jsp">Electronic Publication Summary Report/አትሞ ስለማውጣት ማጠቃለያ ሪፖርት (በኤሌክትሮኒክስ)</option>
                						<option value="">======================(Report By Sector)የሴክተር ሪፖርት ማውጫ ዝርዝር===================</option>
                						<option value="summaryreportbysectordispatcher.jsp?reportPageURL='trainingandorganizingsummaryreportbysector.jsp'">Training and Organization Summary Report/ሥልጠና እና አደረጃጀት ማጠቃለያ ሪፖርት (በ ሴክተር)</option>
                						<option value="summaryreportbysectordispatcher.jsp?reportPageURL='requesttoobtaininformationsummaryreportbysector.jsp'">Request to Obtain Information Summary Report/መረጃ ለማግኝት የቀረበ ጥያቄን ማስተናግድ የማጠቃለያ ሪፖርት (በ ሴክተር)</option>                						
                						<option value="summaryreportbysectordispatcher.jsp?reportPageURL='appealstoorganizationheadsummaryreportbysector.jsp'">Appeal to Organization Head Summary Report/ለተቋሙ የበላይ ኃላፊ የቀረቡ አቤቱታዎች/ቅሬታዎች ማጠቃለያ ሪፖርት (በ ሴክተር)</option>
                						<option value="summaryreportbysectordispatcher.jsp?reportPageURL='appealstomainombudsmansummaryreportbysector.jsp'">Appeal to Main Ombudsman Summary Report/ለዋና ዕንባ ጠባቂ የቀረቡ አስተዳደራዊ ይግባኞች ማጠቃለያ ሪፖርት (በ ሴክተር)</option>
                						<option value="summaryreportbysectordispatcher.jsp?reportPageURL='appealtocourtsummaryreportbysector.jsp'">Appeal to Court Summary Report/ለፍርድ ቤት የቀረቡ ይግባኞች ማጠቃለያ ሪፖርት (በ ሴክተር)</option>
                						<option value="summaryreportbysectordispatcher.jsp?reportPageURL='classifiedinformationcategorysummaryreportbysector.jsp'">Classified Inforamtion Summary Report/የማይገለፁ መረጃዎች ምድብ ማጠቃለያ ሪፖርት (በ ሴክተር)</option>
                						<option value="summaryreportbysectordispatcher.jsp?reportPageURL='rejectioncertificatesummaryreportbysector.jsp'">Rejection Certificate Summary Report/የክልከላ ሠርተፍኬት ማጠቃለያ ሪፖርት (በ ሴክተር)</option>
                						<option value="summaryreportbysectordispatcher.jsp?reportPageURL='activitiesservedwithintheperiodspecifiedbyproclamationsummaryreportbysector.jsp'">Activities Performed as per Time Period of Proclamation Summary Report/በአዋጁ በተቀመጠው የጊዜ ገደብ የተስተናገዱ ተግባራት ማጠቃለያ ሪፖርት (በ ሴክተር)</option>
                						<option value="summaryreportbysectordispatcher.jsp?reportPageURL='activitiestakingmorethan30workingdayssummaryreportbysector.jsp'">Activities Taking Morethan 30 Working Days Summary Report/ከ 30 የሥራ ቀናት በላይ የወሰዱ ክንዋኔዎች ማጠቃለያ ሪፖርት (በ ሴክተር)</option>
                						<option value="summaryreportbysectordispatcher.jsp?reportPageURL='urgentreplywithin10dayssummaryreportbysector.jsp'">Urgent Reply to Requests Within 10 Days Summary Report/አጣዳፊ ምላሽ በ 10 ቀን የተከናወኑ ማጠቃለያ ሪፖርት (በ ሴክተር)</option>
                						<option value="summaryreportbysectordispatcher.jsp?reportPageURL='informationrightimplementationandadmincostsummaryreportbysector.jsp'">Information Rights Implementation Summary Report/የመረጃ መብት ትግበራ አስተዳደራዊ ወጭዎች ማጠቃለያ ሪፖርት (በ ሴክተር)</option>
                						<option value="summaryreportbysectordispatcher.jsp?reportPageURL='otherissuesthereportshouldincludesummaryreportbysector.jsp'">Other Issues Report Must Include Summary Report/ሪፖርቱ ሊያካትታቸው የሚገቡ ሌሎች ጉዳዮች ማጠቃለያ ሪፖርት (በ ሴክተር)</option>
                						<option value="summaryreportbysectordispatcher.jsp?reportPageURL='publishinginformationpapersummaryreportbysector.jsp'">Paper Publication Summary Report/አትሞ ስለማውጣት ማጠቃለያ ሪፖርት (በወረቀት) (በ ሴክተር)</option>
                						<option value="summaryreportbysectordispatcher.jsp?reportPageURL='publishinginformationelectronicsummaryreportbysector.jsp'">Electronic Publication Summary Report/አትሞ ስለማውጣት ማጠቃለያ ሪፖርት (በኤሌክትሮኒክስ) (በ ሴክተር)</option>
                					</select>
                				</td>                				
                			</tr>
                			<tr>
                				<td colspan="2">
                					<label><font color="red">*</font><strong>Start Date/መነሻ ቀን:</strong></label><br/>
                					<table border="0" width="100%">
                						<tr style="background:#ccc">
                							<td>Date/ቀን</td>
                							<td>Month/ወር</td>
                							<td>Year/ዓመት</td>
                						</tr>
                						<tr>
                							<td>
                								<select name="slctstartdate" id="slctstartdate" style="width:100%">
                									<option value="" selected="selected">--Select--</option>
                									<%
                										for(int i=1;i<=30;i++){
                											%>
                												<option value="<%=i %>"><%=i %></option>
                											<%
                										}//end for...loop
                									%>
                								</select>
                							</td>
                							<td>
                								<select name="slctstartmonth" id="slctstartmonth" style="width:100%">
                									<option value="" selected="selected">--Select--</option>
                									<%
                										List<EthiopicMonth> ethiopicMonthList = EthiopicMonth.getAllEthiopicMonths();
                										Iterator<EthiopicMonth> ethiopicMonthItr = ethiopicMonthList.iterator();
                										while(ethiopicMonthItr.hasNext()){
                											EthiopicMonth ethiopicMonth = ethiopicMonthItr.next();
                											%>
                												<option value="<%=ethiopicMonth.getMonthIndex() %>"><%=ethiopicMonth.getMonthName() %></option>
                											<%
                										}//end while loop
                									%>
                								</select>
                							</td>
                							<td>
                								<select name="slctstartyear" id="slctstartyear" style="width:100%">
                									<option value="" selected="selected">--Select--</option>
                									<%
	                									int startYear = year - 5;
	                									for(int i=year;i>=startYear;i--){
	                										Day ethiopicDay = DateConverter.toEthiopian(1, 1, i);
	                										int ethYear = ethiopicDay.getYear();
	                										%>
	                											<option value="<%=ethYear%>"><%=ethYear %></option>
	                										<%
	                									}//end for...loop
                									%>
                								</select>
                								<input type="hidden" name="txtdatefrom" id="txtdatefrom"/>
                							</td>
                						</tr>
                					</table>
                				</td>
                				<td colspan="2">
                				<label><font color="red">*</font><strong>End Date/መጨረሻ ቀን:</strong></label><br/>
                					<table border="0" width="100%">
                						<tr style="background:#ccc">
                							<td>Date/ቀን</td>
                							<td>Month/ወር</td>
                							<td>Year/ዓመት</td>
                						</tr>
                						<tr>
                							<td>
                								<select name="slctenddate" id="slctenddate" style="width:100%">
                									<option value="" selected="selected">--Select--</option>
                									<%
                										for(int i=1;i<=30;i++){
                											%>
                												<option value="<%=i %>"><%=i %></option>
                											<%
                										}//end for...loop
                									%>
                								</select>
                							</td>
                							<td>
                								<select name="slctendmonth" id="slctendmonth" style="width:100%">
                									<option value="" selected="selected">--Select--</option>
                									<%
                										List<EthiopicMonth> ethiopicEndMonthList = EthiopicMonth.getAllEthiopicMonths();
                										Iterator<EthiopicMonth> ethiopicEndMonthItr = ethiopicEndMonthList.iterator();
                										while(ethiopicEndMonthItr.hasNext()){
                											EthiopicMonth ethiopicMonth = ethiopicEndMonthItr.next();
                											%>
                												<option value="<%=ethiopicMonth.getMonthIndex() %>"><%=ethiopicMonth.getMonthName() %></option>
                											<%
                										}//end while loop
                									%>
                								</select>
                							</td>
                							<td>
                								<select name="slctendyear" id="slctendyear" style="width:100%">
                									<option value="" selected="selected">--Select--</option>
                									<%
	                									int stopYear = year - 5;
	                									for(int i=year;i>=stopYear;i--){
	                										Day ethiopicDay = DateConverter.toEthiopian(1, 1, i);
	                										int ethYear = ethiopicDay.getYear();
	                										%>
	                											<option value="<%=ethYear%>"><%=ethYear %></option>
	                										<%
	                									}//end for...loop
                									%>
                								</select>
                								<input type="hidden" name="txtdateto" id="txtdateto"/>
                							</td>                							
                						</tr>
                					</table>
                				</td>                				
                			</tr>
                			<tr>
                				<td colspan="4" align="right">                					
                					<input type="button" value="Show/አሳይ" class="btn btn-blue" id="showButton"/>
                					<input type="reset" value="Clear/አፅዳ" class="btn btn-blue"/>
                				</td>
                			</tr>
                			<tr>
                				<td colspan="4">
                					<div id="errorDiv"></div>
                				</td>
                			</tr>                			
                		</table>
                	</form>
                	<div id="loadingDiv" style="display: none"><img src="design/progress_bar.gif" alt="Loading..."/></div>
                	<div id="reportDetailDiv" style="width: 100%; height: 80%; overflow-y: scroll;">            			
            		</div>
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
		$('#slctendyear').change(function(){
			//ethiopic start date
			var ethiopicStartDate = $('#slctstartdate').val();
			var ethiopicStartMonth = $('#slctstartmonth').val();
			var ethiopicStartYear = $('#slctstartyear').val();
			
			//ethiopic end date
			var ethiopicEndDate = $('#slctenddate').val();
			var ethiopicEndMonth = $('#slctendmonth').val();
			var ethiopicEndYear = $('#slctendyear').val();
			
			//now do the convertion in here...	
			if(ethiopicStartDate != "" && ethiopicStartMonth != "" && ethiopicStartYear != "" &&
					ethiopicEndDate != "" && ethiopicEndMonth != "" && ethiopicEndYear != ""){
				var startDateDataString = "dateDataString="+ethiopicStartDate+":"+ethiopicStartMonth+":"+ethiopicStartYear;
				var endDateDataString = "dateDataString="+ethiopicEndDate+":"+ethiopicEndMonth+":"+ethiopicEndYear;
				
				$.ajax({
					type:'POST',
					data:startDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#txtdatefrom').val(data);
					}
				});
				
				$.ajax({
					type:'POST',
					data:endDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#txtdateto').val(data);
					}
				});
			}//end if condition...
		});
		
		$('#showButton').click(function(){
			$('#errorDiv').html('');
			var reportRegion = $('#slctregion').val();
			var reportZone = $('#slctzone').val();
			var reportWoreda = $('#slctworeda').val();
			var reportKebele= $('#slctkebele').val();
			var reportSector = $('#slctsectorcategory').val();
			var reportPageURL = $('#slctreporttype').val();
			
			var reportLevel = "regionLevel";
			var ethStartDate = $('#slctstartdate').val();
			var ethStartMonth = $('#slctstartmonth').val();
			var ethStartYear = $('#slctstartyear').val();
			var ethEndDate = $('#slctenddate').val();
			var ethEndMonth = $('#slctendmonth').val();
			var ethEndYear = $('#slctendyear').val();
						
			
			//now comes the ajax part...
			var dateFrom = $('#txtdatefrom').val();
			var dateTo = $('#txtdateto').val();	
				
			if(reportRegion != "" && reportSector != "" && reportPageURL != "" && dateFrom != "" && dateTo != ""){
				$('#loadingDiv').show();							
				//parameter setting/initializing...
				var dataString = "reportRegion="+reportRegion+"&reportZone="+reportZone+"&reportWoreda="+reportWoreda+
				"&reportKebele="+reportKebele+"&reportSector="+reportSector+"&reportPageURL="+reportPageURL+
				"&dateFrom="+dateFrom+"&dateTo="+dateTo+"&reportLevel="+reportLevel+"&ethStartDate="+ethStartDate+
				"&ethStartMonth="+ethStartMonth+"&ethStartYear="+ethStartYear+"&ethEndDate="+ethEndDate+"&ethEndMonth="+
				ethEndMonth+"&ethEndYear="+ethEndYear;
				
				$.ajax({
			        type:'GET',
			        data:dataString,
			        url:reportPageURL,
			        success:function(data) {
			          $('#reportDetailDiv').html(data);
			          $('#loadingDiv').hide();
			        }
			    });
			}else{
				$('#errorDiv').html("<div class='message error'>Please enter data for all the required fields!</div>");
			}
		});//end button.click function
	});//end document.ready function
</script>
</html>