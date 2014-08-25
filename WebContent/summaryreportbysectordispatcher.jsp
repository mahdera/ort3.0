<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.Date" %>
<%@page import="java.util.*" %>
<%@page import="com.signetitsolutions.ort.server.classes.*" %>
<%
	String reportLevel = request.getParameter("reportLevel");
	String reportPageURL = request.getParameter("reportPageURL");
	
	String reportRegion = request.getParameter("reportRegion");
	String reportZone = request.getParameter("reportZone");
	String reportWoreda = request.getParameter("reportWoreda");
	String reportKebele = request.getParameter("reportKebele");
	//out.println(reportPageURL);	
	Date dateFrom = Date.valueOf(request.getParameter("dateFrom"));
	System.out.println("dateFrom: "+dateFrom);
	Date dateTo = Date.valueOf(request.getParameter("dateTo"));
	/*System.out.println("on trainig aaaaaaaaaaaand ... reportRegion = "+reportRegion+"   reportZone = "+reportZone+
			"   reportWoreda = "+reportWoreda+"   reportKebele = "+reportKebele+
			"   reportLevel = "+reportLevel+"   selectedTerritoryId = ");*/
%>
<form style="background:#eee">
<input type="hidden" name="hiddenreportlevel" id="hiddenreportlevel" value="<%=reportLevel %>"/>
<input type="hidden" name="hiddenreportpageurl" id="hiddenreportpageurl" value="<%=reportPageURL.replace(" ","") %>"/>
	<table border="0" width="100%">
		<tr>
			<%
				if(reportLevel.equalsIgnoreCase("regionLevel")){
			%>
				<td width="60%">Select Region Where Government Sector Organization is Located/ሴክተር መ/ቤቱ የሚገኝበትን ሪጅን ይምረጡ:</td>
				<td>
					<select name="slctterritory" id="slctterritory" style="width:60%">
						<option value="" selected="selected">--Select--</option>
						<%
							List<Region> regionList = Region.getAllRegions();
							Iterator<Region> regionItr = null;
							if(!regionList.isEmpty())
								regionItr = regionList.iterator();
							while(regionItr.hasNext()){
								Region region = regionItr.next();
								%>
								<option value="<%=region.getId() %>"><%=region.getRegionName() %></option>
								<%
							}//end while loop
						%>
					</select>					
				</td>
			<%
				}else if(reportLevel.equalsIgnoreCase("zoneLevel")){
			%>
			<td width="60%">Select Zone Where Government Sector Organization is Located/ሴክተር መ/ቤቱ የሚገኝበትን ዞን ይምረጡ:</td>
				<td>
					<select name="slctterritory" id="slctterritory" style="width:60%">
						<option value="" selected="selected">--Select--</option>
						<%
							List<Zone> zoneList = Zone.getAllZones();
							Iterator<Zone> zoneItr = null;
							if(!zoneList.isEmpty())
								zoneItr = zoneList.iterator();
							while(zoneItr.hasNext()){
								Zone zone = zoneItr.next();
								%>
								<option value="<%=zone.getId() %>"><%=zone.getZoneName() %></option>
								<%
							}//end while loop
						%>
					</select>
				</td>
			<%
				}else if(reportLevel.equalsIgnoreCase("woredaLevel")){
			%>
			<td width="60%">Select Woreda Where Government Sector Organization is Located/ሴክተር መ/ቤቱ የሚገኝበትን ወረዳ ይምረጡ:</td>
				<td>
					<select name="slctterritory" id="slctterritory" style="width:60%">
						<option value="" selected="selected">--Select--</option>
						<%
							List<Woreda> woredaList = Woreda.getAllWoredas();
							Iterator<Woreda> woredaItr = null;
							if(!woredaList.isEmpty())
								woredaItr = woredaList.iterator();
							while(woredaItr.hasNext()){
								Woreda woreda = woredaItr.next();
								%>
								<option value="<%=woreda.getId() %>"><%=woreda.getWoredaName() %></option>
								<%
							}//end while loop
						%>
					</select>
				</td>
			<%
			}else if(reportLevel.equalsIgnoreCase("kebeleLevel")){
			%>
			<td width="30%">ሴክተር መ/ቤቱ የሚገኝበትን ቀበሌ ይምረጡ:</td>
				<td>
					<select name="slctterritory" id="slctterritory" style="width:60%">
						<option value="" selected="selected">--Select--</option>
						<%
							List<Kebele> kebeleList = Kebele.getAllKebeles();
							Iterator<Kebele> kebeleItr = null;
							if(!kebeleList.isEmpty())
								kebeleItr = kebeleList.iterator();
							while(kebeleItr.hasNext()){
								Kebele kebele = kebeleItr.next();
								%>
								<option value="<%=kebele.getId() %>"><%=kebele.getKebeleName() %></option>
								<%
							}//end while loop
						%>
					</select>
				</td>
			<%
			}
			%>		
		</tr>
	</table>
</form>
<div id="sectorReportDetailDiv"></div>
<script type="text/javascript">
	$('#slctterritory').change(function(){
		var selectedTerritoryId = $('#slctterritory').val();		
		var reportLevel = $('#hiddenreportlevel').val();
		var dateFrom = "<%=dateFrom %>";
		var dateTo = "<%=dateTo%>";
		var reportPageURL = $('#hiddenreportpageurl').val();
		var ethStartDate = $('#slctstartdate').val();
		var ethStartMonth = $('#slctstartmonth').val();
		var ethStartYear = $('#slctstartyear').val();
		var ethEndDate = $('#slctenddate').val();
		var ethEndMonth = $('#slctendmonth').val();
		var ethEndYear = $('#slctendyear').val();
		
		if(selectedTerritoryId != ""){
			var dataString = "selectedTerritoryId="+selectedTerritoryId+"&reportLevel="+reportLevel+
			"&dateFrom="+dateFrom+"&dateTo="+dateTo+"&ethStartDate="+ethStartDate+
			"&ethStartMonth="+ethStartMonth+"&ethStartYear="+ethStartYear+"&ethEndDate="+
			ethEndDate+"&ethEndMonth="+ethEndMonth+"&ethEndYear="+ethEndYear;
			//alert(dataString);
			//alert(reportPageURL);
			reportPageURL = reportPageURL.replace(/["']{1}/gi,"");
			//alert(reportPageURL);
			$.ajax({
		        type:'GET',
		        data:dataString,
		        url:reportPageURL,
		        success:function(data) {
		          $('#sectorReportDetailDiv').html(data);
		        }
		    });
		}
	});
</script>