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
			<th colspan="8">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Appeal to Court Summary Report/ለፍርድ ቤት የቀረቡ ይግባኞች ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
				G.C<br/>
					<%=(ethiopicStartMonthName+" "+ethStartDate+", "+ethStartYear +" - "+ ethiopicEndMonthName+" "+ethEndDate+", "+ethEndYear) %>
			</th>
		</tr>
		<tr>
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
			<th>Verdict Rejecting Previous Decision(Government Body)/በመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በመሻር የተፈረደ ፍርድ ብዛት</th>
			<th>Verdict Approving Previous Decision(Government Body)/በመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማጽደቅ የተፈረደ ፍርድ ብዛት</th>
			<th>Verdict Improving Previous Decision(Government Body)/በመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማሻሻል የተፈረደ ፍርድ ብዛት</th>
			<th>Verdict Rejecting Previous Decision(Information Requesters)/በመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በመሻር የተፈረደ ፍርድ ብዛት</th>
			<th>Verdict Approving Previous Decision(Information Requesters)/በመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማጽደቅ የተፈረደ ፍርድ ብዛት</th>
			<th>Verdict Improving Previous Decision(Information Requesters)/በመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማሻሻል የተፈረደ ፍርድ ብዛት</th>			
			<th>Total/በጠቅላላ</th>
		</tr>
	<%
		float regionNumberOfVerdictRejectingPreviousDecisionByGovBody=0.0f;
		float regionNumberOfVerdictApprovingPreviousDecisionByGovBody=0.0f;
		float regionNumberOfVerdictImprovingPreviousDecisionByGovBody=0.0f;
		float regionNumberOfVerdictRejectingPreviousDecisionByInfoRequesters=0.0f;
		float regionNumberOfVerdictApprovingPreviousDecisionByInfoRequesters=0.0f;
		float regionNumberOfVerdictImprovingPreviousDecisionByInfoRequesters=0.0f;
		float regionTotal=0.0f;
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float numberOfVerdictRejectingPreviousDecisionByGovBody = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "gov_body_number_of_decision_rejecting_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfVerdictApprovingPreviousDecisionByGovBody = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "gov_body_number_of_decision_approving_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfVerdictImprovingPreviousDecisionByGovBody = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "gov_body_number_of_decision_improving_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfVerdictRejectingPreviousDecisionByInfoRequesters = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "info_requester_number_of_decision_rejecting_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfVerdictApprovingPreviousDecisionByInfoRequesters = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "info_requester_number_of_decision_approving_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfVerdictImprovingPreviousDecisionByInfoRequesters = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "info_requester_number_of_decision_improving_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float sumTotal = numberOfVerdictRejectingPreviousDecisionByGovBody + numberOfVerdictApprovingPreviousDecisionByGovBody +
					numberOfVerdictImprovingPreviousDecisionByGovBody + numberOfVerdictRejectingPreviousDecisionByInfoRequesters + numberOfVerdictApprovingPreviousDecisionByInfoRequesters +
					numberOfVerdictImprovingPreviousDecisionByInfoRequesters;
			
			regionNumberOfVerdictRejectingPreviousDecisionByGovBody += numberOfVerdictRejectingPreviousDecisionByGovBody;
			regionNumberOfVerdictApprovingPreviousDecisionByGovBody += numberOfVerdictApprovingPreviousDecisionByGovBody;
			regionNumberOfVerdictImprovingPreviousDecisionByGovBody += numberOfVerdictImprovingPreviousDecisionByGovBody;
			regionNumberOfVerdictRejectingPreviousDecisionByInfoRequesters += numberOfVerdictRejectingPreviousDecisionByInfoRequesters;
			regionNumberOfVerdictApprovingPreviousDecisionByInfoRequesters += numberOfVerdictApprovingPreviousDecisionByInfoRequesters;
			regionNumberOfVerdictImprovingPreviousDecisionByInfoRequesters += numberOfVerdictImprovingPreviousDecisionByInfoRequesters;
			regionTotal += sumTotal;
			%>
			<tr>
				<td><%=organization.getOrganizationName() %></td>
				<td><%=numberOfVerdictRejectingPreviousDecisionByGovBody %></td>
				<td><%=numberOfVerdictApprovingPreviousDecisionByGovBody %></td>
				<td><%=numberOfVerdictImprovingPreviousDecisionByGovBody %></td>
				<td><%=numberOfVerdictRejectingPreviousDecisionByInfoRequesters %></td>
				<td><%=numberOfVerdictApprovingPreviousDecisionByInfoRequesters %></td>	
				<td><%=numberOfVerdictImprovingPreviousDecisionByInfoRequesters %></td>							
				<td><%=sumTotal %></td>
			</tr>
			<%
		}//end while loop
	%>
		<tr>
			<td>አጠቃላይ ድምር</td>
			<td><%=regionNumberOfVerdictRejectingPreviousDecisionByGovBody %></td>
			<td><%=regionNumberOfVerdictApprovingPreviousDecisionByGovBody %></td>
			<td><%=regionNumberOfVerdictImprovingPreviousDecisionByGovBody %></td>
			<td><%=regionNumberOfVerdictRejectingPreviousDecisionByInfoRequesters %></td>
			<td><%=regionNumberOfVerdictApprovingPreviousDecisionByInfoRequesters %></td>
			<td><%=regionNumberOfVerdictImprovingPreviousDecisionByInfoRequesters %></td>			
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
			<th colspan="8">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Appeal to Court Summary Report/ለፍርድ ቤት የቀረቡ ይግባኞች ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
			<th>Verdict Rejecting Previous Decision(Government Body)/በመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በመሻር የተፈረደ ፍርድ ብዛት</th>
			<th>Verdict Approving Previous Decision(Government Body)/በመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማጽደቅ የተፈረደ ፍርድ ብዛት</th>
			<th>Verdict Improving Previous Decision(Government Body)/በመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማሻሻል የተፈረደ ፍርድ ብዛት</th>
			<th>Verdict Rejecting Previous Decision(Information Requesters)/በመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በመሻር የተፈረደ ፍርድ ብዛት</th>
			<th>Verdict Approving Previous Decision(Information Requesters)/በመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማጽደቅ የተፈረደ ፍርድ ብዛት</th>
			<th>Verdict Improving Previous Decision(Information Requesters)/በመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማሻሻል የተፈረደ ፍርድ ብዛት</th>			
			<th>Total/በጠቅላላ</th>
		</tr>
	<%
		float woredaNumberOfVerdictRejectingPreviousDecisionByGovBody=0.0f;
		float woredaNumberOfVerdictApprovingPreviousDecisionByGovBody=0.0f;
		float woredaNumberOfVerdictImprovingPreviousDecisionByGovBody=0.0f;
		float woredaNumberOfVerdictRejectingPreviousDecisionByInfoRequesters=0.0f;
		float woredaNumberOfVerdictApprovingPreviousDecisionByInfoRequesters=0.0f;
		float woredaNumberOfVerdictImprovingPreviousDecisionByInfoRequesters=0.0f;
		float woredaTotal=0.0f;
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float numberOfVerdictRejectingPreviousDecisionByGovBody = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "gov_body_number_of_decision_rejecting_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfVerdictApprovingPreviousDecisionByGovBody = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "gov_body_number_of_decision_approving_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfVerdictImprovingPreviousDecisionByGovBody = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "gov_body_number_of_decision_improving_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfVerdictRejectingPreviousDecisionByInfoRequesters = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "info_requester_number_of_decision_rejecting_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfVerdictApprovingPreviousDecisionByInfoRequesters = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "info_requester_number_of_decision_approving_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfVerdictImprovingPreviousDecisionByInfoRequesters = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "info_requester_number_of_decision_improving_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float sumTotal = numberOfVerdictRejectingPreviousDecisionByGovBody + numberOfVerdictApprovingPreviousDecisionByGovBody +
					numberOfVerdictImprovingPreviousDecisionByGovBody + numberOfVerdictRejectingPreviousDecisionByInfoRequesters + numberOfVerdictApprovingPreviousDecisionByInfoRequesters +
					numberOfVerdictImprovingPreviousDecisionByInfoRequesters;
			
			woredaNumberOfVerdictRejectingPreviousDecisionByGovBody += numberOfVerdictRejectingPreviousDecisionByGovBody;
			woredaNumberOfVerdictApprovingPreviousDecisionByGovBody += numberOfVerdictApprovingPreviousDecisionByGovBody;
			woredaNumberOfVerdictImprovingPreviousDecisionByGovBody += numberOfVerdictImprovingPreviousDecisionByGovBody;
			woredaNumberOfVerdictRejectingPreviousDecisionByInfoRequesters += numberOfVerdictRejectingPreviousDecisionByInfoRequesters;
			woredaNumberOfVerdictApprovingPreviousDecisionByInfoRequesters += numberOfVerdictApprovingPreviousDecisionByInfoRequesters;
			woredaNumberOfVerdictImprovingPreviousDecisionByInfoRequesters += numberOfVerdictImprovingPreviousDecisionByInfoRequesters;
			woredaTotal += sumTotal;
			%>
			<tr>
				<td><%=organization.getOrganizationName() %></td>
				<td><%=numberOfVerdictRejectingPreviousDecisionByGovBody %></td>
				<td><%=numberOfVerdictApprovingPreviousDecisionByGovBody %></td>
				<td><%=numberOfVerdictImprovingPreviousDecisionByGovBody %></td>
				<td><%=numberOfVerdictRejectingPreviousDecisionByInfoRequesters %></td>
				<td><%=numberOfVerdictApprovingPreviousDecisionByInfoRequesters %></td>	
				<td><%=numberOfVerdictImprovingPreviousDecisionByInfoRequesters %></td>							
				<td><%=sumTotal %></td>
			</tr>
			<%
		}//end while loop
	%>
		<tr>
			<td>አጠቃላይ ድምር</td>
			<td><%=woredaNumberOfVerdictRejectingPreviousDecisionByGovBody %></td>
			<td><%=woredaNumberOfVerdictApprovingPreviousDecisionByGovBody %></td>
			<td><%=woredaNumberOfVerdictImprovingPreviousDecisionByGovBody %></td>
			<td><%=woredaNumberOfVerdictRejectingPreviousDecisionByInfoRequesters %></td>
			<td><%=woredaNumberOfVerdictApprovingPreviousDecisionByInfoRequesters %></td>
			<td><%=woredaNumberOfVerdictImprovingPreviousDecisionByInfoRequesters %></td>			
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
			<th colspan="8">ለፍርድ ቤት የቀረቡ ይግባኞች ማጠቃለያ ሪፖርት</th>
		</tr>
		<tr>
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
			<th>Verdict Rejecting Previous Decision(Government Body)/በመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በመሻር የተፈረደ ፍርድ ብዛት</th>
			<th>Verdict Approving Previous Decision(Government Body)/በመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማጽደቅ የተፈረደ ፍርድ ብዛት</th>
			<th>Verdict Improving Previous Decision(Government Body)/በመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማሻሻል የተፈረደ ፍርድ ብዛት</th>
			<th>Verdict Rejecting Previous Decision(Information Requesters)/በመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በመሻር የተፈረደ ፍርድ ብዛት</th>
			<th>Verdict Approving Previous Decision(Information Requesters)/በመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማጽደቅ የተፈረደ ፍርድ ብዛት</th>
			<th>Verdict Improving Previous Decision(Information Requesters)/በመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማሻሻል የተፈረደ ፍርድ ብዛት</th>			
			<th>Total/በጠቅላላ</th>
		</tr>
	<%
		float kebeleNumberOfVerdictRejectingPreviousDecisionByGovBody=0.0f;
		float kebeleNumberOfVerdictApprovingPreviousDecisionByGovBody=0.0f;
		float kebeleNumberOfVerdictImprovingPreviousDecisionByGovBody=0.0f;
		float kebeleNumberOfVerdictRejectingPreviousDecisionByInfoRequesters=0.0f;
		float kebeleNumberOfVerdictApprovingPreviousDecisionByInfoRequesters=0.0f;
		float kebeleNumberOfVerdictImprovingPreviousDecisionByInfoRequesters=0.0f;
		float kebeleTotal=0.0f;
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float numberOfVerdictRejectingPreviousDecisionByGovBody = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "gov_body_number_of_decision_rejecting_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfVerdictApprovingPreviousDecisionByGovBody = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "gov_body_number_of_decision_approving_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfVerdictImprovingPreviousDecisionByGovBody = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "gov_body_number_of_decision_improving_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfVerdictRejectingPreviousDecisionByInfoRequesters = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "info_requester_number_of_decision_rejecting_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfVerdictApprovingPreviousDecisionByInfoRequesters = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "info_requester_number_of_decision_approving_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfVerdictImprovingPreviousDecisionByInfoRequesters = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "info_requester_number_of_decision_improving_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float sumTotal = numberOfVerdictRejectingPreviousDecisionByGovBody + numberOfVerdictApprovingPreviousDecisionByGovBody +
					numberOfVerdictImprovingPreviousDecisionByGovBody + numberOfVerdictRejectingPreviousDecisionByInfoRequesters + numberOfVerdictApprovingPreviousDecisionByInfoRequesters +
					numberOfVerdictImprovingPreviousDecisionByInfoRequesters;
			
			kebeleNumberOfVerdictRejectingPreviousDecisionByGovBody += numberOfVerdictRejectingPreviousDecisionByGovBody;
			kebeleNumberOfVerdictApprovingPreviousDecisionByGovBody += numberOfVerdictApprovingPreviousDecisionByGovBody;
			kebeleNumberOfVerdictImprovingPreviousDecisionByGovBody += numberOfVerdictImprovingPreviousDecisionByGovBody;
			kebeleNumberOfVerdictRejectingPreviousDecisionByInfoRequesters += numberOfVerdictRejectingPreviousDecisionByInfoRequesters;
			kebeleNumberOfVerdictApprovingPreviousDecisionByInfoRequesters += numberOfVerdictApprovingPreviousDecisionByInfoRequesters;
			kebeleNumberOfVerdictImprovingPreviousDecisionByInfoRequesters += numberOfVerdictImprovingPreviousDecisionByInfoRequesters;
			kebeleTotal += sumTotal;
			%>
			<tr>
				<td><%=organization.getOrganizationName() %></td>
				<td><%=numberOfVerdictRejectingPreviousDecisionByGovBody %></td>
				<td><%=numberOfVerdictApprovingPreviousDecisionByGovBody %></td>
				<td><%=numberOfVerdictImprovingPreviousDecisionByGovBody %></td>
				<td><%=numberOfVerdictRejectingPreviousDecisionByInfoRequesters %></td>
				<td><%=numberOfVerdictApprovingPreviousDecisionByInfoRequesters %></td>	
				<td><%=numberOfVerdictImprovingPreviousDecisionByInfoRequesters %></td>							
				<td><%=sumTotal %></td>
			</tr>
			<%
		}//end while loop
	%>
		<tr>
			<td>አጠቃላይ ድምር</td>
			<td><%=kebeleNumberOfVerdictRejectingPreviousDecisionByGovBody %></td>
			<td><%=kebeleNumberOfVerdictApprovingPreviousDecisionByGovBody %></td>
			<td><%=kebeleNumberOfVerdictImprovingPreviousDecisionByGovBody %></td>
			<td><%=kebeleNumberOfVerdictRejectingPreviousDecisionByInfoRequesters %></td>
			<td><%=kebeleNumberOfVerdictApprovingPreviousDecisionByInfoRequesters %></td>
			<td><%=kebeleNumberOfVerdictImprovingPreviousDecisionByInfoRequesters %></td>			
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
			<th colspan="8">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Appeal to Court Summary Report/ለፍርድ ቤት የቀረቡ ይግባኞች ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
			<th>Verdict Rejecting Previous Decision(Government Body)/በመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በመሻር የተፈረደ ፍርድ ብዛት</th>
			<th>Verdict Approving Previous Decision(Government Body)/በመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማጽደቅ የተፈረደ ፍርድ ብዛት</th>
			<th>Verdict Improving Previous Decision(Government Body)/በመንግስት አካሉ የቀረበ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማሻሻል የተፈረደ ፍርድ ብዛት</th>
			<th>Verdict Rejecting Previous Decision(Information Requesters)/በመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በመሻር የተፈረደ ፍርድ ብዛት</th>
			<th>Verdict Approving Previous Decision(Information Requesters)/በመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማጽደቅ የተፈረደ ፍርድ ብዛት</th>
			<th>Verdict Improving Previous Decision(Information Requesters)/በመረጃ ጠያቂዎች የቀረቡ ይግባገኝ ብዛት - ቀደምሲል የተሰጠ ውሳኔን በማሻሻል የተፈረደ ፍርድ ብዛት</th>			
			<th>Total/በጠቅላላ</th>
		</tr>
	<%
		float zoneNumberOfVerdictRejectingPreviousDecisionByGovBody=0.0f;
		float zoneNumberOfVerdictApprovingPreviousDecisionByGovBody=0.0f;
		float zoneNumberOfVerdictImprovingPreviousDecisionByGovBody=0.0f;
		float zoneNumberOfVerdictRejectingPreviousDecisionByInfoRequesters=0.0f;
		float zoneNumberOfVerdictApprovingPreviousDecisionByInfoRequesters=0.0f;
		float zoneNumberOfVerdictImprovingPreviousDecisionByInfoRequesters=0.0f;
		float zoneTotal=0.0f;
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float numberOfVerdictRejectingPreviousDecisionByGovBody = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "gov_body_number_of_decision_rejecting_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfVerdictApprovingPreviousDecisionByGovBody = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "gov_body_number_of_decision_approving_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfVerdictImprovingPreviousDecisionByGovBody = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "gov_body_number_of_decision_improving_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfVerdictRejectingPreviousDecisionByInfoRequesters = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "info_requester_number_of_decision_rejecting_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfVerdictApprovingPreviousDecisionByInfoRequesters = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "info_requester_number_of_decision_approving_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float numberOfVerdictImprovingPreviousDecisionByInfoRequesters = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_appeal_to_court", "info_requester_number_of_decision_improving_previous_decision", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float sumTotal = numberOfVerdictRejectingPreviousDecisionByGovBody + numberOfVerdictApprovingPreviousDecisionByGovBody +
					numberOfVerdictImprovingPreviousDecisionByGovBody + numberOfVerdictRejectingPreviousDecisionByInfoRequesters + numberOfVerdictApprovingPreviousDecisionByInfoRequesters +
					numberOfVerdictImprovingPreviousDecisionByInfoRequesters;
			
			zoneNumberOfVerdictRejectingPreviousDecisionByGovBody += numberOfVerdictRejectingPreviousDecisionByGovBody;
			zoneNumberOfVerdictApprovingPreviousDecisionByGovBody += numberOfVerdictApprovingPreviousDecisionByGovBody;
			zoneNumberOfVerdictImprovingPreviousDecisionByGovBody += numberOfVerdictImprovingPreviousDecisionByGovBody;
			zoneNumberOfVerdictRejectingPreviousDecisionByInfoRequesters += numberOfVerdictRejectingPreviousDecisionByInfoRequesters;
			zoneNumberOfVerdictApprovingPreviousDecisionByInfoRequesters += numberOfVerdictApprovingPreviousDecisionByInfoRequesters;
			zoneNumberOfVerdictImprovingPreviousDecisionByInfoRequesters += numberOfVerdictImprovingPreviousDecisionByInfoRequesters;
			zoneTotal += sumTotal;
			%>
			<tr>
				<td><%=organization.getOrganizationName() %></td>
				<td><%=numberOfVerdictRejectingPreviousDecisionByGovBody %></td>
				<td><%=numberOfVerdictApprovingPreviousDecisionByGovBody %></td>
				<td><%=numberOfVerdictImprovingPreviousDecisionByGovBody %></td>
				<td><%=numberOfVerdictRejectingPreviousDecisionByInfoRequesters %></td>
				<td><%=numberOfVerdictApprovingPreviousDecisionByInfoRequesters %></td>	
				<td><%=numberOfVerdictImprovingPreviousDecisionByInfoRequesters %></td>							
				<td><%=sumTotal %></td>
			</tr>
			<%
		}//end while loop
	%>
		<tr>
			<td>አጠቃላይ ድምር</td>
			<td><%=zoneNumberOfVerdictRejectingPreviousDecisionByGovBody %></td>
			<td><%=zoneNumberOfVerdictApprovingPreviousDecisionByGovBody %></td>
			<td><%=zoneNumberOfVerdictImprovingPreviousDecisionByGovBody %></td>
			<td><%=zoneNumberOfVerdictRejectingPreviousDecisionByInfoRequesters %></td>
			<td><%=zoneNumberOfVerdictApprovingPreviousDecisionByInfoRequesters %></td>
			<td><%=zoneNumberOfVerdictImprovingPreviousDecisionByInfoRequesters %></td>			
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