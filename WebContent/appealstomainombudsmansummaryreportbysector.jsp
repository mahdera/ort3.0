<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.Date" %>
<%@page import="com.signetitsolutions.ort.server.classes.*" %>
<%@page import="java.util.*" %>
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
	<table border="0" width="100%" style="border: 1px solid #2779aa" rules="all">
	<%
		List<GovernmentSectorOrganization> sectorOrganizationList = GovernmentSectorOrganization.getAllGovernmentSectorOrganizationsLocatedInThisTerritory("region_id",selectedTerritoryId);
		Iterator<GovernmentSectorOrganization> sectorOrganizationItr = null;
		if(!sectorOrganizationList.isEmpty())
		sectorOrganizationItr = sectorOrganizationList.iterator();
		if(sectorOrganizationItr != null){
	%>
		<tr>
			<th colspan="9">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Appeal to Main Ombudsman Office/ለዋና ዕንባ ጠባቂ የቀረቡ አስተዳደራዊ ይግባኞች ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
				G.C<br/>
					<%=(ethiopicStartMonthName+" "+ethStartDate+", "+ethStartYear +" - "+ ethiopicEndMonthName+" "+ethEndDate+", "+ethEndYear) %>
			</th>
		</tr>
		<tr>
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
			<th>Number of Appeal<br/>የአስተዳደራዊ ይግባኞች ብዛት</th>
			<th>Number of Decision Rejected by Organization Head<br/>የተቋሙ የበላይ ኃላፊ ውሳኔ የተሻረበት ይግባኝ ብዛት</th>
			<th>Number of Decisions Approved by Organization Head<br/>የተቋሙ የበላይ ኃላፊ ውሳኔ የጸደቀበት ይግባኝ ብዛት</th>
			<th>Number of Decisions Improved by Organization Head<br/>የተቋሙ የበላይ ኃላፊ ውሳኔ የተሸሻለበት ይግባኝ ብዛት</th>
			<th>Number of Decisions in Progress<br/>በሂደት ላይ ያለ የይግባኝ ውሳኔ ብዛት</th>			
			<th>Total<br/>በጠቅላላ</th>
		</tr>
	<%
		float regionNumberOfAppeals=0.0f;
		float regionNumberOfDecisionsRejectedByOrganizationHead=0.0f;
		float regionNumberOfDecisionsApprovedByOrganizationHead=0.0f;
		float regionNumberOfDecisionsImprovedByOrganizationHead=0.0f;
		float regionNumberOfDecisionsInProgress=0.0f;		
		float regionTotal=0.0f;
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float numberOfAppeals = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_main_ombudsman", "number_of_appeal", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsRejectedByOrganizationHead = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_main_ombudsman", "number_of_request_rejected_by_head", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsApprovedByOrganizationHead = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_main_ombudsman", "number_of_request_approved_by_head", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsImprovedByOrganizationHead = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_main_ombudsman", "number_of_request_improved_by_head", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsInProgress = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_main_ombudsman", "number_of_decision_in_progress", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());			
			float sumTotal = numberOfAppeals+numberOfDecisionsRejectedByOrganizationHead+
					numberOfDecisionsApprovedByOrganizationHead+numberOfDecisionsImprovedByOrganizationHead+numberOfDecisionsInProgress;
			
			regionNumberOfAppeals += numberOfAppeals;
			regionNumberOfDecisionsRejectedByOrganizationHead += numberOfDecisionsRejectedByOrganizationHead;
			regionNumberOfDecisionsApprovedByOrganizationHead += numberOfDecisionsApprovedByOrganizationHead;
			regionNumberOfDecisionsImprovedByOrganizationHead += numberOfDecisionsImprovedByOrganizationHead;
			regionNumberOfDecisionsInProgress += numberOfDecisionsInProgress;			
			regionTotal += sumTotal;
			%>
			<tr>
				<td><%=organization.getOrganizationName() %></td>
				<td><%=numberOfAppeals %></td>
				<td><%=numberOfDecisionsRejectedByOrganizationHead %></td>
				<td><%=numberOfDecisionsApprovedByOrganizationHead %></td>
				<td><%=numberOfDecisionsImprovedByOrganizationHead %></td>
				<td><%=numberOfDecisionsInProgress %></td>								
				<td><%=sumTotal %></td>
			</tr>
			<%
		}//end while loop
	%>
		<tr>
			<td>አጠቃላይ ድምር</td>
			<td><%=regionNumberOfAppeals %></td>
			<td><%=regionNumberOfDecisionsRejectedByOrganizationHead %></td>
			<td><%=regionNumberOfDecisionsApprovedByOrganizationHead %></td>
			<td><%=regionNumberOfDecisionsImprovedByOrganizationHead %></td>
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
	<table border="0" width="100%" style="border: 1px solid #2779aa" rules="all">
	<%
		List<GovernmentSectorOrganization> sectorOrganizationList = GovernmentSectorOrganization.getAllGovernmentSectorOrganizationsLocatedInThisTerritory("woreda_id",selectedTerritoryId);
		Iterator<GovernmentSectorOrganization> sectorOrganizationItr = null;
		if(!sectorOrganizationList.isEmpty())
		sectorOrganizationItr = sectorOrganizationList.iterator();
		if(sectorOrganizationItr != null){
	%>
		<tr>
			<th colspan="9">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Appeal to Main Ombudsman Office/ለዋና ዕንባ ጠባቂ የቀረቡ አስተዳደራዊ ይግባኞች ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
			<th>Number of Appeal<br/>የአስተዳደራዊ ይግባኞች ብዛት</th>
			<th>Number of Decision Rejected by Organization Head<br/>የተቋሙ የበላይ ኃላፊ ውሳኔ የተሻረበት ይግባኝ ብዛት</th>
			<th>Number of Decisions Approved by Organization Head<br/>የተቋሙ የበላይ ኃላፊ ውሳኔ የጸደቀበት ይግባኝ ብዛት</th>
			<th>Number of Decisions Improved by Organization Head<br/>የተቋሙ የበላይ ኃላፊ ውሳኔ የተሸሻለበት ይግባኝ ብዛት</th>
			<th>Number of Decisions in Progress<br/>በሂደት ላይ ያለ የይግባኝ ውሳኔ ብዛት</th>			
			<th>Total<br/>በጠቅላላ</th>
		</tr>
	<%
		float woredaNumberOfAppeals=0.0f;
		float woredaNumberOfDecisionsRejectedByOrganizationHead=0.0f;
		float woredaNumberOfDecisionsApprovedByOrganizationHead=0.0f;
		float woredaNumberOfDecisionsImprovedByOrganizationHead=0.0f;
		float woredaNumberOfDecisionsInProgress=0.0f;		
		float woredaTotal=0.0f;
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float numberOfAppeals = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_main_ombudsman", "number_of_appeal", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsRejectedByOrganizationHead = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_main_ombudsman", "number_of_request_rejected_by_head", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsApprovedByOrganizationHead = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_main_ombudsman", "number_of_request_approved_by_head", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsImprovedByOrganizationHead = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_main_ombudsman", "number_of_request_improved_by_head", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsInProgress = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_main_ombudsman", "number_of_decision_in_progress", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());			
			float sumTotal = numberOfAppeals+numberOfDecisionsRejectedByOrganizationHead+
					numberOfDecisionsApprovedByOrganizationHead+numberOfDecisionsImprovedByOrganizationHead+numberOfDecisionsInProgress;
			
			woredaNumberOfAppeals += numberOfAppeals;
			woredaNumberOfDecisionsRejectedByOrganizationHead += numberOfDecisionsRejectedByOrganizationHead;
			woredaNumberOfDecisionsApprovedByOrganizationHead += numberOfDecisionsApprovedByOrganizationHead;
			woredaNumberOfDecisionsImprovedByOrganizationHead += numberOfDecisionsImprovedByOrganizationHead;
			woredaNumberOfDecisionsInProgress += numberOfDecisionsInProgress;			
			woredaTotal += sumTotal;
			%>
			<tr>
				<td><%=organization.getOrganizationName() %></td>
				<td><%=numberOfAppeals %></td>
				<td><%=numberOfDecisionsRejectedByOrganizationHead %></td>
				<td><%=numberOfDecisionsApprovedByOrganizationHead %></td>
				<td><%=numberOfDecisionsImprovedByOrganizationHead %></td>
				<td><%=numberOfDecisionsInProgress %></td>								
				<td><%=sumTotal %></td>
			</tr>
			<%
		}//end while loop
	%>
		<tr>
			<td>አጠቃላይ ድምር</td>
			<td><%=woredaNumberOfAppeals %></td>
			<td><%=woredaNumberOfDecisionsRejectedByOrganizationHead %></td>
			<td><%=woredaNumberOfDecisionsApprovedByOrganizationHead %></td>
			<td><%=woredaNumberOfDecisionsImprovedByOrganizationHead %></td>
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
	<table border="0" width="100%" style="border: 1px solid #2779aa" rules="all">
	<%
		List<GovernmentSectorOrganization> sectorOrganizationList = GovernmentSectorOrganization.getAllGovernmentSectorOrganizationsLocatedInThisTerritory("kebele_id",selectedTerritoryId);
		Iterator<GovernmentSectorOrganization> sectorOrganizationItr = null;
		if(!sectorOrganizationList.isEmpty())
		sectorOrganizationItr = sectorOrganizationList.iterator();
		if(sectorOrganizationItr != null){
	%>
		<tr>
			<th colspan="9">ለዋና ዕንባ ጠባቂ የቀረቡ አስተዳደራዊ ይግባኞች ማጠቃለያ ሪፖርት</th>
		</tr>
		<tr>
			<th>ሴክተር መሥሪያ ቤት</th>
			<th>የአስተዳደራዊ ይግባኞች ብዛት</th>
			<th>የተቋሙ የበላይ ኃላፊ ውሳኔ የተሻረበት ይግባኝ ብዛት</th>
			<th>የተቋሙ የበላይ ኃላፊ ውሳኔ የጸደቀበት ይግባኝ ብዛት</th>
			<th>የተቋሙ የበላይ ኃላፊ ውሳኔ የተሸሻለበት ይግባኝ ብዛት</th>
			<th>በሂደት ላይ ያለ የይግባኝ ውሳኔ ብዛት</th>			
			<th>በጠቅላላ</th>
		</tr>
	<%
		float kebeleNumberOfAppeals=0.0f;
		float kebeleNumberOfDecisionsRejectedByOrganizationHead=0.0f;
		float kebeleNumberOfDecisionsApprovedByOrganizationHead=0.0f;
		float kebeleNumberOfDecisionsImprovedByOrganizationHead=0.0f;
		float kebeleNumberOfDecisionsInProgress=0.0f;		
		float kebeleTotal=0.0f;
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float numberOfAppeals = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_main_ombudsman", "number_of_appeal", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsRejectedByOrganizationHead = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_main_ombudsman", "number_of_request_rejected_by_head", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsApprovedByOrganizationHead = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_main_ombudsman", "number_of_request_approved_by_head", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsImprovedByOrganizationHead = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_main_ombudsman", "number_of_request_improved_by_head", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsInProgress = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_main_ombudsman", "number_of_decision_in_progress", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());			
			float sumTotal = numberOfAppeals+numberOfDecisionsRejectedByOrganizationHead+
					numberOfDecisionsApprovedByOrganizationHead+numberOfDecisionsImprovedByOrganizationHead+numberOfDecisionsInProgress;
			
			kebeleNumberOfAppeals += numberOfAppeals;
			kebeleNumberOfDecisionsRejectedByOrganizationHead += numberOfDecisionsRejectedByOrganizationHead;
			kebeleNumberOfDecisionsApprovedByOrganizationHead += numberOfDecisionsApprovedByOrganizationHead;
			kebeleNumberOfDecisionsImprovedByOrganizationHead += numberOfDecisionsImprovedByOrganizationHead;
			kebeleNumberOfDecisionsInProgress += numberOfDecisionsInProgress;			
			kebeleTotal += sumTotal;
			%>
			<tr>
				<td><%=organization.getOrganizationName() %></td>
				<td><%=numberOfAppeals %></td>
				<td><%=numberOfDecisionsRejectedByOrganizationHead %></td>
				<td><%=numberOfDecisionsApprovedByOrganizationHead %></td>
				<td><%=numberOfDecisionsImprovedByOrganizationHead %></td>
				<td><%=numberOfDecisionsInProgress %></td>								
				<td><%=sumTotal %></td>
			</tr>
			<%
		}//end while loop
	%>
		<tr>
			<td>አጠቃላይ ድምር</td>
			<td><%=kebeleNumberOfAppeals %></td>
			<td><%=kebeleNumberOfDecisionsRejectedByOrganizationHead %></td>
			<td><%=kebeleNumberOfDecisionsApprovedByOrganizationHead %></td>
			<td><%=kebeleNumberOfDecisionsImprovedByOrganizationHead %></td>
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
	<table border="0" width="100%" style="border: 1px solid #2779aa" rules="all">
	<%
		List<GovernmentSectorOrganization> sectorOrganizationList = GovernmentSectorOrganization.getAllGovernmentSectorOrganizationsLocatedInThisTerritory("zone_id",selectedTerritoryId);
		Iterator<GovernmentSectorOrganization> sectorOrganizationItr = null;
		if(!sectorOrganizationList.isEmpty())
		sectorOrganizationItr = sectorOrganizationList.iterator();
		if(sectorOrganizationItr != null){
	%>
		<tr>
			<th colspan="9">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Appeal to Main Ombudsman Office/ለዋና ዕንባ ጠባቂ የቀረቡ አስተዳደራዊ ይግባኞች ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
			<th>Number of Appeal<br/>የአስተዳደራዊ ይግባኞች ብዛት</th>
			<th>Number of Decision Rejected by Organization Head<br/>የተቋሙ የበላይ ኃላፊ ውሳኔ የተሻረበት ይግባኝ ብዛት</th>
			<th>Number of Decisions Approved by Organization Head<br/>የተቋሙ የበላይ ኃላፊ ውሳኔ የጸደቀበት ይግባኝ ብዛት</th>
			<th>Number of Decisions Improved by Organization Head<br/>የተቋሙ የበላይ ኃላፊ ውሳኔ የተሸሻለበት ይግባኝ ብዛት</th>
			<th>Number of Decisions in Progress<br/>በሂደት ላይ ያለ የይግባኝ ውሳኔ ብዛት</th>			
			<th>Total<br/>በጠቅላላ</th>
		</tr>
	<%
		float zoneNumberOfAppeals=0.0f;
		float zoneNumberOfDecisionsRejectedByOrganizationHead=0.0f;
		float zoneNumberOfDecisionsApprovedByOrganizationHead=0.0f;
		float zoneNumberOfDecisionsImprovedByOrganizationHead=0.0f;
		float zoneNumberOfDecisionsInProgress=0.0f;		
		float zoneTotal=0.0f;
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float numberOfAppeals = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_main_ombudsman", "number_of_appeal", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsRejectedByOrganizationHead = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_main_ombudsman", "number_of_request_rejected_by_head", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsApprovedByOrganizationHead = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_main_ombudsman", "number_of_request_approved_by_head", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsImprovedByOrganizationHead = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_main_ombudsman", "number_of_request_improved_by_head", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfDecisionsInProgress = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_main_ombudsman", "number_of_decision_in_progress", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());			
			float sumTotal = numberOfAppeals+numberOfDecisionsRejectedByOrganizationHead+
					numberOfDecisionsApprovedByOrganizationHead+numberOfDecisionsImprovedByOrganizationHead+numberOfDecisionsInProgress;
			
			zoneNumberOfAppeals += numberOfAppeals;
			zoneNumberOfDecisionsRejectedByOrganizationHead += numberOfDecisionsRejectedByOrganizationHead;
			zoneNumberOfDecisionsApprovedByOrganizationHead += numberOfDecisionsApprovedByOrganizationHead;
			zoneNumberOfDecisionsImprovedByOrganizationHead += numberOfDecisionsImprovedByOrganizationHead;
			zoneNumberOfDecisionsInProgress += numberOfDecisionsInProgress;			
			zoneTotal += sumTotal;
			%>
			<tr>
				<td><%=organization.getOrganizationName() %></td>
				<td><%=numberOfAppeals %></td>
				<td><%=numberOfDecisionsRejectedByOrganizationHead %></td>
				<td><%=numberOfDecisionsApprovedByOrganizationHead %></td>
				<td><%=numberOfDecisionsImprovedByOrganizationHead %></td>
				<td><%=numberOfDecisionsInProgress %></td>								
				<td><%=sumTotal %></td>
			</tr>
			<%
		}//end while loop
	%>
		<tr>
			<td>አጠቃላይ ድምር</td>
			<td><%=zoneNumberOfAppeals %></td>
			<td><%=zoneNumberOfDecisionsRejectedByOrganizationHead %></td>
			<td><%=zoneNumberOfDecisionsApprovedByOrganizationHead %></td>
			<td><%=zoneNumberOfDecisionsImprovedByOrganizationHead %></td>
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