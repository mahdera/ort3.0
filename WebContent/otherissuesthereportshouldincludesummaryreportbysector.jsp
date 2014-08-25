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
			<th colspan="4">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Other Issues the Report Should Include/ሪፖርቱ ሊያካትታቸው የሚገቡ ሌሎች ጉዳዮች ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
				G.C<br/>
					<%=(ethiopicStartMonthName+" "+ethStartDate+", "+ethStartYear +" - "+ ethiopicEndMonthName+" "+ethEndDate+", "+ethEndYear) %>
			</th>
		</tr>
		<tr>
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
			<th>Training Given to Heads and Professionals (Male)/ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ወንድ)</th>
			<th>Training Given to Heads and Professionals (Female)/ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ሴት)</th>						
			<th>Total/በጠቅላላ</th>
		</tr>
	<%
		float regionTrainingGivenToProfessionalsAndHeadsMale=0.0f;
		float regionTrainingGivenToProfessionalsAndHeadsFemale=0.0f;		
		float regionTotal=0.0f;
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float trainingGivenToProfessionalsAndHeadsMale = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_other_issues_report_must_contain", "number_of_trainings_given_to_male_head_and_professionals", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float trainingGivenToProfessionalsAndHeadsFemale = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_other_issues_report_must_contain", "number_of_trainings_given_to_female_head_and_professionals", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());	
			
			float sumTotal = trainingGivenToProfessionalsAndHeadsMale + trainingGivenToProfessionalsAndHeadsFemale;
			%>
			<tr>
				<td><%=organization.getOrganizationName() %></td>
				<td><%=trainingGivenToProfessionalsAndHeadsMale %></td>											
				<td><%=trainingGivenToProfessionalsAndHeadsFemale %></td>				
				<td><%=sumTotal %></td>
			</tr>
			<%
			regionTrainingGivenToProfessionalsAndHeadsMale += trainingGivenToProfessionalsAndHeadsMale;
			regionTrainingGivenToProfessionalsAndHeadsFemale += trainingGivenToProfessionalsAndHeadsFemale;			
			regionTotal += sumTotal;
		}//end while loop
	  %>		
	  	<tr>
	  		<td>አጠቃላይ ድምር</td>
	  		<td><%=regionTrainingGivenToProfessionalsAndHeadsMale %></td>
	  		<td><%=regionTrainingGivenToProfessionalsAndHeadsFemale %></td>	  		
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
			<th colspan="4">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Other Issues the Report Should Include/ሪፖርቱ ሊያካትታቸው የሚገቡ ሌሎች ጉዳዮች ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
			<th>Training Given to Heads and Professionals (Male)/ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ወንድ)</th>
			<th>Training Given to Heads and Professionals (Female)/ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ሴት)</th>						
			<th>Total/በጠቅላላ</th>
		</tr>
	<%
		float woredaTrainingGivenToProfessionalsAndHeadsMale=0.0f;
		float woredaTrainingGivenToProfessionalsAndHeadsFemale=0.0f;		
		float woredaTotal=0.0f;
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float trainingGivenToProfessionalsAndHeadsMale = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_other_issues_report_must_contain", "number_of_trainings_given_to_male_head_and_professionals", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float trainingGivenToProfessionalsAndHeadsFemale = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_other_issues_report_must_contain", "number_of_trainings_given_to_female_head_and_professionals", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());	
			
			float sumTotal = trainingGivenToProfessionalsAndHeadsMale + trainingGivenToProfessionalsAndHeadsFemale;
			%>
			<tr>
				<td><%=organization.getOrganizationName() %></td>
				<td><%=trainingGivenToProfessionalsAndHeadsMale %></td>											
				<td><%=trainingGivenToProfessionalsAndHeadsFemale %></td>				
				<td><%=sumTotal %></td>
			</tr>
			<%
			woredaTrainingGivenToProfessionalsAndHeadsMale += trainingGivenToProfessionalsAndHeadsMale;
			woredaTrainingGivenToProfessionalsAndHeadsFemale += trainingGivenToProfessionalsAndHeadsFemale;			
			woredaTotal += sumTotal;
		}//end while loop
	  %>		
	  	<tr>
	  		<td>አጠቃላይ ድምር</td>
	  		<td><%=woredaTrainingGivenToProfessionalsAndHeadsMale %></td>
	  		<td><%=woredaTrainingGivenToProfessionalsAndHeadsFemale %></td>	  		
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
			<th colspan="4">ሪፖርቱ ሊያካትታቸው የሚገቡ ሌሎች ጉዳዮች ማጠቃለያ ሪፖርት</th>
		</tr>
		<tr>
			<th>ሴክተር መሥሪያ ቤት</th>
			<th>ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ወንድ)</th>
			<th>ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ሴት)</th>						
			<th>በጠቅላላ</th>
		</tr>
	<%
		float kebeleTrainingGivenToProfessionalsAndHeadsMale=0.0f;
		float kebeleTrainingGivenToProfessionalsAndHeadsFemale=0.0f;		
		float kebeleTotal=0.0f;
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float trainingGivenToProfessionalsAndHeadsMale = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_other_issues_report_must_contain", "number_of_trainings_given_to_male_head_and_professionals", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float trainingGivenToProfessionalsAndHeadsFemale = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_other_issues_report_must_contain", "number_of_trainings_given_to_female_head_and_professionals", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());	
			
			float sumTotal = trainingGivenToProfessionalsAndHeadsMale + trainingGivenToProfessionalsAndHeadsFemale;
			%>
			<tr>
				<td><%=organization.getOrganizationName() %></td>
				<td><%=trainingGivenToProfessionalsAndHeadsMale %></td>											
				<td><%=trainingGivenToProfessionalsAndHeadsFemale %></td>				
				<td><%=sumTotal %></td>
			</tr>
			<%
			kebeleTrainingGivenToProfessionalsAndHeadsMale += trainingGivenToProfessionalsAndHeadsMale;
			kebeleTrainingGivenToProfessionalsAndHeadsFemale += trainingGivenToProfessionalsAndHeadsFemale;			
			kebeleTotal += sumTotal;
		}//end while loop
	  %>		
	  	<tr>
	  		<td>አጠቃላይ ድምር</td>
	  		<td><%=kebeleTrainingGivenToProfessionalsAndHeadsMale %></td>
	  		<td><%=kebeleTrainingGivenToProfessionalsAndHeadsFemale %></td>	  		
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
		<div id="kebeleLevelReportDiv">
			<table border="0" width="100%" class="reportTable" style="border: 1px solid #2779aa" rules="all">
	<%
		List<GovernmentSectorOrganization> sectorOrganizationList = GovernmentSectorOrganization.getAllGovernmentSectorOrganizationsLocatedInThisTerritory("zone_id",selectedTerritoryId);
		Iterator<GovernmentSectorOrganization> sectorOrganizationItr = null;
		if(!sectorOrganizationList.isEmpty())
		sectorOrganizationItr = sectorOrganizationList.iterator();
		if(sectorOrganizationItr != null){
	%>
		<tr>
			<th colspan="4">
				<%
					String reportLevelDisplay = null;
					if(reportLevel.equals("regionLevel"))
						reportLevelDisplay = "National Level/ብሔራዊ ደረጃ";
					else if(reportLevel.equals("zoneLevel"))
						reportLevelDisplay = "Zone Level/ዞን ደረጃ";
					else if(reportLevel.equals("woredaLevel"))
						reportLevelDisplay = "Woreda Level/ወረዳ ደረጃ";
				%>
				Other Issues the Report Should Include/ሪፖርቱ ሊያካትታቸው የሚገቡ ሌሎች ጉዳዮች ማጠቃለያ ሪፖርት<br/>
				Report Level/የሪፖርቱ ደረጃ: <%=reportLevelDisplay %> <br/>
				Report Period/የሪፖርቱ ክፍለ ግዜ: <%=(dateFrom +" to "+ dateTo) %>
			</th>
		</tr>
		<tr>
			<th>Sector Organization/ሴክተር መሥሪያ ቤት</th>
			<th>Training Given to Heads and Professionals (Male)/ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ወንድ)</th>
			<th>Training Given to Heads and Professionals (Female)/ለኃላፊዎችና ለባለሙያዎች የተሠጠ ሥልጠና (ሴት)</th>						
			<th>Total/በጠቅላላ</th>
		</tr>
	<%
		float kebeleTrainingGivenToProfessionalsAndHeadsMale=0.0f;
		float kebeleTrainingGivenToProfessionalsAndHeadsFemale=0.0f;		
		float kebeleTotal=0.0f;
		
		while(sectorOrganizationItr.hasNext()){
			GovernmentSectorOrganization organization = sectorOrganizationItr.next();
			float trainingGivenToProfessionalsAndHeadsMale = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_other_issues_report_must_contain", "number_of_trainings_given_to_male_head_and_professionals", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());
			float trainingGivenToProfessionalsAndHeadsFemale = ReportGenerator.getReportSumDataForTableFieldOnThisLevelSelectedValueDuringForSector("tbl_other_issues_report_must_contain", "number_of_trainings_given_to_female_head_and_professionals", reportLevel, selectedTerritoryId, dateFrom, dateTo,organization.getId());	
			
			float sumTotal = trainingGivenToProfessionalsAndHeadsMale + trainingGivenToProfessionalsAndHeadsFemale;
			%>
			<tr>
				<td><%=organization.getOrganizationName() %></td>
				<td><%=trainingGivenToProfessionalsAndHeadsMale %></td>											
				<td><%=trainingGivenToProfessionalsAndHeadsFemale %></td>				
				<td><%=sumTotal %></td>
			</tr>
			<%
			kebeleTrainingGivenToProfessionalsAndHeadsMale += trainingGivenToProfessionalsAndHeadsMale;
			kebeleTrainingGivenToProfessionalsAndHeadsFemale += trainingGivenToProfessionalsAndHeadsFemale;			
			kebeleTotal += sumTotal;
		}//end while loop
	  %>		
	  	<tr>
	  		<td>አጠቃላይ ድምር</td>
	  		<td><%=kebeleTrainingGivenToProfessionalsAndHeadsMale %></td>
	  		<td><%=kebeleTrainingGivenToProfessionalsAndHeadsFemale %></td>	  		
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