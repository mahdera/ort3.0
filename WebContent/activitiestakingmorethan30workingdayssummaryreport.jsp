<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.Date" %>
<%@page import="com.signetitsolutions.ort.server.classes.*" %>
<%@page import="java.util.*" %>
<div id="printReportDiv">
<%
	String reportRegion = request.getParameter("reportRegion");
	String reportZone = request.getParameter("reportZone");
	String reportWoreda = request.getParameter("reportWoreda");
	String reportKebele = request.getParameter("reportKebele");
	String reportSector = request.getParameter("reportSector");	
	

	String reportLevel;
	Date dateFrom = Date.valueOf(request.getParameter("dateFrom"));
	Date dateTo = Date.valueOf(request.getParameter("dateTo"));
	
	int ethStartDate = Integer.parseInt(request.getParameter("ethStartDate"));
	int ethStartMonth = Integer.parseInt(request.getParameter("ethStartMonth"));
	int ethStartYear = Integer.parseInt(request.getParameter("ethStartYear"));
	int ethEndDate = Integer.parseInt(request.getParameter("ethEndDate"));
	int ethEndMonth = Integer.parseInt(request.getParameter("ethEndMonth"));
	int ethEndYear = Integer.parseInt(request.getParameter("ethEndYear"));
	String ethiopicStartMonthName = EthiopicMonth.getEthiopicMonth(ethStartMonth).getMonthName();
	String ethiopicEndMonthName = EthiopicMonth.getEthiopicMonth(ethEndMonth).getMonthName();
	
	if (reportKebele != null && !reportKebele.equalsIgnoreCase("") && !reportKebele.equalsIgnoreCase("undefined")) {
		reportLevel = "kebeleLevel";
	} else if (reportWoreda != null && !reportWoreda.equalsIgnoreCase("") && !reportWoreda.equalsIgnoreCase("undefined")) {
		reportLevel = "woredaLevel";
	} else if (reportZone != null && !reportZone.equalsIgnoreCase("") && !reportZone.equalsIgnoreCase("undefined") ) {
		reportLevel = "zoneLevel";
	} else if (reportRegion != null && !reportRegion.equalsIgnoreCase("") && !reportRegion.equalsIgnoreCase("undefined") && !reportRegion.equalsIgnoreCase("all") ) {
		reportLevel = "regionLevel";	
	} else {
		reportLevel = "all";
	}
	if(reportLevel.equalsIgnoreCase("regionLevel") || reportLevel.equalsIgnoreCase("all") ){
		List<Region> regionList = Region.getAllRegions();
		Iterator<Region> regionItr = null;
		if(!regionList.isEmpty())
			regionItr = regionList.iterator();
%>
<div id="regionLevelReportDiv">
	<table border="0" width="100%" class="reportTable" style="border: 1px solid #2779aa" rules="all">
		<tr>
			<th colspan="3">				
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Activities Taking More than 30 Working Days/ከ 30 የሥራ ቀናት በላይ የወሰዱ ክንዋኔዎች ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
				G.C<br/>
					<%=(ethiopicStartMonthName+" "+ethStartDate+", "+ethStartYear +" - "+ ethiopicEndMonthName+" "+ethEndDate+", "+ethEndYear) %>
			</th>
		</tr>
		<tr>
			<th>Region/ሪጅን</th>
			<th>Information Requesters in Percent/የመረጃ ጠያቂዎች ብዛት በመቶኛ</th>
			<th>Number of Days Taken to Serve/ለማስተናገድ የፈጀው ቀን በአማካይ</th>			
		</tr>
	<%
		float regionNumberOfInformationRequesterTakingMoreThan30DaysPercent=0.0f;
		float regionAvergeNumberOfDaysTakenToServeRequestTakingMoreThan30Days=0.0f;		
		if(reportLevel.equalsIgnoreCase("all")){
		while(regionItr.hasNext()){
			Region region = regionItr.next();
			float numberOfInformationRequesterTakingMoreThan30DaysPercent = ReportGenerator
					.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
							("tbl_service_performed_by_the_given_time_duration",
									"number_of_information_request_took_more_than_30_days",
											reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float averageNumberOfDaysTakenToServeRequestTakingMoreThan30Days = ReportGenerator
					.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
							("tbl_service_performed_by_the_given_time_duration",
									"number_of_days_taken_to_serve_request_taking_more_than_30_days",
											reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			%>
			<tr>
				<td><%=region.getRegionName() %></td>
				<td><%=numberOfInformationRequesterTakingMoreThan30DaysPercent %></td>											
				<td><%=averageNumberOfDaysTakenToServeRequestTakingMoreThan30Days %></td>
			</tr>
			<%
		}//end while loop
		}else{
			Region region = Region.getRegion(Integer.parseInt(reportRegion));
			float numberOfInformationRequesterTakingMoreThan30DaysPercent = ReportGenerator
			.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
					("tbl_service_performed_by_the_given_time_duration",
							"number_of_information_request_took_more_than_30_days",
									reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
	float averageNumberOfDaysTakenToServeRequestTakingMoreThan30Days = ReportGenerator
			.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
					("tbl_service_performed_by_the_given_time_duration",
							"number_of_days_taken_to_serve_request_taking_more_than_30_days",
									reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
	%>
	<tr>
		<td><%=region.getRegionName() %></td>
		<td><%=numberOfInformationRequesterTakingMoreThan30DaysPercent %></td>											
		<td><%=averageNumberOfDaysTakenToServeRequestTakingMoreThan30Days %></td>
	</tr>
	<%
		}
		
	  %>		
	</table>
</div>
<%
	}else if(reportLevel.equalsIgnoreCase("woredaLevel")){
		List<Woreda> woredaList = Woreda.getAllWoredas();
		Iterator<Woreda> woredaItr = null;
		if(!woredaList.isEmpty())
			woredaItr = woredaList.iterator();
%>
<div id="woredaLevelReportDiv">
	<table border="0" width="100%" class="reportTable" style="border: 1px solid #2779aa" rules="all">
		<tr>
			<th colspan="3">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Activities Taking More than 30 Working Days/ከ 30 የሥራ ቀናት በላይ የወሰዱ ክንዋኔዎች ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>Woreda/ወረዳ</th>
			<th>Information Requesters in Percent/የመረጃ ጠያቂዎች ብዛት በመቶኛ</th>
			<th>Number of Days Taken to Serve/ለማስተናገድ የፈጀው ቀን በአማካይ</th>			
		</tr>
		<%
		float woredaNumberOfInformationRequesterTakingMoreThan30DaysPercent=0.0f;
		float woredaAvergeNumberOfDaysTakenToServeRequestTakingMoreThan30Days=0.0f;		
		
		Woreda woreda = Woreda.getWoreda(Integer.parseInt(reportWoreda));
			float numberOfInformationRequesterTakingMoreThan30DaysPercent = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_service_performed_by_the_given_time_duration",
										"number_of_information_request_took_more_than_30_days",
										reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float averageNumberOfDaysTakenToServeRequestTakingMoreThan30Days = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_service_performed_by_the_given_time_duration",
										"number_of_days_taken_to_serve_request_taking_more_than_30_days",
											reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			%>
			<tr>
				<td><%=woreda.getWoredaName() %></td>
				<td><%=numberOfInformationRequesterTakingMoreThan30DaysPercent %></td>											
				<td><%=averageNumberOfDaysTakenToServeRequestTakingMoreThan30Days %></td>
			</tr>
			
	</table>
</div>
<%
	}else if(reportLevel.equalsIgnoreCase("kebeleLevel")){
		List<Kebele> kebeleList = Kebele.getAllKebeles();
		Iterator<Kebele> kebeleItr = null;
		if(!kebeleList.isEmpty())
			kebeleItr = kebeleList.iterator();
%>
<div id="kebeleLevelReportDiv">
	<table border="0" width="100%" class="reportTable" style="border: 1px solid #2779aa" rules="all">
		<tr>
			<th colspan="4">ከ 30 የሥራ ቀናት በላይ የወሰዱ ክንዋኔዎች ማጠቃለያ ሪፖርት</th>
		</tr>
		<tr>
			<th>ቀበሌ</th>
			<th>የመረጃ ጠያቂዎች ብዛት በመቶኛ</th>
			<th>ለማስተናገድ የፈጀው ቀን በአማካይ</th>			
		</tr>
	<%
		float kebeleNumberOfInformationRequesterTakingMoreThan30DaysPercent=0.0f;
		float kebeleAvergeNumberOfDaysTakenToServeRequestTakingMoreThan30Days=0.0f;		
		
		Kebele kebele = Kebele.getKebele(Integer.parseInt(reportKebele));
			float numberOfInformationRequesterTakingMoreThan30DaysPercent = ReportGenerator
					.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
							("tbl_service_performed_by_the_given_time_duration",
									"number_of_information_request_took_more_than_30_days",
										reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float averageNumberOfDaysTakenToServeRequestTakingMoreThan30Days = ReportGenerator
					.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
							("tbl_service_performed_by_the_given_time_duration",
									"number_of_days_taken_to_serve_request_taking_more_than_30_days",
										reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			%>
			<tr>
				<td><%=kebele.getKebeleName() %></td>
				<td><%=numberOfInformationRequesterTakingMoreThan30DaysPercent %></td>											
				<td><%=averageNumberOfDaysTakenToServeRequestTakingMoreThan30Days %></td>
			</tr>
			
	</table>
</div>
<%
	}else if(reportLevel.equalsIgnoreCase("zoneLevel")){
		List<Zone> zoneList = Zone.getAllZones();
		Iterator<Zone> zoneItr = null;
		if(!zoneList.isEmpty())
			zoneItr = zoneList.iterator();
%>
<div id="zoneLevelReportDiv">
	<table border="0" width="100%" class="reportTable" style="border: 1px solid #2779aa" rules="all">
		<tr>
			<th colspan="3">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Activities Taking More than 30 Working Days/ከ 30 የሥራ ቀናት በላይ የወሰዱ ክንዋኔዎች ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>Zone/ዞን</th>
			<th>Information Requesters in Percent/የመረጃ ጠያቂዎች ብዛት በመቶኛ</th>
			<th>Number of Days Taken to Serve/ለማስተናገድ የፈጀው ቀን በአማካይ</th>			
		</tr>
	<%
		float zoneNumberOfInformationRequesterTakingMoreThan30DaysPercent=0.0f;
		float zoneAvergeNumberOfDaysTakenToServeRequestTakingMoreThan30Days=0.0f;		
		
		Zone zone = Zone.getZone(Integer.parseInt(reportZone));
			float numberOfInformationRequesterTakingMoreThan30DaysPercent = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_service_performed_by_the_given_time_duration",
										"number_of_information_request_took_more_than_30_days",
										       reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
			float averageNumberOfDaysTakenToServeRequestTakingMoreThan30Days = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_service_performed_by_the_given_time_duration", 
										"number_of_days_taken_to_serve_request_taking_more_than_30_days",
											reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
			%>
			<tr>
				<td><%=zone.getZoneName() %></td>
				<td><%=numberOfInformationRequesterTakingMoreThan30DaysPercent %></td>											
				<td><%=averageNumberOfDaysTakenToServeRequestTakingMoreThan30Days %></td>
			</tr>
			
	</table>
</div>
<%		
	}
%>
</div>
<table border="0" width="100%">
	<tr>
		<td align="right">
			<a href="#.jsp" onclick="printDiv('printReportDiv')">Print Report / ሪፖርቱን አትም <img src="images/printer.jpeg" border="0" align="absmiddle"/></a>
		</td>
	</tr>
</table>
