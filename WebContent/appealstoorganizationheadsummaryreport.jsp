<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.Date" %>
<%@page import="java.util.*" %>
<%@page import="com.signetitsolutions.ort.server.classes.*" %>
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
	
	if(reportLevel.equalsIgnoreCase("regionLevel")|| reportLevel.equalsIgnoreCase("all")){
		List<Region> regionList = Region.getAllRegions();
		Iterator<Region> regionItr = null;
		if(!regionList.isEmpty())
			regionItr = regionList.iterator();
%>
<div id="regionLevelReportDiv">
	<table border="0" width="100%" class="reportTable" style="border: 1px solid #2779aa" rules="all">
		<tr>
			<th colspan="7">				
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Appeal to Organization Head/ለተቋሙ የበላይ ኃላፊ የቀረቡ አቤቱታዎች/ቅሬታዎች ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
				G.C<br/>
				<%=(ethiopicStartMonthName+" "+ethStartDate+", "+ethStartYear +" - "+ ethiopicEndMonthName+" "+ethEndDate+", "+ethEndYear) %>
			</th>
		</tr>
		<tr>
			<th>Region<br/>ሪጅን</th>
			<th>Number of Appeal<br/>የአቤቱታዎች ብዛት</th>
			<th>Number of PR Rejected Decisions<br/>የህዝብ ግንኙነት ውሳኔ የተሻረበት የመረጃ ጥያቄ ብዛት</th>			
			<th>Number of PR Approved Decisions<br/>የህዝብ ግንኙነት ውሳኔ የጸደቀበት የመረጃ ጥያቄ ብዛት</th>
			<th>Number of PR Improved Decisions<br/>የህዝብ ግንኙነት ውሳኔ የተሸሻለበት የመረጃ ብዛት</th>
			<th>Decisions in Process<br/>በሂደት ላይ ያለ ውሳኔ ብዛት</th>			
			<th>Total<br/>በጠቅላላ</th>
		</tr>
	<%
		float regionNumberOfAppeals=0.0f;
		float regionNumberOfDecisionsRejectedByPublicRelation=0.0f;
		float regionNumberOfDecisionsApprovedByPublicRelation=0.0f;
		float regionNumberOfDecisionsImprovedByPublicRelation=0.0f;
		float regionNumberOfDecisionsInProgress=0.0f;		
		float regionTotal=0.0f;
		if (reportLevel.equalsIgnoreCase("all")) {
		while(regionItr.hasNext()){
			Region region = regionItr.next();
			float numberOfAppeals = ReportGenerator
					.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
							("tbl_appeal_to_organization_head", "number_of_appeal", 
									reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float numberOfDecisionsRejectedByPublicRelation = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_appeal_to_organization_head", "number_of_request_rejected_by_pr",
										reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float numberOfDecisionsApprovedByPublicRelation = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_appeal_to_organization_head", "number_of_request_approved_by_pr", 
										reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float numberOfDecisionsImprovedByPublicRelation = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_appeal_to_organization_head", "number_of_request_improved_by_pr",
										reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			float numberOfDecisionsInProgress = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
									("tbl_appeal_to_organization_head", "number_of_decision_in_progress",
											reportLevel, region.getId(), dateFrom, dateTo,reportSector);
			
			float sumTotal = numberOfAppeals+numberOfDecisionsRejectedByPublicRelation+
					numberOfDecisionsApprovedByPublicRelation+numberOfDecisionsImprovedByPublicRelation+
					numberOfDecisionsInProgress;			
			regionTotal += sumTotal;
			regionNumberOfAppeals += numberOfAppeals;
			regionNumberOfDecisionsRejectedByPublicRelation += numberOfDecisionsRejectedByPublicRelation;
			regionNumberOfDecisionsApprovedByPublicRelation += numberOfDecisionsApprovedByPublicRelation;
			regionNumberOfDecisionsImprovedByPublicRelation += numberOfDecisionsImprovedByPublicRelation;
			regionNumberOfDecisionsInProgress += numberOfDecisionsInProgress;
			%>
			<tr>
				<td><%=region.getRegionName() %></td>
				<td><%=numberOfAppeals %></td>
				<td><%=numberOfDecisionsRejectedByPublicRelation %></td>
				<td><%=numberOfDecisionsApprovedByPublicRelation %></td>
				<td><%=numberOfDecisionsImprovedByPublicRelation %></td>
				<td><%=numberOfDecisionsInProgress %></td>
				<td><%=sumTotal %></td>				
			</tr>
			<%
		}//end while loop
		}else{
			Region region = Region.getRegion(Integer.parseInt(reportRegion));
			float numberOfAppeals = ReportGenerator
			.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
					("tbl_appeal_to_organization_head", "number_of_appeal", 
							reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
	float numberOfDecisionsRejectedByPublicRelation = ReportGenerator
				.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
						("tbl_appeal_to_organization_head", "number_of_request_rejected_by_pr",
								reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
	float numberOfDecisionsApprovedByPublicRelation = ReportGenerator
				.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
						("tbl_appeal_to_organization_head", "number_of_request_approved_by_pr", 
								reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
	float numberOfDecisionsImprovedByPublicRelation = ReportGenerator
				.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
						("tbl_appeal_to_organization_head", "number_of_request_improved_by_pr",
								reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
	float numberOfDecisionsInProgress = ReportGenerator
				.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
							("tbl_appeal_to_organization_head", "number_of_decision_in_progress",
									reportLevel, Integer.parseInt(reportRegion), dateFrom, dateTo,reportSector);
	
	float sumTotal = numberOfAppeals+numberOfDecisionsRejectedByPublicRelation+
			numberOfDecisionsApprovedByPublicRelation+numberOfDecisionsImprovedByPublicRelation+
			numberOfDecisionsInProgress;			
	regionTotal += sumTotal;
	regionNumberOfAppeals += numberOfAppeals;
	regionNumberOfDecisionsRejectedByPublicRelation += numberOfDecisionsRejectedByPublicRelation;
	regionNumberOfDecisionsApprovedByPublicRelation += numberOfDecisionsApprovedByPublicRelation;
	regionNumberOfDecisionsImprovedByPublicRelation += numberOfDecisionsImprovedByPublicRelation;
	regionNumberOfDecisionsInProgress += numberOfDecisionsInProgress;
	%>
	<tr>
		<td><%=region.getRegionName() %></td>
		<td><%=numberOfAppeals %></td>
		<td><%=numberOfDecisionsRejectedByPublicRelation %></td>
		<td><%=numberOfDecisionsApprovedByPublicRelation %></td>
		<td><%=numberOfDecisionsImprovedByPublicRelation %></td>
		<td><%=numberOfDecisionsInProgress %></td>
		<td><%=sumTotal %></td>				
	</tr>
	<% 
		}
	%>
		<tr>
			<td>Total Sum/አጠቃላይ ድምር</td>
			<td><%=regionNumberOfAppeals %></td>
			<td><%=regionNumberOfDecisionsRejectedByPublicRelation %></td>
			<td><%=regionNumberOfDecisionsApprovedByPublicRelation %></td>
			<td><%=regionNumberOfDecisionsImprovedByPublicRelation %></td>
			<td><%=regionNumberOfDecisionsInProgress %></td>			
			<td><%=regionTotal %></td>			
		</tr>
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
			<th colspan="7">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Appeal to Organization Head/ለተቋሙ የበላይ ኃላፊ የቀረቡ አቤቱታዎች/ቅሬታዎች ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>Woreda<br/>ወረዳ</th>
			<th>Number of Appeal<br/>የአቤቱታዎች ብዛት</th>
			<th>Number of PR Rejected Decisions<br/>የህዝብ ግንኙነት ውሳኔ የተሻረበት የመረጃ ጥያቄ ብዛት</th>			
			<th>Number of PR Approved Decisions<br/>የህዝብ ግንኙነት ውሳኔ የጸደቀበት የመረጃ ጥያቄ ብዛት</th>
			<th>Number of PR Improved Decisions<br/>የህዝብ ግንኙነት ውሳኔ የተሸሻለበት የመረጃ ብዛት</th>
			<th>Decisions in Process<br/>በሂደት ላይ ያለ ውሳኔ ብዛት</th>			
			<th>Total<br/>በጠቅላላ</th>
		</tr>
	<%
		float woredaNumberOfAppeals=0.0f;
		float woredaNumberOfDecisionsRejectedByPublicRelation=0.0f;
		float woredaNumberOfDecisionsApprovedByPublicRelation=0.0f;
		float woredaNumberOfDecisionsImprovedByPublicRelation=0.0f;
		float woredaNumberOfDecisionsInProgress=0.0f;		
		float woredaTotal=0.0f;
		
		Woreda woreda = Woreda.getWoreda(Integer.parseInt(reportWoreda));
		
			float numberOfAppeals = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
									("tbl_appeal_to_organization_head", "number_of_appeal",
											reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float numberOfDecisionsRejectedByPublicRelation = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
									("tbl_appeal_to_organization_head", "number_of_request_rejected_by_pr", 
											reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float numberOfDecisionsApprovedByPublicRelation = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
									("tbl_appeal_to_organization_head", "number_of_request_approved_by_pr",
											reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float numberOfDecisionsImprovedByPublicRelation = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
								("tbl_appeal_to_organization_head", "number_of_request_improved_by_pr",
										reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			float numberOfDecisionsInProgress = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
									("tbl_appeal_to_organization_head", "number_of_decision_in_progress",
											reportLevel, Integer.parseInt(reportWoreda), dateFrom, dateTo,reportSector);
			
			float sumTotal = numberOfAppeals+numberOfDecisionsRejectedByPublicRelation+
					numberOfDecisionsApprovedByPublicRelation+numberOfDecisionsImprovedByPublicRelation+
					numberOfDecisionsInProgress;			
			woredaTotal += sumTotal;
			woredaNumberOfAppeals += numberOfAppeals;
			woredaNumberOfDecisionsRejectedByPublicRelation += numberOfDecisionsRejectedByPublicRelation;
			woredaNumberOfDecisionsApprovedByPublicRelation += numberOfDecisionsApprovedByPublicRelation;
			woredaNumberOfDecisionsImprovedByPublicRelation += numberOfDecisionsImprovedByPublicRelation;
			woredaNumberOfDecisionsInProgress += numberOfDecisionsInProgress;
			%>
			<tr>
				<td><%=woreda.getWoredaName() %></td>
				<td><%=numberOfAppeals %></td>
				<td><%=numberOfDecisionsRejectedByPublicRelation %></td>
				<td><%=numberOfDecisionsApprovedByPublicRelation %></td>
				<td><%=numberOfDecisionsImprovedByPublicRelation %></td>
				<td><%=numberOfDecisionsInProgress %></td>
				<td><%=sumTotal %></td>				
			</tr>
			
		<tr>
			<td>Total Sum/አጠቃላይ ድምር</td>
			<td><%=woredaNumberOfAppeals %></td>
			<td><%=woredaNumberOfDecisionsRejectedByPublicRelation %></td>
			<td><%=woredaNumberOfDecisionsApprovedByPublicRelation %></td>
			<td><%=woredaNumberOfDecisionsImprovedByPublicRelation %></td>
			<td><%=woredaNumberOfDecisionsInProgress %></td>			
			<td><%=woredaTotal %></td>			
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
			<th colspan="7">Appeal to Organization Head/ለተቋሙ የበላይ ኃላፊ የቀረቡ አቤቱታዎች/ቅሬታዎች ማጠቃለያ ሪፖርት</th>
		</tr>
		<tr>
			<th>Kebele<br/>ቀበሌ</th>
			<th>Number of Appeal<br/>የአቤቱታዎች ብዛት</th>
			<th>Number of PR Rejected Decisions<br/>የህዝብ ግንኙነት ውሳኔ የተሻረበት የመረጃ ጥያቄ ብዛት</th>			
			<th>Number of PR Approved Decisions<br/>የህዝብ ግንኙነት ውሳኔ የጸደቀበት የመረጃ ጥያቄ ብዛት</th>
			<th>Number of PR Improved Decisions<br/>የህዝብ ግንኙነት ውሳኔ የተሸሻለበት የመረጃ ብዛት</th>
			<th>Decisions in Process<br/>በሂደት ላይ ያለ ውሳኔ ብዛት</th>			
			<th>Total<br/>በጠቅላላ</th>
		</tr>
	<%
		float kebeleNumberOfAppeals=0.0f;
		float kebeleNumberOfDecisionsRejectedByPublicRelation=0.0f;
		float kebeleNumberOfDecisionsApprovedByPublicRelation=0.0f;
		float kebeleNumberOfDecisionsImprovedByPublicRelation=0.0f;
		float kebeleNumberOfDecisionsInProgress=0.0f;		
		float kebeleTotal=0.0f;
		
		Kebele kebele = Kebele.getKebele(Integer.parseInt(reportKebele));
			float numberOfAppeals = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
									("tbl_appeal_to_organization_head", "number_of_appeal", 
												reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float numberOfDecisionsRejectedByPublicRelation = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
									("tbl_appeal_to_organization_head", "number_of_request_rejected_by_pr",
												reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float numberOfDecisionsApprovedByPublicRelation = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
									("tbl_appeal_to_organization_head", "number_of_request_approved_by_pr",
											reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float numberOfDecisionsImprovedByPublicRelation = ReportGenerator
							.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
									("tbl_appeal_to_organization_head", "number_of_request_improved_by_pr",
												reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			float numberOfDecisionsInProgress = ReportGenerator
							.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
										("tbl_appeal_to_organization_head", "number_of_decision_in_progress", 
													reportLevel, Integer.parseInt(reportKebele), dateFrom, dateTo,reportSector);
			
			float sumTotal = numberOfAppeals+numberOfDecisionsRejectedByPublicRelation+
					numberOfDecisionsApprovedByPublicRelation+numberOfDecisionsImprovedByPublicRelation+
					numberOfDecisionsInProgress;			
			kebeleTotal += sumTotal;
			kebeleNumberOfAppeals += numberOfAppeals;
			kebeleNumberOfDecisionsRejectedByPublicRelation += numberOfDecisionsRejectedByPublicRelation;
			kebeleNumberOfDecisionsApprovedByPublicRelation += numberOfDecisionsApprovedByPublicRelation;
			kebeleNumberOfDecisionsImprovedByPublicRelation += numberOfDecisionsImprovedByPublicRelation;
			kebeleNumberOfDecisionsInProgress += numberOfDecisionsInProgress;
			%>
			<tr>
				<td><%=kebele.getKebeleName() %></td>
				<td><%=numberOfAppeals %></td>
				<td><%=numberOfDecisionsRejectedByPublicRelation %></td>
				<td><%=numberOfDecisionsApprovedByPublicRelation %></td>
				<td><%=numberOfDecisionsImprovedByPublicRelation %></td>
				<td><%=numberOfDecisionsInProgress %></td>
				<td><%=sumTotal %></td>				
			</tr>
			
		<tr>
			<td>Total Sum/አጠቃላይ ድምር</td>
			<td><%=kebeleNumberOfAppeals %></td>
			<td><%=kebeleNumberOfDecisionsRejectedByPublicRelation %></td>
			<td><%=kebeleNumberOfDecisionsApprovedByPublicRelation %></td>
			<td><%=kebeleNumberOfDecisionsImprovedByPublicRelation %></td>
			<td><%=kebeleNumberOfDecisionsInProgress %></td>			
			<td><%=kebeleTotal %></td>			
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
			<th colspan="7">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Appeal to Organization Head/ለተቋሙ የበላይ ኃላፊ የቀረቡ አቤቱታዎች/ቅሬታዎች ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>Zone<br/>ዞን</th>
			<th>Number of Appeal<br/>የአቤቱታዎች ብዛት</th>
			<th>Number of PR Rejected Decisions<br/>የህዝብ ግንኙነት ውሳኔ የተሻረበት የመረጃ ጥያቄ ብዛት</th>			
			<th>Number of PR Approved Decisions<br/>የህዝብ ግንኙነት ውሳኔ የጸደቀበት የመረጃ ጥያቄ ብዛት</th>
			<th>Number of PR Improved Decisions<br/>የህዝብ ግንኙነት ውሳኔ የተሸሻለበት የመረጃ ብዛት</th>
			<th>Decisions in Process<br/>በሂደት ላይ ያለ ውሳኔ ብዛት</th>			
			<th>Total<br/>በጠቅላላ</th>
		</tr>
	<%
		float zoneNumberOfAppeals=0.0f;
		float zoneNumberOfDecisionsRejectedByPublicRelation=0.0f;
		float zoneNumberOfDecisionsApprovedByPublicRelation=0.0f;
		float zoneNumberOfDecisionsImprovedByPublicRelation=0.0f;
		float zoneNumberOfDecisionsInProgress=0.0f;		
		float zoneTotal=0.0f;
		
		Zone zone = Zone.getZone(Integer.parseInt(reportZone));
		
			float numberOfAppeals = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
										("tbl_appeal_to_organization_head", "number_of_appeal",
													reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
			float numberOfDecisionsRejectedByPublicRelation = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
									("tbl_appeal_to_organization_head", "number_of_request_rejected_by_pr",
													reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
			float numberOfDecisionsApprovedByPublicRelation = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
									("tbl_appeal_to_organization_head", "number_of_request_approved_by_pr",
													reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
			float numberOfDecisionsImprovedByPublicRelation = ReportGenerator
						.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
									("tbl_appeal_to_organization_head", "number_of_request_improved_by_pr", 
													reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
			float numberOfDecisionsInProgress = ReportGenerator
							.getReportSumDataForTableFieldOnThisLevelSelectedValueDuring
										("tbl_appeal_to_organization_head", "number_of_decision_in_progress",
													reportLevel, Integer.parseInt(reportZone), dateFrom, dateTo,reportSector);
			
			float sumTotal = numberOfAppeals+numberOfDecisionsRejectedByPublicRelation+
					numberOfDecisionsApprovedByPublicRelation+numberOfDecisionsImprovedByPublicRelation+
					numberOfDecisionsInProgress;			
			zoneTotal += sumTotal;
			zoneNumberOfAppeals += numberOfAppeals;
			zoneNumberOfDecisionsRejectedByPublicRelation += numberOfDecisionsRejectedByPublicRelation;
			zoneNumberOfDecisionsApprovedByPublicRelation += numberOfDecisionsApprovedByPublicRelation;
			zoneNumberOfDecisionsImprovedByPublicRelation += numberOfDecisionsImprovedByPublicRelation;
			zoneNumberOfDecisionsInProgress += numberOfDecisionsInProgress;
			%>
			<tr>
				<td><%=zone.getZoneName() %></td>
				<td><%=numberOfAppeals %></td>
				<td><%=numberOfDecisionsRejectedByPublicRelation %></td>
				<td><%=numberOfDecisionsApprovedByPublicRelation %></td>
				<td><%=numberOfDecisionsImprovedByPublicRelation %></td>
				<td><%=numberOfDecisionsInProgress %></td>
				<td><%=sumTotal %></td>				
			</tr>
			
		<tr>
			<td>Total Sum/አጠቃላይ ድምር</td>
			<td><%=zoneNumberOfAppeals %></td>
			<td><%=zoneNumberOfDecisionsRejectedByPublicRelation %></td>
			<td><%=zoneNumberOfDecisionsApprovedByPublicRelation %></td>
			<td><%=zoneNumberOfDecisionsImprovedByPublicRelation %></td>
			<td><%=zoneNumberOfDecisionsInProgress %></td>			
			<td><%=zoneTotal %></td>			
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