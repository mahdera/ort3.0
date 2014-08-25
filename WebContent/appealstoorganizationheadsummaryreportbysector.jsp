<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.Date" %>
<%@page import="java.util.*" %>
<%@page import="com.signetitsolutions.ort.server.classes.*" %>
<div id="printReportDiv">
<%
	int selectedTerritoryId = Integer.parseInt(request.getParameter("selectedTerritoryId"));
	String reportLevel = request.getParameter("reportLevel");
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

	if(reportLevel.equalsIgnoreCase("regionLevel")){
		List<Region> regionList = Region.getAllRegions();
		Iterator<Region> regionItr = null;
		if(!regionList.isEmpty())
			regionItr = regionList.iterator();
%>
<div id="regionLevelReportDiv">
	<table border="0" width="100%" class="reportTable" style="border: 1px solid #2779aa" rules="all">
	<%
		List<GovernmentSectorOrganization> sectorOrganizationList = GovernmentSectorOrganization.getAllGovernmentSectorOrganizationsLocatedInThisTerritory("region_id",selectedTerritoryId);
		Iterator<GovernmentSectorOrganization> sectorOrganizationItr = null;
		if(!sectorOrganizationList.isEmpty())
		sectorOrganizationItr = sectorOrganizationList.iterator();
		if(sectorOrganizationItr != null){
	%>
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
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
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
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float numberOfAppeals = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_organization_head", "number_of_appeal", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsRejectedByPublicRelation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_organization_head", "number_of_request_rejected_by_pr", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsApprovedByPublicRelation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_organization_head", "number_of_request_approved_by_pr", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsImprovedByPublicRelation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_organization_head", "number_of_request_improved_by_pr", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsInProgress = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_organization_head", "number_of_decision_in_progress", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
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
				<td><%=organization.getOrganizationName() %></td>
				<td><%=numberOfAppeals %></td>
				<td><%=numberOfDecisionsRejectedByPublicRelation %></td>
				<td><%=numberOfDecisionsApprovedByPublicRelation %></td>
				<td><%=numberOfDecisionsImprovedByPublicRelation %></td>
				<td><%=numberOfDecisionsInProgress %></td>
				<td><%=sumTotal %></td>				
			</tr>
			<%
		}//end while loop
	%>
		<tr>
			<td>አጠቃላይ ድምር</td>
			<td><%=regionNumberOfAppeals %></td>
			<td><%=regionNumberOfDecisionsRejectedByPublicRelation %></td>
			<td><%=regionNumberOfDecisionsApprovedByPublicRelation %></td>
			<td><%=regionNumberOfDecisionsImprovedByPublicRelation %></td>
			<td><%=regionNumberOfDecisionsInProgress %></td>			
			<td><%=regionTotal %></td>			
		</tr>
	<%
		}else{
			out.print("<div class='message warning'><h5>ማሳሰቢያ!</h5><p>ምንም የተገኝ ዳታ የለም!</p></div>");
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
	<%
		List<GovernmentSectorOrganization> sectorOrganizationList = GovernmentSectorOrganization.getAllGovernmentSectorOrganizationsLocatedInThisTerritory("woreda_id",selectedTerritoryId);
		Iterator<GovernmentSectorOrganization> sectorOrganizationItr = null;
		if(!sectorOrganizationList.isEmpty())
		sectorOrganizationItr = sectorOrganizationList.iterator();
		if(sectorOrganizationItr != null){
	%>
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
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
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
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float numberOfAppeals = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_organization_head", "number_of_appeal", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsRejectedByPublicRelation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_organization_head", "number_of_request_rejected_by_pr", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsApprovedByPublicRelation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_organization_head", "number_of_request_approved_by_pr", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsImprovedByPublicRelation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_organization_head", "number_of_request_improved_by_pr", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsInProgress = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_organization_head", "number_of_decision_in_progress", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
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
				<td><%=organization.getOrganizationName() %></td>
				<td><%=numberOfAppeals %></td>
				<td><%=numberOfDecisionsRejectedByPublicRelation %></td>
				<td><%=numberOfDecisionsApprovedByPublicRelation %></td>
				<td><%=numberOfDecisionsImprovedByPublicRelation %></td>
				<td><%=numberOfDecisionsInProgress %></td>
				<td><%=sumTotal %></td>				
			</tr>
			<%
		}//end while loop
	%>
		<tr>
			<td>አጠቃላይ ድምር</td>
			<td><%=woredaNumberOfAppeals %></td>
			<td><%=woredaNumberOfDecisionsRejectedByPublicRelation %></td>
			<td><%=woredaNumberOfDecisionsApprovedByPublicRelation %></td>
			<td><%=woredaNumberOfDecisionsImprovedByPublicRelation %></td>
			<td><%=woredaNumberOfDecisionsInProgress %></td>			
			<td><%=woredaTotal %></td>			
		</tr>
	<%
		}else{
			out.print("<div class='message warning'><h5>ማሳሰቢያ!</h5><p>ምንም የተገኝ ዳታ የለም!</p></div>");
		}
	%>
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
	<%
		List<GovernmentSectorOrganization> sectorOrganizationList = GovernmentSectorOrganization.getAllGovernmentSectorOrganizationsLocatedInThisTerritory("kebele_id",selectedTerritoryId);
		Iterator<GovernmentSectorOrganization> sectorOrganizationItr = null;
		if(!sectorOrganizationList.isEmpty())
		sectorOrganizationItr = sectorOrganizationList.iterator();
		if(sectorOrganizationItr != null){
	%>
		<tr>
			<th colspan="7">ለተቋሙ የበላይ ኃላፊ የቀረቡ አቤቱታዎች/ቅሬታዎች ማጠቃለያ ሪፖርት</th>
		</tr>
		<tr>
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
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
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float numberOfAppeals = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_organization_head", "number_of_appeal", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsRejectedByPublicRelation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_organization_head", "number_of_request_rejected_by_pr", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsApprovedByPublicRelation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_organization_head", "number_of_request_approved_by_pr", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsImprovedByPublicRelation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_organization_head", "number_of_request_improved_by_pr", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsInProgress = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_organization_head", "number_of_decision_in_progress", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
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
				<td><%=organization.getOrganizationName() %></td>
				<td><%=numberOfAppeals %></td>
				<td><%=numberOfDecisionsRejectedByPublicRelation %></td>
				<td><%=numberOfDecisionsApprovedByPublicRelation %></td>
				<td><%=numberOfDecisionsImprovedByPublicRelation %></td>
				<td><%=numberOfDecisionsInProgress %></td>
				<td><%=sumTotal %></td>				
			</tr>
			<%
		}//end while loop
	%>
		<tr>
			<td>አጠቃላይ ድምር</td>
			<td><%=kebeleNumberOfAppeals %></td>
			<td><%=kebeleNumberOfDecisionsRejectedByPublicRelation %></td>
			<td><%=kebeleNumberOfDecisionsApprovedByPublicRelation %></td>
			<td><%=kebeleNumberOfDecisionsImprovedByPublicRelation %></td>
			<td><%=kebeleNumberOfDecisionsInProgress %></td>			
			<td><%=kebeleTotal %></td>			
		</tr>
	<%
		}else{
			out.print("<div class='message warning'><h5>ማሳሰቢያ!</h5><p>ምንም የተገኝ ዳታ የለም!</p></div>");
		}
	%>
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
	<%
		List<GovernmentSectorOrganization> sectorOrganizationList = GovernmentSectorOrganization.getAllGovernmentSectorOrganizationsLocatedInThisTerritory("zone_id",selectedTerritoryId);
		Iterator<GovernmentSectorOrganization> sectorOrganizationItr = null;
		if(!sectorOrganizationList.isEmpty())
		sectorOrganizationItr = sectorOrganizationList.iterator();
		if(sectorOrganizationItr != null){
	%>
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
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
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
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float numberOfAppeals = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_organization_head", "number_of_appeal", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsRejectedByPublicRelation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_organization_head", "number_of_request_rejected_by_pr", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsApprovedByPublicRelation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_organization_head", "number_of_request_approved_by_pr", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsImprovedByPublicRelation = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_organization_head", "number_of_request_improved_by_pr", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsInProgress = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_organization_head", "number_of_decision_in_progress", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
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
				<td><%=organization.getOrganizationName() %></td>
				<td><%=numberOfAppeals %></td>
				<td><%=numberOfDecisionsRejectedByPublicRelation %></td>
				<td><%=numberOfDecisionsApprovedByPublicRelation %></td>
				<td><%=numberOfDecisionsImprovedByPublicRelation %></td>
				<td><%=numberOfDecisionsInProgress %></td>
				<td><%=sumTotal %></td>				
			</tr>
			<%
		}//end while loop
	%>
		<tr>
			<td>አጠቃላይ ድምር</td>
			<td><%=zoneNumberOfAppeals %></td>
			<td><%=zoneNumberOfDecisionsRejectedByPublicRelation %></td>
			<td><%=zoneNumberOfDecisionsApprovedByPublicRelation %></td>
			<td><%=zoneNumberOfDecisionsImprovedByPublicRelation %></td>
			<td><%=zoneNumberOfDecisionsInProgress %></td>			
			<td><%=zoneTotal %></td>			
		</tr>
	<%
		}else{
			out.print("<div class='message warning'><h5>ማሳሰቢያ!</h5><p>ምንም የተገኝ ዳታ የለም!</p></div>");
		}
	%>
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